-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/e2noqD
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "census" (
    "ZCTA" CHAR(5)   NOT NULL,
    "population" FLOAT,
    "median_age" FLOAT,
    "median_household_income" FLOAT,
    "per_capita_income" FLOAT,
    "poverty_count" FLOAT,
    "unemployment_count" FLOAT,
    CONSTRAINT "pk_census" PRIMARY KEY (
        "ZCTA"
     )
);

CREATE TABLE "zip_zcta" (
    "zip_code" CHAR(5)   NOT NULL,
    "ZCTA" CHAR(5)   NOT NULL,
    CONSTRAINT "pk_zip_zcta" PRIMARY KEY (
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
    "street_no" INT   NOT NULL,
    "street_name" VARCHAR   NOT NULL,
    "zip_code" CHAR(5)   NOT NULL,
    CONSTRAINT "pk_restaurant_address" PRIMARY KEY (
        "restaurant_address_id"
     )
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

ALTER TABLE "zip_zcta" ADD CONSTRAINT "fk_zip_zcta_zip_code" FOREIGN KEY("zip_code")
REFERENCES "zip_code" ("zip_code");

ALTER TABLE "zip_zcta" ADD CONSTRAINT "fk_zip_zcta_ZCTA" FOREIGN KEY("ZCTA")
REFERENCES "census" ("ZCTA");

ALTER TABLE "restaurant_address" ADD CONSTRAINT "fk_restaurant_address_restaurant_id" FOREIGN KEY("restaurant_id")
REFERENCES "restaurant" ("restaurant_id");

ALTER TABLE "restaurant_address" ADD CONSTRAINT "fk_restaurant_address_zip_code" FOREIGN KEY("zip_code")
REFERENCES "zip_code" ("zip_code");

