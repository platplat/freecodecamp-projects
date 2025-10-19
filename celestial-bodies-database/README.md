# Celestial Bodies Database (FreeCodCamp Project)

This repository contains a SQL database for storing information about celestial bodies and their orbital relationships. It provides a structured schema for galaxies, stars, planets, moons, and the relationships between them.

## Database Structure

The database includes the following tables:

### 1. galaxy
Stores information about galaxies.
- **galaxy_id**: SERIAL, Primary Key
- **name**: VARCHAR(30), name of the galaxy
- **description**: TEXT, description of galaxy
- **number_of_stars_in_billions**: INT, approximate number of stars in billions
- **is_dwarf**: BOOLEAN, indicates if the galaxy is a dwarf galaxy

### 2. star
Stores information about stars.
- **star_id**: SERIAL, Primary Key
- **name**: VARCHAR(30), star name
- **description**: TEXT, description of star
- **galaxy_id**: INT, Foreign Key referencing `galaxy(galaxy_id)`
- **age_in_millions_of_years**: NUMERIC(10,2), age of star in millions of years

### 3. planet
Stores information about planets.
- **planet_id**: SERIAL, Primary Key
- **name**: VARCHAR(30), planet name
- **description**: TEXT, description of planet
- **star_id**: INT, Foreign Key referencing `star(star_id)`
- **number_of_moons**: INT, number of moons orbiting the planet
- **has_rings**: BOOLEAN, indicates if the planet has rings

### 4. moon
Stores information about moons.
- **moon_id**: SERIAL, Primary Key
- **name**: VARCHAR(30), moon name
- **description**: TEXT, description of moon
- **planet_id**: INT, Foreign Key referencing `planet(planet_id)`
- **circumference_in_km**: INT, circumference of moon in kilometers

### 5. orbital_relationship
Stores orbital relationships between planets and moons.
- **orbital_relationship_id**: SERIAL, Primary Key
- **name**: VARCHAR(30), name of planet
- **planet_id**: INT, Foreign Key referencing `planet(planet_id)`
- **moon_id**: INT, Foreign Key referencing `moon(moon_id)`
- **orbital_period_in_days**: NUMERIC(10,2), number of days it takes the moon to orbit the planet
- **semi_major_axis_in_km**: INT, semi-major axis of the orbit in km

<!--
---

## Restoring the Database

To restore the database from the SQL dump:

```bash

# PostgreSQL
psql -U username -d celestial_db -f celestial_db_dump.sql
-->
