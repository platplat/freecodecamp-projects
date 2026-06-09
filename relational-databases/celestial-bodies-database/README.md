# 🌌 Celestial Bodies Database (freeCodeCamp Project)

For this project, I built a database of celestial bodies using PostgreSQL.

---

## 🧱 Database Schema

### `galaxy` Table
| Column | Type | Constraints | Description |
|--------|------|-------------|--------------|
| galaxy_id | SERIAL | PRIMARY KEY | Unique galaxy identifier |
| name | VARCHAR(30) | NOT NULL | Galaxy name |
| description | TEXT |  | Galaxy description |
| number_of_stars | INT |  | Galaxy name |
| is_dwarf | BOOLEAN |  | Indicates if galaxy is dwarf galaxy |

### `star` Table
| Column | Type | Constraints | Description |
|--------|------|-------------|--------------|
| star_id | SERIAL | PRIMARY KEY | Unique star identifier |
| name | VARCHAR(30) | NOT NULL | Star name |
| description | TEXT |  | Star description |
| galaxy_id | INT |  | Foreign key referencing `galaxy(galaxy_id)` |
| age_in_millions_of_years | NUMERIC(10,2) |  | Star age in millions of years |

### `planet` Table
| Column | Type | Constraints | Description |
|--------|------|-------------|--------------|
| planet_id | SERIAL | PRIMARY KEY | Unique planet identifier |
| name | VARCHAR(30) | NOT NULL | Planet name |
| description | TEXT |  | Planet description |
| star_id | INT |  | Foreign key referencing `star(star_id)` |
| number_of_moons | INT |  | Number of moons orbiting planet |
| has_rings | BOOLEAN |  | Indicates if the planet has rings |

### `moon` Table
| Column | Type | Constraints | Description |
|--------|------|-------------|--------------|
| moon_id | SERIAL | PRIMARY KEY | Unique moon identifier |
| name | VARCHAR(30) | NOT NULL | Moon name |
| description | TEXT |  | Moon description |
| planet_id | INT |  | Foreign key referencing `planet(planet_id)` |
| circumference_in_km | INT |  | Circumference of moon in kilometres |

### `orbital_relationship` Table
| Column | Type | Constraints | Description |
|--------|------|-------------|--------------|
| orbital_relationship_id | SERIAL | PRIMARY KEY | Unique orbital realtionship identifier |
| name | VARCHAR(30) | NOT NULL | Planet name |
| description | TEXT |  | Orbital relationship description |
| planet_id | INT |  | Foreign key referencing `planet(planet_id)` |
| moon_id | INT |  | Foreign key referencing `moon(moon_id)` |
| orbital_period_in_days | NUMERIC(10,2) |  | Number of days it takes moon to orbit planet |
| semi_major_axis_in_km | INT |  | Semi-major axis of orbit in kilometres |

<!--
---

## Restoring the Database

To restore the database from the SQL dump:

```bash

# PostgreSQL
psql -U username -d celestial_db -f celestial_db_dump.sql
-->
