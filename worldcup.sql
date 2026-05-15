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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: orbit; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.orbit (
    game_id integer NOT NULL,
    year smallint NOT NULL,
    round character varying(50) NOT NULL,
    winner character varying(50) NOT NULL,
    opponent character varying(50) NOT NULL,
    winner_goals smallint NOT NULL,
    opponent_goals smallint NOT NULL
);


ALTER TABLE public.orbit OWNER TO freecodecamp;

--
-- Name: orbit_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.orbit_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orbit_game_id_seq OWNER TO freecodecamp;

--
-- Name: orbit_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.orbit_game_id_seq OWNED BY public.orbit.game_id;


--
-- Name: system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.system (
    system_id integer NOT NULL,
    team character varying(50) NOT NULL
);


ALTER TABLE public.system OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_system_id_seq OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.system_system_id_seq OWNED BY public.system.system_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: orbit game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit ALTER COLUMN game_id SET DEFAULT nextval('public.orbit_game_id_seq'::regclass);


--
-- Name: system system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system ALTER COLUMN system_id SET DEFAULT nextval('public.system_system_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (97, 2018, 'Final', 843, 844, 4, 2);
INSERT INTO public.games VALUES (98, 2018, 'Third Place', 845, 846, 2, 0);
INSERT INTO public.games VALUES (99, 2018, 'Semi-Final', 844, 846, 2, 1);
INSERT INTO public.games VALUES (100, 2018, 'Semi-Final', 843, 845, 1, 0);
INSERT INTO public.games VALUES (101, 2018, 'Quarter-Final', 844, 847, 3, 2);
INSERT INTO public.games VALUES (102, 2018, 'Quarter-Final', 846, 848, 2, 0);
INSERT INTO public.games VALUES (103, 2018, 'Quarter-Final', 845, 849, 2, 1);
INSERT INTO public.games VALUES (104, 2018, 'Quarter-Final', 843, 850, 2, 0);
INSERT INTO public.games VALUES (105, 2018, 'Eighth-Final', 846, 851, 2, 1);
INSERT INTO public.games VALUES (106, 2018, 'Eighth-Final', 848, 852, 1, 0);
INSERT INTO public.games VALUES (107, 2018, 'Eighth-Final', 845, 853, 3, 2);
INSERT INTO public.games VALUES (108, 2018, 'Eighth-Final', 849, 854, 2, 0);
INSERT INTO public.games VALUES (109, 2018, 'Eighth-Final', 844, 855, 2, 1);
INSERT INTO public.games VALUES (110, 2018, 'Eighth-Final', 847, 856, 2, 1);
INSERT INTO public.games VALUES (111, 2018, 'Eighth-Final', 850, 857, 2, 1);
INSERT INTO public.games VALUES (112, 2018, 'Eighth-Final', 843, 858, 4, 3);
INSERT INTO public.games VALUES (113, 2014, 'Final', 859, 858, 1, 0);
INSERT INTO public.games VALUES (114, 2014, 'Third Place', 860, 849, 3, 0);
INSERT INTO public.games VALUES (115, 2014, 'Semi-Final', 858, 860, 1, 0);
INSERT INTO public.games VALUES (116, 2014, 'Semi-Final', 859, 849, 7, 1);
INSERT INTO public.games VALUES (117, 2014, 'Quarter-Final', 860, 861, 1, 0);
INSERT INTO public.games VALUES (118, 2014, 'Quarter-Final', 858, 845, 1, 0);
INSERT INTO public.games VALUES (119, 2014, 'Quarter-Final', 849, 851, 2, 1);
INSERT INTO public.games VALUES (120, 2014, 'Quarter-Final', 859, 843, 1, 0);
INSERT INTO public.games VALUES (121, 2014, 'Eighth-Final', 849, 862, 2, 1);
INSERT INTO public.games VALUES (122, 2014, 'Eighth-Final', 851, 850, 2, 0);
INSERT INTO public.games VALUES (123, 2014, 'Eighth-Final', 843, 863, 2, 0);
INSERT INTO public.games VALUES (124, 2014, 'Eighth-Final', 859, 864, 2, 1);
INSERT INTO public.games VALUES (125, 2014, 'Eighth-Final', 860, 854, 2, 1);
INSERT INTO public.games VALUES (126, 2014, 'Eighth-Final', 861, 865, 2, 1);
INSERT INTO public.games VALUES (127, 2014, 'Eighth-Final', 858, 852, 1, 0);
INSERT INTO public.games VALUES (128, 2014, 'Eighth-Final', 845, 866, 2, 1);


--
-- Data for Name: orbit; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (843, 'France');
INSERT INTO public.teams VALUES (844, 'Croatia');
INSERT INTO public.teams VALUES (845, 'Belgium');
INSERT INTO public.teams VALUES (846, 'England');
INSERT INTO public.teams VALUES (847, 'Russia');
INSERT INTO public.teams VALUES (848, 'Sweden');
INSERT INTO public.teams VALUES (849, 'Brazil');
INSERT INTO public.teams VALUES (850, 'Uruguay');
INSERT INTO public.teams VALUES (851, 'Colombia');
INSERT INTO public.teams VALUES (852, 'Switzerland');
INSERT INTO public.teams VALUES (853, 'Japan');
INSERT INTO public.teams VALUES (854, 'Mexico');
INSERT INTO public.teams VALUES (855, 'Denmark');
INSERT INTO public.teams VALUES (856, 'Spain');
INSERT INTO public.teams VALUES (857, 'Portugal');
INSERT INTO public.teams VALUES (858, 'Argentina');
INSERT INTO public.teams VALUES (859, 'Germany');
INSERT INTO public.teams VALUES (860, 'Netherlands');
INSERT INTO public.teams VALUES (861, 'Costa Rica');
INSERT INTO public.teams VALUES (862, 'Chile');
INSERT INTO public.teams VALUES (863, 'Nigeria');
INSERT INTO public.teams VALUES (864, 'Algeria');
INSERT INTO public.teams VALUES (865, 'Greece');
INSERT INTO public.teams VALUES (866, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 128, true);


--
-- Name: orbit_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.orbit_game_id_seq', 320, true);


--
-- Name: system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.system_system_id_seq', 64, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 866, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: orbit orbit_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit
    ADD CONSTRAINT orbit_pkey PRIMARY KEY (game_id);


--
-- Name: system system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_pkey PRIMARY KEY (system_id);


--
-- Name: system system_team_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_team_key UNIQUE (team);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

