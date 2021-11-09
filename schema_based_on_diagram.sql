CREATE TABLE patients(
  id INT PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  date_of_birth DATE,
);

CREATE TABLE medical_histories(
  id INT PRIMARY KEY NOT NULL,
  admitted_at TIMESTAMP,
  patient_id INT, 
  status VARCHAR(255),
  CONSTRAINT fk_patients FOREIGN KEY(patients_id) REFERENCES patients(id),
  CONSTRAINT fk_treatments FOREIGN KEY(treatments_id) REFERENCES treatments(id),
);

CREATE TABLE treatments(
  id INT PRIMARY KEY NOT NULL,
  type VARCHAR(255), 
  name TEXT NOT NULL,
  CONSTRAINT fk_invoice_items FOREIGN KEY(invoice_items_id) REFERENCES invoice_items(id),
);

CREATE TABLE invoices(
  id INT PRIMARY KEY NOT NULL,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  CONSTRAINT fk_medical_histories FOREIGN KEY(medical_histories_id) REFERENCES medical_histories(id),
);

CREATE TABLE invoice_items(
  id INT PRIMARY KEY NOT NULL,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  CONSTRAINT fk_invoices FOREIGN KEY(invoices_id) REFERENCES invoices(id),
);
