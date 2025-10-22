# ⚛ Periodic Table Database (freeCodeCamp Project)
For this project, I have created a Bash script to get information about chemical elements from a periodic table database.

---

## 🧱 Database Schema
### `elements` table
| Column | Type | Constraints | Description |
| ------ | ---- | ----------- | ----------- |
| atomic_number | INT | PRIMARY KEY | Atomic number of element |
| symbol | VARCHAR(2) | NOT NULL, UNIQUE | Element symbol |
| name | VARCHAR(40) | NOT NULL, UNIQUE | Element name |
### `types` table
| Column | Type | Constraints | Description |
| ------ | ---- | ----------- | ----------- |
| type_id | SERIAL | PRIMARY KEY | Unique type identifier |
| type | VARCHAR(20) | NOT NULL | Element type |
### `properties` table
| Column | Type | Constraints | Description |
| ------ | ---- | ----------- | ----------- |
| atomic_number | INT | PRIMARY KEY, REFERENCES `elements(atomic_number)` | Atomic number of element |
| atomic_mass | NUMERIC | NOT NULL | Atomic mass of element |
| melting_point_celsius | NUMERIC | NOT NULL | Melting point of element in celsius |
| boiling_point_celsius | NUMERIC | NOT NULL | Boiling point of element in celsius |
| type_id | INT | NOT NULL, REFERENCES `types(type_id)` | Atomic number of element |

---

## ⚙ Scripts
### 1. `element.sh`
`element.sh <element>` queries the database and displays information about an element,
where `<element>` is the name, symbol or atomic number of an element.
