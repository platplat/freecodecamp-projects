# 💇‍♀️ Salon Appointments Scheduler (freeCodeCamp Project)

For this project, I have created an interactive Bash program that uses PostgreSQL to track the customers and appointments for a salon.

---

## 🧱 Database Schema

### `customers` table
| Column | Type | Contraints | Description |
| ------ | ---- | ---------- | ----------- |
| customer_id | SERIAL | PRIMARY KEY | Unique customer identifier |
| phone | VARCHAR(15) | UNIQUE | Customer phone number |
| name | VARCHAR(30) | | Customer name |

### `services` table
| Column | Type | Contraints | Description |
| ------ | ---- | ---------- | ----------- |
| service_id | SERIAL | PRIMARY KEY | Unique service identifier |
| name | VARCHAR(30) | | Name of service |

### `appointments` table
| Column | Type | Contraints | Description |
| ------ | ---- | ---------- | ----------- |
| appointment_id | SERIAL | PRIMARY KEY | Unique appointment identifier |
| customer_id | INT | REFERENCES `customers(customer_id)` | ID of customer |
| service_id | INT | REFERENCES `services(service_id)` | ID of service |
| time | VARCHAR(10) | | Appointment time |

---

## ⚙ Scripts
### 1. `salon.sh`
Interactive Bash program for adding appointments for new or existing customers.
