--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    number_of_stars_in_billions integer,
    is_dwarf boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    planet_id integer,
    circumference_in_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: orbital_relationship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.orbital_relationship (
    orbital_relationship_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    moon_id integer,
    orbital_period_in_days numeric(10,2),
    semi_major_axis_in_km integer
);


ALTER TABLE public.orbital_relationship OWNER TO freecodecamp;

--
-- Name: orbital_relationships_orbital_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.orbital_relationships_orbital_relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orbital_relationships_orbital_relationship_id_seq OWNER TO freecodecamp;

--
-- Name: orbital_relationships_orbital_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.orbital_relationships_orbital_relationship_id_seq OWNED BY public.orbital_relationship.orbital_relationship_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    star_id integer,
    number_of_moons integer,
    has_rings boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer,
    age_in_millions_of_years numeric(10,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: orbital_relationship orbital_relationship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbital_relationship ALTER COLUMN orbital_relationship_id SET DEFAULT nextval('public.orbital_relationships_orbital_relationship_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', NULL, 3, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 4, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 4, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', NULL, 5, NULL);
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, 5, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, 5, NULL);
INSERT INTO public.moon VALUES (7, 'Titan', NULL, 6, NULL);
INSERT INTO public.moon VALUES (8, 'Rhea', NULL, 6, NULL);
INSERT INTO public.moon VALUES (9, 'Dione', NULL, 6, NULL);
INSERT INTO public.moon VALUES (10, 'Mimas', NULL, 6, NULL);
INSERT INTO public.moon VALUES (11, 'Tethys', NULL, 6, NULL);
INSERT INTO public.moon VALUES (12, 'Enceladus', NULL, 6, NULL);
INSERT INTO public.moon VALUES (13, 'Miranda', NULL, 7, NULL);
INSERT INTO public.moon VALUES (14, 'Ariel', NULL, 7, NULL);
INSERT INTO public.moon VALUES (15, 'Umbriel', NULL, 7, NULL);
INSERT INTO public.moon VALUES (16, 'Titania', NULL, 7, NULL);
INSERT INTO public.moon VALUES (17, 'Triton', NULL, 8, NULL);
INSERT INTO public.moon VALUES (18, 'Proteus', NULL, 8, NULL);
INSERT INTO public.moon VALUES (19, 'Larissa', NULL, 8, NULL);
INSERT INTO public.moon VALUES (20, 'Galatea', NULL, 8, NULL);


--
-- Data for Name: orbital_relationship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.orbital_relationship VALUES (1, 'Earth', 3, 1, 27.32, 384400);
INSERT INTO public.orbital_relationship VALUES (2, 'Mars', 4, 2, 0.32, 9376);
INSERT INTO public.orbital_relationship VALUES (3, 'Mars', 4, 3, 1.26, 23460);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'Sirius I', NULL, 2, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Betelgeuse I', NULL, 3, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Alpheratz I', NULL, 4, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'R136a1 I', NULL, 5, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'AzV 123 I', NULL, 6, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, 1, 1, false);
INSERT INTO public.planet VALUES (1, 'Mercury', NULL, 1, 0, false);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, 1, 0, false);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, 1, 2, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, 1, 79, true);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, 1, 83, true);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, 1, 27, true);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, 1, 14, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', NULL, 1, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', NULL, 1, NULL);
INSERT INTO public.star VALUES (4, 'Alpheratz', NULL, 2, NULL);
INSERT INTO public.star VALUES (5, 'R136a1', NULL, 3, NULL);
INSERT INTO public.star VALUES (6, 'AzV 123', NULL, 4, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: orbital_relationships_orbital_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.orbital_relationships_orbital_relationship_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: orbital_relationship orbital_relationships_orbital_relationship_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbital_relationship
    ADD CONSTRAINT orbital_relationships_orbital_relationship_id_key UNIQUE (orbital_relationship_id);


--
-- Name: orbital_relationship orbital_relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbital_relationship
    ADD CONSTRAINT orbital_relationships_pkey PRIMARY KEY (orbital_relationship_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: orbital_relationship orbital_relationship_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbital_relationship
    ADD CONSTRAINT orbital_relationship_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: orbital_relationship orbital_relationship_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbital_relationship
    ADD CONSTRAINT orbital_relationship_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

