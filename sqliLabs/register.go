package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"
)

func createUser(w http.ResponseWriter, r *http.Request) {

	username := r.FormValue("username")
	password := r.FormValue("password")
	email := r.FormValue("email")

	execQuery := fmt.Sprintf(
		"INSERT INTO users (id, username, password, email) VALUES (LEFT(UUID(), 8), '%s', '%s', '%s');",
		username,
		password,
		email,
	)

	query := fmt.Sprintf("SELECT username, email FROM users WHERE username='%s';", username)

	log.Println("Q_1: ", execQuery, "\n============================\n Q_2: ", query)

	db.QueryRow(execQuery)

	var usrName, usrEmail string
	err := db.QueryRow(query).Scan(&usrName, &usrEmail)

	switch {
	case err == sql.ErrNoRows:
		log.Println("Q_errNoRows: ", query, "\n============================\n", err.Error())
		http.Error(w, "Invalid data", http.StatusUnauthorized)
		return
	case err != nil:
		log.Println("Q_err: ", query, "\n============================\n", err.Error(), "\n============================")
		http.Error(w, "Something Went Wrong!", http.StatusBadRequest)
		return
	}

	fmt.Fprintf(w, "User Succesfully Redister! id: %s email: %s", usrName, usrEmail)
}
