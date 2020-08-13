-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/e2noqD
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "social_economic" (
    "ZTCA" CHAR(5)   NOT NULL,
    "household_income" FLOAT   NOT NULL,
    "population" INT   NOT NULL,
    "median_age" FLOAT   NOT NULL,
    "per_capital_income" FLOAT   NOT NULL,
    "poverty_count" INT   NOT NULL,
    "unemployment_count" INT   NOT NULL,
    CONSTRAINT "pk_social_economic" PRIMARY KEY (
        "ZTCA"
     )
);

CREATE TABLE "restaurant" (
    "restaurant_id" INT   NOT NULL,
    "name" VARCHAR(100)   NOT NULL,
    "address" VARCHAR   NOT NULL,
    "zip_code" CHAR(5)   NOT NULL,
    CONSTRAINT "pk_restaurant" PRIMARY KEY (
        "restaurant_id"
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
    "state" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_zip_code" PRIMARY KEY (
        "zip_code"
     )
);

ALTER TABLE "zcta" ADD CONSTRAINT "fk_zcta_zip_code" FOREIGN KEY("zip_code")
REFERENCES "restaurant" ("zip_code");

ALTER TABLE "zcta" ADD CONSTRAINT "fk_zcta_ZCTA" FOREIGN KEY("ZCTA")
REFERENCES "social_economic" ("ZTCA");

ALTER TABLE "zip_code" ADD CONSTRAINT "fk_zip_code_zip_code" FOREIGN KEY("zip_code")
REFERENCES "restaurant" ("zip_code");

