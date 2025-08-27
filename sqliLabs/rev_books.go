package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"
)

func listBooks(w http.ResponseWriter, r *http.Request) {

	// limit := 10

	vulnStr := r.URL.Query().Get("r")
	// lmt, _ := strconv.Atoi(vulnStr)

	// if s := r.URL.Query().Get("r"); s != "" {
	// 	if n, err := strconv.Atoi(s); err == nil && n > 0 && n <= 1000 {
	// 		limit = n
	// 	}
	// }

	query := fmt.Sprintf("SELECT * FROM books LIMIT %s;", vulnStr)

	log.Println(query)

	rows, err := db.Query(query)
	if err != nil {
		log.Println("query error:", err)
		http.Error(w, "query error", http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	columns, err := rows.Columns()
	if err != nil {
		log.Println("columns error:", err)
		http.Error(w, "server error", http.StatusInternalServerError)
		return
	}

	// buffers for Scan
	rawVals := make([]sql.RawBytes, len(columns))
	scanArgs := make([]interface{}, len(rawVals))
	for i := range rawVals {
		scanArgs[i] = &rawVals[i]
	}

	for rows.Next() {
		if err := rows.Scan(scanArgs...); err != nil {
			log.Println("scan error:", err)
			http.Error(w, "server error", http.StatusInternalServerError)
			return
		}

		for i, col := range columns {
			var v string
			if rawVals[i] == nil {
				v = "NULL"
			} else {
				v = string(rawVals[i])
			}
			fmt.Fprintf(w, "%s: %s ", col, v)
		}
		fmt.Fprintln(w)
	}

	if err := rows.Err(); err != nil {
		log.Println("rows error:", err)
	}
}
