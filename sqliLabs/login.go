package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"
)

func authHandler(w http.ResponseWriter, r *http.Request) {

	userName := r.FormValue("username")
	passWord := r.FormValue("password")

	query := fmt.Sprintf(
		"SELECT id,username,email FROM users WHERE username='%s' AND password='%s';",
		userName,
		passWord,
	)

	log.Println("Q_1: ", query, "\n============================")

	var id, user, email string
	err := db.QueryRow(query).Scan(&id, &user, &email)

	switch {
	case err == sql.ErrNoRows:
		log.Println("Q_errNoRow: ", query, "\n============================\n", err.Error(), "\n============================")
		http.Error(w, "Invalid Username or Password", http.StatusUnauthorized)
		return
	case err != nil:
		log.Println("Q_err: ", query, "\n============================\n", err.Error(), "\n============================")
		http.Error(w, "Something Went Wrong!", http.StatusBadRequest)
		return
	}

	fmt.Fprintf(w, "Welcom: '%s', your email: '%s', your id: '%s'",
		user,
		email,
		id,
	)
}
