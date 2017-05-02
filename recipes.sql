--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ingredient; Type: TABLE; Schema: public; Owner: doug
--

CREATE TABLE ingredient (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    recipeid integer NOT NULL
);


ALTER TABLE ingredient OWNER TO doug;

--
-- Name: ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: doug
--

CREATE SEQUENCE ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingredient_id_seq OWNER TO doug;

--
-- Name: ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doug
--

ALTER SEQUENCE ingredient_id_seq OWNED BY ingredient.id;


--
-- Name: instruction; Type: TABLE; Schema: public; Owner: doug
--

CREATE TABLE instruction (
    id integer NOT NULL,
    instruction character varying(500) NOT NULL,
    recipeid integer NOT NULL
);


ALTER TABLE instruction OWNER TO doug;

--
-- Name: instruction_id_seq; Type: SEQUENCE; Schema: public; Owner: doug
--

CREATE SEQUENCE instruction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE instruction_id_seq OWNER TO doug;

--
-- Name: instruction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doug
--

ALTER SEQUENCE instruction_id_seq OWNED BY instruction.id;


--
-- Name: recipe; Type: TABLE; Schema: public; Owner: doug
--

CREATE TABLE recipe (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description character varying(1000),
    servings integer NOT NULL,
    imageurl character varying(500) NOT NULL,
    created timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
);


ALTER TABLE recipe OWNER TO doug;

--
-- Name: recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: doug
--

CREATE SEQUENCE recipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipe_id_seq OWNER TO doug;

--
-- Name: recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: doug
--

ALTER SEQUENCE recipe_id_seq OWNED BY recipe.id;


--
-- Name: ingredient id; Type: DEFAULT; Schema: public; Owner: doug
--

ALTER TABLE ONLY ingredient ALTER COLUMN id SET DEFAULT nextval('ingredient_id_seq'::regclass);


--
-- Name: instruction id; Type: DEFAULT; Schema: public; Owner: doug
--

ALTER TABLE ONLY instruction ALTER COLUMN id SET DEFAULT nextval('instruction_id_seq'::regclass);


--
-- Name: recipe id; Type: DEFAULT; Schema: public; Owner: doug
--

ALTER TABLE ONLY recipe ALTER COLUMN id SET DEFAULT nextval('recipe_id_seq'::regclass);


--
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: doug
--

