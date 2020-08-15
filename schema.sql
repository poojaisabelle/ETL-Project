﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/e2noqD
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "social_economics" (
    "ZCTA" CHAR(5)   NOT NULL,
    "population" INT,
    "median_age" FLOAT,
    "median_household_income" FLOAT,
    "per_capita_income" FLOAT,
    "poverty_count" INT,
    "unemployment_count" INT,
    CONSTRAINT "pk_social_economics" PRIMARY KEY (
        "ZCTA"
     )
);

CREATE TABLE "zcta" (
    "zip_code" CHAR(5)   NOT NULL,
    "ZCTA" CHAR(5)   NOT NULL,
    CONSTRAINT "pk_zcta" PRIMARY KEY (
        "zip_code","ZCTA"
     )
);

CREATE TABLE "zip_code" (
    "zip_code" CHAR(5)   NOT NULL,
    "city" VARCHAR(100)   NOT NULL,
    "state" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_zip_code" PRIMARY KEY (
        "zip_code"
     )
);

CREATE TABLE "restaurant_address" (
    "restaurant_address_id" SERIAL   NOT NULL,
    "restaurant_id" INT   NOT NULL,
    "street_no" VARCHAR(30)   NOT NULL,
    "street_name" VARCHAR   NOT NULL,
    "zip_code" CHAR(5)   NOT NULL
);

CREATE TABLE "restaurant" (
    "restaurant_id" INT   NOT NULL,
    "restaurant_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_restaurant" PRIMARY KEY (
        "restaurant_id"
     ),
    CONSTRAINT "uc_restaurant_restaurant_name" UNIQUE (
        "restaurant_name"
    )
);

ALTER TABLE "zcta" ADD CONSTRAINT "fk_zcta_zip_code" FOREIGN KEY("zip_code")
REFERENCES "zip_code" ("zip_code");

ALTER TABLE "zcta" ADD CONSTRAINT "fk_zcta_ZCTA" FOREIGN KEY("ZCTA")
REFERENCES "social_economics" ("ZCTA");

ALTER TABLE "restaurant_address" ADD CONSTRAINT "fk_restaurant_address_restaurant_id" FOREIGN KEY("restaurant_id")
REFERENCES "restaurant" ("restaurant_id");

ALTER TABLE "restaurant_address" ADD CONSTRAINT "fk_restaurant_address_zip_code" FOREIGN KEY("zip_code")
REFERENCES "zip_code" ("zip_code");

