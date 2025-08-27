package main

import (
	"database/sql"
	"log"
	"net/http"

	"github.com/go-chi/chi/v5"
	_ "github.com/go-sql-driver/mysql"
)

var db *sql.DB

// func sqliAuthHanler(w http.ResponseWriter, r *http.Request) {
// 	username := r.FormValue("username")
// 	password := r.FormValue("password")

// 	// if username == "" || password == "" {
// 	// 	fmt.Fprintf(w, "missing username or password", http.StatusUnauthorized)
// 	// 	return
// 	// }

// 	query := fmt.Sprintf(
// 		"SELECT * FROM users WHERE password='%s' AND id='%s' LIMIT 1;",
// 		password, username,
// 	)

// 	// query := "select id from users where password='" + password + "' and id='" + username + "' limit 1;"
// 	log.Println("QUERY:", query)
// 	log.Println("======================================")
// 	var id string
// 	var pass string
// 	err := db.QueryRow(query).Scan(&id, &pass)
// 	log.Println("QUERY 2:", query)
// 	switch {
// 	case err == sql.ErrNoRows:
// 		http.Error(w, "Invalid Username or Password", http.StatusUnauthorized)
// 		return
// 	case err != nil:
// 		http.Error(w, "error: "+err.Error(), http.StatusInternalServerError)
// 		return
// 	}

// 	fmt.Fprintf(w, "welcom: %s", id)

// }

func main() {

	var err error
	dbURL := "root:AHMEDkhaled@123@tcp(127.0.0.1:3306)/sqli?parseTime=true"
	db, err = sql.Open("mysql", dbURL)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	router := chi.NewRouter()
	router.Post("/login", authHandler)
	router.Post("/register", createUser)
	router.Get("/lb", listBooks)

	log.Println("Server Listening on PORT 9090")
	if err := http.ListenAndServe(":9090", router); err != nil {
		log.Fatal(err)
	}

}
