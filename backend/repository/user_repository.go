package repository

import (
	"campusconnect/backend/models"
	"database/sql"
)

func GetAllUsers(db *sql.DB) ([]models.User, error) {
	rows, err := db.Query(
		"SELECT id,name,email,role FROM users",
	)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var users []models.User

	for rows.Next() {
		var user models.User
		err := rows.Scan(
			&user.ID,
			&user.Name,
			&user.Email,
			&user.Role,
		)
		if err != nil {
			return nil, err

		}
		users = append(users, user)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return users, nil
}
