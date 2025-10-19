# 🏆 World Cup Database (FreeCodeCamp Project)

For this project, I created a Bash script that enters information from CSV file (containing World Cup games data) into PostgreSQL, then another script that queries the database for useful statistics.

---

## 📋 Project Overview

This project creates a database named **`worldcup`** with two tables — `teams` and `games`.  
It stores information about the participating teams and the results of each match.

---

## 🧱 Database Schema

### `teams` Table

| Column | Type | Constraints | Description |
|--------|------|-------------|--------------|
| team_id | SERIAL | PRIMARY KEY | Unique team identifier |
| name | VARCHAR | UNIQUE, NOT NULL | Team name |

### `games` Table

| Column | Type | Constraints | Description |
|--------|------|-------------|--------------|
| game_id | SERIAL | PRIMARY KEY | Unique game identifier |
| year | INT | NOT NULL | Year of the match |
| round | VARCHAR | NOT NULL | Tournament round |
| winner_id | INT | REFERENCES teams(team_id) NOT NULL | ID of the winning team |
| opponent_id | INT | REFERENCES teams(team_id) NOT NULL | ID of the opposing team |
| winner_goals | INT | NOT NULL | Goals scored by the winning team |
| opponent_goals | INT | NOT NULL | Goals scored by the opposing team |

---

## ⚙️ Scripts

### 1. `insert_data.sh`

Inserts the data from games.csv into the teams and games tables

### 2. `queries.sh`

Queries the database for useful statistics