COPY ingredient (id, name, recipeid) FROM stdin;
5	1 pound bacon\n	2
6	1/4 teaspoons crushed red pepper flakes\n	2
7	1 pound rigatoni or penne pasta\n	2
8	1/2 cups heavy cream\n	2
9	1/4 cups cream cheese \n	2
10	1/4 cups grated parmesan cheese	2
11	2 whole eggs\n	2
12	1/4 teaspoons freshly ground black pepper	2
13	2 boneless skinless chicken breast halves, cut into thin strips\n	3
14	4 ounces linguine, cooked al dente\n	3
15	3  teaspoons cajun seasoning (your recipe, Cajun Seasoning Mix or store-bought)\n	3
16	2 tablespoons butter\n	3
17	1 thinly sliced green onion\n	3
18	1.5 cup heavy whipping cream\n	3
19	2 tablespoons chopped sun-dried tomatoes\n	3
20	1/4 teaspoon salt\n	3
21	1/4 teaspoon dried basil\n	3
22	1/8 teaspoon ground black pepper\n	3
23	1/8 teaspoon garlic powder\n	3
24	1/4 cup grated parmesan cheese	3
25	3-4 chicken breasts, diced\n	5
26	1/3 cup cornstarch\n	5
27	1 cup water\n	5
28	2-3 tablespoons sriracha (depending on how spicy you want it)\n	5
29	5 tablespoons soy sauce\n	5
30	1 tablespoon minced garlic\n	5
31	1/4 cup sugar\n	5
32	2-3 tablespoons honey (depending on how sweet you want it)\n	5
33	2 tablespoons corn starch + 2 tablespoons cold water\n	5
45	1⁄2 cup butter, melted	10
46	1 1⁄2 cups granulated sugar	10
47	1⁄2 teaspoon vanilla extract	10
48	2 eggs	10
49	3/4 cup all-purpose flour	10
50	1/2 cup unsweetened cocoa powder	10
51	1/4 teaspoon salt	10
52	1/4 teaspoon baking soda (omit if you don't want the crunchy crust)	10
53	1 cup semisweet chocolate	10
54	Peanut Butter	11
55	Jelly	11
56	Bread	11
57	Knife	11
\.


--
-- Name: ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doug
--

SELECT pg_catalog.setval('ingredient_id_seq', 57, true);


--
-- Data for Name: instruction; Type: TABLE DATA; Schema: public; Owner: doug
--

COPY instruction (id, instruction, recipeid) FROM stdin;
4	In a skillet, fry the bacon.	2
5	Sprinkle with red pepper flakes. 	2
6	When done, remove bacon until cool enough to handle and roughly chop.	2
7	Meanwhile, cook the pasta in boiling salted water until done (according to package instructions ).	2
8	Place cream and cream cheese in a small saucepan. Heat over low until cream cheese is melted, and whisk until smooth. Remove from heat.	2
9	Add the parmesan cheese, eggs, and pepper and whisk until blended. 	2
10	Drain pasta (reserving 1/2 cup of hot water) and return to pot. Immediately add the white sauce and toss to coat. The hot pasta will cook the eggs.	2
11	Stir in the bacon, and add some reserved pasta water if needed to loosen the sauce.\n	2
12	Place chicken and Cajun seasoning in a bowl and toss to coat.	3
13	In a large skillet over medium heat, sauté chicken in butter or margarine until chicken is tender, about 5 to 7 minutes.	3
14	Reduce heat add green onion, heavy cream, tomatoes, basil, salt, garlic powder, black pepper and heat through.\n	3
15	Pour over hot linguine and toss with Parmesan cheese.	3
16	In a small-medium sauce pan, combine the 1 cup of water, sriracha, soy sauce, garlic, sugar, and honey and stir. Bring mixture to a boil over medium heat. \n	5
17	Whisk together the 2 tablespoons corn starch and remaining 2 tablespoons of water until dissolved. Add to sauce pan and stir until thickened. Reduce heat to low.\n	5
18	Add diced chicken and ⅓ cup corn starch to a large plastic bag. Seal the bag and shake to coat chicken. Drizzle a large pan or skillet with oil over medium heat. Add chicken and sauté until browned and chicken is cooked through. Add the sauce and stir to coat. \n	5
19	Sprinkle with crushed pepper flakes if desired and serve over warm rice.	5
30	Preheat your oven to 350 degrees Fahrenheit or 175 degrees Celsius.	10
31	Melt the butter and lightly grease a pan of your liking (I used an 8x8 because I like a thicker brownie).	10
32	In a large bowl; combine the flour, cocoa powder, salt, and baking soda.	10
33	In another large bowl; combine the sugar, melted butter, and vanilla extract.	10
34	Once combined beat in the eggs, one at a time, mixing well after each until thoroughly blended.	10
35	Gradually add in the flour mixture to the egg/sugar mixture.	10
36	Toss the chocolate chips in a little flour. (The flour will keep them from sinking to the bottom of the pan.).	10
37	Mix the chocolate chips into the batter.	10
38	Bake for 20-25 minutes. (The brownies are done if you stick a toothpick in the middle and it comes out clean.	10
39	(ALSO, THE BATTER IS GOING TO RISE. PLEASE, DO NOT BE ALARMED! ONCE IT SINKS, WHICH TAKES ALL OF 10 MINUTES, I CAN ASSURE YOU THEY MIGHT BE THE BEST BROWNIES YOU'VE EVER TASTED.).	10
40	Logic	11
41	More Logic	11
42	Even More Logic	11
43	Eat.	11
\.


--
-- Name: instruction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doug
--

SELECT pg_catalog.setval('instruction_id_seq', 43, true);


--
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: doug
--

COPY recipe (id, title, description, servings, imageurl, created) FROM stdin;
2	Bacon And Parmesan Pasta	\N	4	https://s-media-cache-ak0.pinimg.com/564x/8d/e0/b3/8de0b30903fbda1ecc7fc63a006d0ff3.jpg	2017-04-18 02:00:00
3	Creamy Cajun Chicken Pasta	N'awlin's style of chicken with an updated Alfredo sauce.	2	http://img.sndimg.com/food/image/upload/h_464,w_619,c_fit/v1/img/recipes/39/08/7/piccZDaro.jpg	2017-04-18 03:00:00
5	Honey Sriracha Chicken	Sweet and spicy Chinese honey sriracha chicken – better tasting and healthier than take out! 	4	http://www.lecremedelacrumb.com/wp-content/uploads/2014/12/honey-sriracha-chicken-1.jpg	2017-04-18 04:00:00
10	Best Gooey Brownie Recipe EVER	This recipe is uber delicious and it is so simple, your 3 year old could make it (granted you measure everything out first).	12	http://img.sndimg.com/food/image/upload/h_420,w_560,c_fit/v1/img/recipes/49/86/62/003y67TCTg6UPZOKEZag_Brownies-8.png	2017-04-21 00:00:00
11	PB&J	Yummy sandwich for coding 	1	http://www.smuckers.com/smuckers/pbj/peanut-butter-jelly-pairing.png	2017-04-21 00:00:00
\.


--
-- Name: recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: doug
--

SELECT pg_catalog.setval('recipe_id_seq', 11, true);


--
-- Name: ingredient ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: doug
--

ALTER TABLE ONLY ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (id);


--
-- Name: instruction instruction_pkey; Type: CONSTRAINT; Schema: public; Owner: doug
--

ALTER TABLE ONLY instruction
    ADD CONSTRAINT instruction_pkey PRIMARY KEY (id);


--
-- Name: recipe recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: doug
--

ALTER TABLE ONLY recipe
    ADD CONSTRAINT recipe_pkey PRIMARY KEY (id);


--
-- Name: ingredient_id_uindex; Type: INDEX; Schema: public; Owner: doug
--

CREATE UNIQUE INDEX ingredient_id_uindex ON ingredient USING btree (id);


--
-- Name: instruction_id_uindex; Type: INDEX; Schema: public; Owner: doug
--

CREATE UNIQUE INDEX instruction_id_uindex ON instruction USING btree (id);


--
-- Name: recipe_id_uindex; Type: INDEX; Schema: public; Owner: doug
--

CREATE UNIQUE INDEX recipe_id_uindex ON recipe USING btree (id);


--
-- Name: ingredient ingredient_recipe_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doug
--

ALTER TABLE ONLY ingredient
    ADD CONSTRAINT ingredient_recipe_id_fk FOREIGN KEY (recipeid) REFERENCES recipe(id);


--
-- Name: instruction ingredient_recipe_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: doug
--

ALTER TABLE ONLY instruction
    ADD CONSTRAINT ingredient_recipe_id_fk FOREIGN KEY (recipeid) REFERENCES recipe(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

