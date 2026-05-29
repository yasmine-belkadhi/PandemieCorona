-- Table: public.dim_pays

-- DROP TABLE IF EXISTS public.dim_pays;

CREATE TABLE IF NOT EXISTS public.dim_pays
(
    id_pays integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    nom_pays character varying COLLATE pg_catalog."default",
    CONSTRAINT dim_pays_pkey PRIMARY KEY (id_pays),
    CONSTRAINT nom_pays_uni UNIQUE (nom_pays)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_pays
    OWNER to postgres;


-- Table: public.dim_temps

-- DROP TABLE IF EXISTS public.dim_temps;

CREATE TABLE IF NOT EXISTS public.dim_temps
(
    id_temps integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    date_jour date NOT NULL,
    annee integer,
    mois integer,
    trimestre integer,
    semaine_iso integer,
    CONSTRAINT dim_temps_pkey PRIMARY KEY (id_temps),
    CONSTRAINT date_jour_uni UNIQUE (date_jour)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_temps
    OWNER to postgres;



-- Table: public.fait_pandemie

-- DROP TABLE IF EXISTS public.fait_pandemie;

CREATE TABLE IF NOT EXISTS public.fait_pandemie
(
    id_fait integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    id_temps integer,
    id_pays integer,
    nouveaux_cas double precision,
    nouveaux_deces double precision,
    cas_cumules double precision,
    deces_cumules double precision,
    cas_hebdomadaires double precision,
    deces_hebdomadaires double precision,
    CONSTRAINT fait_pandemie_pkey PRIMARY KEY (id_fait),
    CONSTRAINT id_pays FOREIGN KEY (id_pays)
        REFERENCES public.dim_pays (id_pays) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT id_temps FOREIGN KEY (id_temps)
        REFERENCES public.dim_temps (id_temps) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.fait_pandemie
    OWNER to postgres;
