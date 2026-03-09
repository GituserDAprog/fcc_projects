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
    name character varying(100) NOT NULL,
    galaxy_types character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    is_irregular boolean
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
    name character varying(100) NOT NULL,
    diameter_km numeric(10,2) NOT NULL,
    is_lonely boolean,
    distance_from_earth_ly numeric(15,10),
    planet_id integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    has_life boolean,
    size_km integer NOT NULL,
    weight_kg numeric(28,3),
    star_id integer
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
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    future_supernovae boolean NOT NULL,
    mass_solar_mass numeric(10,4),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_planet (
    star_planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    galaxy_id integer,
    star_id integer
);


ALTER TABLE public.star_planet OWNER TO freecodecamp;

--
-- Name: star_planet_star_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_planet_star_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_planet_star_planet_id_seq OWNER TO freecodecamp;

--
-- Name: star_planet_star_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_planet_star_planet_id_seq OWNED BY public.star_planet.star_planet_id;


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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_planet star_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet ALTER COLUMN star_planet_id SET DEFAULT nextval('public.star_planet_star_planet_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Sagitarius', 'irregular', 'cool galaxy.', 1600, true);
INSERT INTO public.galaxy VALUES (4, 'Capricornio', 'irregular', 'boring galaxy.', 22500, true);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', ' the galaxy that includes the Solar System, with the name describing the galaxy''s appearance from Earth: a hazy band of light seen in the night sky formed from stars in other arms of the galaxy, which are so far away that they cannot be individually distinguished by the naked eye.', 13600, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', ' É a galáxia espiral mais próxima da Via Láctea e seu nome é derivado da constelação onde está situada, que, por sua vez, tem o nome derivado da princesa mitológica Andrômeda. ', 7000, false);
INSERT INTO public.galaxy VALUES (6, 'Scorpion', 'elliptical', 'tough galaxy.', 2100, false);
INSERT INTO public.galaxy VALUES (7, 'Pegasus', 'elliptical', 'tough galaxy.', 11100, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth moon', 3474.00, true, 0.0000000406, 1);
INSERT INTO public.moon VALUES (2, 'Umbriel', 1169.00, false, 0.0003400000, 2);
INSERT INTO public.moon VALUES (3, 'Miranda', 2011.00, false, 0.0003100000, 3);
INSERT INTO public.moon VALUES (4, 'Iforgot', 1000.00, false, 0.0002100000, 4);
INSERT INTO public.moon VALUES (5, 'Lasaturn', 900.00, false, 0.0003100000, 5);
INSERT INTO public.moon VALUES (6, 'Sdagobah', 4100.00, false, 11100.0000000000, 6);
INSERT INTO public.moon VALUES (7, 'habogad', 1550.00, false, 51100.0000000000, 7);
INSERT INTO public.moon VALUES (9, 'Sdago3', 550.00, false, 52100.0000000000, 9);
INSERT INTO public.moon VALUES (10, 'Sdago4', 2321.00, false, 45100.0000000000, 10);
INSERT INTO public.moon VALUES (11, 'Yoda', 781.00, false, 45000.0000000000, 11);
INSERT INTO public.moon VALUES (12, 'Griveous', 1641.00, false, 70000.0000000000, 12);
INSERT INTO public.moon VALUES (13, 'Palpatine', 2000.00, false, 70100.0000000000, 2);
INSERT INTO public.moon VALUES (14, 'Scold', 6030.00, true, 44600.0000000000, 2);
INSERT INTO public.moon VALUES (15, 'Mcorus', 1950.00, false, 98600.0000000000, 3);
INSERT INTO public.moon VALUES (18, 'Mcorus2', 1224.00, false, 97400.0000000000, 6);
INSERT INTO public.moon VALUES (17, 'Mcorus1', 1364.00, false, 97600.0000000000, 7);
INSERT INTO public.moon VALUES (19, 'Mcorus3', 2152.00, false, 97900.0000000000, 8);
INSERT INTO public.moon VALUES (20, 'Skusen', 1404.00, false, 88100.0000000000, 9);
INSERT INTO public.moon VALUES (21, 'Kukusen', 3509.00, false, 87100.0000000000, 10);
INSERT INTO public.moon VALUES (22, 'Gokusen', 909.00, false, 87900.0000000000, 11);
INSERT INTO public.moon VALUES (23, 'Friekusen', 1768.00, false, 87400.0000000000, 12);
INSERT INTO public.moon VALUES (24, 'Twinkusen', 1832.00, false, 86600.0000000000, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 12647, 5976000000000000000000000.000, 1);
INSERT INTO public.planet VALUES (2, 'Dagobah', true, 22537, 597600000000000000000.000, 2);
INSERT INTO public.planet VALUES (3, 'Mars', false, 6624, 6471000000000000000000.000, 3);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 69886, 1810000000000000000000000.000, 4);
INSERT INTO public.planet VALUES (5, 'Hoth', true, 89886, 2810000000000000000000000.000, 5);
INSERT INTO public.planet VALUES (6, 'Vulcan', true, 9886, 233810000000000000000.000, 6);
INSERT INTO public.planet VALUES (7, 'Venus', false, 586, 338100000000.000, 1);
INSERT INTO public.planet VALUES (8, 'Coruscant', true, 115869, 938100000000000000000000.000, 2);
INSERT INTO public.planet VALUES (9, 'Tsunami', false, 10869, 1668100000000000000000000.000, 3);
INSERT INTO public.planet VALUES (10, 'Saturn', false, 50869, 9668100000000000000000000.000, 4);
INSERT INTO public.planet VALUES (11, 'Uranus', false, 5869, 1581000000000000000000000.000, 5);
INSERT INTO public.planet VALUES (12, 'Namekusen', true, 169, 15810000000000.000, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, false, 1.0000, 1);
INSERT INTO public.star VALUES (2, 'Omicron_Velorum', 39001, false, 5.5000, 2);
INSERT INTO public.star VALUES (3, 'Fallen_omen', 401, false, 7.3000, 3);
INSERT INTO public.star VALUES (4, 'Galactus', 4701, true, 15.3000, 4);
INSERT INTO public.star VALUES (5, 'Little giant', 3601, true, 10.9000, 6);
INSERT INTO public.star VALUES (6, 'Destoryer', 2601, false, 2.9000, 7);


--
-- Data for Name: star_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_planet VALUES (1, 'Sun_Earth', NULL, NULL, NULL);
INSERT INTO public.star_planet VALUES (2, 'Omicron_velorum_Uranus', NULL, NULL, NULL);
INSERT INTO public.star_planet VALUES (3, 'Destroyer_Hoth', NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_planet_star_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_planet_star_planet_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_planet star_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_name_key UNIQUE (name);


--
-- Name: star_planet star_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_pkey PRIMARY KEY (star_planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- Name: star_planet star_planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star_planet star_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star_planet star_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

