# 🔢 Number Guessing Game (freeCodeCamp Project)
For this project, I used Bash scripting, PostgreSQL, and Git to create a number guessing game that runs in the terminal and saves user information.

---

## 🧱 Database Schema
### `users` table
| Column | Type | Constraints | Description |
| ------ | ---- | ----------- | ----------- |
| user_id | SERIAL | PRIMARY KEY | Unique user identifier |
| username | VARCHAR(22) | UNIQUE, NOT NULL | Username of user |
| games_played | INT | NOT NULL, DEFAULT 1 | Number of games user has played |
| best_game | INT | NOT NULL | High score (least amount of guesses to guess number) of user

---

## ⚙ Scripts
### 1. `number_guess.sh`
Runs interactive bash script in which a user has to guess a number between 1 and 1000.
The script stores the user info in the `users` table.
