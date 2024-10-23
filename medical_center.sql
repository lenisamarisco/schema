DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL, 
  specialty TEXT NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    insurance TEXT NOT NULL,
    birthday DATE NOT NULL
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    date DATE NOT NULL
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INT NOT NULL,
    disease_id INT NOT NULL,
    notes TEXT NOT NULL
);

INSERT INTO doctors (name, specialty) 
VALUES 
    ('Adam Houser', 'General doctor'), 
    ('Will Smith', 'Lung Doctor'),
    ('Katherine Smith', 'Nutrition Specialist'),
    ('Nora Williams', 'X-R specialist');

INSERT INTO patients 
    (name,insurance, birthday) 
VALUES
    ('Lenisa Marisco', 'Blue Cross Blue Shield', '10-04-1975'),
    ('Sophia Smith', 'Medicaid', '02-01-2013');

INSERT INTO visits (doctor_id, patient_id, date)
VALUES
    (1, 1, '10-19-2024'),
    (2, 1, '10-21-2024'),
    (3, 1, '10-29-2024');

INSERT INTO diseases (name, description)
VALUES
    ('Covid', 'fever, lost of taste and smell');

INSERT INTO diagnoses (visit_id, disease_id, notes)
VALUES
    (1, 1, 'Viral tests, including nucleic acid amplification
     tests (NAATs) and PCR tests, as well as antigen tests');