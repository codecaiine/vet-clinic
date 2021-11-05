
CREATE DATABASE vet_clinic;

CREATE TABLE animals(
  id INT PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL
);

ALTER TABLE animals 
ADD species TEXT;

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,                    
  full_name TEXT,   
  age  INT
);

CREATE TABLE species(
  id SERIAL PRIMARY KEY,
  name TEXT
);

ALTER TABLE animals
  DROP species;

ALTER TABLE animals
ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id) 
REFERENCES species (id);

ALTER TABLE animals 
ADD COLUMN owners_id INT,
ADD CONSTRAINT fk_owners
FOREIGN KEY (owners_id)
REFERENCES owners (id);
