--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: William
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO "William";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: books; Type: TABLE; Schema: public; Owner: William; Tablespace: 
--

CREATE TABLE books (
    id integer DEFAULT nextval('books_id_seq'::regclass) NOT NULL,
    title character varying(255),
    subtitle character varying(255),
    author character varying(255),
    pubdate date,
    us_price double precision,
    can_price double precision,
    isbn_13 character varying(255),
    short_descrip text,
    long_descrip text,
    "position" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    marketing text,
    selling_point text,
    format character varying(255),
    book_available_now boolean,
    preview_info_overide character varying(255),
    preview_format character varying(255),
    preview_available_now boolean,
    ship_date date,
    publisher character varying(255),
    contact_name character varying(255),
    contact_email character varying(255),
    galley_url character varying(255),
    editor_name character varying(255),
    editor_email character varying(255),
    marketing_name character varying(255),
    marketing_email character varying(255)
);


ALTER TABLE public.books OWNER TO "William";

--
-- Name: books_orders; Type: TABLE; Schema: public; Owner: William; Tablespace: 
--

CREATE TABLE books_orders (
    book_id integer,
    order_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.books_orders OWNER TO "William";

--
-- Name: covers_id_seq; Type: SEQUENCE; Schema: public; Owner: William
--

CREATE SEQUENCE covers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.covers_id_seq OWNER TO "William";

--
-- Name: covers; Type: TABLE; Schema: public; Owner: William; Tablespace: 
--

CREATE TABLE covers (
    id integer DEFAULT nextval('covers_id_seq'::regclass) NOT NULL,
    book_id integer,
    parent_id integer,
    size integer,
    width integer,
    height integer,
    content_type character varying(255),
    filename character varying(255),
    thumbnail character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.covers OWNER TO "William";

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: William
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO "William";

--
-- Name: orders; Type: TABLE; Schema: public; Owner: William; Tablespace: 
--

CREATE TABLE orders (
    id integer DEFAULT nextval('orders_id_seq'::regclass) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    store character varying(255),
    address1 character varying(255),
    address2 character varying(255),
    city character varying(255),
    state character varying(255),
    zip character varying(255),
    email character varying(255),
    opt_in boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    keycode character varying(255),
    purchaser_type character varying(255),
    eula boolean,
    review_url character varying(255),
    phone character varying(255),
    newsletter_optin boolean
);


ALTER TABLE public.orders OWNER TO "William";

--
-- Name: schema_info; Type: TABLE; Schema: public; Owner: William; Tablespace: 
--

CREATE TABLE schema_info (
    version integer
);


ALTER TABLE public.schema_info OWNER TO "William";

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: William; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO "William";

--
-- Name: site_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: William
--

CREATE SEQUENCE site_reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_reviews_id_seq OWNER TO "William";

--
-- Name: site_reviews; Type: TABLE; Schema: public; Owner: William; Tablespace: 
--

CREATE TABLE site_reviews (
    id integer DEFAULT nextval('site_reviews_id_seq'::regclass) NOT NULL,
    approve boolean,
    comments text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    order_id integer
);


ALTER TABLE public.site_reviews OWNER TO "William";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: William
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "William";

--
-- Name: users; Type: TABLE; Schema: public; Owner: William; Tablespace: 
--

CREATE TABLE users (
    id integer DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
    login character varying(255),
    email character varying(255),
    crypted_password character varying(40),
    salt character varying(40),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    remember_token character varying(255),
    remember_token_expires_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO "William";

--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: William
--

COPY books (id, title, subtitle, author, pubdate, us_price, can_price, isbn_13, short_descrip, long_descrip, "position", created_at, updated_at, marketing, selling_point, format, book_available_now, preview_info_overide, preview_format, preview_available_now, ship_date, publisher, contact_name, contact_email, galley_url, editor_name, editor_email, marketing_name, marketing_email) FROM stdin;
1	Istanbul Passage	A Novel	Joseph Kanon	2012-05-29	26	29.9899999999999984	9781439156414	From the acclaimed, bestselling author of Stardust, The Good German, and Los Alamosâ€”a gripping tale of an American undercover agent in 1945 Istanbul who descends into the murky cat-and-mouse world of compromise and betrayal that will come to define the entire post-war era.	<p>A neutral capital straddling Europe and Asia, Istanbul has spent the war as a magnet for refugees and spies. Even American businessman Leon Bauer has been drawn into this shadow world, doing undercover odd jobs and courier runs for the Allied war effort. Now as the espionage community begins to pack up and an apprehensive city prepares for the grim realities of post-war life, he is given one more assignment, a routine job that goes fatally wrong, plunging him into a tangle of intrigue and moral confusion.</p> \r\n\r\n<p>Played out against the bazaars and mosques and faded mansions of this knowing, ancient Ottoman city, Leon's attempt to save one life leads to a desperate manhunt and a maze of shifting loyalties that threatens his own. How do you do the right thing when there are only bad choices to make? Istanbul Passage is the story of a man swept up in the aftermath of war, an unexpected love affair, and a city as deceptive as the calm surface waters of the Bosphorus that divides it.</p>\r\n\r\n<p>"Istanbul Passage bristles with authenticity. Joseph Kanon has a unique and admirable talent: he brilliantly marries suspense and historical fact, wrapping them around a core of pure human drama, while making it seem effortless. This isn't just talent; it's magic.â€ â€”Olen Steinhauer, New York Times bestselling author of The Tourist</p>\r\n\r\n<p>â€œIstanbul Passage is a first-rate espionage novel, filled with complexity and thrills, but its greatest success may be in this much more universal literary exploration: how an ordinary man is transformed by extraordinary circumstances.â€ â€”Chris Pavone, New York Times bestselling author of The Expats, in Publishers Weekly</p>\r\n\r\n<p>"With dialogue that can go off like gunfire and a streak of nostalgia that feels timeless, this book takes its place among espionage novels as an instant classic." â€”Kirkus Reviews (Starred Review)</p>	1	2009-04-17 12:21:55	2012-04-30 15:40:18	<li>Egalley expires 6/30/12</li>\r\n<li>National print review and feature campaign</li>\r\n<li>Advance Readerâ€™s Copies</li>\r\n<li>ARC and finished book mailings to key accounts</li>\r\n<li>Cross promotion with the author's website: MonsKallentoft.se</li>\r\n<li>SimonandSchuster.com feature</li>\r\n<li>SimonandSchuster.com newsletter feature</li>\r\n<li>Online promotions and features</li>\r\n<li>Included in Atria's International Books of Mystery promotion</li>\r\n\r\n	Shortlisted for the UK's prestigious Orange Prize, this is a haunting coming-of-age novel with a love story at its heart. 	Hardcover	\N	\N	Finished Book	\N	2012-07-02	Atria Books	Paul Olsewski, Publicist	Paul.Olsewski@simonandschuster.com	http://www.netgalley.com/PopupHandler.php?module=catalog&func=galleyTitleDetails&projectid=14580	Peter Borland, Editor	Peter.Borland@simonandschuster.com	Hillary Tisman, Marketing	Hillary.Tisman@simonandschuster.com
2	The Map of Time 	A Novel	FÃ©lix J. Palma 	2011-06-28	26	29.9899999999999984	9781439167397	Published to massive acclaim in Spain, FÃ©lix J. Palmaâ€™s rollicking page-turner boasts a cast of real and imagined literary characters and cunning intertwined plots, as a skeptical H.G. Wells becomes a time-traveling investigator in Victorian London. 	<p>Published to massive acclaim in Spain, FÃ©lix J. Palmaâ€™s rollicking page-turner boasts a cast of real and imagined literary characters and cunning intertwined plots, as a skeptical H.G. Wells becomes a time-traveling investigator in Victorian London.</p>\r\n\r\n<p>Jack the Ripper, Allan Quartermain, <i>Dracula</i> author Bram Stoker, the Elephant Man, and Henry James are among the players in FÃ©lix J. Palmaâ€™s captivating and ambitious novel. To save innocent livesâ€”including that of his own wifeâ€”H.G. Wells the author of <i>The Time Machine</i> must discover the truth about purported incidents of time travel. The mysteries involve an aristocrat in love with a murdered prostitute from the past; a woman bent on fleeing the strictures of Victorian society by searching for her lover somewhere in the future; and a fourth-dimensional plot to murder celebrated authors in order to steal their fictional creations.</p>\r\n\r\n<p>Awarded the 2008 XL Ateneo de Sevilla Novela Prize and lauded as â€œa miracle from beginning to endâ€¦a masterpieceâ€  <i>(QuÃ© Leer</i>) on its original publication, <i>The Map of Time</i> is an audacious historical fantasy executed with uncommon skill. It is a story full of love, adventure, and extraordinary imagination.</p>\r\n\r\n<p>"A brilliant and breathtaking trip through metafictional time." \r\nâ€”Scott Westerfeld, <i>New York Times</i> bestselling author of <i>Leviathan</i></p>\r\n\r\n<p>"Palma makes his U.S. debut with the brilliant first in a trilogy, an intriguing thriller." \r\nâ€”starred <i>Publishers Weekly</i> review</p>\r\n\r\n<p>"Readers who embark on the journey...will be richly rewarded. \r\nâ€”starred <i>Booklist</i> review</p>\r\n\r\n<p>â€œStrange and wonderful. Magical and smart. FÃ©lix J. Palma has done more than written a wonderful novel, heâ€™s concocted a supernatural tour de force. Time travel, tragic love, murder and mystery all combine in what is nothing short of a surprising, satisfying and mesmerizing read.â€ \r\nâ€”M.J. Rose, International Bestseller</p>\r\n\r\n<p>"Lyrical storytelling and a rich attention to detail make this prize-winning novel  an enthralling read." \r\nâ€”starred <i>Library Journal Review</i></p>\r\n                                                                                                                                                                                                                                                                                                                                                 <p><i>"The Map of Time</i> is a singularly inventive, luscious story with a core of pure, unsettling weirdness. \r\nWith unnerving grace and disturbing fantasy, it effortlessly straddles that impossible line between \r\nbeing decidedly familiar, and yet absolutely new." \r\nâ€”Cherie Priest, author of <i>Boneshaker</i></p>	2	2009-04-17 13:17:50	2011-05-19 07:14:02	<li>eGalley expires 6/28/11</li>\r\n<li>National print publicity</li>\r\n<li>Special Advance Reader's Editions with promotional copy of <i>The Time Machine</i> by H.G. Wells</li>\r\n<li>Interactive author website, themapoftimebook.com</li>\r\n<li>Book club outreach</li>\r\n\r\n\r\n	Set in Victorian London with characters real and imagined, <i>The Map of Time</i> is a page turner in which H.G. Wells is called upon to investigate purported incidents of time travel, save lives and literary classics from being wiped from existence. <i>The Map of Time</i> is an amazing ride back (and forward) in time.	Hardcover	\N	\N	Finished Book	\N	2011-06-21	Atria Books	Mellony Torres, Publicist	Mellony.Torres@simonandschuster.com	http://www.galleygrab.com/?asset_url=9781451632194	Johanna Castillo, Editor	Johanna.Castillo@simonandschuster.com	Katie Moran, Marketing	Catherine.Moran@simonandschuster.com
3	Best Kept Secret 	A Novel	Amy Hatvany 	2011-06-07	15	17	9781439193310	Cadence didnâ€™t sit down one night and decide that downing two bottles of wine was a brilliant idea. Her drinking snuck up on her - as a way to sleep, to help her relax after a long day, to relieve some of the stress of the painful divorce thatâ€™s left her struggling to make ends meet with her five-year old son, Charlie.	<p>Cadence didnâ€™t sit down one night and decide that downing two bottles of wine was a brilliant idea. Her drinking snuck up on her - as a way to sleep, to help her relax after a long day, to relieve some of the stress of the painful divorce thatâ€™s left her struggling to make ends meet with her five-year old son, Charlie.</p>  \r\n\r\n<p>It wasnâ€™t always like this. Just a few years ago, Cadence seemed to have it allâ€”a successful husband, an adorable son, and a promising career as a freelance journalist. But with the demise of her marriage, her carefully constructed life begins to spiral out of control. Suddenly she is all alone trying to juggle the demands of work and motherhood.</p>  \r\n\r\n<p>Logically, Cadence knows that she is drinking too much, and every day begins with renewed promises to herself that she will stop. But within a few hours, driven by something she doesnâ€™t understand, she is reaching for the bottle - even when it means not playing with her son because she is too tired, or dropping him off at preschool late, again.  And even when one calamitous night it means leaving him alone to pick up more wine at the grocery store. Itâ€™s only when her ex-husband shows up at her door to take Charlie away that Cadence realizes her best kept secret has been discoveredâ€¦</p>  \r\n\r\n<p>Heartbreaking, haunting, and ultimately life-affirming, <i>Best Kept Secret</i> is more than just the story of Cadenceâ€”itâ€™s a story of how the secrets we hold closest are the ones that can most tear us apart.</p>  \r\n\r\n<p>"Amy Hatvany grabs you from page one and doesn't let you go. I was transfixed by Cadence and her heart-wrenching dilemma. The writing is visceral, the problems are real, and there are no clear solutions. You won't want to put it down."  \r\nâ€”Emily Giffin, <i>New York Times</i> bestselling author of <i>Something Borrowed</i> and <i>Heart of the Matter</i></p>\r\n\r\n<p>â€œ<i>Best Kept Secret</i> is touching, hopeful, and so real.  Amy Hatvany writes with depth and compassion about a secret many have kept as she offers the miracle chance of starting over . . . I loved these characters and this novel.â€ \r\nâ€”Luanne Rice, <i>New York Times</i> bestselling author of <i>The Silver Boat</i></p>	3	2009-04-20 11:21:39	2011-05-19 07:18:21	<li>No eGalley available</li> \r\n<li>National author publicity</li>\r\n<li>Author appearances: Portland, Seattle</li>\r\n<li>National television, radio and print publicity</li>\r\n<li>Local and online publicity</li> \r\n<li>Cross promotion with the author website: AmyHatvany.com</li>\r\n<li>SimonandSchuster book club outreach</li>\r\n<li>SimonandSchuster.com newsletter feature</li>\r\n<li>WSP reading guide bound into book</li>\r\n<li>Finished book mailing to book club advisory board</li>\r\n<li>Newsletter coop</li> \r\n	A timely and captivating novel about a mother whose life spirals out of control when she descends into alcoholism, and her painful battle to get sober and regain custody of her beloved son.	Paperback Original	\N	\N	Finished Book	\N	2011-06-21	Washington Square Press	Cristina Suarez, Publicist	Cristina.Suarez@simonandschuster.com	mailto:atriafeedback@simonandschuster.com?subject=Best Kept Secret - Galley Alley	Greer Hendricks, Editor	Greer.Hendricks@simonandschuster.com	Katie Moran, Marketing	Catherine.Moran@simonandschuster.com
4	One Big Blissful Thing 		Josh Radnor 	2011-10-11	25	28.9899999999999984	9781439188040 	Josh Radnor grew up in Ohio. He was driven to school in a big yellow bus. He watched <i>The Cosby Show</i> and John Hughes movies. He also went on to become a successful actor in Hollywood.	<p>Josh Radnor grew up in Ohio. He was driven to school in a big yellow bus. He watched <i>The Cosby Show</i> and John Hughes movies. He also went on to become a successful actor in Hollywood. How then, in 2007, did he end up drinking an indigenous plant medicine called <i>ayahuasca</i> with a shaman in Brazil?</p>\r\n\r\n<p>Radnor asks himself that very question and many more in this brilliant, funny, and authentic book.  While continuing to work in television and movies, Radnor went deeper into the shamanic path and found himself left with the simplest of desires: to be kinder to himself and kinder to others.  Referencing everyone from Carlos Castaneda to Lisa Simpson, Schopenhauer to David Foster Wallace, <i>Monty Python</i> to Maura Tierney of <i>E.R.</i>, Radnor takes readers on an episodic, free-wheeling journey through all the different strands of his life, while musing on some of lifeâ€™s biggest questions, and in the process points all of us toward a saner and more compassionate way of living. In <i>One Big Blissful Thing</i>, Josh Radnor has written <i>Zen and the Art of Motorcycle Maintenance</i> for a new generation.</p>\r\n\r\n<p>Josh Radnor is best known for playing Ted Mosby in the CBS comedy <i>How I Met Your Mother.</i> He wrote, directed, and starred in the Sundance Award-winning film <i>happythankyoumoreplease,</i> which was released nationally and internationally in 2011.  His writing has been published in the <i>Los Angeles Times Magazine, Moviemaker Magazine,</i> and <i>The Huffington Post</i>, among others.  A native of Columbus, Ohio, Radnor attended Kenyon College where he won the Paul Newman Acting Trophy. He received his MFA in acting from NYUâ€™s Tisch School of the Arts. He lives in Los Angeles.</p>	4	2009-04-20 11:24:12	2011-05-19 07:20:51	<li>eGalley not yet available â€“ please click the eGalley link to be alerted when it is</li> \r\n<li>National television, radio, and print publicity</li>\r\n<li>Author appearances: Los Angeles, New York</li> \r\n<li>25-city radio tour</li>\r\n<li>Local and online publicity</li>\r\n<li>SimonandSchuster.com homepage feature</li>\r\n<li>SimonandSchuster.com newsletter feature</li> \r\n<li>Finished book mailings to key accounts and industry big mouths</li>\r\n	From the sound stages of Hollywood to the rain forests of Brazil, a brilliant, funny and fiercely intelligent book about the most unlikely spiritual awakening ever.  This is <i>Eat, Pray, Love</i> for people who would rather read McSweeney's.  	Hardcover	\N	\N	Bound Galley	\N	2011-09-07	Atria Books	Lisa Sciambra, Publicist	Lisa.Sciambra@simonandschuster.com	mailto:atriafeedback@simonandschuster.com?subject=One Big Blissful Thing - Galley Alley	Peter Borland, Editor 	Peter.Borland@simonandschuster.com	Katie Moran, Marketing	Catherine.Moran@simonandschuster.com
5	A Double Death on the Black Isle 	A Novel	A.D. Scott 	2011-09-27	15	17	9781439154946	Two Women, Two Murdersâ€¦A stunning and suspenseful story of families, betrayal, and a community divided.	<p>Two Women, Two Murdersâ€¦A stunning and suspenseful story of families, betrayal, and a community divided.</p>\r\n\r\n<p>Nothing is ever quite at peace on Scotlandâ€™s Black Isleâ€”the Traveling People are forever at odds with the locals; the fishermen have nothing in common with the farmers; and the villages have no connection with the town. But when two deaths occur on the same day, involving the same families from the same estateâ€”the Black Isle seems as forbidding as its name.</p>\r\n\r\n<p>Joanne Ross, typist at  <i>The Highland Gazette </i>, is torn whether to take on the plum task of reporting on these murdersâ€”after all, the woman at the center of both crimes is one of her closest friends. Joanne knows the story could be her big break, and for a woman in the mid-1950sâ€”a single mother, no lessâ€”good work is hard to come by.</p>\r\n\r\n<p>But the investigation by the staff on the  <i>Gazette </i> reveals secrets that will forever change this quiet, remote part of the Highlands. The ancient feudal order is crumbling; loyalties are tested, friendships torn apart, the sublime beauty of the landscape will never seem peaceful again.</p>\r\n\r\n<p>â€œScottâ€™s writing is engaging, and her plotting Macbethian â€¦The characters of the crusading small-town newspaper are skillfully drawn and will have readers rooting for them unequivocallyâ€¦captivating on every level." \r\nâ€” <i>Booklist</i>, starred review</p>\r\n\r\n<p>"Scott brilliantly evokes the life of a small Scottish town and touches on issues that continue to perplex and horrify us.â€ \r\nâ€” <i>Richmond Times-Dispatch</i></p>	5	2009-04-20 11:25:56	2011-05-19 07:25:14	<li>eGalley not yet available â€“ please click the eGalley link to be alerted when it is</li>\r\n<li>National Print Campaign</li>\r\n<li>Online Publicity</li>\r\n<li>Cross promotion with the author website: adscott.org</li> \r\n<li>Part of Atria's mystery promotion which includes outreach and advertising to the mystery readersâ€™ community</li>\r\n<li>Newsletter coop</li>\r\n	The author of <i>A Small Death in the Great Glen</i> returns with another entry in her lyrical, character-driven, and gripping suspense series set in the Scottish Highlands, featuring a small-town newspaper staff. 	Paperback Original	\N	\N	Advance Reading Copy	\N	2011-08-24	Atria Books	Mellony Torres, Publicist	Mellony.Torres@simonandschuster.com	mailto:atriafeedback@simonandschuster.com?subject=A Double Death on the Black Isle - Galley Alley	Sarah Durand, Editor	Sarah.Durand@simonandschuster.com	Katie Moran, Marketing	Catherine.Moran@simonandschuster.com
6	The GQ Candidate 	A Novel	Keli Goff 	2011-07-05	24.9899999999999984	0	9781439158722	Political pundit and blogger, Keli Goff, makes her fiction debut with <i>The GQ Candidate,</i> the literary equivalent of TVâ€™s â€œWest Wingâ€ meets â€œThe Game.â€	<p>Political pundit and blogger, Keli Goff, makes her fiction debut with <i>The GQ Candidate,</i> the literary equivalent of TVâ€™s â€œWest Wingâ€ meets â€œThe Game.â€</p>\r\n\r\n<p>After a sex scandal brings down a local politician, Luke Cooper finds himself catapulted into the Michigan Governorâ€™s mansion, making him one of the few black andâ€”by virtue of adoptionâ€”Jewish elected officials to hold such an office. His national celebrity is increased when he heroically saves the life of an avowed racist, and his good looks and charm earn him the nickname â€œThe GQ Candidate.â€</p>\r\n\r\n<p>One day Luke stuns his circle of intimates by informing them that he is going to run for president of the United States. His friends and family have his back and lend whatever help they can to his campaign. But the candidate and his loved ones discover that standing by their man takes more effort and has more impact on their lives than they ever imagined.</p>\r\n\r\n<p>Keli Goff knows the world of American politics as a first-hand observer and media figure. She brings all that experience and her incredible skills as a writer to bear in making <i>The GQ Candidate</i> an insightful, memorable and above all, highly entertaining read.</p>\r\n\r\n<p>â€œIn recent years, and especially in the election of 2008, Keli Goff brought skill and grace to the rough-and-tumble arena of political commentary. Now, in time for 2012, she has aimed those same talents at fiction, and the result is a witty novel that reminds us that all politics is personal. â€\r\nâ€”Arianna Huffington, President and Editor-in-Chief of <i>The Huffington Post Media Group.</i></p>\r\n\r\n<p>"From its humorous inside peek at the world of politics to its honest portrayal of the vicissitudes of a loving marriage, Keli Goff's book is the ideal escape for the thinking person. Hers is a bold and bright voice for a new, 'post-racialâ€ generation'." \r\nâ€”Susan Fales-Hill, author of <i>One Flight Up</i></p>\r\n\r\n<p>â€œGoffâ€™s intellectually pulsating and fresh political page-turner is penned with undeniable heat and heart-racing soul . . . each characterâ€™s inside portrait, vividly threaded making you invest deeper. If you love government affairs laced with swaggering scandal and an intense competitive race to the finish line <i>The GQ Candidate</i> is a must-read.â€ \r\nâ€”Victoria Rowell</p>\r\n\r\n<p>â€œKeli Goff takes us on the entertaining behind-the-scenes ride of a handsome, young, charismatic African-American presidential candidate. Think you know how it ends? Think again.â€ \r\nâ€”Trey Ellis, <i>Platitudes</i> and <i>Right Here, Right Now</i></p>\r\n	6	2009-04-20 11:28:12	2011-05-19 07:27:13	<li>eGalley expires 7/5/11</li>   \r\n<li>National author publicity</li>\r\n<li>National television, radio, and print publicty</li>\r\n<li>Local and online publicity</li> \r\n<li>Cross promotion with the author's website, KeliGoff.com and social media platform</li>\r\n<li>SimonandSchuster.com monthly feature</li>\r\n<li>SimonandSchuster.com monthly newsletter feature</li>\r\n<li>Book Club Advisory Board mailing</li>\r\n	Popular political analyst for television, print and online serves up smart commercial fiction that does for Obama-era politics what <i>Primary Colors</i> did for the Clinton era and <i>Eighteen Acres</i> does for the new possibilities for women in politics.	Hardcover	\N	\N	Finished Book	\N	2011-06-21	Atria Books	Adiya Mobley, Publicist	Adiya.Mobley@simonandschuster.com	http://www.galleygrab.com/?asset_url=9781451632149	Malaika Adero, Editor	Malaika.Adero@simonandschuster.com	Hillary Tisman, Marketing	Hillary.Tisman@simonandschuster.com
7	Josefinaâ€™s Sin 	A Novel	Claudia H. Long 	2011-08-09	16	18.9899999999999984	9781451610673	Mexico, 1683. Lured by the imagined grandeur and adventure of the Viceroyal Court, Josefina, a sheltered landownerâ€™s wife, accepts an invitation from the Marquesa to come and socialize with the cultural elite. 	<p>Mexico, 1683. Lured by the imagined grandeur and adventure of the Viceroyal Court, Josefina, a sheltered landownerâ€™s wife, accepts an invitation from the Marquesa to come and socialize with the cultural elite. She is overwhelmed by the intensity of the Courtâ€™s complicated world.  While fighting off aggressive advances from the Marquesaâ€™s husband, she finds her marriage vows tested by the unexpected passion of the Bishop of Puebla.\r\nAmidst this drama, Josefina finds herself inexorably drawn to the nuns who study and write poetry at the risk of persecution by the Spanish Inquisition. One nun in particular, Sor Juana InÃ©s de la Cruz, teaches Josefina about poetry, power, and the nature and consequences of love, all in the shadow of the Holy Office. She is Josefinaâ€™s mentor and lynchpin during her tumultuous passage from grounded wife and mother to woman of this treacherous, confusing, and ultimately physically and intellectually fulfilling world.</p>\r\n\r\n<p>â€œAn exotic, steamy world is brought vividly to life in <i>Josefina's Sin</i>. Josefina's.â€ \r\nâ€”Posie Graeme-Evans, internationally bestselling author of <i>The Dressmaker</i></p>\r\n\r\n<p>"A powerful, cautionary tale told with beauty and precision, <i>Josefina's Sin</i> is a dazzling read." \r\nâ€”Thomas Trebitsch Parker, O. Henry Prize winner and author of <i>Anna, Ann, Annie</i></p>\r\n\r\n<p>"Sensuous, sensual, and sensitive,<i>Josefina's Sin</i> speaks to the dreams, the guile, and the cruelty in us all. Part MoliÃ¨re, part Grand Guignol, inside an intricate, villainous plot, but it's so much more, for Claudia has grounded this tale in the real world, and it speaks movingly of the passions, and the treachery and anguish, in the human equation." \r\nâ€”Crosby Lewy, author of <i>Amusings from a Life</i></p>	7	2009-04-20 11:29:47	2011-05-19 07:30:26	<li>eGalley expires 8/9/11</li> \r\n<li>National author publicity</li>\r\n<li>Book Club materials available at SimonandSchuster.com</li>\r\n<li>Reading Group Guide bound into book</li>\r\n<li>Newsletter coop</li>\r\n<li>Book Club Advisory Board mailing</li>	A thrilling and passionate debut novel about a sheltered landownerâ€™s wife whose life is turned upside down when she visits the Royal Court in 17th century Mexico.	Paperback Original	\N	\N	Finished Book	\N	2011-07-06	Atria Books	Diana Franco, Publicist	Diana.Franco@simonandschuster.com	http://www.galleygrab.com/?asset_url=9781451632491	Amy Tannenbaum, Editor	Amy.Tannenbaum@simonandschuster.com	Katie Moran, Marketing	Catherine.Moran@simonandschuster.com
8	The Winters in Bloom 	A Novel	Lisa Tucker 	2011-09-13	24	27.9899999999999984	9781416575405	Kyra and David Winter are happier than they ever thought they could be. They have a comfortable home, stable careers, and a young son, Michael, whom they love more than anything. 	<p>Kyra and David Winter are happier than they ever thought they could be. They have a comfortable home, stable careers, and a young son, Michael, whom they love more than anything. Yet because of their complicated histories, Kyra and David have always feared that the life they created was destined to be disrupted. And on one perfectly average summer day, it is, when Michael disappears from his own backyard.</p>\r\n\r\n<p>The only question is whose past has finally caught up with them: David feels sure that Michael was taken by his troubled ex-wife, while Kyra believes the kidnapper must be someone from her estranged family, someone she betrayed years ago. \r\nAs the Winters embark on a journey of time and memory to find Michael, they will be forced to admit these suspicions, revealing secrets about themselves theyâ€™ve always kept hidden. But they will also have a chance to discover that itâ€™s not too late to have the family theyâ€™ve dreamed of; that even if the world is full of risks, as long as they have hope, the future can bloom.</p> \r\n\r\n<p>Lyrical, wise, and witty, <i>The Winters in Bloom</i> is Lisa Tuckerâ€™s most optimistic work to date. This enchanting, life-affirming story will charm readers and leave them full of wonder at the stubborn strength of the human heart.</p>\r\n\r\n<p>â€œFew contemporary novelists come close to understanding families in trouble with the insight and compassion of Lisa Tucker. <i>The Winters in Bloom</i> is one page-turner you will not want to miss.â€ \r\nâ€”Pat Conroy, author of <i>South of Broad and Beach Music</i></p>\r\n\r\n<p>â€œLisa Tucker weaves together multiple perspectives to give us a novel rife with human entanglements of every variety . . . Most moving is the story of Kyra and David as they face the struggles every parent will recognize: how to take care of someone in a world as dangerous as it is beautiful; how to chooseâ€”daily, deliberatelyâ€”joy over fear.â€  \r\nâ€”Marisa de los Santos, author of <i>Belong to Me</i></p>\r\n	8	2009-04-20 11:31:01	2011-05-19 08:00:47	<li>eGalley expires 9/13/11</li>\r\n<li>National Print Campaign</li>\r\n<li>Author Appearances: Philadelphia Area</li>\r\n<li>Cross-promotion with author web site: lisatucker.com</li>\r\n<li>SimonandSchuster.com newsletter outreach</li>\r\n<li>Atria readers guide available online</li>\r\n<li>Outreach to reading group sites and blogs</li>\r\n<li>Mailing to national accounts and independent stores</li>\r\n<li>Newsletter coop</li>\r\n	In bestselling author Lisa Tuckerâ€™s latest, a family discovers that itâ€™s only when the walls between the present and past crumble that the future can bloom.  	Hardcover	\N	\N	Finished Book	\N	2011-06-21	Atria Books	Cristina Suarez, Publicist	Cristina.Suarez@simonandschuster.com	http://www.galleygrab.com/?asset_url=9781451632002	Greer Hendricks, Editor	Greer.Hendricks@simonandschuster.com	Hillary Tisman, Marketing	Hillary.Tisman@simonandschuster.com
9	Bright and Distant Shores 	A Novel	Dominic Smith 	2011-09-13	15	17	9781439198865	With critical praise lavished on his first two novels, Dominic Smith has become a celebrated and deeply revered storyteller. <i>Bright and Distant Shores</i> offers a stunning exploration of late nineteenth-century America and the tribal Pacific.	<p>With critical praise lavished on his first two novels, Dominic Smith has become a celebrated and deeply revered storyteller. <i>Bright and Distant Shores</i> offers a stunning exploration of late nineteenth-century America and the tribal Pacific.</p>\r\n\r\n<p>In the waning years of the nineteenth century there was a hunger for tribal artifacts, spawning collecting voyages from museums and collectors around the globe. In 1897, one such collector, a Chicago insurance magnate, sponsors an expedition into the South Seas to commemorate the completion of his companyâ€™s new skyscraperâ€”the worldâ€™s tallest building. The ship is to bring back an array of Melanesian weaponry and handicrafts, but also several natives related by blood.</p>\r\n\r\n<p>Caught up in this scheme are two orphansâ€”Owen Graves, an itinerant trader from Chicagoâ€™s South Side who has recently proposed to the girl he must leave behind, and Argus Niu, a mission houseboy in the New Hebrides who longs to be reunited with his sister. At the cusp of the twentieth century, the expedition forces a collision course between the tribal and the civilized, between two young men plagued by their respective and haunting pasts.</p>\r\n\r\n<p>An epic and ambitious story that brings to mind E. L. Doctorow, with echoes of Melville and Robert Louis Stevenson, <i>Bright and Distant Shores</i> is a wondrous achievement.</p>\r\n\r\n<p>â€œ...a work suffused by a generous and often joyous humanity.â€\r\nâ€”<i>The Weekend Australian</i></p>\r\n\r\n<p>â€œ...a must-read for anyone with a love of history.â€\r\nâ€”<i>Courier-Mail</i> (Australia)</p>\r\n\r\n<p>â€œA breathless narrative pace...a riveting tale...evocations of Chicago surprise and delight.â€\r\nâ€”<i>Australian Book Review</i></p>\r\n	9	2009-04-20 11:32:55	2011-05-19 07:37:21	<li>eGalley expires 9/13/11</li>\r\n<li>Local and online publicity</li>\r\n<li>Cross promotion with the author website: dominicsmith.net</li>\r\n<li>SimonandSchuster.com monthly newsletter feature</li>\r\n<li>SimonandSchuster.com feature</li>\r\n<li>Book Club Advisory Board mailing</li>\r\n	From the award-winning, critically-acclaimed author of <i>The Mercury Visions of Louis Daguerre</i> and <i>The Beautiful Miscellaneous</i> comes a sweepingÂ historical novel set in bustling, 1890s Chicago and the high seas of the South Pacific.	Paperback Original	\N	\N	Bound Galley	\N	2011-06-21	Washington Square Press	Mellony Torres, Publicist	Mellony.Torres@simonandschuster.com	http://www.galleygrab.com/?asset_url=9781451632378	Sarah Branham, Editor	Sarah.Branham@simonandschuster.com	Katie Moran, Marketing	Catherine.Moran@simonandschuster.com
10	Upper Cut 	Highlights of My Hollywood Life	Carrie White 	2011-09-20	26	29.9899999999999984	9781439199091	Carrie Whiteâ€™s astonishing career took off in the early 1960s, when women still wore white gloves and bouffants and there was no such thing as a credit card, and reached its peak in the tumult and chaos of the 1970s and 1980s, when she was sought after by every ingÃ©nue, leading lady, power broker, one-hit wonder, and screen legend who craved a new look.	<p>Carrie Whiteâ€™s astonishing career took off in the early 1960s, when women still wore white gloves and bouffants and there was no such thing as a credit card, and reached its peak in the tumult and chaos of the 1970s and 1980s, when she was sought after by every ingÃ©nue, leading lady, power broker, one-hit wonder, and screen legend who craved a new look.</p>\r\n\r\n<p>Carrieâ€™s story is vibrant social history as seen through the lens of a woman who was at the center of it all. As the â€œFirst Lady of Hairdressing,â€ Carrie collaborated with Richard Avedon on shoots for Vogue, partied with Jim Morrison, styled Sharon Tateâ€™s hair before her wedding to Roman Polanski, and got high with Jimi Hendrix. She has counted Jennifer Jones, Betsy Bloomingdale, Elizabeth Taylor, Goldie Hawn, and Camille Cosby among her favorite clients.</p>\r\n\r\n<p>But behind the scenes, Carrieâ€™s world was in perpetual disarray and always had been. After her father abandoned the family when she was still a child, she was sexually abused by her domineering stepfather, and her alcoholic mother was unstable and unreliable. Carrie was sipping cocktails before her tenth birthday, and had had five children and three husbands before her twenty-eighth. She fueled the frenetic pace of her professional life with a steady diet of champagne and vodka, diet pills, cocaine, and heroin, until she eventually lost her home, her car, her careerâ€”and nearly her children. But she battled her way back, getting sober, rebuilding her professional life and her relationships, and today, the name Carrie White is once again on the door of one of Beverly Hillsâ€™s most respected salons.</p> \r\n\r\n<p>An unflinching portrayal of addiction and recovery, <i>Upper Cut</i> proves that even in Hollywood, sometimes you have to fight for your happy ending.</p>\r\n\r\n<p>â€œCarrie White puts pen to paper with the power of an individual who has much to tell. As I read her thoughts and enjoy her way with words, I am captivated by her storytelling. Carrie became one of Americaâ€™s most artistic hairdressers and her writing has the same touch of the true artist.â€  \r\nâ€”Vidal Sassoon</p>\r\n\r\n<p>â€œIf what is in this book is a fraction of what I have heard in Carrieâ€™s salon, we are all in for one hell of a fun ride.â€   \r\nâ€”Sandra Bullock</p>\r\n	10	2009-04-20 11:34:34	2011-05-19 07:41:31	<li>eGalley expires 9/20/11</li>\r\n<li>National author publicity</li>\r\n<li>Author Appearances: New York City, Los Angeles</li>\r\n<li>Local and online publicity</li>\r\n<li>Cross promotion with TheCarrieWhite.com and authorâ€™s social media platform</li>\r\n<li>Author video</li>\r\n<li>Simonandschuster.com homepage feature</li>\r\n<li>Simonandschuster.com monthly newsletter feature</li>\r\n<li>Interior photos from book available online</li>	<i>Shampoo</i> meets <i>You'll Never Eat Lunch In This Town Again</i> in a rollicking and riveting memoir from the woman who for decades styled Hollywood's most celebrated players. 	Hardcover	\N	\N	Finished Book	\N	2011-06-21	Atria Books	Paul Olsewski, Publicist	Paul.Olsewski@simonandschuster.com	http://www.galleygrab.com/?asset_url=9781451632385	Greer Hendricks, Editor	Greer.Hendricks@simonandschuster.com	Katie Moran, Marketing	Catherine.Moran@simonandschuster.com
11	Triangles 	A Novel	Ellen Hopkins 	2011-10-18	26	29.9899999999999984	9781451626339	Three female friends face midlife crises in a no-holds-barred exploration of sex, marriage, and the fragility of life.	<p>Three female friends face midlife crises in a no-holds-barred exploration of sex, marriage, and the fragility of life.</p>\r\n\r\n<p>Ellen Hopkins has made her mark as the wildly popular author of several novels for young adultsâ€”every one of them a <i>New York Times</i> bestseller and every one a hard-hitting exploration of tough-to-tackle topics. Now, in <i>Triangles</i>, Hopkins applies her fearless brand of storytelling to adult dramas.</p>\r\n\r\n<p>In this emotionally powerful novel, written in Hopkinsâ€™s signature poetic verse style, three women face the age-old question: If Iâ€™m in the middle of my life, is this really all Iâ€™ve got to show for it? Holly, filled with regret for being a stay-at-home mom, sheds sixty pounds and loses herself in the world of extramarital sex. Andrea, a single mom and avowed celibate, watches her friend Hollyâ€™s meltdown with a mixture of concern and contempt. Holly is throwing away what Andrea has spent her whole life searching forâ€”a committed relationship with a decent guy. So what if Andrea picks up Hollyâ€™s castaway husband? Then thereâ€™s Marissa. She has more than her fair share of challengesâ€”a gay teenage son, a terminally ill daughter, and a husband who buries himself in his work rather than face the facts. As one womanâ€™s marriage unravels, anotherâ€™s rekindles. As one womanâ€™s family comes apart at the seams, anotherâ€™s reconfigure into something bigger and better. In this story of connections and disconnections, one womanâ€™s up is another oneâ€™s down, and all of them will learn the meaning of friendship, betrayal, and forgiveness.</p>	11	2009-04-20 11:35:50	2011-05-19 07:44:47	<li>No eGalley</li>\r\n<li>National Author Publicity</li>\r\n<li>Author appearances</li>\r\n<li>Online publicity</li>\r\n<li>Cross promotion with author website: www.ellenhopkins.com/</li>\r\n<li>SimonandSchuster.com feature</li>\r\n<li>SimonandSchuster.com newsletter feature</li>\r\n<li>ReadingGroups.simonandschuster.com feature</li>\r\n<li>Author video</li>\r\n<li>Finished book mailing to comp reps, book club advisory board</li>\r\n<li>12-copy floor display, 9781451630961, $300.00/$347.88 Can.</li>\r\n<li>ALA feature title</li>\r\n	The first gripping adult novel by the <i>New York Times</i> bestselling YA author of the unforgettable <i>Crank</i> trilogy.  	Hardcover	\N	\N	Finished Book	\N	2011-06-21	Atria Books	Mellony Torres, Publicist	Mellony.Torres@simonandschuster.com	mailto:atriafeedback@simonandschuster.com?subject=Triangles - Galley Alley	Sarah Branham, Editor	Sarah.Branham@simonandschuster.com	Hillary Tisman, Marketing	Hillary.Tisman@simonandschuster.com
12	The Lost Angel 	A Novel	Javier Sierra 	2011-10-04	25.9899999999999984	29.9899999999999984	9781451632798	In approximately seventy-two hours, a little-known Middle Eastern terrorist group plans to bring about the end of the world. Convinced that they are the descendents of angels, they believe they are on the verge of at last being returned to heaven.	<p>In approximately seventy-two hours, a little-known Middle Eastern terrorist group plans to bring about the end of the world. Convinced that they are the descendents of angels, they believe they are on the verge of at last being returned to heaven. Central to their plan is the kidnapping of an undercover American scientist whose research has led him to an extraordinary secret: He is the keeper of a pair of mysterious artifacts said to grant their owner the power to communicate directly with God himself.</p>  \r\n\r\n<p>The scientistâ€™s only hope for survival is his young wifeâ€”a woman born with a rare psychic gift that can unleash the power of the sacred stones. But she must find the courage to save her husband, all while running from religious extremists and secret U.S. government agencies who want to use the stones for their own purposes.</p> \r\n\r\n<p>Like <i>The Secret Supper</i>, <i>The Lost Angel</i> bears all the hallmarks of Sierraâ€™s erudite yet fast-paced brand of storytelling, combining historical fact and fiction with dazzling narrative feats.</p>\r\n\r\n<p>"Praise for Javier Sierraâ€™s <i>The Secret Supper</i>. Sierra is a more sophisticated writer than Dan Brown, and he offers fresh perspective on the Renaissance mind.â€ â€”<i>Kirkus</i> Review</p>\r\n\r\n<p>â€œSierraâ€™s narrative moves smoothly, fluidly . . . [and makes] art history palatable and exciting.â€  â€”<i>Los Angeles Times</i></p>\r\n\r\n<p>â€œ<i>The Secret Supper</i> is a fascinating yarn and very well told.â€ â€”<i>San Francisco Chronicle</i></p>\r\n	12	2009-04-20 11:37:11	2011-05-19 07:49:02	<li>eGalley expires 10/4/11</li>\r\n<li>National print review and feature campaign</li>\r\n<li>Author appearances</li>\r\n<li>Special Advance Readerâ€™s Editions with Javierâ€™s research notes bound-in</li>\r\n<li>Cross-promotion with author website: TheLostAngel.com</li> \r\n<li>SimonandSchuster.com feature</li>\r\n<li>SimonandSchuster.com newsletter feature</li>\r\n<li>BEA Focus Title</li>\r\n<li>Finished book mailing to reading group coordinators and key booksellers</li>\r\n<li>Librarian Outreach â€“ ALA</li>	A Middle Eastern terrorist group will stop at nothing to get their hands on a mysterious pair of 16th century stones used for communicating with Godâ€”even if it means running from the CIA, the President of the United States and putting their lives on the line. 	Hardcover	\N	\N	Bound Galley	\N	2011-06-21	Atria Books	David Brown, Publicist	David.Brown@simonandschuster.com	mailto:atriafeedback@simonandschuster.com?subject=The Lost Angel - Galley Alley	Johanna Castillo, Editor	Johanna.Castillo@simonandschuster.com	Katie Moran, Marketing	Catherine.Moran@simonandschuster.com
15	The Goat Woman of Largo Bay 	A Novel	Gillian Royes 	2011-10-04	15	17	9781451627411	<i>The Goat Woman of Largo Bay</i> begins the detective series featuring Shad, a bartender in a fishing village in Jamaica, who is the community problem solver and right hand of Eric, an American who owns the bar and a hotel left in ruins by a hurricane.	<p><i>The Goat Woman of Largo Bay</i> begins the detective series featuring Shad, a bartender in a fishing village in Jamaica, who is the community problem solver and right hand of Eric, an American who owns the bar and a hotel left in ruins by a hurricane.</p> \r\n\r\n<p>When Shad sees movement on the island offshore, he thinks itâ€™s just a goat.  But it turns out to be Simone, an American who has run away from her professional and personal life in the United States, an intriguing woman who captures Ericâ€™s heart.  Always keeping his ear to the ground, Shad discovers that a gunshot heard near Simoneâ€™s place late one night isnâ€™t exactly friendly fire, but tied to a plot to harm Simone and ultimately manipulate local elections. But why does someone want to harm Simone? And what does she have to do with the elections?  Only Shad can find out.</p>   \r\n\r\n<p>An irresistible character is introduced in <i>The Goat Woman of Largo Bay</i>, and Royes wonderfully blends suspense and the soul of the islands in this smart debut.</p>	14	2009-04-20 11:41:41	2011-05-19 07:53:19	<li>eGalley expires 10/4/11</li>\r\n<li>National print review and feature campaign</li>\r\n<li>Cross promotion with the author's website: gillianroyes.com</li>\r\n<li>SimonandSchuster.com feature</li>\r\n<li>SimonandSchuster.com newsletter feature</li>\r\n<li>Finished book mailing to key accounts and mystery booksellers</li>\r\n<li>Part of Atria's mystery promotion which includes outreach and advertising to the mystery readersâ€™ community</li>\r\n	A bartender and community problem-solver in a remote Jamaican resort discovers that a shadowy figure he sees moving around a tiny deserted island across the bay is not a goatâ€”as he'd thoughtâ€”but rather a woman-in-hiding.Â 	Paperback Original	\N	\N	Finished Book	\N	2011-07-18	Atria Books	Paul Olsewski, Publicist	Paul.Olsewski@simonandschuster.com	http://www.galleygrab.com/?asset_url=9781451647198	Malaika Adero, Editor	Malaika.Adero@simonandschuster.com	Katie Moran, Marketing	Catherine.Moran@simonandschuster.com
16	Burned 	A Novel	Thomas Enger 	2011-10-04	15	17	9781451616453	In a park in Oslo, Norway, a young man walking his dog makes a horrifying discovery:	<p>In a park in Oslo, Norway, a young man walking his dog makes a horrifying discovery:</p>\r\n\r\n<p>Her blonde curls are soaked in blood. The ground has opened up and tried to swallow her. Only her head and torso are visible. Her rigid body is propped up by the damp earth; she looks like a single, long-stemmed, red roseâ€¦</p> \r\n\r\n<p>A young woman has been buried up to her neck, then stoned to death.  The brutality of the crime is shocking, and its implications are deeply puzzling.  The method of murder resembles an honor killing, an execution style practiced rarely in the Middle East, and only when the victim has been accused of adultery.  Yet such killings don't happen in Norway...</p>\r\n\r\n<p>Investigative reporter Henning Juul has just returned to his job after an accident that killed his son and left him scarred from a fire, and his first assignment is to investigate and report on this brutal murder.  Working with his ex-wife's new boyfriend proves difficult, but it's the lingering pain from his accident that's almost debilitating.  Henning knows the arrest of the victim's boyfriendâ€”a Pakistani nativeâ€”is misguided, and he sets out to uncover the truth. This gritty, page-turning novel of suspense uncovers class divisions, racial conflicts, and deep emotions in the way that's reminiscent of the best of Scandinavian suspense, and heralds the arrival of a major talent.</p>\r\n\r\n<p>â€œAn intriguing new voice in crime.â€ \r\nâ€”N J Cooper, author of <i>No Escape</i></p>	13	2009-04-20 11:43:24	2011-05-19 07:51:00	<li>eGalley expires 10/4/11</li>\r\n<li>National print review and feature campaign</li>\r\n<li>SimonandSchuster.com montly newsletter feature</li>\r\n<li>Finished book mailing to key accounts</li>\r\n<li>Part of Atria's mystery promotion which includes outreach and advertising to the mystery readersâ€™ community</li>	Already an international bestseller, <i>Burned</i> is a shocking, unputdownable Norwegian thriller starring a reporter named Henning Juul.	Paperback Original	\N	\N	Finished Book	\N	2011-06-21	Atria Books	Paul Olsewski, Publicist	Paul.Olsewski@simonandschuster.com	http://www.galleygrab.com/?asset_url=9781451637328	Sarah Durand, Editor	Sarah.Durand@simonandschuster.com	Hillary Tisman, Marketing	Hillary.Tisman@simonandschuster.com
17	The Infernals 	A Novel	John Connolly 	2011-10-18	22	26	9781451643084 	Samuel Johnson is in trouble. Not only is he in love with the wrong girl, but the demon Mrs. Abernathy is seeking revenge upon him for his part in foiling the invasion of Earth by the forces of Darkness.	<p>Samuel Johnson is in trouble. Not only is he in love with the wrong girl, but the demon Mrs. Abernathy is seeking revenge upon him for his part in foiling the invasion of Earth by the forces of Darkness. She wants to get her claws on Samuel, and when the Large Hadron Collider is turned on again, she is given her chance. Samuel and his faithful dachshund, Boswell, are pulled through a portal into Hell, there to be hunted down by Mrs. Abernathy and her allies.</p> \r\n\r\n<p>But catching Samuel is not going to be easy, for Mrs. Abernathy has reckoned without the bravery and cleverness of a boy and his dog, or the loyalty of Samuel's friend, the hapless demon Nurd. Most of all, she hasn't planned on the intervention of an unexpected band of little men, for Samuel and Boswell are not the only inhabitants of Earth who have found themselves in Hell.</p>\r\n\r\n<p>If you thought demons were frightening, just wait until you meet Mr. Merryweather's Elves...</p>	15	2011-04-28 14:48:37	2011-05-19 07:55:15	<li>eGalley not yet available â€“ please click the eGalley link to be alerted when it is</li>\r\n<li>National print review and feature coverage</li>\r\n<li>Simonandschuster.com home page feature</li>\r\n<li>Simonandschuster.com newsletter outreach</li>\r\n<li>Cross-promotion on author website: www.johnconnollybooks.com</li>\r\n<li>Outreach to author newsletter list</li>\r\n<li>Finished book mailing to top national accounts store managers</li>\r\n<li>Finished book promotion to NEIBA booksellers</li>	All hell is breaking loose in... well, hell. John Connolly once again delights and entertains us.	Hardcover	\N	\N	Finished Book	\N	2011-09-14	Atria Books	Paul Olsewski, Publicist	Paul.Olsewski@simonandschuster.com	mailto:atriafeedback@simonandschuster.com?subject=The Infernals - Galley Alley	Emily Bestler, Editor	Emily.Bestler@simonandschuster.com	Hillary Tisman, Marketing	Hillary.Tisman@simonandschuster.com
18	The Time in Between 	A Novel	Maria Duenas 	2011-11-08	26	29.9899999999999984	9781451616880	<i>The Time In Between</i> is a word-of-mouth phenomenon that catapulted MarÃ­a DueÃ±as, a debut author, to the top of Spainâ€™s bestseller lists.	<p>Discover what 1.7 million readers already know.</p>\r\n\r\n<p>The Time In Between is a word-of-mouth phenomenon that catapulted MarÃ­a DueÃ±as, a debut author, to the top of Spainâ€™s bestseller lists.</p>  \r\n\r\n<p>This sweeping novel, which combines the storytelling power of <i>The Shadow of the Wind</i> with the irresistible romance of <i>Casablanca</i>, moves at an unstoppable pace. Suddenly left abandoned and penniless in Algiers by her lover, Sira Quiroga forges a new identity. Against all odds she becomes the most sought-after couture designer for the socialite wives of German Nazi officers. But she is soon embroiled in a dangerous political conspiracy as she passes information to the British Secret Service through a code stitched into the hems of her dresses.</p>\r\n\r\n<p>â€œDestined to become a literary classic.""  \r\n- Javier Sierra, <i>New York Times</i> bestselling author</p>\r\n\r\n<p>â€œA magnificent novel that flawlessly brings together history and intrigue.â€ \r\n- Juan GÃ³mez-Jurado, author of <i>The Moses Expedition</i></p>\r\n	16	2011-04-28 14:58:18	2011-05-19 08:05:36	<li>eGalley not yet available â€“ please click the eGalley link to be alerted when it is</li>\r\n<li>National print, review and feature campaign</li>\r\n<li>SimonandSchuster.com feature</li>\r\n<li>SimonandSchuster.com newsletter feature</li>\r\n<li>ReadingGroups.simonandschuster.com feature</li>\r\n<li>Feature title at ALA</li>\r\n<li>Newsletter coop (tent)</li>	<i>The Shadow of the Wind</i> meets <i>Casablanca</i> in this sweeping and artfully crafted debut. 	Hardcover	\N	\N	Finished Book	\N	2011-06-21	Atria Books	Diana Franco, Publicist	Diana.Franco@simonandschuster.com	mailto:atriafeedback@simonandschuster.com?subject=The Time in Between - Galley Alley	Johanna Castillo, Editor	Johanna.Castillo@simonandschuster.com	Katie Moran, Marketing	Catherine.Moran@simonandschuster.com
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: William
--

SELECT pg_catalog.setval('books_id_seq', 19, true);


--
-- Data for Name: books_orders; Type: TABLE DATA; Schema: public; Owner: William
--

COPY books_orders (book_id, order_id, created_at, updated_at) FROM stdin;
1	1388	2009-04-17 12:21:55	2011-05-19 07:56:01
2	1388	2009-04-17 13:17:50	2011-05-19 07:14:02
3	1388	2009-04-20 11:21:39	2011-05-19 07:18:21
2	1389	2009-04-17 13:17:50	2011-05-19 07:14:02
9	1389	2009-04-20 11:32:55	2011-05-19 07:37:21
11	1389	2009-04-20 11:35:50	2011-05-19 07:44:47
2	1391	2009-04-17 13:17:50	2011-05-19 07:14:02
3	1391	2009-04-20 11:21:39	2011-05-19 07:18:21
4	1391	2009-04-20 11:24:12	2011-05-19 07:20:51
\.


--
-- Data for Name: covers; Type: TABLE DATA; Schema: public; Owner: William
--

COPY covers (id, book_id, parent_id, size, width, height, content_type, filename, thumbnail, created_at, updated_at) FROM stdin;
77	1	\N	78786	397	600	image/jpeg	GodSleepsInRwanda_9781416575733_NOT_FINAL_NOT_FINAL.jpg	\N	2009-05-07 13:46:22	2009-05-07 13:46:22
78	\N	77	78810	116	176	image/jpeg	GodSleepsInRwanda_9781416575733_NOT_FINAL_NOT_FINAL_medium.jpg	medium	2009-05-07 13:46:22	2009-05-07 13:46:22
79	\N	77	78810	90	136	image/jpeg	GodSleepsInRwanda_9781416575733_NOT_FINAL_NOT_FINAL_small.jpg	small	2009-05-07 13:46:22	2009-05-07 13:46:22
80	\N	77	78810	181	273	image/jpeg	GodSleepsInRwanda_9781416575733_NOT_FINAL_NOT_FINAL_large.jpg	large	2009-05-07 13:46:22	2009-05-07 13:46:22
81	2	\N	82734	400	600	image/jpeg	Stardust_9781439156148_NOT_FINAL_NOT_FINAL.jpg	\N	2009-05-07 13:55:02	2009-05-07 13:55:02
82	\N	81	82752	117	176	image/jpeg	Stardust_9781439156148_NOT_FINAL_NOT_FINAL_medium.jpg	medium	2009-05-07 13:55:02	2009-05-07 13:55:02
83	\N	81	82752	91	136	image/jpeg	Stardust_9781439156148_NOT_FINAL_NOT_FINAL_small.jpg	small	2009-05-07 13:55:02	2009-05-07 13:55:02
84	\N	81	82752	182	273	image/jpeg	Stardust_9781439156148_NOT_FINAL_NOT_FINAL_large.jpg	large	2009-05-07 13:55:02	2009-05-07 13:55:02
85	3	\N	67679	394	600	image/jpeg	9781439158845_NOT_FINAL.jpg	\N	2009-05-07 13:56:27	2009-05-07 13:56:27
86	\N	85	67704	116	176	image/jpeg	9781439158845_NOT_FINAL_medium.jpg	medium	2009-05-07 13:56:27	2009-05-07 13:56:27
87	\N	85	67704	89	136	image/jpeg	9781439158845_NOT_FINAL_small.jpg	small	2009-05-07 13:56:27	2009-05-07 13:56:27
88	\N	85	67704	179	273	image/jpeg	9781439158845_NOT_FINAL_large.jpg	large	2009-05-07 13:56:28	2009-05-07 13:56:28
89	4	\N	130964	396	600	image/jpeg	13thHour_9781439147917_NOT_FINAL_NOT_FINAL.jpg	\N	2009-05-07 13:57:01	2009-05-07 13:57:01
90	\N	89	130955	116	176	image/jpeg	13thHour_9781439147917_NOT_FINAL_NOT_FINAL_medium.jpg	medium	2009-05-07 13:57:01	2009-05-07 13:57:01
91	\N	89	130955	90	136	image/jpeg	13thHour_9781439147917_NOT_FINAL_NOT_FINAL_small.jpg	small	2009-05-07 13:57:01	2009-05-07 13:57:01
92	\N	89	130955	180	273	image/jpeg	13thHour_9781439147917_NOT_FINAL_NOT_FINAL_large.jpg	large	2009-05-07 13:57:01	2009-05-07 13:57:01
93	5	\N	79250	399	600	image/jpeg	NannyReturns_9781416585671_NOT_FINAL_NOT_FINAL.jpg	\N	2009-05-07 13:57:26	2009-05-07 13:57:26
94	\N	93	79291	117	176	image/jpeg	NannyReturns_9781416585671_NOT_FINAL_NOT_FINAL_medium.jpg	medium	2009-05-07 13:57:26	2009-05-07 13:57:26
95	\N	93	79291	90	136	image/jpeg	NannyReturns_9781416585671_NOT_FINAL_NOT_FINAL_small.jpg	small	2009-05-07 13:57:26	2009-05-07 13:57:26
96	\N	93	79291	182	273	image/jpeg	NannyReturns_9781416585671_NOT_FINAL_NOT_FINAL_large.jpg	large	2009-05-07 13:57:26	2009-05-07 13:57:26
97	6	\N	92147	400	600	image/jpeg	RuleWorldFromCouch_9781439118207_NOT_FINAL_NOT_FINAL.jpg	\N	2009-05-07 13:57:59	2009-05-07 13:57:59
98	\N	97	92166	117	176	image/jpeg	RuleWorldFromCouch_9781439118207_NOT_FINAL_NOT_FINAL_medium.jpg	medium	2009-05-07 13:57:59	2009-05-07 13:57:59
99	\N	97	92166	91	136	image/jpeg	RuleWorldFromCouch_9781439118207_NOT_FINAL_NOT_FINAL_small.jpg	small	2009-05-07 13:57:59	2009-05-07 13:57:59
100	\N	97	92166	182	273	image/jpeg	RuleWorldFromCouch_9781439118207_NOT_FINAL_NOT_FINAL_large.jpg	large	2009-05-07 13:58:00	2009-05-07 13:58:00
105	7	\N	33590	388	600	image/jpeg	French-WomenREVISE-1.jpg	\N	2009-05-07 13:58:52	2009-05-07 13:58:52
106	\N	105	33590	114	176	image/jpeg	French-WomenREVISE-1_medium.jpg	medium	2009-05-07 13:58:52	2009-05-07 13:58:52
107	\N	105	33590	88	136	image/jpeg	French-WomenREVISE-1_small.jpg	small	2009-05-07 13:58:52	2009-05-07 13:58:52
108	\N	105	33590	177	273	image/jpeg	French-WomenREVISE-1_large.jpg	large	2009-05-07 13:58:52	2009-05-07 13:58:52
113	9	\N	82900	388	600	image/jpeg	9781416585855_NOT_FINAL.jpg	\N	2009-05-07 14:00:01	2009-05-07 14:00:01
114	\N	113	82902	114	176	image/jpeg	9781416585855_NOT_FINAL_medium.jpg	medium	2009-05-07 14:00:01	2009-05-07 14:00:01
115	\N	113	82902	88	136	image/jpeg	9781416585855_NOT_FINAL_small.jpg	small	2009-05-07 14:00:02	2009-05-07 14:00:02
116	\N	113	82902	177	273	image/jpeg	9781416585855_NOT_FINAL_large.jpg	large	2009-05-07 14:00:02	2009-05-07 14:00:02
117	10	\N	51439	397	600	image/jpeg	SimpleSkinBeauty_9781416586968_NOT_FINAL_NOT_FINAL.jpg	\N	2009-05-07 14:00:44	2009-05-07 14:00:44
118	\N	117	51472	116	176	image/jpeg	SimpleSkinBeauty_9781416586968_NOT_FINAL_NOT_FINAL_medium.jpg	medium	2009-05-07 14:00:44	2009-05-07 14:00:44
119	\N	117	51472	90	136	image/jpeg	SimpleSkinBeauty_9781416586968_NOT_FINAL_NOT_FINAL_small.jpg	small	2009-05-07 14:00:44	2009-05-07 14:00:44
120	\N	117	51472	181	273	image/jpeg	SimpleSkinBeauty_9781416586968_NOT_FINAL_NOT_FINAL_large.jpg	large	2009-05-07 14:00:44	2009-05-07 14:00:44
121	11	\N	69332	397	600	image/jpeg	ThePromisedWorld_9781416575382_NOT_FINAL_NOT_FINAL.jpg	\N	2009-05-07 14:01:06	2009-05-07 14:01:06
122	\N	121	69356	116	176	image/jpeg	ThePromisedWorld_9781416575382_NOT_FINAL_NOT_FINAL_medium.jpg	medium	2009-05-07 14:01:06	2009-05-07 14:01:06
123	\N	121	69356	90	136	image/jpeg	ThePromisedWorld_9781416575382_NOT_FINAL_NOT_FINAL_small.jpg	small	2009-05-07 14:01:06	2009-05-07 14:01:06
124	\N	121	69356	181	273	image/jpeg	ThePromisedWorld_9781416575382_NOT_FINAL_NOT_FINAL_large.jpg	large	2009-05-07 14:01:06	2009-05-07 14:01:06
125	12	\N	67963	396	600	image/jpeg	AtlantisRevelation_9781416589129_NOT_FINAL_NOT_FINAL.jpg	\N	2009-05-07 14:01:43	2009-05-07 14:01:43
126	\N	125	67981	116	176	image/jpeg	AtlantisRevelation_9781416589129_NOT_FINAL_NOT_FINAL_medium.jpg	medium	2009-05-07 14:01:43	2009-05-07 14:01:43
127	\N	125	67981	90	136	image/jpeg	AtlantisRevelation_9781416589129_NOT_FINAL_NOT_FINAL_small.jpg	small	2009-05-07 14:01:43	2009-05-07 14:01:43
128	\N	125	67981	180	273	image/jpeg	AtlantisRevelation_9781416589129_NOT_FINAL_NOT_FINAL_large.jpg	large	2009-05-07 14:01:43	2009-05-07 14:01:43
137	15	\N	77157	398	600	image/jpeg	BFF_9780743294294_NOT_FINAL_NOT_FINAL.jpg	\N	2009-05-07 14:03:48	2009-05-07 14:03:48
138	\N	137	77173	117	176	image/jpeg	BFF_9780743294294_NOT_FINAL_NOT_FINAL_medium.jpg	medium	2009-05-07 14:03:48	2009-05-07 14:03:48
139	\N	137	77173	90	136	image/jpeg	BFF_9780743294294_NOT_FINAL_NOT_FINAL_small.jpg	small	2009-05-07 14:03:48	2009-05-07 14:03:48
140	\N	137	77173	181	273	image/jpeg	BFF_9780743294294_NOT_FINAL_NOT_FINAL_large.jpg	large	2009-05-07 14:03:48	2009-05-07 14:03:48
141	16	\N	183617	397	600	image/jpeg	MercuryInRetrograde_9781416598930.jpg	\N	2009-05-07 14:04:11	2009-05-07 14:04:11
142	\N	141	183668	116	176	image/jpeg	MercuryInRetrograde_9781416598930_medium.jpg	medium	2009-05-07 14:04:11	2009-05-07 14:04:11
143	\N	141	183668	90	136	image/jpeg	MercuryInRetrograde_9781416598930_small.jpg	small	2009-05-07 14:04:12	2009-05-07 14:04:12
144	\N	141	183668	181	273	image/jpeg	MercuryInRetrograde_9781416598930_large.jpg	large	2009-05-07 14:04:12	2009-05-07 14:04:12
145	8	\N	16067	182	273	image/jpeg	theprogram.jpg	\N	2009-05-11 16:45:31	2009-05-11 16:45:31
146	\N	145	16051	91	136	image/jpeg	theprogram_small.jpg	small	2009-05-11 16:45:31	2009-05-11 16:45:31
147	\N	145	16051	117	176	image/jpeg	theprogram_medium.jpg	medium	2009-05-11 16:45:31	2009-05-11 16:45:31
148	\N	145	16051	182	273	image/jpeg	theprogram_large.jpg	large	2009-05-11 16:45:31	2009-05-11 16:45:31
149	17	\N	2283	\N	\N	image/jpeg	Upper-Cut-small.jpg	\N	2011-04-28 14:48:37	2011-04-28 14:48:37
150	18	\N	3255	\N	\N	image/jpeg	Trianglescomp-small.jpg	\N	2011-04-28 14:58:18	2011-04-28 14:58:18
\.


--
-- Name: covers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: William
--

SELECT pg_catalog.setval('covers_id_seq', 151, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: William
--

COPY orders (id, first_name, last_name, store, address1, address2, city, state, zip, email, opt_in, created_at, updated_at, keycode, purchaser_type, eula, review_url, phone, newsletter_optin) FROM stdin;
1388	R	Narvadez	L-name	L-address	\N	L-city	CA	90210	rnarvadez@boomboxinc.com	t	2012-04-25 13:08:37	2012-04-25 13:08:37	EIeivKN0AhdEQVKRfkPMGnxr3e1nQoIo6z0ydhSYY	Librarian	t	\N	\N	\N
1389	Anne	Spieth	Atria Books 	1230 Avenue of the Americas	\N	New York	NY	10020	anne.spieth@simonandschuster.com	t	2012-04-27 11:05:07	2012-04-27 11:05:07	tPMr528LTBwvVaRBk2lJcgtqgCD0UVYwsaHakn2aB	Trade	t	\N	\N	\N
1390	Tonya	Weber	Lakota Local Schools	6608 Red Pine Drive	\N	Liberty Township	OH	45044	tonya.weber@lakotaonline.com	t	2012-04-30 08:38:50	2012-04-30 08:38:50	YN2PiV0u1WOHDV1nbgfqw98Q6uECrPCFjPm8E0UnS	Librarian	t	\N	\N	\N
1391	test-galley	test-galley	test-galley	test-galley	\N	test-galley	AK	11220	test-galley@example.com	t	2012-05-07 22:49:55	2012-05-07 22:49:55	V0FUyC9kqSNYRGb24bwHIRvcrMQTGjGIwuxH07S8l	Trade	t	\N	\N	t
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: William
--

SELECT pg_catalog.setval('orders_id_seq', 1392, true);


--
-- Data for Name: schema_info; Type: TABLE DATA; Schema: public; Owner: William
--

COPY schema_info (version) FROM stdin;
17
17
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: William
--

COPY schema_migrations (version) FROM stdin;
1
2
3
5
7
8
9
11
12
13
14
15
16
17
\.


--
-- Data for Name: site_reviews; Type: TABLE DATA; Schema: public; Owner: William
--

COPY site_reviews (id, approve, comments, created_at, updated_at, order_id) FROM stdin;
1	t	Your digital agency did a great job!!	2011-05-18 13:45:40	2011-05-18 13:45:40	1
2	t	test test test	2011-05-18 13:49:08	2011-05-18 13:49:08	3
3	t		2011-05-18 14:03:12	2011-05-18 14:03:12	5
4	t	It's awesome.	2011-05-18 15:15:05	2011-05-18 15:15:05	7
5	t		2011-05-19 06:48:39	2011-05-19 06:48:39	8
6	t	test test test.	2011-05-19 11:52:11	2011-05-19 11:52:11	9
7	t	I love the opportunity you are giving to booksellers, librarians, and reviewers, it's a great program!	2011-05-19 21:19:47	2011-05-19 21:19:47	10
8	t	This program is amazing! Thank you so much!	2011-05-19 21:32:48	2011-05-19 21:32:48	11
9	t	Likes: Good, varied selection of books; it's easy to access information and place orders.	2011-05-20 05:18:56	2011-05-20 05:18:56	16
10	t	It's a fantastic site - very easy to use and with an impressive selection. I will be picking up copies of some of the other titles as well on my own :). Thanks!	2011-05-20 05:18:57	2011-05-20 05:18:57	14
11	t	I think it was easier than last year, but I would have like a synopsis of each book.	2011-05-20 05:19:33	2011-05-20 05:19:33	13
12	t		2011-05-20 05:24:23	2011-05-20 05:24:23	17
13	t		2011-05-20 05:28:15	2011-05-20 05:28:15	19
14	t	Perhaps a one or two sentence description of the plot-? I selected 2 of the galleys because they were written by authors I would purchase for the library (and read myself), and the 3rd I selected because of the cover (not how I usually purchase books for the library, but I do often find that a good cover image will grab me when browsing a bookstore for my own books). Meg	2011-05-20 05:29:43	2011-05-20 05:29:43	18
15	t	I love the way you have this set up, with all of the information I need at my fingertips.	2011-05-20 05:38:27	2011-05-20 05:38:27	24
16	t	Format is excellent. Easy to navigate and make choices. Opportunity to receive printed and/or e-galley. Thank you. 	2011-05-20 05:38:30	2011-05-20 05:38:30	23
17	t		2011-05-20 05:41:59	2011-05-20 05:41:59	25
18	t		2011-05-20 05:43:16	2011-05-20 05:43:16	26
19	t		2011-05-20 05:43:53	2011-05-20 05:43:53	27
20	t		2011-05-20 05:46:49	2011-05-20 05:46:49	28
21	t		2011-05-20 05:56:24	2011-05-20 05:56:24	29
22	t		2011-05-20 05:57:11	2011-05-20 05:57:11	30
23	t		2011-05-20 05:57:40	2011-05-20 05:57:40	31
24	t	I like the information provided for each book that helps to narrow down my choices!	2011-05-20 06:01:54	2011-05-20 06:01:54	32
25	t	i think that this is a very good site for an advanced look at books that Atria is publishing.  May want to add a small blurb about each book on the selection page.	2011-05-20 06:10:40	2011-05-20 06:10:40	34
26	t		2011-05-20 06:11:49	2011-05-20 06:11:49	35
27	t	A great way to alert us on future books. Kudos.	2011-05-20 06:15:29	2011-05-20 06:15:29	37
28	t		2011-05-20 06:15:30	2011-05-20 06:15:30	38
29	t		2011-05-20 06:22:15	2011-05-20 06:22:15	40
30	t	This is an awesome website! It is nice to see what is available and what will be published soon. It also helps to see what types of titles Atria is publishing. 	2011-05-20 06:23:00	2011-05-20 06:23:00	41
31	t	It's wonderful - when I can't get to ALA or BEA, it gives me the chance to still be ahead of my patrons and be able to talk the books up when they come out. I also use LibraryThing where I briefly review everything I read and I'm a member of our One Book, One Community reading program selection committee so I'm always looking for titles to recommend for that.	2011-05-20 06:31:59	2011-05-20 06:31:59	42
32	t	Great site - easy to use, intuitive interface. Perhaps more detailed summaries of books?	2011-05-20 06:32:38	2011-05-20 06:32:38	43
33	t		2011-05-20 06:33:44	2011-05-20 06:33:44	44
34	t	I truly like the site that way it is. It's a brilliant way to showcase the new titles that are available!	2011-05-20 06:39:05	2011-05-20 06:39:05	46
35	t		2011-05-20 06:45:17	2011-05-20 06:45:17	48
36	t	Yes, I like the option of picking the books that it would be best to read/adivse my school librarian about and what would be best for my student body (approx. 2400 students).  English teachers at my school influence what our librarian and our students buy based on which books we read/promote.	2011-05-20 06:48:08	2011-05-20 06:48:08	49
37	t		2011-05-20 06:48:25	2011-05-20 06:48:25	51
38	t		2011-05-20 06:53:27	2011-05-20 06:53:27	53
39	t	I think this site is great for reviewers and the like to get some really great advance novels.	2011-05-20 06:59:22	2011-05-20 06:59:22	55
40	t		2011-05-20 06:59:44	2011-05-20 06:59:44	56
41	t		2011-05-20 07:03:39	2011-05-20 07:03:39	57
42	t	Very nicely designed.  Really like the summaries -- used in making decisions about choices of books to request.	2011-05-20 07:12:22	2011-05-20 07:12:22	58
43	t	This is terrific - thank you!  I'm looking forward to reading all three.	2011-05-20 07:19:54	2011-05-20 07:19:54	59
44	t	Love your site; gives me a chance to see something to help decide what I will add to our collection.	2011-05-20 07:24:05	2011-05-20 07:24:05	60
45	t		2011-05-20 07:26:05	2011-05-20 07:26:05	62
46	t	awesome!	2011-05-20 07:29:44	2011-05-20 07:29:44	63
47	t	This is a fantastic opportunity to see what's coming and what's available in galleys at a quick glance. I really love this format and hope that other publishers follow suit.\n\nall best,\nJocelyn\n\nBook Reviewer\nBookFinds\n	2011-05-20 07:31:48	2011-05-20 07:31:48	64
48	t	Very easy to browse. Thank you	2011-05-20 07:33:54	2011-05-20 07:33:54	65
49	t	I love how you don't have to reload pages to get the quick description of the book and even the longer description of the book. That's so smooth and easy to use. \nFor fun, you might want to do some kind of quiz that helps buyers select books for their customers. So you could ask them a few questions about what books are selling best for them right now and then recommend books that would satisfy those same customers. \n	2011-05-20 07:39:30	2011-05-20 07:39:30	66
50	t	What a nice surprise!	2011-05-20 08:04:18	2011-05-20 08:04:18	67
51	t	I really like how you have both print and e-galleys available. Very useful. Thank you!	2011-05-20 08:09:05	2011-05-20 08:09:05	68
52	t	This was my first time. It is super easy to use.  Thank you so much.	2011-05-20 08:20:17	2011-05-20 08:20:17	70
53	t		2011-05-20 08:34:02	2011-05-20 08:34:02	73
54	t	Loved this concept.	2011-05-20 08:36:18	2011-05-20 08:36:18	75
55	t	The ability to choose from several books is great!	2011-05-20 08:41:38	2011-05-20 08:41:38	76
56	t		2011-05-20 08:42:23	2011-05-20 08:42:23	77
57	t		2011-05-20 08:44:57	2011-05-20 08:44:57	79
58	t		2011-05-20 08:45:04	2011-05-20 08:45:04	78
59	t		2011-05-20 09:00:04	2011-05-20 09:00:04	81
60	t	I'm very pleased with the site.  Almost all of the expected information can be found on the front page, which is always desirable.  \n\nThe only change I would suggest is an indicator on the main page of books as to whether the egalley is available or not.  Possibly graying out or crossing out the option if the egalley is not yet available would be satisfactory.	2011-05-20 09:05:35	2011-05-20 09:05:35	83
61	t	What a wonderful and easy way to select galleys and find out about upcoming books. Love it!!!	2011-05-20 09:20:06	2011-05-20 09:20:06	87
62	t	LOVE IT!!!	2011-05-20 09:21:28	2011-05-20 09:21:28	88
125	t		2011-05-20 14:24:01	2011-05-20 14:24:01	137
126	t		2011-05-20 14:27:33	2011-05-20 14:27:33	172
63	t	I think this is great! I did this last year and think it is wonderful that you continued it again this year. Thank you very much!	2011-05-20 09:25:02	2011-05-20 09:25:02	90
64	t		2011-05-20 09:28:30	2011-05-20 09:28:30	94
65	t		2011-05-20 09:30:17	2011-05-20 09:30:17	93
66	t		2011-05-20 09:31:33	2011-05-20 09:31:33	97
67	t	This is a great site! It's easy to use and I enjoy getting a glimpse at some future releases, especially books that will be good for my library's book clubs.	2011-05-20 09:33:21	2011-05-20 09:33:21	98
68	t	I love this site.  It's a great way for librarians and bloggers to see what's coming up and request galleys for review.	2011-05-20 09:33:38	2011-05-20 09:33:38	99
69	t		2011-05-20 09:36:14	2011-05-20 09:36:14	101
70	t		2011-05-20 09:36:42	2011-05-20 09:36:42	102
71	t	Very convenient!  Though as a book reviews editor attempting to request all historical fiction titles so that we can cover them in our journal (Historical Novels Review), it is frustrating not to be able to request them all. However, I understand it wouldn't be feasible since everyone would request more. I'll contact the publicist I usually work with to get the others.	2011-05-20 09:37:15	2011-05-20 09:37:15	100
72	t	Loved it.  Thank you.	2011-05-20 09:37:54	2011-05-20 09:37:54	104
73	t	I love this site. It is very informative and user friendly. 	2011-05-20 09:38:10	2011-05-20 09:38:10	105
74	t		2011-05-20 09:39:01	2011-05-20 09:39:01	107
75	t		2011-05-20 09:40:10	2011-05-20 09:40:10	109
76	t	Dear Atria, I wish it was possible to choose more than three titles. I had a difficult time choosing because so many titles sounded intriguing. Thank you so much. Michael	2011-05-20 09:42:15	2011-05-20 09:42:15	110
77	t	I'm so glad that this is being offered with BEA so imminent. I won't be able to get to New York so this is an excellent for me to pick up some of the ARCs I'll be missing out on. Great work. \n\nAlthough I understand that it is an attempt to be fair to everyone, I would like to be eligible for more books. I guess I'm just greedy.\n\nI would have liked to have been able to check more than one box identifying myself. I'm signed in as a bookseller but I also write reviews for four other websites. Perhaps two sign-ins would qualify me for more books. Oops, there's that greed again.\n\nThanks again for this great offer,\nCarl Scott\nWest of Eden Books\n\n	2011-05-20 09:47:06	2011-05-20 09:47:06	108
78	t		2011-05-20 09:47:57	2011-05-20 09:47:57	112
79	t	Awesome!  Thank you!	2011-05-20 09:49:43	2011-05-20 09:49:43	114
80	t	Love the ease of this and greatly appreciate the opportunity!	2011-05-20 09:49:46	2011-05-20 09:49:46	113
81	t		2011-05-20 09:50:05	2011-05-20 09:50:05	115
82	t		2011-05-20 09:52:46	2011-05-20 09:52:46	117
83	t	I liked having the choice of books so I could pick the ones that are  the most interesting to me. I liked the variety of titles from which to choose. The website and making the choices were very user friendly and fast. Thank you!	2011-05-20 09:55:26	2011-05-20 09:55:26	116
84	t	I like that it shows all the information about the titles in a clear, orderly manner. It is very easy to use. 	2011-05-20 09:59:49	2011-05-20 09:59:49	119
85	t		2011-05-20 10:00:52	2011-05-20 10:00:52	120
86	t		2011-05-20 10:05:15	2011-05-20 10:05:15	122
87	t		2011-05-20 10:05:21	2011-05-20 10:05:21	121
88	t		2011-05-20 10:07:38	2011-05-20 10:07:38	124
89	t	I really liked it. Thought it was colorful,easy to use and fun!	2011-05-20 10:08:10	2011-05-20 10:08:10	123
90	t	Thanks for the great selections and large amount of information about each title. The site is easy to navigate. It's deciding which three titles to choose that's the hard part!	2011-05-20 10:11:14	2011-05-20 10:11:14	126
91	t		2011-05-20 10:12:29	2011-05-20 10:12:29	127
92	t		2011-05-20 10:18:50	2011-05-20 10:18:50	128
93	t	Excellent layout, easy to use and fast.	2011-05-20 10:20:04	2011-05-20 10:20:04	129
94	t		2011-05-20 10:22:40	2011-05-20 10:22:40	130
95	t		2011-05-20 10:25:23	2011-05-20 10:25:23	133
96	t	I love this service! It's wonderful to be able see what books you're most excited to publish, and I always appreciate the chance to read a book ahead of time so that I can be ready to suggest it to patrons. Thank you so much!!	2011-05-20 10:25:50	2011-05-20 10:25:50	131
97	t	This is amazing!  Thank you!	2011-05-20 10:30:15	2011-05-20 10:30:15	134
98	t		2011-05-20 10:32:02	2011-05-20 10:32:02	135
99	t	The only thing I was wondering about is that I saw this on Shelf Awareness and when I clicked on it, it took me to an email to send rather than to show the book selections. As I was lucky enough last yaer to get a couple of galleys through your excellent program, I went straight to your website to enter this way. Thank you!	2011-05-20 10:36:27	2011-05-20 10:36:27	136
100	t	Love the site--it's fun to be able to click on each\r\nbook and read the synopsis to decide.  My only problem\r\nwas keeping the choice to three!!  Thank you.	2011-05-20 10:41:02	2011-05-20 10:41:02	138
101	t		2011-05-20 10:45:05	2011-05-20 10:45:05	139
102	t	allow summary of book to appear upon mousing over (like Netflix)	2011-05-20 10:55:32	2011-05-20 10:55:32	140
103	t	I like having the ability to read about the up coming titles and an opportunity to preview them pre-selection to the library collection.	2011-05-20 10:58:28	2011-05-20 10:58:28	141
104	t	Set up very nice and easy to use;	2011-05-20 11:07:05	2011-05-20 11:07:05	142
105	t	This is a cool format.  I liked having a brief synopsis of each book. (Perhaps an alternate address to ship books to might be helpful.)	2011-05-20 11:10:59	2011-05-20 11:10:59	143
106	t	It's easy to use. I like that you can look at the descriptions of the books without having to flip back and forth between pages. I think it's a great way to explore new books. And, I thank you for the opportunity.	2011-05-20 11:16:12	2011-05-20 11:16:12	145
107	t		2011-05-20 11:17:00	2011-05-20 11:17:00	146
108	t	Great opportunity with no hassle!	2011-05-20 11:23:58	2011-05-20 11:23:58	148
109	t	No improvements needed! It worked extremely well and the summary details were very helpful.	2011-05-20 11:27:04	2011-05-20 11:27:04	149
110	t	Very easy to use	2011-05-20 11:33:35	2011-05-20 11:33:35	147
111	t		2011-05-20 11:33:40	2011-05-20 11:33:40	151
112	t		2011-05-20 11:53:26	2011-05-20 11:53:26	153
113	t	It was easy to use.	2011-05-20 12:03:33	2011-05-20 12:03:33	155
114	t	Great.	2011-05-20 12:22:26	2011-05-20 12:22:26	156
115	t	I like that I can read about each book right on the same page, without leaving the site. 	2011-05-20 12:23:36	2011-05-20 12:23:36	157
116	t		2011-05-20 12:36:58	2011-05-20 12:36:58	159
117	t		2011-05-20 13:00:14	2011-05-20 13:00:14	162
118	t		2011-05-20 13:05:52	2011-05-20 13:05:52	163
119	t	Love it. I would like to get this offer more frequently	2011-05-20 13:26:02	2011-05-20 13:26:02	164
120	t		2011-05-20 13:32:37	2011-05-20 13:32:37	166
121	t	I think the website is very easy to use. It is easy to see the more information about each book and easy enough to order them.	2011-05-20 13:44:06	2011-05-20 13:44:06	167
122	t	You make it very easy.  We love the chance to preview early and\nwe will SO talk up the titles to our patrons.  Thanks in advance.	2011-05-20 13:52:27	2011-05-20 13:52:27	168
123	t		2011-05-20 14:07:11	2011-05-20 14:07:11	170
124	t		2011-05-20 14:10:14	2011-05-20 14:10:14	171
127	t		2011-05-20 14:41:13	2011-05-20 14:41:13	174
128	t		2011-05-20 14:43:35	2011-05-20 14:43:35	175
129	t	I thought the site was clearly laid out and easy to use. Good job on it!	2011-05-20 14:47:30	2011-05-20 14:47:30	177
130	t	What a generous offer and a great way to see your top picks!	2011-05-20 14:56:28	2011-05-20 14:56:28	178
131	t	I look forward to this every year.  The site is nicely visual and easy to use and the choices are, as always, amazing.  Thanks for this awesome opportunity to get really cool books.	2011-05-20 15:05:02	2011-05-20 15:05:02	179
132	t		2011-05-20 15:06:35	2011-05-20 15:06:35	180
133	t		2011-05-20 15:30:37	2011-05-20 15:30:37	182
134	t		2011-05-20 15:40:34	2011-05-20 15:40:34	183
135	t	This is a great idea and site. I get copies for my buyers to consider each time you have a gaaley grab. Aloha!	2011-05-20 15:44:26	2011-05-20 15:44:26	184
136	t		2011-05-20 15:48:36	2011-05-20 15:48:36	185
137	t		2011-05-20 16:06:43	2011-05-20 16:06:43	186
138	t	Very easy to navigate.\r\n\r\nThank YOu	2011-05-20 16:27:19	2011-05-20 16:27:19	187
139	t	I love the site! Extremely easy to use!	2011-05-20 17:31:46	2011-05-20 17:31:46	190
140	t	I really like that you can find out additional information about the books listed without having to leave the initial website.	2011-05-20 19:09:45	2011-05-20 19:09:45	191
141	t	Larger selection would be great. Also, separated by genre. Thanks! You guys are amazing!!	2011-05-20 19:32:09	2011-05-20 19:32:09	192
142	t		2011-05-20 20:19:03	2011-05-20 20:19:03	193
143	t	I think the site is great. I look forward to seeing what else you may have to offer.	2011-05-20 21:06:07	2011-05-20 21:06:07	194
144	t		2011-05-20 23:07:46	2011-05-20 23:07:46	195
145	t	Short and expanded summaries.	2011-05-21 06:36:23	2011-05-21 06:36:23	197
146	t	LOVE IT!!!!!	2011-05-21 08:25:11	2011-05-21 08:25:11	198
147	t	This is fantastic. It's great! THANKS!	2011-05-21 08:54:57	2011-05-21 08:54:57	199
148	t		2011-05-21 10:15:04	2011-05-21 10:15:04	201
149	t		2011-05-21 11:22:24	2011-05-21 11:22:24	203
150	t		2011-05-21 12:24:06	2011-05-21 12:24:06	204
151	t	I received books in the last gallery grab and loved them!\r\nThank you!	2011-05-21 12:59:13	2011-05-21 12:59:13	206
152	t	I've always loved the ease of Altria's website, the quality of your published works, and the polite professionalism of the employees I've dealt with. Keep up the great work!	2011-05-21 13:55:10	2011-05-21 13:55:10	207
153	t	I am using an IPad and I wasn't able to access all the summary information.\n\nEasy to use and I like the layout.\n\nThank you!p	2011-05-21 14:34:44	2011-05-21 14:34:44	208
154	t		2011-05-21 14:57:18	2011-05-21 14:57:18	209
155	t		2011-05-21 17:08:54	2011-05-21 17:08:54	210
156	t		2011-05-21 19:07:35	2011-05-21 19:07:35	211
157	t	I like being able to get a good summary and a good look at book info.  It is convenient to look at all the books in one place.	2011-05-21 21:39:24	2011-05-21 21:39:24	212
158	t		2011-05-22 09:24:30	2011-05-22 09:24:30	216
159	t		2011-05-23 05:21:08	2011-05-23 05:21:08	219
160	t	I like to display of the title. Thank you  for this service!	2011-05-23 06:25:28	2011-05-23 06:25:28	221
161	t		2011-05-23 08:19:42	2011-05-23 08:19:42	222
162	t		2011-05-23 09:19:42	2011-05-23 09:19:42	224
163	t	\r\nThis is an great deal for everyone involved; you do a wonderful job. Iâ€™ve place my order and am eagerly awaiting the chance to read them!  Of course, then I am able to promote those titles to our customers!   A win-win situation for all involved!\r\n\r\nIâ€™m an avid reader and have worked at the Maricopa County Library District for over 20 awesome years.  Iâ€™m known to some of our customers as their book sommelier!\r\n\r\nConnie Ransberger\r\nMaricopa County Library District\r\nLitchfield Park Branch Library\r\nconnieransberger@mcldaz.org\r\n\r\n\r\n\r\n\r\n	2011-05-23 09:51:11	2011-05-23 09:51:11	225
164	t		2011-05-23 10:01:29	2011-05-23 10:01:29	223
165	t		2011-05-23 10:02:16	2011-05-23 10:02:16	226
166	t	Great so far.  I have to move to a different computer to try downloading an egalley so can't comment yet on that process.	2011-05-23 10:18:43	2011-05-23 10:18:43	227
167	t		2011-05-23 10:21:59	2011-05-23 10:21:59	228
168	t	LOVE this site. It builds word of mouth for books that we've only read reviews on.	2011-05-23 11:42:29	2011-05-23 11:42:29	229
169	t		2011-05-23 11:49:36	2011-05-23 11:49:36	230
170	t		2011-05-23 11:54:00	2011-05-23 11:54:00	231
171	t		2011-05-23 12:26:21	2011-05-23 12:26:21	232
172	t	It is very easy to order books and I love the little bios. It makes choosing easy too. i can't wait to read them.	2011-05-23 12:46:25	2011-05-23 12:46:25	233
173	t		2011-05-23 15:06:08	2011-05-23 15:06:08	234
174	t		2011-05-23 21:17:31	2011-05-23 21:17:31	238
175	t		2011-05-23 21:52:05	2011-05-23 21:52:05	239
176	t		2011-05-23 21:52:06	2011-05-23 21:52:06	239
177	t	You can always add more selections.  Very nice and user-friendly.	2011-05-23 23:16:55	2011-05-23 23:16:55	240
178	t		2011-05-24 03:03:31	2011-05-24 03:03:31	242
179	t		2011-05-24 04:04:17	2011-05-24 04:04:17	239
180	t		2011-05-24 04:54:51	2011-05-24 04:54:51	243
181	t		2011-05-24 04:55:20	2011-05-24 04:55:20	244
182	t		2011-05-24 04:55:28	2011-05-24 04:55:28	245
183	t		2011-05-24 04:57:01	2011-05-24 04:57:01	246
184	t		2011-05-24 05:00:15	2011-05-24 05:00:15	249
185	t		2011-05-24 05:03:43	2011-05-24 05:03:43	250
186	t		2011-05-24 05:08:24	2011-05-24 05:08:24	251
187	t	The Galley Grab was easy to use and gave just enough information about each title to let potential reviewers know about them.  I enjoyed using this interactive tool and look forward to reviewing your books!	2011-05-24 05:11:50	2011-05-24 05:11:50	255
188	t		2011-05-24 05:15:31	2011-05-24 05:15:31	261
189	t	I have recieved ARCs from Atria and Simon & Schuster before and been thrilled - got a chance to preview some wonderful books that I recommended and purchased. But I'd love to be able to download to my Kindle also - it's so convenient. Hopefully you'll offer the Kindle option sometime. \n\n	2011-05-24 05:18:23	2011-05-24 05:18:23	260
190	t		2011-05-24 05:20:56	2011-05-24 05:20:56	262
191	t		2011-05-24 05:21:34	2011-05-24 05:21:34	263
192	t		2011-05-24 05:21:42	2011-05-24 05:21:42	264
193	t	I like the amount of information for each book, and the quick load time for the info page when clicked.	2011-05-24 05:23:15	2011-05-24 05:23:15	265
194	t		2011-05-24 05:24:41	2011-05-24 05:24:41	266
195	t	It is FANTASTIC! It's very user-friendly.	2011-05-24 05:32:34	2011-05-24 05:32:34	271
196	t		2011-05-24 05:34:22	2011-05-24 05:34:22	274
197	t	This is the most convenient galley grab I've seen that easily lets us view titles and their descriptions. Great job!	2011-05-24 05:36:58	2011-05-24 05:36:58	277
198	t		2011-05-24 05:37:17	2011-05-24 05:37:17	278
199	t		2011-05-24 05:38:05	2011-05-24 05:38:05	279
200	t	love this site - i wish though that you still sent catalogues - it's too hard to do the front list now.	2011-05-24 05:42:15	2011-05-24 05:42:15	280
201	t	I love this idea, but I wish it was more then during BEA.	2011-05-24 05:46:34	2011-05-24 05:46:34	283
202	t	I think the site is great as is - I've used it for 3 years now.	2011-05-24 05:47:42	2011-05-24 05:47:42	284
203	t		2011-05-24 05:48:09	2011-05-24 05:48:09	285
204	t		2011-05-24 05:51:33	2011-05-24 05:51:33	286
205	t	I loved it! I will definitely look forward to future offerings!	2011-05-24 05:52:18	2011-05-24 05:52:18	287
206	t	Add mini synopsisâ€™s of each title. 	2011-05-24 05:53:18	2011-05-24 05:53:18	288
207	t	Give a synopsis of the book.  Otherwise, it's a great site.  I've used it before.   Thanks for doing it.	2011-05-24 05:55:43	2011-05-24 05:55:43	290
208	t		2011-05-24 05:55:45	2011-05-24 05:55:45	289
209	t	Since I can't make it to BEA, I love galley grab!	2011-05-24 05:59:47	2011-05-24 05:59:47	292
210	t	The site was easy to use with clean presentation. Thank you for the opportunity to review for Atria Books!	2011-05-24 05:59:53	2011-05-24 05:59:53	291
211	t		2011-05-24 06:01:08	2011-05-24 06:01:08	293
212	t		2011-05-24 06:02:28	2011-05-24 06:02:28	294
213	t		2011-05-24 06:02:52	2011-05-24 06:02:52	295
214	t		2011-05-24 06:03:08	2011-05-24 06:03:08	296
215	t	Love it...makes it so much easier.  Always loved your books anyway, but I like the options given.	2011-05-24 06:05:10	2011-05-24 06:05:10	297
216	t		2011-05-24 06:08:22	2011-05-24 06:08:22	299
217	t		2011-05-24 06:10:56	2011-05-24 06:10:56	300
218	t		2011-05-24 06:11:32	2011-05-24 06:11:32	301
219	t		2011-05-24 06:14:00	2011-05-24 06:14:00	302
220	t	Easy to use. one click and you get the information about each book that helps you decide what sounds appealing.	2011-05-24 06:18:47	2011-05-24 06:18:47	304
221	t		2011-05-24 06:18:56	2011-05-24 06:18:56	305
222	t		2011-05-24 06:19:34	2011-05-24 06:19:34	306
223	t		2011-05-24 06:20:05	2011-05-24 06:20:05	308
224	t	Very easy to use.	2011-05-24 06:26:27	2011-05-24 15:32:45	311
225	t		2011-05-24 06:27:20	2011-05-24 06:27:20	312
226	t	This site was very easy to navigate, and I appreciate the option for egalleys.\r\nThe speed was much faster than netgalley, too.	2011-05-24 06:29:43	2011-05-24 06:29:43	313
227	t	It was very easy to use and the titles were diverse.\nThank you	2011-05-24 06:37:23	2011-05-24 06:37:23	314
228	t	I really enjoy the convenience of Galley Grab.	2011-05-24 06:39:39	2011-05-24 06:39:39	315
229	t	maybe choose 3 ARCs and some eGalleys.  that would be wonderful.\r\n\r\nThank you,  Susan	2011-05-24 06:46:28	2011-05-24 06:46:28	319
230	t	Worked easily and efficiently, look forward to receiving books!	2011-05-24 06:46:49	2011-05-24 06:46:49	320
231	t		2011-05-24 06:51:04	2011-05-24 06:51:04	323
232	t	I love the website! It's fast and easy to use. I'll defiantly come back. 	2011-05-24 06:52:47	2011-05-24 06:52:47	324
233	t	Love the Galley Grab app!	2011-05-24 06:52:52	2011-05-24 06:52:52	325
234	t		2011-05-24 07:03:46	2011-05-24 07:03:46	327
235	t		2011-05-24 07:04:29	2011-05-24 07:04:29	329
236	t	Think it is a great way to get some advance copies to review for my blog. Enables me to look at what is coming up and choose books of interest for myself and followers of my book blog. Thank you!	2011-05-24 07:10:15	2011-05-24 07:10:15	332
237	t		2011-05-24 07:12:05	2011-05-24 07:12:05	335
238	t		2011-05-24 07:20:08	2011-05-24 07:20:08	337
239	t		2011-05-24 07:23:36	2011-05-24 07:23:36	339
240	t	This is an interesting idea!	2011-05-24 07:25:09	2011-05-24 07:25:09	340
241	t	I like it, it's easy to use and to see descriptions right there.	2011-05-24 07:26:45	2011-05-24 07:26:45	336
242	t		2011-05-24 07:27:34	2011-05-24 07:27:34	342
243	t		2011-05-24 07:34:30	2011-05-24 07:34:30	345
244	t		2011-05-24 07:38:15	2011-05-24 07:38:15	346
245	t	I just love this! What a great way to get a taste of what is new and what would be approperate for younger (High School) readers	2011-05-24 07:39:34	2011-05-24 07:39:34	347
246	t		2011-05-24 07:45:04	2011-05-24 07:45:04	348
247	t		2011-05-24 07:53:15	2011-05-24 07:53:15	352
248	t		2011-05-24 07:58:27	2011-05-24 07:58:27	354
249	t		2011-05-24 08:15:00	2011-05-24 08:15:00	359
250	t		2011-05-24 08:18:46	2011-05-24 08:18:46	361
251	t		2011-05-24 08:19:22	2011-05-24 08:19:22	362
252	t		2011-05-24 08:20:28	2011-05-24 08:20:28	363
253	t		2011-05-24 08:20:35	2011-05-24 08:20:35	364
254	t		2011-05-24 08:21:13	2011-05-24 08:21:13	365
255	t	Perfect!  	2011-05-24 08:30:45	2011-05-24 08:30:45	368
256	t	Great layout and I love that clicking on the title to read more doesn't take you to a completely different page so you have to go back to the main screen over and over.\n\nCan't think of anything I disliked.	2011-05-24 08:36:51	2011-05-24 08:36:51	369
257	t	Somehow it needs to more clearly give very brief descriptions for each book. Otherwise, love it! Thank you for giving us this opportunity.	2011-05-24 08:38:50	2011-05-24 08:38:50	371
258	t	I like the site, as is.  Thanks!	2011-05-24 08:38:52	2011-05-24 08:38:52	370
259	t	love it!	2011-05-24 08:43:25	2011-05-24 08:43:25	373
260	t	like a summary of the books. Thank you for providing that. 	2011-05-24 08:57:23	2011-05-24 08:57:23	374
261	t		2011-05-24 09:04:00	2011-05-24 09:04:00	375
262	t		2011-05-24 09:05:02	2011-05-24 09:05:02	378
263	t	Really like the galley grab.  I enjoy being able to see a selection and pick the best ones that I think will appeal to my customers.  I then review them in our newsletter and get advance orders. \n\nI think that this is great!	2011-05-24 09:05:31	2011-05-24 09:05:31	377
264	t		2011-05-24 09:07:39	2011-05-24 09:07:39	379
265	t	This is great - the covers and all information in one place! \n\nI think if the ebooks did not have an expiration date, it would allow greater ability for reviewers to read the books and write reviews. Perhaps extend it's expiration for a year past the publishing date?\n\nThanks!	2011-05-24 09:11:47	2011-05-24 09:11:47	376
266	t		2011-05-24 09:11:55	2011-05-24 09:11:55	380
267	t		2011-05-24 09:14:17	2011-05-24 09:14:17	381
268	t		2011-05-24 09:20:00	2011-05-24 09:20:00	382
269	t		2011-05-24 09:32:04	2011-05-24 09:32:04	384
270	t	I love seeing what's coming up and having the opportunity to get advanced copies to review so I can recommend them to our patrons.	2011-05-24 09:35:42	2011-05-24 09:35:42	386
271	t	This is a great site and a wonderful way to discover upcoming titles!\r\n\r\nThank you!\r\nKimberly\r\nLazy Day Books\r\nwww.LazyDayBooks.com	2011-05-24 09:37:38	2011-05-24 09:37:38	387
272	t	The site was easy & clean to use and direct.\r\nIt made the ordering process enjoyable.	2011-05-24 09:37:57	2011-05-24 09:37:57	388
273	t		2011-05-24 09:44:18	2011-05-24 09:44:18	395
274	t	It was nice to have all the books in one area and be able to look at the book descriptions. 	2011-05-24 09:44:40	2011-05-24 09:44:40	393
275	t		2011-05-24 09:47:03	2011-05-24 09:47:03	396
276	t	I love the cover art display and clicking for more information.  Your summaries, author info, and marketing information assist me in choosing galleys and seeking more information about the books.	2011-05-24 09:48:07	2011-05-24 09:48:07	394
277	t		2011-05-24 09:49:16	2011-05-24 09:49:16	397
278	t	Very easy to use. Great titles to choose from (some favorite authors as well as those I am not familiar with). Thank you!	2011-05-24 09:57:44	2011-05-24 09:57:44	399
279	t		2011-05-24 10:06:17	2011-05-24 10:06:17	400
280	t	I love that there are many books to choose from, and that I can get them in e-book form if I choose to. The only improvement I can think of is maybe to not have all of the e-galleys expire. I know a lot of reviewers pass up e-books for just that reason alone.	2011-05-24 10:08:33	2011-05-24 10:08:33	401
281	t		2011-05-24 10:09:51	2011-05-24 10:09:51	402
282	t		2011-05-24 10:14:42	2011-05-24 10:14:42	405
283	t		2011-05-24 10:20:05	2011-05-24 10:20:05	407
284	t	I liked this very much!	2011-05-24 10:28:19	2011-05-24 10:28:19	408
285	t	Extremely easy to use - love it!	2011-05-24 10:46:45	2011-05-24 10:46:45	409
286	t	I like how easy it is to use.	2011-05-24 10:50:35	2011-05-24 10:50:35	410
287	t		2011-05-24 10:56:15	2011-05-24 10:56:15	411
288	t		2011-05-24 11:13:58	2011-05-24 11:13:58	413
289	t		2011-05-24 11:18:55	2011-05-24 11:18:55	414
290	t	Wonderful !!!!!  The site is exceptionally easy to use. Thank you,  \r\nClaire Eaton	2011-05-24 11:32:04	2011-05-24 11:32:04	416
291	t		2011-05-24 11:32:30	2011-05-24 11:32:30	417
292	t		2011-05-24 11:40:50	2011-05-24 11:40:50	419
293	t		2011-05-24 11:41:23	2011-05-24 11:41:23	420
294	t	Loved it!  Easy to use, good selection.  	2011-05-24 11:43:08	2011-05-24 11:43:08	422
295	t	I enjoyed using this website to obtain ARC's.  Great website and easy to use.  	2011-05-24 12:04:47	2011-05-24 12:04:47	423
296	t		2011-05-24 12:15:05	2011-05-24 12:15:05	424
297	t	I love this site for Galleys. I much prefer it to NetGalley.	2011-05-24 12:26:35	2011-05-24 12:26:35	425
298	t	Great site!	2011-05-24 12:27:29	2011-05-24 12:27:29	426
299	t		2011-05-24 12:44:57	2011-05-24 12:44:57	428
300	t	I think both Galley Alley and Galley Grab are great resources for reviewers. I look forward to the Galley Grab newsletter each month and I love that I can get egalleys without waiting for approval each time. You have a great thing going here.	2011-05-24 12:51:25	2011-05-24 12:51:25	429
301	t		2011-05-24 12:57:40	2011-05-24 12:57:40	430
302	t	Excellent format and easy to navigate.	2011-05-24 13:11:27	2011-05-24 13:11:27	431
303	t	I love it! Quick and easy to use. Thank you!	2011-05-24 13:15:38	2011-05-24 13:15:38	432
304	t	It was very easy to see all of the titles offered and to read the details of each one. Very easy site to use.	2011-05-24 13:18:38	2011-05-24 13:18:38	433
305	t		2011-05-24 13:42:55	2011-05-24 13:42:55	437
306	t	I love getting a choice of a variety of titles.  	2011-05-24 13:46:03	2011-05-24 13:46:03	438
307	t	This site was very easy to use, and I will definitely use it again.	2011-05-24 14:04:13	2011-05-24 14:04:13	440
308	t	I think this is a brilliant website. I am just a little unsure as to how often we are able to place an order of 3 books. Is this a one-time thing, or is it once every six months, or even once a year? It would be good to know this information.\n\nBut as for the program itself, I think it is a brilliant way to bring your books to the attention of those who will ultimately bring the most attention to your titles.\n\nMany thanks!\n\nTodd Hurley\nThe Hurley Edition (www.toddhurley.ca)	2011-05-24 14:20:17	2011-05-24 14:20:17	441
309	t		2011-05-24 14:46:44	2011-05-24 14:46:44	445
310	t	Love this offer!!	2011-05-24 14:55:05	2011-05-24 14:55:05	449
311	t	Liked it very much.  Easy to use.  Thank you.	2011-05-24 15:12:04	2011-05-24 15:12:04	450
312	t	I like the option to choose the ones I'm interested in and the info about the titles is informative and helpful. Some of us still want ARC's and not e-book formats!  Thank you so much for this offer!\r\n	2011-05-24 16:33:14	2011-05-24 16:33:14	455
313	t	The variety of selections... thanks so much.	2011-05-24 16:38:34	2011-05-24 16:38:34	456
314	t	Easy to use, I liked the easy to access description and information given. No need to search elsewhere for details on the book,  	2011-05-24 16:41:28	2011-05-24 16:41:28	458
315	t	Site is very easy to navigate and 'user friendly' a joy for all of us!	2011-05-24 16:57:42	2011-05-24 16:57:42	459
316	t	Very easy to use - no issues with how it is set up. Thank you!	2011-05-24 17:06:50	2011-05-24 17:06:50	460
317	t	I liked the layout, it was pleasing to the eye and clearly accessable. The visibilty of the rules and guidelines of the site may be put in a better position for acknowledgement.	2011-05-24 17:21:41	2011-05-24 17:21:41	446
318	t	I LOVE Galley Grab, and use it regularly for e-galleys. Thank you!	2011-05-24 17:26:54	2011-05-24 17:26:54	463
319	t		2011-05-24 17:41:55	2011-05-24 17:41:55	464
320	t	I love being able to choose from selection of galleys. Some books I get to read, others wind up on my wish list. Very smart!	2011-05-24 17:44:42	2011-05-24 17:44:42	465
321	t		2011-05-24 17:50:57	2011-05-24 17:50:57	466
322	t		2011-05-24 18:05:56	2011-05-24 18:05:56	467
323	t	This is fantastic, so easy to use, loads quickly. Thank you so much for the generous offer, can't wait to get started!	2011-05-24 18:23:18	2011-05-24 18:23:18	468
324	t		2011-05-24 18:23:54	2011-05-24 18:23:54	469
325	t	I was very impressed with this. This was my first time doing it and I was referred by a Shelf Awareness ad for the book "The Lost Angel". I would definitely use this in the future. I like that I can request up to 3 books at a time.	2011-05-24 18:38:39	2011-05-24 18:38:39	470
326	t		2011-05-24 18:43:44	2011-05-24 18:43:44	471
327	t		2011-05-24 19:08:01	2011-05-24 19:08:01	472
328	t		2011-05-24 19:25:58	2011-05-24 19:25:58	473
329	t	Excellent variety.  Perhaps add the option to read the first chapter or just an excerpt?	2011-05-24 21:04:30	2011-05-24 21:04:30	477
330	t	I found it amazingly simple to use. \nReally like that all the information as well as the covers of the books are available. \nThere was nothing to dislike at all:)	2011-05-24 21:48:35	2011-05-24 21:48:35	476
331	t		2011-05-25 00:26:05	2011-05-25 00:26:05	479
332	t		2011-05-25 05:22:15	2011-05-25 05:22:15	482
333	t	This is a wonderful site! I wouldn't change a thing.	2011-05-25 06:59:37	2011-05-25 06:59:37	485
334	t	Very nice website, easy to navigate.  I appreciate the opportunity as a librarian to be able to acquire free books from you company. Thank you!	2011-05-25 07:02:24	2011-05-25 07:02:24	486
335	t		2011-05-25 07:49:31	2011-05-25 07:49:31	490
336	t	Galley Grab is a great way to get the acquisitions staff to review new titles we might otherwise miss. Aloha!	2011-05-25 09:19:18	2011-05-25 09:19:18	492
337	t		2011-05-25 09:44:17	2011-05-25 09:44:17	494
338	t	There's nothing to change, it's perfect as is.	2011-05-25 10:13:48	2011-05-25 10:13:48	495
339	t		2011-05-25 10:22:07	2011-05-25 10:22:07	496
340	t		2011-05-25 10:41:03	2011-05-25 10:41:03	497
341	t	Love being able to choose the books I'd prefer to review for publication. Thanks for the opportunity.	2011-05-25 10:47:21	2011-05-25 10:47:21	499
342	t	Excellent titles to choose from	2011-05-25 11:53:02	2011-05-25 11:53:02	501
343	t		2011-05-25 12:45:10	2011-05-25 12:45:10	504
344	t		2011-05-25 13:09:28	2011-05-25 13:09:28	505
345	t		2011-05-25 14:21:03	2011-05-25 14:21:03	506
346	t	Very easy to use. I love how simple it was to learn more about the books. 	2011-05-25 14:53:19	2011-05-25 14:53:19	507
347	t		2011-05-25 16:25:01	2011-05-25 16:25:01	508
348	t		2011-05-25 19:16:57	2011-05-25 19:16:57	510
349	t	This is so easy to use! Thanks!	2011-05-25 22:10:42	2011-05-25 22:10:42	511
350	t	I think it is great.	2011-05-26 08:38:33	2011-05-26 08:38:33	512
351	t	This is a great website.  The only way I think it could be improved would be to have the book descriptions underneath the titles.\r\n	2011-05-26 11:01:38	2011-05-26 11:01:38	513
352	t		2011-05-26 12:03:33	2011-05-26 12:03:33	514
353	t		2011-05-26 12:49:48	2011-05-26 12:49:48	515
354	t		2011-05-26 13:46:49	2011-05-26 13:46:49	516
355	t		2011-05-27 14:10:01	2011-05-27 14:10:01	519
356	t	It's pretty awesome. Wouldn't change a thing.	2011-05-28 10:19:18	2011-05-28 10:19:18	520
357	t		2011-05-28 18:28:09	2011-05-28 18:28:09	522
358	t		2011-05-28 20:07:20	2011-05-28 20:07:20	523
359	t	Very easy to use, appealin presentation of books	2011-05-29 15:19:04	2011-05-29 15:19:04	525
360	t	I like that I can get a quick summary, and can order multiple titles at once.	2011-05-30 08:06:57	2011-05-30 08:06:57	526
361	t	I like that it's as easy as ordering from an online merchandiser.	2011-05-30 08:11:22	2011-05-30 08:11:22	527
362	t		2011-05-31 06:35:21	2011-05-31 06:35:21	528
363	t	This is a great way to review your titles. Thanks for offering this service!	2011-05-31 06:37:56	2011-05-31 06:37:56	529
364	t		2011-05-31 06:38:15	2011-05-31 06:38:15	531
365	t		2011-05-31 06:38:41	2011-05-31 06:38:41	532
366	t		2011-05-31 06:39:03	2011-05-31 06:39:03	534
367	t	I love this idea as I'm a big mouth consumer of books...thanks for this offer.	2011-05-31 06:39:19	2011-05-31 06:39:19	535
368	t	The site was very easy to use. This is a great service and a wonderful way to read a book early before recommending it to customers.	2011-05-31 06:40:47	2011-05-31 06:40:47	533
369	t		2011-05-31 06:40:50	2011-05-31 06:40:50	538
370	t	Very clean design and easy to use	2011-05-31 06:40:54	2011-05-31 06:40:54	537
371	t		2011-05-31 06:41:06	2011-05-31 06:41:06	539
372	t		2011-05-31 06:41:31	2011-05-31 06:41:31	541
373	t	easy to use	2011-05-31 06:41:48	2011-05-31 06:41:48	543
374	t	Love the site!  Easy to use and viewer friendly	2011-05-31 06:42:03	2011-05-31 06:42:03	544
375	t		2011-05-31 06:42:44	2011-05-31 06:42:44	546
376	t		2011-05-31 06:43:41	2011-05-31 06:43:41	547
377	t	Galley Alley is wonderful! I love the choice of paper of e-galley. Great stuff!	2011-05-31 06:44:10	2011-05-31 06:44:10	548
378	t		2011-05-31 06:44:42	2011-05-31 06:44:42	550
379	t		2011-05-31 06:46:14	2011-05-31 06:46:14	551
380	t		2011-05-31 06:47:13	2011-05-31 06:47:13	553
381	t		2011-05-31 06:47:14	2011-05-31 06:47:14	552
382	t	very easy to surf on - clean and concise.	2011-05-31 06:47:23	2011-05-31 06:47:23	554
383	t		2011-05-31 06:47:28	2011-05-31 06:47:28	555
384	t		2011-05-31 06:47:39	2011-05-31 06:47:39	556
385	t	Very neat!\r\n	2011-05-31 06:47:59	2011-05-31 06:47:59	558
386	t	Lovely interface - great service!	2011-05-31 06:49:21	2011-05-31 06:49:21	559
387	t	Seemed fairly easy to use.  Have only tried with this one promotion	2011-05-31 06:49:43	2011-05-31 06:49:43	560
388	t		2011-05-31 06:50:34	2011-05-31 06:50:34	561
389	t		2011-05-31 06:51:33	2011-05-31 06:51:33	562
390	t		2011-05-31 06:52:10	2011-05-31 06:52:10	563
391	t		2011-05-31 06:52:11	2011-05-31 06:52:11	564
392	t		2011-05-31 06:53:49	2011-05-31 06:53:49	568
393	t	Great site. Useful information got me excited about these titles.	2011-05-31 06:54:23	2011-05-31 06:54:23	566
394	t	A description of the book's contents, the marketing plan, and the author would be useful.	2011-05-31 06:54:48	2011-05-31 06:54:48	567
395	t		2011-05-31 06:56:03	2011-05-31 06:56:03	569
396	t		2011-05-31 06:57:06	2011-05-31 06:57:06	570
397	t	Easy to use.	2011-05-31 06:58:51	2011-05-31 06:58:51	571
398	t	It's easy to use and very convenient. 	2011-05-31 06:59:13	2011-05-31 06:59:13	572
399	t	This is so neat. I love it. Thank you.	2011-05-31 07:01:20	2011-05-31 07:01:20	574
400	t		2011-05-31 07:01:47	2011-05-31 07:01:47	576
401	t	I like the fact that there are details of each book readily available AND that there's a limit on books each person can choose - I think that makes the potential reader more selective.	2011-05-31 07:01:52	2011-05-31 07:01:52	573
402	t		2011-05-31 07:02:56	2011-05-31 07:02:56	579
403	t		2011-05-31 07:04:00	2011-05-31 07:04:00	581
404	t		2011-05-31 07:04:03	2011-05-31 07:04:03	582
405	t	I think its great and look forward to sending in my reviews!	2011-05-31 07:04:29	2011-05-31 07:04:29	583
406	t	This is the first time I have used this website and found it helpful.  Hopefully I will receive some of the galleys as we don't receive  many galleys at our location.  I would also be interested in children's forthcoming news as I am the children's lead.	2011-05-31 07:04:37	2011-05-31 07:04:37	578
407	t	It's a terrific feature. Couldn't think of a thing to improve.	2011-05-31 07:05:44	2011-05-31 07:05:44	585
408	t		2011-05-31 07:06:02	2011-05-31 07:06:02	586
409	t	Very easy to use.  I was pleased.  \nA suggestion:\nRather than clicking for details, it would be better if you could get the detail information by mousing over the item.  Netflix does that, and it's fabulous.\n	2011-05-31 07:07:57	2011-05-31 07:07:57	587
410	t		2011-05-31 07:09:07	2011-05-31 07:09:07	590
411	t		2011-05-31 07:09:13	2011-05-31 07:09:13	591
412	t	I loved it-really easy to use and a lot of interesting books that I would definitely love to review.	2011-05-31 07:09:47	2011-05-31 07:09:47	592
413	t		2011-05-31 07:10:31	2011-05-31 07:10:31	593
414	t		2011-05-31 07:11:50	2011-05-31 07:11:50	594
415	t		2011-05-31 07:12:27	2011-05-31 07:12:27	596
416	t	Flexibility. Please note, I am a PEN member and I blog about books on the PEN site. Thanks, Philip Turner	2011-05-31 07:13:30	2011-05-31 07:13:30	584
417	t	The site is great, thank you!	2011-05-31 07:14:57	2011-05-31 07:14:57	600
418	t	Paperless is great!\n\nWould be great if you could wand over the book and have a box pop up with the "about" info automatically, as opposed to clicking on book, opening new box, THEN choosing the "more" button to get summary. \n\n	2011-05-31 07:14:57	2011-05-31 07:14:57	597
419	t		2011-05-31 07:15:02	2011-05-31 07:15:02	605
420	t	Very easy to use.  \r\nWould highly recommend to others.	2011-05-31 07:15:05	2011-05-31 07:15:05	604
421	t		2011-05-31 07:15:59	2011-05-31 07:15:59	607
422	t		2011-05-31 07:16:05	2011-05-31 07:16:05	603
423	t		2011-05-31 07:16:11	2011-05-31 07:16:11	608
424	t	I like the aesthetics and the easiness of the page to use--it's nice to be able to click on the book and find out all the necessary information, and it worked very smoothly on my computer. I just thought it was very nicely done.	2011-05-31 07:17:19	2011-05-31 07:17:19	606
425	t	Works well; easy to use. Brief descriptions (or at least titles) of prior books by the same author would be welcome.	2011-05-31 07:18:51	2011-05-31 07:18:51	609
426	t		2011-05-31 07:19:54	2011-05-31 07:19:54	611
427	t		2011-05-31 07:20:29	2011-05-31 07:20:29	612
428	t	Very easy to use and choices were clear. \n\nThank you!	2011-05-31 07:21:27	2011-05-31 07:21:27	613
429	t	The site is great!  (Of course, I wish I could have more galleys--but that would just be greedy!)\r\n\r\nThanks you so much,\r\nStarr	2011-05-31 07:24:51	2011-05-31 07:24:51	616
430	t		2011-05-31 07:24:58	2011-05-31 07:24:58	619
431	t		2011-05-31 07:25:09	2011-05-31 07:25:09	618
432	t		2011-05-31 07:25:56	2011-05-31 07:25:56	620
433	t	This was very easy to use.  I love it!	2011-05-31 07:26:22	2011-05-31 07:26:22	615
434	t	Very quick, easy, and simple to use. Might be nice to see the back side of the book if there is a description. Not all ARC's have a description on the backside.	2011-05-31 07:28:27	2011-05-31 07:28:27	621
435	t		2011-05-31 07:29:10	2011-05-31 07:29:10	622
436	t		2011-05-31 07:31:22	2011-05-31 07:31:22	624
437	t		2011-05-31 07:31:49	2011-05-31 07:31:49	625
438	t		2011-05-31 07:32:53	2011-05-31 07:32:53	626
439	t		2011-05-31 07:34:14	2011-05-31 07:34:14	628
440	t		2011-05-31 07:36:01	2011-05-31 07:36:01	629
441	t	How do we sign up to get online (digital) galleys instead of hard books? And can our reviewers (we have about four) get access to them?\n	2011-05-31 07:37:15	2011-05-31 07:37:15	630
442	t	Works great. Thank you very much and looking forward to the titles.	2011-05-31 07:37:34	2011-05-31 07:37:34	631
443	t	It was easy to use and view the content.	2011-05-31 07:37:38	2011-05-31 07:37:38	632
444	t	I think it's a neat idea. I doubt I'll be selected, because I'm a lowly book reviewer, but the idea is great.	2011-05-31 07:37:59	2011-05-31 07:37:59	633
445	t		2011-05-31 07:39:06	2011-05-31 07:39:06	635
446	t		2011-05-31 07:41:26	2011-05-31 07:41:26	637
447	t	I really am looking forward to participating in this program.  The website is informative and easy to use.  I am glad to see some fiction titles that will appeal to our students and staff.  Thank you!	2011-05-31 07:42:45	2011-05-31 07:42:45	636
448	t		2011-05-31 07:44:36	2011-05-31 07:44:36	640
449	t		2011-05-31 07:45:24	2011-05-31 07:45:24	641
450	t		2011-05-31 07:47:31	2011-05-31 07:47:31	643
451	t	I like that you use the cover art and include past works by the author.	2011-05-31 07:48:29	2011-05-31 07:48:29	644
452	t	If you can update your capabilities for Kindle use that would make my day!	2011-05-31 07:49:12	2011-05-31 07:49:12	645
453	t	Very professional presentation.  Good choices across genres.  Hope to be asked again.	2011-05-31 07:51:17	2011-05-31 07:51:17	646
454	t		2011-05-31 07:59:30	2011-05-31 07:59:30	649
455	t	it was a very easy site to use	2011-05-31 08:01:28	2011-05-31 08:01:28	650
456	t		2011-05-31 08:02:11	2011-05-31 08:02:11	652
457	t		2011-05-31 08:02:54	2011-05-31 08:02:54	653
458	t	Thanks.  This makes it very easy to get galleys to review and recommend.  Nice job.	2011-05-31 08:04:15	2011-05-31 08:04:15	654
459	t	Very easy to browse, read book recaps and use. Thank You	2011-05-31 08:04:51	2011-05-31 08:04:51	655
460	t	This is the second (or third maybe?) time I've participated in Galley Grab, and I love it. With cutbacks at my library, I am no longer able to attend ALA, and this helps me stay in tune with the latest galleys from the comfort of my desk chair (and no expenses!).\n\nThank you so much for this excellent service.	2011-05-31 08:05:52	2011-05-31 08:05:52	656
461	t	I very enjoyed this site and thought it clean, easy to navigate, and very useful.  	2011-05-31 08:07:51	2011-05-31 08:07:51	658
462	t		2011-05-31 08:08:12	2011-05-31 08:08:12	660
463	t	easy to read, easy to use! thank you	2011-05-31 08:10:33	2011-05-31 08:10:33	661
464	t	Great idea.\n\nI would also offer a link to specialized lists after the prelim selection.\n\nSo yes, keep this format, and selection to promote books across demographics, but then let us link to specialized areas, especially for books by and about Latinos, in English.  \n\nThanks for the free galleys. For that, I'm giving you free consultation, free ideas Tuesdays.\n\nThanks!!!!	2011-05-31 08:12:05	2011-05-31 08:12:05	662
465	t		2011-05-31 08:12:06	2011-05-31 08:12:06	663
466	t		2011-05-31 08:12:26	2011-05-31 08:12:26	664
467	t	very easy to use, simple and attractive, intuitive navigation	2011-05-31 08:13:36	2011-05-31 08:13:36	665
468	t		2011-05-31 08:17:20	2011-05-31 08:17:20	666
469	t	I like this site because it replicates a bookstore experience. In the delivery of information, the site's presence isn't all tech, or geek, or web page for that matter. I felt like I had come to a place. There, I was provided information, clearly, simply, and sufficiently to make an informed decision. All in an easy, comfortable, and attractive environment. Nice job! 	2011-05-31 08:17:44	2011-05-31 08:17:44	657
470	t	A great idea.  I love the fact that I can pick titles that interest me (and by extension my customers).  Very clean interface and easy to use.  	2011-05-31 08:18:19	2011-05-31 08:18:19	667
471	t	This is a super easy way to request readers copies.  Love it!  I also love the egalleys.  Thank you for sharing.	2011-05-31 08:18:35	2011-05-31 08:18:35	668
472	t		2011-05-31 08:22:53	2011-05-31 08:22:53	671
473	t	It's very easy to use, but it would be even better if there was an option to just get the egalleys at the same time, rather than waiting to be notified when they become available.	2011-05-31 08:23:51	2011-05-31 08:23:51	672
474	t		2011-05-31 08:25:56	2011-05-31 08:25:56	675
475	t		2011-05-31 08:26:04	2011-05-31 08:26:04	674
476	t	I find this to be a great way to receive new books for reviewing and for finding and enjoying new authors.	2011-05-31 08:29:14	2011-05-31 08:29:14	676
477	t		2011-05-31 08:30:11	2011-05-31 08:30:11	678
478	t	Easy to use! Possibly a longer annotation about each book? 	2011-05-31 08:30:33	2011-05-31 08:30:33	677
479	t		2011-05-31 08:37:16	2011-05-31 08:37:16	681
480	t	Easy to use for print galleys.  Harder for egalleys-- I would not be happy reading a book on the computer at my desk.  Would be happy to take egalleys when they work on Kindle. 	2011-05-31 08:39:14	2011-05-31 08:39:14	682
481	t		2011-05-31 08:39:44	2011-05-31 08:39:44	683
482	t	Can't think of anything -- it worked like a charm.	2011-05-31 08:44:23	2011-05-31 08:44:23	684
483	t	Thanks, this is very helpful	2011-05-31 08:44:57	2011-05-31 08:44:57	685
484	t		2011-05-31 08:46:22	2011-05-31 08:46:22	688
485	t		2011-05-31 08:46:25	2011-05-31 08:46:25	687
486	t	Interesting idea. Liked the bookstore-like feel of being able to browse, and notice of upcoming titles. Thank you!	2011-05-31 08:47:11	2011-05-31 08:47:11	686
487	t		2011-05-31 08:49:44	2011-05-31 08:49:44	689
488	t	I did it last year and I think it's great.	2011-05-31 08:51:34	2011-05-31 08:51:34	690
489	t	Great format and easy to use.	2011-05-31 08:55:09	2011-05-31 08:55:09	692
490	t	Great format and easy to use.	2011-05-31 08:55:15	2011-05-31 08:55:15	692
491	t		2011-05-31 08:55:21	2011-05-31 08:55:21	694
492	t		2011-05-31 08:55:21	2011-05-31 08:55:21	693
493	t		2011-05-31 08:57:37	2011-05-31 08:57:37	696
494	t		2011-05-31 08:58:17	2011-05-31 08:58:17	695
495	t	Easy to use. Thank you!	2011-05-31 08:59:15	2011-05-31 08:59:15	697
496	t	This is very user-friendly!	2011-05-31 09:03:22	2011-05-31 09:03:22	698
497	t		2011-05-31 09:03:44	2011-05-31 09:03:44	699
498	t	This looks very good - I like that not *too much at once* is offered. Also I will likely use the egalley in the future. \n\nThe one thing I would change is that for those of us who are both booksellers *and* reviewers, it's hard to settle on a category for the "what are you" portion. 	2011-05-31 09:04:48	2011-05-31 09:04:48	700
499	t	Very good.  THANKS!	2011-05-31 09:10:16	2011-05-31 09:10:16	701
500	t		2011-05-31 09:12:46	2011-05-31 09:12:46	703
501	t		2011-05-31 09:13:52	2011-05-31 09:13:52	704
502	t		2011-05-31 09:16:58	2011-05-31 09:16:58	705
503	t		2011-05-31 09:18:11	2011-05-31 09:18:11	706
504	t	This is a fabulous way to get specific galleys to the people who want to read them.\nThank you!!	2011-05-31 09:27:10	2011-05-31 09:27:10	708
505	t	I love this...!  Very easy to use;   I wasn't able to get to BEA this year and this helps so much.  Thank you!	2011-05-31 09:31:19	2011-05-31 09:31:19	709
506	t		2011-05-31 09:41:46	2011-05-31 09:41:46	711
507	t	User interface very easy to navigate. Liked that there was information on the books, and the cover images.	2011-05-31 09:46:30	2011-05-31 09:46:30	712
508	t	Very easy to navigate.	2011-05-31 09:47:32	2011-05-31 09:47:32	714
509	t		2011-05-31 09:48:01	2011-05-31 09:48:01	715
510	t		2011-05-31 09:48:54	2011-05-31 09:48:54	716
511	t		2011-05-31 09:52:12	2011-05-31 09:52:12	718
512	t		2011-05-31 09:53:32	2011-05-31 09:53:32	719
513	t		2011-05-31 09:54:39	2011-05-31 09:54:39	720
514	t		2011-05-31 09:55:40	2011-05-31 09:55:40	721
515	t	Great setup --- easy to use, and intuitive. I like it.	2011-05-31 09:55:55	2011-05-31 09:55:55	722
516	t	Great site; great idea!	2011-05-31 09:56:47	2011-05-31 09:56:47	723
517	f	I can't open books I download from the Galley Grab. I have reinstalled the software and don't have any problem with books downloaded from other sources.	2011-05-31 10:06:13	2011-05-31 10:06:13	725
519	t	I wouldn't change a thing.   Beautiful site.	2011-05-31 10:16:18	2011-05-31 10:16:18	727
520	t		2011-05-31 10:22:38	2011-05-31 10:22:38	729
521	t		2011-05-31 10:23:44	2011-05-31 10:23:44	730
522	t	I like what you've done with this website. It is easy to navigate and gives full information for site visitors.\r\n\r\nDr. Linda F. Beed	2011-05-31 10:24:47	2011-05-31 10:24:47	731
523	t		2011-05-31 10:28:46	2011-05-31 10:28:46	732
524	t		2011-05-31 10:32:27	2011-05-31 10:32:27	733
525	t	I thought the site was great! Thank you.	2011-05-31 10:33:22	2011-05-31 10:33:22	734
526	t	Well done site.  Thank you.	2011-05-31 10:35:30	2011-05-31 10:35:30	736
527	t	Easy and fast to use.  I loved the ability to select which galleys I was interested in.	2011-05-31 10:36:19	2011-05-31 10:36:19	737
528	t		2011-05-31 10:40:42	2011-05-31 10:40:42	738
529	t		2011-05-31 10:46:33	2011-05-31 10:46:33	739
530	t		2011-05-31 10:52:27	2011-05-31 10:52:27	740
531	t		2011-05-31 11:00:06	2011-05-31 11:00:06	741
532	t	I liked this but hope I can go back and choose some books as egalley instead.	2011-05-31 11:04:57	2011-05-31 11:04:57	743
533	t		2011-05-31 11:08:36	2011-05-31 11:08:36	744
534	t		2011-05-31 11:14:56	2011-05-31 11:14:56	745
535	t	Very easy to use.  I like it.	2011-05-31 11:23:34	2011-05-31 11:23:34	747
536	t		2011-05-31 11:44:29	2011-05-31 11:44:29	748
537	t	I think its great idea thank you 	2011-05-31 11:53:09	2011-05-31 11:53:09	750
538	t	Excellent; very easy... no complaints.	2011-05-31 11:56:08	2011-05-31 11:56:08	751
539	t	Nice to preview new releases.	2011-05-31 11:59:11	2011-05-31 11:59:11	753
540	t	This is so great! I love the options of both e-galleys and print versions.	2011-05-31 12:02:25	2011-05-31 12:02:25	755
541	t	this is the first time I have encountered your site but I think it is great for booksellers.	2011-05-31 12:02:43	2011-05-31 12:02:43	754
542	t		2011-05-31 12:12:49	2011-05-31 12:12:49	757
543	t		2011-05-31 12:12:56	2011-05-31 12:12:56	758
544	t		2011-05-31 12:13:26	2011-05-31 12:13:26	759
545	t	I really like the ability to ask for printed copies. I so much prefer reading an actual book to an ebook.	2011-05-31 12:24:40	2011-05-31 12:24:40	760
546	t	I appreciate having the opportunity to sort thru the galleys here rather than in the bookstore.  I feel so badly about the galleys that don't get read....it seems so wasteful.  I also like the opportunity to download the books on ereaders.....no labor or cost involved there.  \n   Thank you for being on the cusp of a better business model!\nNancy SimpsonBrice\nBook Vault\nOskaloosa, Iowa	2011-05-31 12:28:32	2011-05-31 12:28:32	761
547	t	Great idea!  Thank you for the galleys.	2011-05-31 12:29:47	2011-05-31 12:29:47	762
548	t		2011-05-31 12:32:07	2011-05-31 12:32:07	763
549	t		2011-05-31 12:39:38	2011-05-31 12:39:38	764
550	t	I think the site was very easy to use, and there are what look to be some great titles available. The setup of the site provided all the information I needed. I liked the option of the unlimited eGalleys. This allows me to select titles that I may be slightly interested in but may not have time to read right now. Knowing the expiration date of the eGalley allows me to choose books that I can fit in my review calendar later and plan accordingly. Thanks for this opportunity, and I look forward to participating again! 	2011-05-31 12:42:51	2011-05-31 12:42:51	765
551	t	Super. Hope it saves you $$$ and fewer galley/ARC's are being delivered to uninterested parties. I know the booksellers on my staff are overwhelmed with unsolicited ARC's and just tune out when the pile gets too high. This method makes us pay attention. Thanks, Susan Novotny, Book House of Stuyvesant Plaza, Albany, NY	2011-05-31 12:58:41	2011-05-31 12:58:41	752
552	t	I can think of nothing so far.	2011-05-31 13:00:05	2011-05-31 13:00:05	766
553	t	Like. Very easy to navigate and contains all of the important info without having to leave the site.	2011-05-31 13:03:39	2011-05-31 13:03:39	767
554	t	So fun!  Because I work part time, I have requested the ARC's be sent to my home address.  Great summer reading.  Thanks!	2011-05-31 13:15:19	2011-05-31 13:15:19	769
555	t	Like: simple, visually appealing, clear in its purpose and directions.\nDislike: Can't think of anything! :)	2011-05-31 13:17:18	2011-05-31 13:17:18	770
556	t		2011-05-31 13:30:25	2011-05-31 13:30:25	771
557	t		2011-05-31 13:35:00	2011-05-31 13:35:00	772
558	t	I think it's awesome as is--the technological advancement is ahead of its time.	2011-05-31 13:40:49	2011-05-31 13:40:49	774
559	t		2011-05-31 13:41:57	2011-05-31 13:41:57	775
560	t		2011-05-31 13:42:09	2011-05-31 13:42:09	776
561	t		2011-05-31 13:53:07	2011-05-31 13:53:07	777
562	t	Despite the information about how to download the eGalleys, I could not get them to download. Love the interface!	2011-05-31 13:54:11	2011-05-31 13:54:11	780
563	t		2011-05-31 14:04:38	2011-05-31 14:04:38	781
564	t	I really like this site.  It was easy to use and there was a lot of information about the titles.	2011-05-31 14:32:34	2011-05-31 14:32:34	783
565	t	The web site is very easy to use and understand the ordering process.  Thank you for you generous offer.  The books will be well used at the library.	2011-05-31 14:32:46	2011-05-31 14:32:46	784
566	t	I just recently bought a kindle and did not order ebooks because I was not sure that they would be compatable with the Kindle.  I have had some issues being able to download galleys to my kindle before this so I thought I better be safe.  What are your policies regarding your ebook availability for the Kindle?	2011-05-31 14:34:15	2011-05-31 14:34:15	782
567	t		2011-05-31 14:50:22	2011-05-31 14:50:22	785
568	t	great idea! very helpful. 	2011-05-31 15:07:51	2011-05-31 15:07:51	787
569	t		2011-05-31 15:23:16	2011-05-31 15:23:16	788
570	t		2011-05-31 15:38:00	2011-05-31 15:38:00	790
571	t		2011-05-31 15:44:11	2011-05-31 15:44:11	791
572	t	I'm new to this site and my first impression is a positive one. I'd like to see some reviews appear on the site. (Or did I miss that?)\r\n\r\nThank you for the ARC's.	2011-05-31 15:47:20	2011-05-31 15:47:20	792
573	t	I love it	2011-05-31 15:53:05	2011-05-31 15:53:05	794
574	t		2011-05-31 16:01:30	2011-05-31 16:01:30	795
575	t	Great idea!	2011-05-31 16:04:16	2011-05-31 16:04:16	796
576	t		2011-05-31 16:10:11	2011-05-31 16:10:11	797
577	t		2011-05-31 16:18:56	2011-05-31 16:18:56	800
578	t	This is awesome!  I can't think of anything to improve it, short being able to order every book. :)  I always enjoy galleys that I get from Atria, it's a great imprint.  Thanks!!!	2011-05-31 16:31:07	2011-05-31 16:31:07	802
579	t		2011-05-31 16:47:03	2011-05-31 16:47:03	801
580	t		2011-05-31 17:09:12	2011-05-31 17:09:12	803
581	t		2011-05-31 17:17:00	2011-05-31 17:17:00	805
582	t	I love the way this website works. Intuitive and very clean.	2011-05-31 17:38:35	2011-05-31 17:38:35	806
583	t		2011-05-31 17:44:01	2011-05-31 17:44:01	807
584	t		2011-05-31 18:18:02	2011-05-31 18:18:02	808
585	t		2011-05-31 18:18:40	2011-05-31 18:18:40	809
586	t		2011-05-31 18:26:32	2011-05-31 18:26:32	810
587	t	I like that it is very easy to navigate. 	2011-05-31 18:39:33	2011-05-31 18:39:33	811
588	t	Great idea.  Looks great, easy to use, a terrific way to publicize upcoming titles.	2011-05-31 19:09:31	2011-05-31 19:09:31	812
589	t		2011-05-31 19:42:42	2011-05-31 19:42:42	814
590	t	Great idea- easy to navigate.Many thanks,\nDiane Tetreault	2011-05-31 20:21:30	2011-05-31 20:21:30	815
591	t		2011-05-31 20:44:33	2011-05-31 20:44:33	817
592	t		2011-05-31 20:52:37	2011-05-31 20:52:37	818
593	t	The site was an amazing way to see new titles and be offered the chance to review them and spread word about it. I just found out about it, but I like it already! 	2011-05-31 21:06:15	2011-05-31 21:06:15	819
594	t	I like the presentation, the summary, and the ease of submitting selections.	2011-05-31 22:26:59	2011-05-31 22:26:59	820
595	t	It was great!	2011-05-31 22:30:50	2011-05-31 22:30:50	821
596	t	It was great!	2011-05-31 22:30:50	2011-05-31 22:30:50	821
597	t		2011-05-31 23:06:00	2011-05-31 23:06:00	822
598	t	Informative and easy to use. thanks!	2011-05-31 23:26:07	2011-05-31 23:26:07	823
599	t		2011-05-31 23:59:57	2011-05-31 23:59:57	824
600	t		2011-06-01 01:34:40	2011-06-01 01:34:40	825
601	t	I love the set up, it was very easy to use.	2011-06-01 04:18:06	2011-06-01 04:18:06	826
602	t	I like the descriptions/summaries of each book and the ease with which we can "order" a book. 	2011-06-01 04:34:54	2011-06-01 04:34:54	827
603	t		2011-06-01 04:36:05	2011-06-01 04:36:05	828
604	t		2011-06-01 04:45:14	2011-06-01 04:45:14	829
605	t	Great site; I would definitely use it again.	2011-06-01 04:47:43	2011-06-01 04:47:43	831
606	t		2011-06-01 04:51:14	2011-06-01 04:51:14	833
607	t		2011-06-01 04:53:45	2011-06-01 04:53:45	834
608	t		2011-06-01 04:54:15	2011-06-01 04:54:15	836
609	t		2011-06-01 04:54:37	2011-06-01 04:54:37	835
610	t		2011-06-01 04:57:19	2011-06-01 04:57:19	837
611	t		2011-06-01 05:00:39	2011-06-01 05:00:39	839
612	t	Liked the accessibility. Would have liked fuller descriptions of the books.	2011-06-01 05:03:37	2011-06-01 05:03:37	841
613	t	I think this is a wonderful idea!  Thank you. :)  It was incredibly easy to use and also to see what the books are about.	2011-06-01 05:04:55	2011-06-01 05:04:55	842
614	t		2011-06-01 05:13:38	2011-06-01 05:13:38	846
615	t		2011-06-01 05:14:11	2011-06-01 05:14:11	847
616	t	I goofed on previous page, saw the button late: I'm a reviewer, not bookseller. \nAlso found it difficult to download ebook galley on my iPad. Not sure why, as I've been able to download ebooks from elsewhere.  Someday I'll figure this.  	2011-06-01 05:15:56	2011-06-01 05:15:56	845
617	t	I love this idea...it is perfection...I wish you offered it more!!! I read most of my books on my Kindle...I am not sure if egalleys work with a Kindle!!!	2011-06-01 05:19:20	2011-06-01 05:19:20	849
618	t		2011-06-01 05:20:59	2011-06-01 05:20:59	850
619	t	I think this is great! I can peruse the virtual shelf and pick the ones I'm most interested in. :)	2011-06-01 05:22:01	2011-06-01 05:22:01	851
620	t		2011-06-01 05:22:56	2011-06-01 05:22:56	852
621	t	love the ease of Galley Grab	2011-06-01 05:26:21	2011-06-01 05:26:21	854
622	t		2011-06-01 05:29:47	2011-06-01 05:29:47	857
623	t		2011-06-01 05:40:21	2011-06-01 05:40:21	861
624	t		2011-06-01 05:43:50	2011-06-01 05:43:50	864
625	t	I am already a member of Galley Grab, I wish I could access these egalleys without having to request membership again. Plus, my laptop does not use outlook express, so I have to resend all info with my hotmail account. Can the egalley link just go straight to the galley grab site?	2011-06-01 05:49:09	2011-06-01 05:49:09	867
626	t	 This is the BEST idea ever!  Let's do it again !!!	2011-06-01 05:52:44	2011-06-01 05:52:44	868
627	t		2011-06-01 05:57:20	2011-06-01 05:57:20	869
628	t	It's a great site! Thank you!	2011-06-01 05:59:24	2011-06-01 05:59:24	870
629	t	It was very simple and easy to use. Adding books and seeing what you added was very easy. Good work!	2011-06-01 06:04:20	2011-06-01 06:04:20	873
630	t	Great quick look at some upcoming titles. I loved the choice of hardcopies and e-arcs as well. Very simple & easy to use, thanks S&S!	2011-06-01 06:04:27	2011-06-01 06:04:27	871
631	t	This is great- thanks so much	2011-06-01 06:05:41	2011-06-01 06:05:41	874
632	t		2011-06-01 06:08:48	2011-06-01 06:08:48	875
633	t		2011-06-01 06:09:06	2011-06-01 06:09:06	876
634	t		2011-06-01 06:09:24	2011-06-01 06:09:24	877
635	t		2011-06-01 06:12:49	2011-06-01 06:12:49	878
636	t		2011-06-01 06:13:13	2011-06-01 06:13:13	879
637	t	So easy to use!!	2011-06-01 06:15:18	2011-06-01 06:15:18	880
638	t		2011-06-01 06:16:54	2011-06-01 06:16:54	881
639	t		2011-06-01 06:20:33	2011-06-01 06:20:33	883
640	t	Ease of use is good. Maybe bit more content info on the titles.	2011-06-01 06:21:47	2011-06-01 06:21:47	884
641	t		2011-06-01 06:25:03	2011-06-01 06:25:03	886
642	t		2011-06-01 06:28:50	2011-06-01 06:28:50	890
643	t		2011-06-01 06:29:28	2011-06-01 06:29:28	891
644	t		2011-06-01 06:31:51	2011-06-01 06:31:51	892
645	t		2011-06-01 06:33:39	2011-06-01 06:33:39	893
646	t	It was very simple to use. I love the idea, and had no trouble ordering. I honestly cannot think of any improvements. :)	2011-06-01 06:38:04	2011-06-01 06:38:04	897
647	t		2011-06-01 06:39:01	2011-06-01 06:39:01	898
648	t		2011-06-01 06:43:31	2011-06-01 06:43:31	900
649	t	More of a variety of genres	2011-06-01 06:44:08	2011-06-01 06:44:08	901
650	t	The request form to be notified of when e-link available is in Microsoft Outlook, which I do not use, If you would just supply an e-mail name/link to make request that would be helpful.\n\nI already have The Map of Time and reading now. Will be asking for e-galleys of other books, such as The Infernals, when become available.\n\nThanks, Nancy Pate\npatebooks@yahoo.com\n	2011-06-01 06:48:06	2011-06-01 06:48:06	899
651	t		2011-06-01 06:48:51	2011-06-01 06:48:51	904
652	t	Easy to use.	2011-06-01 06:52:26	2011-06-01 06:52:26	905
653	t		2011-06-01 06:53:30	2011-06-01 06:53:30	906
654	t		2011-06-01 06:55:02	2011-06-01 06:55:02	907
655	t		2011-06-01 06:57:27	2011-06-01 06:57:27	908
656	t		2011-06-01 07:01:30	2011-06-01 07:01:30	909
657	t	I love how easy it was to pick exactly which ones I wanted to review. A simple click and I was done!	2011-06-01 07:03:47	2011-06-01 07:03:47	913
658	t	I love the Galley Grab and think it's a great way for Atria Books to reach out to librarians, reviewers and media!!	2011-06-01 07:03:56	2011-06-01 07:03:56	911
659	t	I love seeing the covers like that, as though they're on a table you're browsing.  So easy and aesthetically pleasing.  Thank you.	2011-06-01 07:07:40	2011-06-01 07:07:40	915
660	t		2011-06-01 07:09:48	2011-06-01 07:09:48	918
661	t		2011-06-01 07:15:52	2011-06-01 07:15:52	920
662	t	Make the egalleys available immediately	2011-06-01 07:21:05	2011-06-01 07:21:05	921
663	t		2011-06-01 07:29:01	2011-06-01 07:29:01	925
664	t	I love that there is enough of a description to see that it is a book that one would enjoy reading and reviewing.	2011-06-01 07:29:04	2011-06-01 07:29:04	924
665	t		2011-06-01 07:45:15	2011-06-01 07:45:15	929
666	t		2011-06-01 07:46:18	2011-06-01 07:46:18	930
667	t		2011-06-01 07:47:04	2011-06-01 07:47:04	932
668	t	This is great! I like being able to see a range of choices and selecting what I'd be most interested in reading and reviewing! Thanks!	2011-06-01 07:47:13	2011-06-01 07:47:13	931
669	t		2011-06-01 07:50:50	2011-06-01 07:50:50	934
670	t	I like to see the covers and read the summaries	2011-06-01 07:53:32	2011-06-01 07:53:32	935
671	t		2011-06-01 07:54:53	2011-06-01 07:54:53	936
672	t		2011-06-01 07:58:58	2011-06-01 07:58:58	938
673	t		2011-06-01 07:59:20	2011-06-01 07:59:20	939
674	t	very easy - fun to use	2011-06-01 08:00:46	2011-06-01 08:00:46	940
675	t	I love Galley Grab. It's fantastic.	2011-06-01 08:03:18	2011-06-01 08:03:18	941
676	t		2011-06-01 08:12:40	2011-06-01 08:12:40	943
677	t	I like the short descriptions of the books.  I like the option for egalleys.  This is a great opportunity for reviewers to get a jump on new titles!	2011-06-01 08:13:10	2011-06-01 08:13:10	942
678	t	I like the layout and it was pretty simple to navigate.  	2011-06-01 08:15:53	2011-06-01 08:15:53	944
679	t	I really like the Galley Grab program and look forward to it every year. I was super excited when I saw that this year egalleys were added into the mix. However, just from clicking on the images it didn't appear that there were any egalley links available so that was a little disappointing. I love physical galleys but have begun to prefer egalleys as they save shelf space which then allows for me to buy the finished copies of the galley's I love. I am still happy with the program and thank you for letting me review these titles. 	2011-06-01 08:17:50	2011-06-01 08:17:50	945
680	t	This is fantastic! 	2011-06-01 08:20:43	2011-06-01 08:20:43	946
681	t		2011-06-01 08:26:54	2011-06-01 08:26:54	947
682	t	Like being able to choose between ebook amnd print. I usually opt for print.	2011-06-01 08:27:52	2011-06-01 08:27:52	948
683	t	What a great and easy way to see what's coming up!	2011-06-01 08:32:42	2011-06-02 14:49:43	949
684	t	I love that you do this ... especially for those of us who missed the BEA in NY this year! Thank you! The site is great - very easy to navigate.	2011-06-01 08:34:58	2011-06-01 08:34:58	950
685	t		2011-06-01 08:39:44	2011-06-01 08:39:44	951
686	t	Very organized and easy to use. 	2011-06-01 08:45:40	2011-06-01 08:45:40	952
687	t		2011-06-01 08:48:03	2011-06-01 08:48:03	953
688	t		2011-06-01 08:49:57	2011-06-01 08:49:57	954
689	t		2011-06-01 08:52:41	2011-06-01 08:52:41	955
690	t		2011-06-01 09:09:29	2011-06-01 09:09:29	957
691	t	Very usable interface.	2011-06-01 09:16:48	2011-06-01 09:16:48	958
692	t	I appreciate your generosity in sending out the ARC's.	2011-06-01 09:30:23	2011-06-01 09:30:23	961
693	t	Great idea! I found two titles that I have never heard of, but now I have to read. Great promotion idea.	2011-06-01 09:34:40	2011-06-01 09:34:40	962
694	t	I like that you are offering ARCs; thank you!	2011-06-01 09:38:40	2011-06-01 09:38:40	964
695	t	I like the site very much.  It is informative and easy to use and gives me information on books I might not hear about otherwise.  I specialize in anything British and off-beat mysteries. I then, twice a year, share these titles at library gatherings and reviews in the local media.	2011-06-01 09:43:57	2011-06-01 09:43:57	965
696	t	I think this website is great...very simple and easy to use!!!	2011-06-01 09:49:24	2011-06-01 09:49:24	966
697	t		2011-06-01 09:53:43	2011-06-01 09:53:43	968
698	t	I would have liked more information about the books.  	2011-06-01 09:58:53	2011-06-01 09:58:53	970
699	t		2011-06-01 10:00:23	2011-06-01 10:00:23	971
700	t	This is the first time I've seen Galley Grab, and I love it.  I especially like how easy it is to read a description of each book before requesting it.  Thank you.\r\n\r\nThere wasn't room for this in comments, but my LT and GR profiles are \r\n\r\nhttp://www.goodreads.com/nutz4books and\r\nhttp://www.librarything.com/profile/TooBusyReading\r\n\r\nRegards,\r\nSusan Jones	2011-06-01 10:00:35	2011-06-01 10:00:35	969
701	t	I really like the ease of the site, but a FAQ just in case people are confused would be a great addition. 	2011-06-01 10:07:53	2011-06-01 10:07:53	973
702	t		2011-06-01 10:10:08	2011-06-01 10:10:08	975
703	t		2011-06-01 10:10:09	2011-06-01 10:10:09	974
704	t	I like these galley grabs b/c it gives you a chance to look at several new titles at once.	2011-06-01 10:23:43	2011-06-01 10:23:43	976
705	t		2011-06-01 10:32:37	2011-06-01 10:32:37	978
706	t		2011-06-01 10:36:32	2011-06-01 10:36:32	979
707	t		2011-06-01 10:37:17	2011-06-01 10:37:17	980
708	t	More titles and allow individuals to select more than three titles.	2011-06-01 10:44:53	2011-06-01 10:44:53	982
709	t		2011-06-01 10:48:06	2011-06-01 10:48:06	983
710	t		2011-06-01 10:53:15	2011-06-01 10:53:15	985
711	t	I thought it was fantastic. The entire process very easy and streamlined. 	2011-06-01 10:57:12	2011-06-01 10:57:12	987
712	t		2011-06-01 10:57:53	2011-06-01 10:57:53	988
713	t		2011-06-01 10:58:52	2011-06-01 10:58:52	989
714	t		2011-06-01 11:19:16	2011-06-01 11:19:16	991
715	t	Excellent idea, but I didn't see a way to register as a first-time user when I clicked to download the galleys. Thus, I requested hard copies instead.	2011-06-01 11:30:22	2011-06-01 11:30:22	992
716	t		2011-06-01 11:40:50	2011-06-01 11:40:50	994
717	t		2011-06-01 11:45:05	2011-06-01 11:45:05	995
718	t	\r\n  This site was very easy to use.  The info was readily \r\n  available by clicking on the book cover.	2011-06-01 11:57:56	2011-06-01 11:57:56	997
719	t	I love this!!!!  The only problem is I can't order more, although I love the option of ordering egalleys too.	2011-06-01 12:00:03	2011-06-01 12:00:03	998
720	t		2011-06-01 12:06:50	2011-06-01 12:06:50	999
721	t	I used your Galley Grab last year and think that it is a fantastic service!  Thanks	2011-06-01 12:11:08	2011-06-01 12:11:08	1000
722	t	I love Galley Grab! It's an excellent program! Thank you so much! 	2011-06-01 12:13:44	2011-06-01 12:13:44	1001
723	t	I thought the site was very easy to use and can't think of any ideas for improvements.	2011-06-01 12:20:36	2011-06-01 12:20:36	1002
724	t	What a great idea!  Very eye-catching.  	2011-06-01 12:29:10	2011-06-01 12:29:10	1003
725	t	This is great! I think it is a fantastic chance to allow reviewers easy access to some awesome looking titles. Thanks so much!	2011-06-01 12:32:49	2011-06-01 12:32:49	1004
726	t	I like how the books are displayed and information about the book is easy to come by.  Thank you.\nHeather Davi	2011-06-01 12:40:09	2011-06-01 12:40:09	1007
812	t	This is awesome, nice to have a selection to choose from. also nice that you offer ebooks.	2011-06-02 08:27:41	2011-06-02 08:27:41	1139
727	t	It's a small selection, but there's a nice variety. It was easy to sign up. I would definitely use it again and I hope there will be emails to let us know when there are new titles!	2011-06-01 12:45:50	2011-06-01 12:45:50	1006
728	t		2011-06-01 12:58:34	2011-06-01 12:58:34	1012
729	t	Great site.  Easy to use.  	2011-06-01 13:03:32	2011-06-01 13:03:32	1013
730	t	love this format and keeping fingers crossed for above ARC :)\n\nMany thanks for making this possible for reviewers everywhere.	2011-06-01 13:25:02	2011-06-01 13:25:02	1016
731	t		2011-06-01 13:36:07	2011-06-01 13:36:07	1019
732	t	Very user friendly...awesome!	2011-06-01 13:48:15	2011-06-01 13:48:15	1020
733	t		2011-06-01 13:53:48	2011-06-01 13:53:48	1021
734	t		2011-06-01 14:02:13	2011-06-01 14:02:13	1022
735	t		2011-06-01 14:27:59	2011-06-01 14:27:59	1024
736	t		2011-06-01 14:28:26	2011-06-01 14:28:26	1023
737	t		2011-06-01 14:48:01	2011-06-01 14:48:01	1025
738	t	The information displayed about each book was very useful.  Thank you very much.	2011-06-01 14:57:55	2011-06-01 14:57:55	1026
739	t		2011-06-01 15:04:07	2011-06-01 15:04:07	1027
740	t		2011-06-01 15:13:57	2011-06-01 15:13:57	1028
741	t		2011-06-01 15:26:21	2011-06-01 15:26:21	1029
742	t	I'd love more genre options, like Urban Fantasy and Dystopian.  The layout, however, is fantastic and easy to use.  	2011-06-01 16:24:50	2011-06-01 16:24:50	1034
743	t	This is a great site!  It was easy to use and understand.  I loved being able to find out more about each title.  It is well done!  I would love to use it again in the future.	2011-06-01 16:50:42	2011-06-01 16:50:42	1036
744	t		2011-06-01 17:07:23	2011-06-01 17:07:23	1037
745	t		2011-06-01 17:17:35	2011-06-01 17:17:35	1038
746	t		2011-06-01 17:40:20	2011-06-01 17:40:20	1039
747	t		2011-06-01 17:49:58	2011-06-01 17:49:58	1041
748	t		2011-06-01 17:53:56	2011-06-01 17:53:56	1042
749	t		2011-06-01 18:56:10	2011-06-01 18:56:10	1043
750	t	This is great. I like the pop up information about the books.	2011-06-01 19:07:53	2011-06-01 19:07:53	1044
751	t		2011-06-01 19:30:35	2011-06-01 19:30:35	1045
752	t	This is helpful, can't always get to conferences to pick up ARC's.  The site worked great, thanks!	2011-06-01 19:36:22	2011-06-01 19:36:22	1046
753	t	Well organized and enticing.	2011-06-01 19:38:11	2011-06-01 19:38:11	1047
754	t	You get to chose from multiple titles very easily and not have to hope to see your galley listed somewhere.	2011-06-02 04:34:13	2011-06-02 04:34:13	1048
755	t		2011-06-02 04:57:52	2011-06-02 04:57:52	1051
756	t		2011-06-02 04:59:50	2011-06-02 04:59:50	1052
757	t	Very easy to use!	2011-06-02 05:01:44	2011-06-02 05:01:44	1049
758	t		2011-06-02 05:08:33	2011-06-02 05:08:33	1056
759	t		2011-06-02 05:14:29	2011-06-02 05:14:29	1059
760	t		2011-06-02 05:15:24	2011-06-02 05:15:24	1060
761	t		2011-06-02 05:16:08	2011-06-02 05:16:08	1063
762	t	This a wonderful opportunity to discover new authors. I like to read European novels and you have a good selection of new European titles\nThank you,\n\nPierre	2011-06-02 05:17:49	2011-06-02 05:17:49	1062
763	t		2011-06-02 05:29:41	2011-06-02 05:29:41	1065
764	t	Really great website!  Very easy to use.  Nicely done :)	2011-06-02 05:33:32	2011-06-02 05:33:32	1066
765	t		2011-06-02 05:36:40	2011-06-02 05:36:40	1068
766	t		2011-06-02 05:38:41	2011-06-02 05:38:41	1069
767	t		2011-06-02 05:41:35	2011-06-02 05:41:35	1070
768	t		2011-06-02 05:44:16	2011-06-02 05:44:16	1071
769	t	Thank you for providing such a wonderful opportunity/service. The site was very easy to use, and included all of the information I needed to make a decision.	2011-06-02 05:45:57	2011-06-02 05:45:57	1072
770	t	Like the design of the page to select books. Maybe provide a short description of each book as well.	2011-06-02 05:47:12	2011-06-02 05:47:12	1073
771	t	I love Galley Grab.  Perhaps show the actual book when we download it.  Sometimes I forget what book I'm downloading for my nook.	2011-06-02 05:47:59	2011-06-02 05:47:59	1074
772	t	wonderful presentation	2011-06-02 05:48:13	2011-06-02 05:48:13	1075
773	t		2011-06-02 05:55:48	2011-06-02 05:55:48	1079
774	t		2011-06-02 06:08:35	2011-06-02 06:08:35	1085
775	t	Thanks so much for this program! I don't get many chances to go to conventions (ALA, BEA, etc) and appreciate opportunities like these! I do a blog especially active during our Summer Reading for Adults program and love sharing new titles, especially from first time or lesser known authors!	2011-06-02 06:08:47	2011-06-02 06:08:47	1084
776	t		2011-06-02 06:16:07	2011-06-02 06:16:07	1088
777	t		2011-06-02 06:16:51	2011-06-02 06:16:51	1089
778	t		2011-06-02 06:19:47	2011-06-02 06:19:47	1092
779	t	Like it, although I thought I had also clicked on "Burned."  May be out.  Very useful!	2011-06-02 06:28:07	2011-06-02 06:28:07	1096
780	t		2011-06-02 06:28:38	2011-06-02 06:28:38	1098
781	t	Very nicely designed and easy to use.  I also admire the wide array of books offered.  Thanks so much!	2011-06-02 06:29:10	2011-06-02 06:29:10	1097
782	t	It's great!  no suggestions	2011-06-02 06:31:40	2011-06-02 06:31:40	1099
783	t		2011-06-02 06:31:48	2011-06-02 06:31:48	1100
784	t		2011-06-02 06:34:44	2011-06-02 06:34:44	1101
785	t	I thought this year was the best yet!\r\n\r\nThanks-\r\nCheryl	2011-06-02 06:38:58	2011-06-02 06:38:58	1103
786	t		2011-06-02 06:39:40	2011-06-02 06:39:40	1104
787	t		2011-06-02 06:40:03	2011-06-02 06:40:03	1102
788	t		2011-06-02 06:41:28	2011-06-02 06:41:28	1105
789	t	So far, so good.  It is my first time using this site.	2011-06-02 06:47:06	2011-06-02 06:47:06	1110
790	t		2011-06-02 06:50:48	2011-06-02 06:50:48	1114
791	t		2011-06-02 06:51:03	2011-06-02 06:51:03	1115
792	t	\nI love the opportunity to select more than one book.  I am very excited to receive my selections.	2011-06-02 06:52:18	2011-06-02 06:52:18	1113
793	t		2011-06-02 06:57:18	2011-06-02 06:57:18	1116
794	t	It's great! Thank you	2011-06-02 06:59:26	2011-06-02 06:59:26	1117
795	t		2011-06-02 07:00:05	2011-06-02 07:00:05	1118
796	t		2011-06-02 07:24:34	2011-06-02 07:24:34	1119
797	t	very easy to use, thanks! wish you had kindle versions though	2011-06-02 07:25:36	2011-06-02 07:25:36	1120
798	t	Awesome site.  Easy to use and I love being able to see other titles at the same time.  	2011-06-02 07:33:20	2011-06-02 07:33:20	1121
799	t		2011-06-02 07:35:39	2011-06-02 07:35:39	1122
800	t	I love this!  i forget about doing it, so I am glad to be reminded in ShelfAwareness.	2011-06-02 07:37:38	2011-06-02 07:37:38	1123
801	t		2011-06-02 07:43:59	2011-06-02 07:43:59	1124
802	t	Very Clean! Thanks	2011-06-02 07:44:37	2011-06-02 07:44:37	1125
803	t		2011-06-02 07:49:01	2011-06-02 07:49:01	1127
804	t		2011-06-02 07:54:57	2011-06-02 07:54:57	1129
805	t		2011-06-02 07:57:48	2011-06-02 07:57:48	1130
806	t		2011-06-02 07:57:51	2011-06-02 07:57:51	1131
807	t		2011-06-02 08:01:46	2011-06-02 08:01:46	1132
808	t	This is an incredible opportunity. With limited budgets, being able to preview/review books, it makes purchasing better.  Thank you.	2011-06-02 08:05:30	2011-06-02 08:05:30	1133
809	t		2011-06-02 08:14:27	2011-06-02 08:14:27	1134
810	t	I was very impressed with the site.  The only info I couldn't find was the # of pages for each book/galley!	2011-06-02 08:19:13	2011-06-02 08:19:13	1137
811	t		2011-06-02 08:23:00	2011-06-02 08:23:00	1138
813	t	I love it! I have no complaints. :) Very easy to use and it has an attractive page layout.	2011-06-02 08:42:47	2011-06-02 08:42:47	1141
814	t		2011-06-02 08:46:00	2011-06-02 08:46:00	1144
815	t		2011-06-02 08:46:02	2011-06-02 08:46:02	1143
816	t	Simple and easy.	2011-06-02 08:46:08	2011-06-02 08:46:08	1145
817	t	Like the ease of clicking a title to get info.	2011-06-02 08:46:58	2011-06-02 08:46:58	1146
818	t		2011-06-02 08:59:49	2011-06-02 08:59:49	1149
819	t		2011-06-02 09:00:43	2011-06-02 09:00:43	1150
820	t	More iPad or mobile device friendly . 	2011-06-02 09:01:26	2011-06-02 09:01:26	1152
821	t		2011-06-02 09:11:41	2011-06-02 09:11:41	1157
822	t		2011-06-02 09:11:42	2011-06-02 09:11:42	1157
823	t	Really like to know about what is coming up.  As I am also a bookseller too, it is very useful!	2011-06-02 09:11:56	2011-06-02 09:11:56	1156
824	t		2011-06-02 09:14:21	2011-06-02 09:14:21	1155
825	t		2011-06-02 09:15:52	2011-06-02 09:15:52	1158
826	t		2011-06-02 09:15:52	2011-06-02 09:15:52	1158
827	t		2011-06-02 09:31:18	2011-06-02 09:31:18	1160
828	t	I liked the simplicity of the Galley Grab, but I wish I had more information about each book so that I could make a more educated guess about which book I would like to read and review. Thank you!	2011-06-02 09:33:52	2011-06-02 09:33:52	1162
829	t	Love how it's set up!  Very easy to use!	2011-06-02 09:39:08	2011-06-02 09:39:08	1164
830	t		2011-06-02 09:40:45	2011-06-02 09:40:45	1167
831	t		2011-06-02 09:41:46	2011-06-02 09:41:46	1166
832	t	I think it's perfect!	2011-06-02 09:47:43	2011-06-02 09:47:43	1168
833	t		2011-06-02 10:01:53	2011-06-02 10:01:53	1170
834	t	Enjoy the opportunity to review books before we buy them for our collection. Thank you!	2011-06-02 10:04:16	2011-06-02 10:04:16	1171
835	t	Honestly, there isn't anything that I hate about it. Maybe create a way to tailor the books available by genre or popularity? That's the only thing that I can think of though. Thank you so much for making this available to booksellers, librarians, and us reviewers! 	2011-06-02 10:22:13	2011-06-02 10:22:13	1173
836	t		2011-06-02 10:23:12	2011-06-02 10:23:12	1174
837	t	This is an awesome way to see some upcoming titles and be able to get copies for review. Thanks!	2011-06-02 10:30:04	2011-06-02 10:30:04	1177
838	t		2011-06-02 10:37:07	2011-06-02 10:37:07	1178
839	t	Great site! I honestly can't think of anything to improve it. 	2011-06-02 10:37:52	2011-06-02 10:37:52	1179
840	t		2011-06-02 10:38:14	2011-06-02 10:38:14	1180
841	t		2011-06-02 10:38:40	2011-06-02 10:38:40	1181
842	t	Very nice site with just enough information to let me know if the ARC is one I should request.	2011-06-02 10:41:11	2011-06-02 10:41:11	1182
843	t		2011-06-02 10:44:12	2011-06-02 10:44:12	1183
844	t		2011-06-02 10:44:41	2011-06-02 10:44:41	1184
845	t		2011-06-02 10:55:00	2011-06-02 10:55:00	1187
846	t	Thanks	2011-06-02 11:00:19	2011-06-02 11:00:19	1188
847	t	I would like to be able to download these in ebook format on my color nook and was not able to do it.  Any tips would be helpful.	2011-06-02 11:01:30	2011-06-02 11:01:30	1189
848	t	The site is great--I like the way it is set up with all the books on display and then clicking on them to get details. It's all very clear and easy. 	2011-06-02 11:04:56	2011-06-02 11:04:56	1190
849	t	I would like to see an annotation under the book titles.	2011-06-02 11:24:23	2011-06-02 11:24:23	1193
850	t	Nothing - its great. Thank you.  I love that you'll send advance copies to librarians too!	2011-06-02 11:24:54	2011-06-02 11:24:54	1195
851	t	Great idea. Easy to use. 	2011-06-02 11:26:59	2011-06-02 11:26:59	1196
852	t	Very easy, thanks so much!	2011-06-02 11:40:03	2011-06-02 11:40:03	1198
853	t		2011-06-02 11:47:37	2011-06-02 11:47:37	1199
854	t		2011-06-02 11:48:41	2011-06-02 11:48:41	1200
855	t		2011-06-02 12:14:24	2011-06-02 12:14:24	1203
856	t	This is a wonderful offer.  Thank you.  The site is easy to use. I like everything about it.  	2011-06-02 12:14:53	2011-06-02 12:14:53	1202
857	t	I think this is an awesome site. :) And I'd definitely use it again in the future. 	2011-06-02 12:32:21	2011-06-02 12:32:21	1206
858	t		2011-06-02 13:11:21	2011-06-02 13:11:21	1209
859	t	VERY EASY & SIMPLE. I REMEMBER DOING THIS LAST YEAR, BUT SADLY DIDN'T RECEIVE ANY OF THE TITLES. BETTER LUCK THIS TIME!	2011-06-02 13:18:40	2011-06-02 13:18:40	1210
860	t		2011-06-02 13:18:40	2011-06-02 13:18:40	1211
861	t	Easy to navigate and order.  I especially like the visual bookshelf arrangement of titles and covers.	2011-06-02 13:33:24	2011-06-02 13:33:24	1212
862	t		2011-06-02 13:56:27	2011-06-02 13:56:27	1214
863	t		2011-06-02 14:07:46	2011-06-02 14:07:46	1215
864	t		2011-06-02 14:20:11	2011-06-02 14:20:11	1216
865	t		2011-06-02 14:20:11	2011-06-02 14:20:11	1216
866	t	I loved the ease and use of the site. I would definitely do this again, it made things so quick and stress free. Thank you for the books!	2011-06-02 14:25:56	2011-06-02 14:25:56	1217
867	t	its great	2011-06-02 14:26:45	2011-06-02 14:26:45	1218
868	t		2011-06-02 15:04:38	2011-06-02 15:04:38	1220
869	t		2011-06-02 15:33:14	2011-06-02 15:33:14	1221
870	t		2011-06-02 15:52:58	2011-06-02 15:52:58	1222
871	t	I love the site's design!  It's very intuitive and easy-to-use.  I look forward to perusing future titles.  Thank you!	2011-06-02 15:56:46	2011-06-02 15:56:46	1223
872	t	I really like the site - It's really easy to navigate and use. I don't think there's anything that needs to be improved. 	2011-06-02 16:12:41	2011-06-02 16:12:41	1225
873	t		2011-06-02 16:15:03	2011-06-02 16:15:03	1226
874	t		2011-06-02 16:26:37	2011-06-02 16:26:37	1229
875	t		2011-06-02 16:39:21	2011-06-02 16:39:21	1230
876	t		2011-06-02 17:05:02	2011-06-02 17:05:02	1232
877	t		2011-06-02 17:31:19	2011-06-02 17:31:19	1234
878	t		2011-06-02 17:31:37	2011-06-02 17:31:37	1235
879	t	Super easy to use and very appealing\n\nWorked well on my iPad	2011-06-02 17:51:25	2011-06-02 17:51:25	1236
880	t	I have previously used the Galley Grab and am always entertained.	2011-06-02 18:10:24	2011-06-04 13:51:11	1237
881	t		2011-06-02 18:10:50	2011-06-02 18:10:50	1238
882	t		2011-06-02 18:17:16	2011-06-02 18:17:16	1239
883	t	I would really like a better synopsis for each title offered. I couldn't really get a good idea of whether I wanted to read most of the titles presented because the descriptions were so brief. As a bookseller, this is incredibly important. If I can't get interested in a title, it is really hard for me to get other people interested. I only clicked on the link in the first place because I read Mr. Connolly's Book of Lost Things and enjoyed his storytelling so much.	2011-06-02 18:22:48	2011-06-02 18:22:48	1241
884	t		2011-06-02 18:28:20	2011-06-02 18:28:20	1244
885	t	I feel that the Galley grab that I took part in, was very well done. The selection of books was ample, and I feel that you get the best reviews from people that have real choice in choosing your books. Very good work. 	2011-06-02 18:46:33	2011-06-02 18:46:33	1245
886	t	The web site is great. It gives you a chance to read a bit about each book and select a few. I'm so excited about John Connolly's new book!! Can't wait to read it.	2011-06-02 18:48:05	2011-06-02 18:48:05	1246
887	t		2011-06-02 18:48:46	2011-06-02 18:48:46	1247
888	t	Thanks, very nice service- I'd like to use the egalley option, but am a little confused. Do you send an email for each title you are interested in?\n	2011-06-02 19:34:14	2011-06-02 19:34:14	1249
889	t	This is a wonderful service. Thank you for providing it.	2011-06-02 21:09:25	2011-06-02 21:09:25	1250
890	t		2011-06-02 22:50:30	2011-06-02 22:50:30	1251
891	t		2011-06-03 03:52:01	2011-06-03 03:52:01	1252
892	t		2011-06-03 04:27:31	2011-06-03 04:27:31	1253
893	t		2011-06-03 04:49:51	2011-06-03 04:49:51	1254
894	t		2011-06-03 05:13:50	2011-06-03 05:13:50	1255
895	t	This is a wonderful service that you offer to librarians and booksellers! I was very happy to see that you offer e-galleys of titles. 	2011-06-03 05:18:18	2011-06-03 05:18:18	1256
896	t	I think this is great!	2011-06-03 05:23:38	2011-06-03 05:23:38	1257
897	t		2011-06-03 05:24:01	2011-06-03 05:24:01	1258
898	t		2011-06-03 05:27:15	2011-06-03 05:27:15	1259
899	t		2011-06-03 05:46:43	2011-06-03 05:46:43	1260
900	t	The ability to download to Kindle would be a great improvement for egalleys	2011-06-03 06:03:01	2011-06-03 06:03:01	1261
901	t		2011-06-03 06:11:03	2011-06-03 06:11:03	1263
902	t	The easiness of the site!	2011-06-03 06:13:55	2011-06-03 06:13:55	1264
903	t	I am new to this site. Thank you for the opportunity to read and review the books.\r\nLeona	2011-06-03 06:17:02	2011-06-03 06:17:02	1265
904	t		2011-06-03 06:17:56	2011-06-03 06:17:56	1266
905	t	Very easy to use! I would love to see something similar for children's/YA books.	2011-06-03 06:33:01	2011-06-03 06:33:01	1267
906	t		2011-06-03 06:38:07	2011-06-03 06:38:07	1268
907	t		2011-06-03 06:38:15	2011-06-03 06:38:15	1269
908	t		2011-06-03 06:49:06	2011-06-03 06:49:06	1270
909	t		2011-06-03 06:51:25	2011-06-03 06:51:25	1271
910	t		2011-06-03 06:59:12	2011-06-03 06:59:12	1272
911	t	I like seeing the covers, the way they are displayed and the simple way you can select & de-select the books as I (constantly) change my mind about which galleys I want to read the most (since I basically want to read EVERYTHING - ARGH!) Meg Spencer	2011-06-03 07:03:13	2011-06-03 07:03:13	1273
912	t		2011-06-03 07:06:57	2011-06-03 07:06:57	1275
913	t		2011-06-03 07:42:41	2011-06-03 07:42:41	1278
914	t		2011-06-03 07:52:27	2011-06-03 07:52:27	1280
915	t	Yes this is a great read to look at all the titles and see what I woudl like to read and then suggest to my friends and co-workers to bring in to sell. \r\nThanks\r\nDawn 	2011-06-03 08:03:46	2011-06-03 08:03:46	1281
916	t		2011-06-03 08:08:43	2011-06-03 08:08:43	1282
917	t	I appreciate the plot summaries and publishing information.	2011-06-03 08:35:14	2011-06-03 08:35:14	1284
918	t	Terrific!  Thank you!	2011-06-03 09:27:23	2011-06-03 09:27:23	1285
919	t		2011-06-03 09:31:16	2011-06-03 09:31:16	1286
920	t	I liked that I could see all the books and the books that I was most interested In I could grab.	2011-06-03 09:40:10	2011-06-03 09:40:10	1287
921	t	This is a great program.  The site is very user friendly.	2011-06-03 09:48:38	2011-06-03 09:48:38	1288
922	t		2011-06-03 09:56:10	2011-06-03 09:56:10	1289
923	t	I love that e-galleys are here. Adding the Nook as a supported device would be great. Almost all B&N Store Managers have one.	2011-06-03 10:26:32	2011-06-03 10:26:32	1290
924	t		2011-06-03 10:56:13	2011-06-03 10:56:13	1294
925	t	love it! Especially like the eGalley option this year	2011-06-03 10:57:02	2011-06-03 10:57:02	1295
926	t		2011-06-03 11:04:04	2011-06-03 11:04:04	1296
927	t		2011-06-03 11:45:09	2011-06-03 11:45:09	1298
928	t		2011-06-03 11:53:59	2011-06-03 11:53:59	1299
929	t		2011-06-03 11:55:40	2011-06-03 11:55:40	1300
930	t	This is a great way for independent bookstores to compete with the large chains.  Thanks for this offer	2011-06-03 12:12:36	2011-06-03 12:12:36	1292
931	t	Coolest galley site I have ever seen	2011-06-03 13:09:30	2011-06-03 13:09:30	1302
932	t	LOVED it!	2011-06-03 13:42:19	2011-06-03 13:42:19	1303
933	t		2011-06-03 14:05:52	2011-06-03 14:05:52	1304
934	t	I think the selection of titles is nicely balanced, even for those who haven't purchased an e-reader yet. I did find it a bit hard to read some author names. Thank you.	2011-06-03 14:10:04	2011-06-03 14:10:04	1305
935	t		2011-06-03 14:50:15	2011-06-03 14:50:15	1306
936	t	Very easy to use.	2011-06-03 14:54:40	2011-06-03 14:54:40	1307
937	t		2011-06-03 15:41:14	2011-06-03 15:41:14	1309
938	t	Love this site!!  Thank you for providing this service.	2011-06-03 20:52:51	2011-06-03 20:52:51	1312
939	t		2011-06-03 21:47:48	2011-06-03 21:47:48	1313
940	t		2011-06-03 22:10:16	2011-06-03 22:10:16	1314
941	t		2011-06-04 03:00:35	2011-06-04 03:00:35	1315
942	t		2011-06-04 04:55:02	2011-06-04 04:55:02	1317
943	t	We are a small bookstore and unable to attend book shows.  Offers like this help us choose books for the store.  While some of our staff have e-readers most of the staff do not so we elect to share physical copies but think it 's wonderful to have a choice.  Most of the staff would prefer to read a physical book .  Thanks for helping level the playing field and helping keep small stores like ours current.  FBT, owner, Annie's Book Stop, Wells, Maine	2011-06-04 04:56:31	2011-06-04 04:56:31	1316
944	t		2011-06-04 07:50:42	2011-06-04 13:50:37	1318
945	t		2011-06-04 07:58:36	2011-06-04 07:58:36	1319
946	t		2011-06-04 08:57:00	2011-06-04 08:57:00	1320
947	t	I like having choices and the brief reviews	2011-06-04 09:10:47	2011-06-04 09:10:47	1321
948	t		2011-06-04 09:20:56	2011-06-04 09:20:56	1322
949	t		2011-06-04 10:09:03	2011-06-04 10:09:03	1324
950	t		2011-06-04 11:15:47	2011-06-04 11:15:47	1325
951	t	The site seems very user friendly. I will use Galley Grab again in the future. Thanks!	2011-06-04 12:35:07	2011-06-04 12:35:07	1327
952	t		2011-06-04 12:45:35	2011-06-04 12:45:35	1328
953	t	Not sure what you would improve in terms of use - it's very easy! The titles are all interesting and it's difficult to choose between them.\n\nDonna Pare	2011-06-04 13:17:18	2011-06-04 13:17:18	1330
954	t	This is a great opportunity to read books prior to publication.  It makes a terrific difference in how prepared I am to hand sell books to our customers.  	2011-06-04 13:18:34	2011-06-04 13:18:34	1331
955	t		2011-06-04 14:41:14	2011-06-04 14:41:14	1333
956	t		2011-06-04 15:19:40	2011-06-04 15:19:40	1335
957	t		2011-06-04 17:50:11	2011-06-04 17:50:11	1336
958	t	I liked how you can look through the books and add them. Also, how you could find out more info on them was very good, too.	2011-06-04 20:58:08	2011-06-04 20:58:08	1338
959	t		2011-06-05 05:15:09	2011-06-05 05:15:09	1339
960	t		2011-06-05 05:31:15	2011-06-05 05:31:15	1340
961	t		2011-06-05 07:56:47	2011-06-05 07:56:47	1341
962	t	Easy to use - I'm always in a rush, getting books for my reviewers, so simple is best.  Ellen Feld, Editor  info@featheredquill.com	2011-06-05 08:57:21	2011-06-05 08:57:21	1342
963	t		2011-06-05 11:12:33	2011-06-05 11:12:33	1343
964	t	Excellent site!	2011-06-05 13:59:45	2011-06-05 13:59:45	1344
965	t	Very well put together site.\r\n\r\nThank You,\r\nNeil Surgi	2011-06-05 14:50:48	2011-06-05 14:50:48	1345
966	t		2011-06-05 15:26:10	2011-06-05 15:26:10	1347
967	t		2011-06-05 20:57:47	2011-06-05 20:57:47	1348
968	t		2011-06-06 08:01:24	2011-06-06 08:01:24	1353
969	t		2011-06-06 09:02:58	2011-06-06 09:02:58	1354
970	t	Very easy to use, lots of good titles.	2011-06-06 11:11:50	2011-06-06 11:11:50	1355
971	t		2011-06-06 11:45:08	2011-06-06 11:45:08	1356
972	t		2011-06-06 12:12:14	2011-06-06 12:12:14	1357
973	t	I like the Galley Grab because it gives you a variety of choices and good descriptions for each galley. 	2011-06-06 12:31:04	2011-06-06 12:31:04	1358
974	t		2011-06-06 12:39:24	2011-06-06 12:39:24	1359
975	t		2011-06-06 15:57:04	2011-06-06 15:57:04	1360
976	t		2011-06-06 17:13:40	2011-06-06 17:13:40	1362
977	t		2011-06-06 17:13:46	2011-06-06 17:13:46	1361
978	t	This is awesome. I used it last year and was able to share three great new titles with staff.	2011-06-06 17:59:23	2011-06-06 17:59:23	1363
979	t	I like that it's quick, easy, and user friendly.  The small pop-up window displaying additional information is great!	2011-06-06 19:09:43	2011-06-06 19:09:43	1365
980	t	Very handy way to select.  I clicked on the titles to read the descriptions and away I went.  \nThanks!	2011-06-06 19:13:09	2011-06-06 19:13:09	1366
981	t		2011-06-06 19:37:50	2011-06-06 19:37:50	1367
982	t	A very nice site.  It is so easy.  My biggest problem is deciding which titles I want!	2011-06-07 06:39:22	2011-06-07 06:39:22	1368
983	t		2011-06-07 07:31:31	2011-06-07 07:31:31	1370
984	t	Some of the books need to have longer descriptions, otherwise this site is great.	2011-06-07 07:58:47	2011-06-07 07:58:47	1371
985	t	This is a great idea.	2011-06-07 11:08:17	2011-06-07 11:08:17	1373
986	t		2011-06-08 10:39:03	2011-06-08 10:39:03	1374
987	t	Love it.  Can you also get egalleys too?	2011-06-08 12:30:56	2011-06-08 12:30:56	1375
988	t		2011-06-08 13:00:11	2011-06-08 13:00:11	1376
989	t		2011-06-08 13:29:34	2011-06-08 13:29:34	1377
990	t		2011-06-08 14:12:15	2011-06-08 14:12:15	1378
991	t	This is a wonderful resource. 	2011-06-08 15:37:52	2011-06-08 15:37:52	1379
992	t	I liked this site very much. It was very easy to use and informative.	2011-06-08 15:56:35	2011-06-08 15:56:35	1380
993	t		2011-06-09 04:22:38	2011-06-09 04:22:38	1382
994	t		2011-06-10 14:58:59	2011-06-10 14:58:59	1383
995	t	Easy to use and informative.	2011-06-10 17:28:02	2011-06-10 17:28:02	1384
996	t		2011-06-11 16:39:44	2011-06-11 16:39:44	1385
997	t		2012-01-09 15:26:44	2012-01-09 15:26:44	1387
998	t	super amazing experience	2012-04-25 13:08:53	2012-04-25 13:08:53	1388
999	t		2012-04-27 11:06:38	2012-04-27 11:06:38	1389
1000	t		2012-04-30 08:39:08	2012-04-30 08:39:08	1390
\.


--
-- Name: site_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: William
--

SELECT pg_catalog.setval('site_reviews_id_seq', 1001, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: William
--

COPY users (id, login, email, crypted_password, salt, created_at, updated_at, remember_token, remember_token_expires_at) FROM stdin;
1	bookcase	ddrabik@boomboxinc.com	29ac1da30e020b8063d2646a5aa7ed99900e86ae	9f430c27a4649f3e205e955784ae35488b8a89ba	2009-05-12 19:47:25	2011-06-10 14:56:51	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: William
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: William; Tablespace: 
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: covers_pkey; Type: CONSTRAINT; Schema: public; Owner: William; Tablespace: 
--

ALTER TABLE ONLY covers
    ADD CONSTRAINT covers_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: William; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: site_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: William; Tablespace: 
--

ALTER TABLE ONLY site_reviews
    ADD CONSTRAINT site_reviews_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: William; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: William; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: William
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "William";
GRANT ALL ON SCHEMA public TO "William";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

