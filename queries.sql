/*Queries that provide answers to the questions from all projects.*/
SELECT * from animals WHERE animal_name like '%mon';
SELECT animal_name FROM animals WHERE date_of_birth BETWEEN '2016.01.01' AND '2019.12.31';
SELECT animal_name FROM animals WHERE neutered='1' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE animal_name='Agumon' OR animal_name='Pikachu';
SELECT animal_name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered='1';
SELECT * FROM animals WHERE animal_name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= '10.4' AND weight_kg <= '17.3';

ALTER TABLE animals
ADD species VARCHAR(250);

BEGIN;
UPDATE animals
SET species='unspecified';
ROLLBACK;

BEGIN;
UPDATE animals
SET species='digimon'
WHERE animal_name like '%mon';
UPDATE animals
SET species='pokemon'
WHERE species='';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022.01.01';
SAVEPOINT SAVEPOINT_1;
UPDATE animals
SET weight_kg= weight_kg * '-1';
ROLLBACK TO SAVEPOINT_1;
UPDATE animals
SET weight_kg= weight_kg * '-1'
WHERE weight_kg < 0;
COMMIT;

SELECT FROM animals;
SELECT FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE neutered='1';
SELECT COUNT(escape_attempts) FROM animals WHERE neutered='0';
SELECT MIN(weight_kg) FROM animals WHERE species='digimon';
SELECT MAX(weight_kg) FROM animals WHERE species='digimon';
SELECT MIN(weight_kg) FROM animals WHERE species='pokemon';
SELECT MAX(weight_kg) FROM animals WHERE species='pokemon';
SELECT AVG(escape_attempts) FROM animals WHERE (species='digimon') AND(date_of_birth BETWEEN '1990.01.01' AND '2000.12.31');
SELECT AVG(escape_attempts) FROM animals WHERE (species='pokemon') AND(date_of_birth BETWEEN '1990.01.01' AND '2000.12.31');