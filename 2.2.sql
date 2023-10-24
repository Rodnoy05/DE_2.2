CREATE TABLE public.author (
    id_author bigint DEFAULT nextval(('public.author_id_author_seq'::text)::regclass) NOT NULL,
    fam_author character varying(100) NOT NULL,
    name_author character varying(100) NOT NULL,
    otch_author character varying(100)
);


ALTER TABLE public.author OWNER TO postgres;

CREATE SEQUENCE public.author_id_author_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.author_id_author_seq OWNER TO postgres;

CREATE TABLE public.authorship (
    id_author bigint NOT NULL,
    id_work bigint NOT NULL
);


ALTER TABLE public.authorship OWNER TO postgres;

CREATE TABLE public.book (
    id_book bigint DEFAULT nextval(('public.book_id_book_seq'::text)::regclass) NOT NULL,
    name_book character varying(255) NOT NULL,
    quant_pages integer NOT NULL,
    year_publication integer NOT NULL,
    id_work integer,
    id_publisher integer
);


ALTER TABLE public.book OWNER TO postgres;

CREATE SEQUENCE public.book_id_book_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_id_book_seq OWNER TO postgres;

CREATE TABLE public.book_on (
    id_on bigint DEFAULT nextval(('public.book_on_id_on_seq'::text)::regclass) NOT NULL,
    date_on date NOT NULL,
    quant_books integer NOT NULL,
    id_book integer,
    price_book double precision NOT NULL
);


ALTER TABLE public.book_on OWNER TO postgres;

CREATE SEQUENCE public.book_on_id_on_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_on_id_on_seq OWNER TO postgres;

CREATE TABLE public.book_use (
    id_use bigint DEFAULT nextval(('public.book_use_id_use_seq'::text)::regclass) NOT NULL,
    date_begin date NOT NULL,
    date_end date,
    id_examplar integer,
    numb_ticket integer
);


ALTER TABLE public.book_use OWNER TO postgres;

CREATE SEQUENCE public.book_use_id_use_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_use_id_use_seq OWNER TO postgres;

CREATE TABLE public.examplar (
    id_examplar bigint DEFAULT nextval(('public.examplar_id_examplar_seq'::text)::regclass) NOT NULL,
    id_on integer,
    id_place integer,
    date_off date,
    id_reason_off integer
);


ALTER TABLE public.examplar OWNER TO postgres;

CREATE SEQUENCE public.examplar_id_examplar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.examplar_id_examplar_seq OWNER TO postgres;

CREATE TABLE public.place (
    id_place bigint DEFAULT nextval(('public.place_id_place_seq'::text)::regclass) NOT NULL,
    shifr character varying(20) NOT NULL,
    comment character varying(100)
);


ALTER TABLE public.place OWNER TO postgres;

CREATE SEQUENCE public.place_id_place_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.place_id_place_seq OWNER TO postgres;

CREATE TABLE public.publisher (
    id_publisher bigint DEFAULT nextval(('public.publisher_id_publisher_seq'::text)::regclass) NOT NULL,
    name_publisher character varying(100) NOT NULL,
    city_publisher character varying(150) NOT NULL
);


ALTER TABLE public.publisher OWNER TO postgres;

CREATE SEQUENCE public.publisher_id_publisher_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publisher_id_publisher_seq OWNER TO postgres;

CREATE TABLE public.reader (
    numb_ticket bigint DEFAULT nextval(('public.reader_numb_ticket_seq'::text)::regclass) NOT NULL,
    fam_reader character varying(100) NOT NULL,
    name_reader character varying(100) NOT NULL,
    otch_reader character varying(100),
    adr_reader character varying(255) NOT NULL,
    phone_reader character varying(20)
);


ALTER TABLE public.reader OWNER TO postgres;

CREATE SEQUENCE public.reader_numb_ticket_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reader_numb_ticket_seq OWNER TO postgres;

CREATE TABLE public.reason_off (
    id_reason_off bigint DEFAULT nextval(('public.reason_off_id_reason_off_seq'::text)::regclass) NOT NULL,
    reason_off character varying(100) NOT NULL
);


ALTER TABLE public.reason_off OWNER TO postgres;

CREATE SEQUENCE public.reason_off_id_reason_off_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reason_off_id_reason_off_seq OWNER TO postgres;

CREATE TABLE public.work (
    id_work bigint DEFAULT nextval(('public.work_id_work_seq'::text)::regclass) NOT NULL,
    name_work character varying(255) NOT NULL
);


ALTER TABLE public.work OWNER TO postgres;

CREATE SEQUENCE public.work_id_work_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_id_work_seq OWNER TO postgres;

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id_author);

ALTER TABLE ONLY public.authorship
    ADD CONSTRAINT authorship_pkey PRIMARY KEY (id_author, id_work);

ALTER TABLE ONLY public.book_on
    ADD CONSTRAINT book_on_pkey PRIMARY KEY (id_on);

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id_book);

ALTER TABLE ONLY public.book_use
    ADD CONSTRAINT book_use_pkey PRIMARY KEY (id_use);


ALTER TABLE ONLY public.examplar
    ADD CONSTRAINT examplar_pkey PRIMARY KEY (id_examplar);


ALTER TABLE ONLY public.place
    ADD CONSTRAINT place_pkey PRIMARY KEY (id_place);

ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (id_publisher);

ALTER TABLE ONLY public.reader
    ADD CONSTRAINT reader_pkey PRIMARY KEY (numb_ticket);

ALTER TABLE ONLY public.reason_off
    ADD CONSTRAINT reason_off_pkey PRIMARY KEY (id_reason_off);


ALTER TABLE ONLY public.work
    ADD CONSTRAINT work_pkey PRIMARY KEY (id_work);

ALTER TABLE ONLY public.examplar
    ADD CONSTRAINT r_10 FOREIGN KEY (id_on) REFERENCES public.book_on(id_on);

ALTER TABLE ONLY public.examplar
    ADD CONSTRAINT r_11 FOREIGN KEY (id_place) REFERENCES public.place(id_place);

ALTER TABLE ONLY public.authorship
    ADD CONSTRAINT r_14 FOREIGN KEY (id_author) REFERENCES public.author(id_author);


ALTER TABLE ONLY public.authorship
    ADD CONSTRAINT r_15 FOREIGN KEY (id_work) REFERENCES public.work(id_work);


ALTER TABLE ONLY public.examplar
    ADD CONSTRAINT r_19 FOREIGN KEY (id_reason_off) REFERENCES public.reason_off(id_reason_off);

ALTER TABLE ONLY public.book
    ADD CONSTRAINT r_2 FOREIGN KEY (id_work) REFERENCES public.work(id_work);

ALTER TABLE ONLY public.book
    ADD CONSTRAINT r_3 FOREIGN KEY (id_publisher) REFERENCES public.publisher(id_publisher);

ALTER TABLE ONLY public.book_use
    ADD CONSTRAINT r_7 FOREIGN KEY (id_examplar) REFERENCES public.examplar(id_examplar);

ALTER TABLE ONLY public.book_use
    ADD CONSTRAINT r_8 FOREIGN KEY (numb_ticket) REFERENCES public.reader(numb_ticket);

ALTER TABLE ONLY public.book_on
    ADD CONSTRAINT r_9 FOREIGN KEY (id_book) REFERENCES public.book(id_book);

