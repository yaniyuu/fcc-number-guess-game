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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
    user_id integer,
    secret_number integer NOT NULL,
    number_of_guesses integer NOT NULL
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 208, 209);
INSERT INTO public.games VALUES (2, 1, 78, 79);
INSERT INTO public.games VALUES (3, 2, 211, 212);
INSERT INTO public.games VALUES (4, 2, 937, 938);
INSERT INTO public.games VALUES (5, 1, 488, 491);
INSERT INTO public.games VALUES (6, 1, 286, 288);
INSERT INTO public.games VALUES (7, 1, 786, 787);
INSERT INTO public.games VALUES (8, 3, 208, 209);
INSERT INTO public.games VALUES (9, 3, 857, 858);
INSERT INTO public.games VALUES (10, 4, 709, 710);
INSERT INTO public.games VALUES (11, 4, 439, 440);
INSERT INTO public.games VALUES (12, 3, 132, 135);
INSERT INTO public.games VALUES (13, 3, 501, 503);
INSERT INTO public.games VALUES (14, 3, 157, 158);
INSERT INTO public.games VALUES (15, 5, 982, 983);
INSERT INTO public.games VALUES (16, 5, 347, 348);
INSERT INTO public.games VALUES (17, 6, 795, 796);
INSERT INTO public.games VALUES (18, 6, 454, 455);
INSERT INTO public.games VALUES (19, 5, 444, 447);
INSERT INTO public.games VALUES (20, 5, 704, 706);
INSERT INTO public.games VALUES (21, 5, 642, 643);
INSERT INTO public.games VALUES (22, 7, 275, 276);
INSERT INTO public.games VALUES (23, 7, 390, 391);
INSERT INTO public.games VALUES (24, 8, 597, 598);
INSERT INTO public.games VALUES (25, 8, 227, 228);
INSERT INTO public.games VALUES (26, 7, 649, 652);
INSERT INTO public.games VALUES (27, 7, 54, 56);
INSERT INTO public.games VALUES (28, 7, 307, 308);
INSERT INTO public.games VALUES (29, 9, 691, 692);
INSERT INTO public.games VALUES (30, 9, 938, 939);
INSERT INTO public.games VALUES (31, 10, 255, 256);
INSERT INTO public.games VALUES (32, 10, 428, 429);
INSERT INTO public.games VALUES (33, 9, 683, 686);
INSERT INTO public.games VALUES (34, 9, 77, 79);
INSERT INTO public.games VALUES (35, 9, 782, 783);
INSERT INTO public.games VALUES (36, 11, 699, 700);
INSERT INTO public.games VALUES (37, 11, 196, 197);
INSERT INTO public.games VALUES (38, 12, 433, 434);
INSERT INTO public.games VALUES (39, 12, 974, 975);
INSERT INTO public.games VALUES (40, 11, 261, 264);
INSERT INTO public.games VALUES (41, 11, 295, 297);
INSERT INTO public.games VALUES (42, 11, 381, 382);
INSERT INTO public.games VALUES (43, 13, 524, 525);
INSERT INTO public.games VALUES (44, 13, 657, 658);
INSERT INTO public.games VALUES (45, 14, 298, 299);
INSERT INTO public.games VALUES (46, 14, 527, 528);
INSERT INTO public.games VALUES (47, 13, 213, 216);
INSERT INTO public.games VALUES (48, 13, 127, 129);
INSERT INTO public.games VALUES (49, 13, 846, 847);
INSERT INTO public.games VALUES (50, 15, 128, 17);
INSERT INTO public.games VALUES (51, 16, 848, 849);
INSERT INTO public.games VALUES (52, 16, 479, 480);
INSERT INTO public.games VALUES (53, 17, 177, 178);
INSERT INTO public.games VALUES (54, 17, 833, 834);
INSERT INTO public.games VALUES (55, 16, 882, 885);
INSERT INTO public.games VALUES (56, 16, 670, 672);
INSERT INTO public.games VALUES (57, 16, 305, 306);
INSERT INTO public.games VALUES (58, 18, 48, 49);
INSERT INTO public.games VALUES (59, 18, 316, 317);
INSERT INTO public.games VALUES (60, 19, 846, 847);
INSERT INTO public.games VALUES (61, 19, 629, 630);
INSERT INTO public.games VALUES (62, 18, 250, 253);
INSERT INTO public.games VALUES (63, 18, 63, 65);
INSERT INTO public.games VALUES (64, 18, 282, 283);
INSERT INTO public.games VALUES (65, 20, 646, 647);
INSERT INTO public.games VALUES (66, 20, 802, 803);
INSERT INTO public.games VALUES (67, 21, 41, 42);
INSERT INTO public.games VALUES (68, 21, 9, 10);
INSERT INTO public.games VALUES (69, 20, 377, 380);
INSERT INTO public.games VALUES (70, 20, 90, 92);
INSERT INTO public.games VALUES (71, 20, 552, 553);
INSERT INTO public.games VALUES (72, 22, 678, 679);
INSERT INTO public.games VALUES (73, 22, 309, 310);
INSERT INTO public.games VALUES (74, 23, 262, 263);
INSERT INTO public.games VALUES (75, 23, 527, 528);
INSERT INTO public.games VALUES (76, 22, 94, 97);
INSERT INTO public.games VALUES (77, 22, 969, 971);
INSERT INTO public.games VALUES (78, 22, 902, 903);
INSERT INTO public.games VALUES (79, 24, 41, 42);
INSERT INTO public.games VALUES (80, 24, 989, 990);
INSERT INTO public.games VALUES (81, 25, 518, 519);
INSERT INTO public.games VALUES (82, 25, 181, 182);
INSERT INTO public.games VALUES (83, 24, 462, 465);
INSERT INTO public.games VALUES (84, 24, 24, 26);
INSERT INTO public.games VALUES (85, 24, 20, 21);
INSERT INTO public.games VALUES (86, 26, 960, 961);
INSERT INTO public.games VALUES (87, 26, 129, 130);
INSERT INTO public.games VALUES (88, 27, 416, 417);
INSERT INTO public.games VALUES (89, 27, 994, 995);
INSERT INTO public.games VALUES (90, 26, 918, 921);
INSERT INTO public.games VALUES (91, 26, 383, 385);
INSERT INTO public.games VALUES (92, 26, 85, 86);
INSERT INTO public.games VALUES (93, 28, 369, 370);
INSERT INTO public.games VALUES (94, 28, 782, 783);
INSERT INTO public.games VALUES (95, 29, 405, 406);
INSERT INTO public.games VALUES (96, 29, 594, 595);
INSERT INTO public.games VALUES (97, 28, 13, 16);
INSERT INTO public.games VALUES (98, 28, 632, 634);
INSERT INTO public.games VALUES (99, 28, 277, 278);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1740318631829', 2, 938);
INSERT INTO public.users VALUES (1, 'user_1740318631830', 5, 79);
INSERT INTO public.users VALUES (14, 'user_1740319093893', 2, 299);
INSERT INTO public.users VALUES (4, 'user_1740318684205', 2, 440);
INSERT INTO public.users VALUES (3, 'user_1740318684206', 5, 135);
INSERT INTO public.users VALUES (29, 'user_1740319740006', 2, 406);
INSERT INTO public.users VALUES (13, 'user_1740319093894', 5, 129);
INSERT INTO public.users VALUES (15, 'yani', 1, 17);
INSERT INTO public.users VALUES (6, 'user_1740318906424', 2, 455);
INSERT INTO public.users VALUES (28, 'user_1740319740007', 5, 16);
INSERT INTO public.users VALUES (5, 'user_1740318906425', 5, 348);
INSERT INTO public.users VALUES (17, 'user_1740319191223', 2, 178);
INSERT INTO public.users VALUES (8, 'user_1740318930749', 2, 228);
INSERT INTO public.users VALUES (7, 'user_1740318930750', 5, 56);
INSERT INTO public.users VALUES (16, 'user_1740319191224', 5, 306);
INSERT INTO public.users VALUES (18, 'user_1740319372126', 1, NULL);
INSERT INTO public.users VALUES (19, 'user_1740319372125', 1, NULL);
INSERT INTO public.users VALUES (10, 'user_1740318995383', 2, 256);
INSERT INTO public.users VALUES (20, 'user_1740319457350', 1, NULL);
INSERT INTO public.users VALUES (21, 'user_1740319457349', 1, NULL);
INSERT INTO public.users VALUES (9, 'user_1740318995384', 5, 79);
INSERT INTO public.users VALUES (12, 'user_1740319046687', 2, 434);
INSERT INTO public.users VALUES (11, 'user_1740319046688', 5, 197);
INSERT INTO public.users VALUES (23, 'user_1740319531458', 2, 263);
INSERT INTO public.users VALUES (22, 'user_1740319531459', 5, 97);
INSERT INTO public.users VALUES (25, 'user_1740319578453', 2, 182);
INSERT INTO public.users VALUES (24, 'user_1740319578454', 5, 21);
INSERT INTO public.users VALUES (27, 'user_1740319639712', 2, 417);
INSERT INTO public.users VALUES (26, 'user_1740319639713', 5, 86);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 99, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 29, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

