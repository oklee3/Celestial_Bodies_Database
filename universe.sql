--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: feature; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.feature (
    feature_id integer NOT NULL,
    name character varying(40) NOT NULL,
    supports_life boolean
);


ALTER TABLE public.feature OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_type character varying(30),
    age_in_bya numeric(3,1),
    description text
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
    name character varying(40) NOT NULL,
    radius_mi integer,
    description text,
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
    name character varying(40) NOT NULL,
    has_life boolean,
    age_in_bya numeric(3,1),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_features_feature_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_features_feature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_features_feature_id_seq OWNER TO freecodecamp;

--
-- Name: planet_features_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_features_feature_id_seq OWNED BY public.feature.feature_id;


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
    name character varying(40) NOT NULL,
    star_type character varying(30),
    surface_temp_k integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


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
-- Name: feature feature_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.feature ALTER COLUMN feature_id SET DEFAULT nextval('public.planet_features_feature_id_seq'::regclass);


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
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: feature; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.feature VALUES (1, 'Air', true);
INSERT INTO public.feature VALUES (2, 'Water', true);
INSERT INTO public.feature VALUES (3, 'Rocks', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13.6, 'The Galaxy in which Earth is located, once believed to contain all stars in the universe.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10.0, 'Observable to the naked eye from Earth, and expected to collide with the Milky Way in around 4.5 billion years.');
INSERT INTO public.galaxy VALUES (3, 'Messier 82', 'Starburst', 13.3, 'One of the closest starburst galaxies to Earth; it is five times more luminous than the Milky Way.');
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'Spiral', 13.2, 'A dark band of absorbing dust partially blocking a bright nucleus inspires this nickname.');
INSERT INTO public.galaxy VALUES (5, 'Cartwheel Galaxy', 'Ring', 0.4, 'A fairy new galaxy, and the most dominant member of the Cartwheel Galaxy Group.');
INSERT INTO public.galaxy VALUES (6, 'Hoags Object', 'Ring', 12.7, 'A strangely perfect ring-shaped galaxy comprised of younger stars around an older nucleus.');
INSERT INTO public.galaxy VALUES (7, 'A Galaxy Far, Far Away', 'Fictional', 10.0, 'The distant setting of the Star Wars franchise.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1079, 'The singular moon which orbits Earth.', 1);
INSERT INTO public.moon VALUES (2, 'Europa', 969, 'A moon of Jupiter; it is considered one of the places most likely to have the possibility of life.', 6);
INSERT INTO public.moon VALUES (3, 'Titan', 1599, 'Second largest moon in our solar system.', 7);
INSERT INTO public.moon VALUES (4, 'Io', 1131, 'The most volcanically active body in the solar system.', 6);
INSERT INTO public.moon VALUES (5, 'Ganymede', 1636, 'Largest moon in the solar system.', 6);
INSERT INTO public.moon VALUES (6, 'Phobos', 7, 'On a collision course with Mars.', 5);
INSERT INTO public.moon VALUES (7, 'Miranda', 146, 'Contains many huge canyons.', 8);
INSERT INTO public.moon VALUES (8, 'Ariel', 359, 'Could possibly contain a hidden ocean.', 8);
INSERT INTO public.moon VALUES (9, 'Thebe', 30, 'Irregularly shaped, with a large crater.', 6);
INSERT INTO public.moon VALUES (10, 'Callisto', 1497, 'The third largest moon in the solar system.', 6);
INSERT INTO public.moon VALUES (11, 'Themisto', 2, 'A very small satellite of Jupiter.', 6);
INSERT INTO public.moon VALUES (12, 'Triton', 840, 'The largest moon of Neptune.', 9);
INSERT INTO public.moon VALUES (13, 'Enceladus', 156, 'Contains an ocean underneath the icy crust.', 7);
INSERT INTO public.moon VALUES (14, 'Amalthea', 52, 'The reddest object in the solar system.', 6);
INSERT INTO public.moon VALUES (15, 'Leda', 6, 'Discovered by Charles Kowal in 1974.', 6);
INSERT INTO public.moon VALUES (16, 'Deimos', 4, 'The smaller of the 2 Mars moons.', 5);
INSERT INTO public.moon VALUES (17, 'Calypso', 6, 'A small natural satellite of Saturn.', 7);
INSERT INTO public.moon VALUES (18, 'Charon', 376, 'The largest moon of the dwarft planet Pluto.', 10);
INSERT INTO public.moon VALUES (19, 'Iapetus', 456, 'The outmost moon of Saturn.', 7);
INSERT INTO public.moon VALUES (20, 'Titania', 489, 'The largest of the moons of Uranus.', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 4.5, 1);
INSERT INTO public.planet VALUES (2, '47 Ursae Majoris', false, 8.7, 4);
INSERT INTO public.planet VALUES (3, 'Mercury', false, 4.5, 1);
INSERT INTO public.planet VALUES (4, 'Venus', false, 4.6, 1);
INSERT INTO public.planet VALUES (5, 'Mars', false, 4.6, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', false, 4.6, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', false, 4.5, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', false, 4.5, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', false, 4.5, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', false, 4.5, 1);
INSERT INTO public.planet VALUES (11, 'Tattooine', true, 5.0, 7);
INSERT INTO public.planet VALUES (12, 'Dagobah', true, 5.0, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 5772, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'A0', 9940, 1);
INSERT INTO public.star VALUES (3, 'Alpheratz', 'B8p', 13000, 2);
INSERT INTO public.star VALUES (4, 'Alpha Ursae Majoris', 'K0', 4650, 3);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'SRc', 3800, 1);
INSERT INTO public.star VALUES (6, 'UY Scuti', 'RSG', 3550, 1);
INSERT INTO public.star VALUES (7, 'Twin Suns', 'Dual', 5000, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_features_feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_features_feature_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: feature planet_features_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT planet_features_name_key UNIQUE (name);


--
-- Name: feature planet_features_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT planet_features_pkey PRIMARY KEY (feature_id);


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
-- PostgreSQL database dump complete
--

