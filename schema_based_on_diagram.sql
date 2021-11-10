CREATE TABLE patients(
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(225) NOT NULL,
  date_of_birth DATE,
);

CREATE TABLE medical_history(
  id INT PRIMARY KEY NOT NULL,
  admitted_at TIMESTAMP,
  patient_id INT, 
  status VARCHAR(255),
  CONSTRAINT fk_patients FOREIGN KEY(patient_id) REFERENCES patients(id),
  );

CREATE TABLE treatments(
  id INT PRIMARY KEY NOT NULL,
  type VARCHAR(255), 
  name VARCHAR(225),
  CONSTRAINT fk_invoice_items FOREIGN KEY(invoice_item_id) REFERENCES invoice_items(id),
);

CREATE TABLE invoices(
  id INT PRIMARY KEY NOT NULL,
  total_amount FLOAT,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  CONSTRAINT fk_medical_histories FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
);

CREATE TABLE invoice_items(
  id INT PRIMARY KEY NOT NULL,
  unit_price FLOAT,
  quantity INT,
  total_price FLOAT,
  invoice_id INT,
  treatment_id INT,
  CONSTRAINT fk_invoice FOREIGN KEY(invoice_id) REFERENCES invoices(id),
  CONSTRAINT fk_treatment FOREIGN KEY(treatment_id) REFERENCES treatments(id),
);

CREATE TABLE treatments_histories (
  id INT PRIMARY KEY NOT NULL,
  treatment_id INT,
  medical_history_id INT;
  CONSTRAINT fk_treatment FOREIGN KEY (treatment_id) REFERENCES treatments(id),
  CONSTRAINT fk_medical_history FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
)
