-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Gyms" (
    "Company" varchar   NOT NULL,
    "City" varchar   NOT NULL,
    "State" varchar   NOT NULL,
    "Employee_Count" varchar   NOT NULL,
    "Annual_Sales" varchar   NOT NULL,
    "Industry" varchar   NOT NULL,
    "Zip1" int   NOT NULL
);

CREATE TABLE "Trends" (
    "Year" varchar   NOT NULL,
    "LocationDesc" varchar   NOT NULL,
    "Class" varchar   NOT NULL,
    "Topic" varchar   NOT NULL,
    "Data_Value" float   NOT NULL,
    "Data_Value_Unit" varchar   NOT NULL,
    "StratificationCategory1" varchar   NOT NULL,
    "Stratification1" varcar   NOT NULL,
    "StratificationCategory2" varchar   NOT NULL,
    "Stratification2" varchar   NOT NULL,
    "StratificationCategory3" varchar   NOT NULL,
    "Stratification3" varchar   NOT NULL,
    "LocationID" int   NOT NULL
);

CREATE TABLE "Income" (
    "State_Name" varchar   NOT NULL,
    "County" varchar   NOT NULL,
    "City" varchar   NOT NULL,
    "Place" varchar   NOT NULL,
    "Type" varchar   NOT NULL,
    "Primary" varchar   NOT NULL,
    "Zip_Code" int   NOT NULL,
    "Mean" int   NOT NULL,
    "Median" int   NOT NULL,
    "Stdev" int   NOT NULL,
    "sum_w" float   NOT NULL
);

CREATE TABLE "Mortality" (
    "Year" varchar   NOT NULL,
    "LocationAbbr" varchar   NOT NULL,
    "LocationDesc" varchar   NOT NULL,
    "Geographic_Level" varchar   NOT NULL,
    "Class" varchar   NOT NULL,
    "Topic" varchar   NOT NULL,
    "Data_Value" varchar   NOT NULL,
    "Data_Value_Unit" varchar   NOT NULL,
    "Data_Value_Type" varchar   NOT NULL,
    "StratificationCategory1" varchar   NOT NULL,
    "Stratification1" varchar   NOT NULL,
    "StratificationCategory2" varchar   NOT NULL,
    "Stratification2" varchar   NOT NULL,
    "TopicID" varchar   NOT NULL
);

ALTER TABLE "Trends" ADD CONSTRAINT "fk_Trends_LocationDesc" FOREIGN KEY("LocationDesc")
REFERENCES "Mortality" ("LocationDesc");

ALTER TABLE "Income" ADD CONSTRAINT "fk_Income_County" FOREIGN KEY("County")
REFERENCES "Trends" ("LocationDesc");

ALTER TABLE "Income" ADD CONSTRAINT "fk_Income_Zip_Code" FOREIGN KEY("Zip_Code")
REFERENCES "Gyms" ("Zip1");

