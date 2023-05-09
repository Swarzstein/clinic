create table patients (
  id serial primary key not null,
  name varchar(100), 
  date_of_birth date
);

create table medical_histories (
  id serial primary key not null,
  admitted_at timestamp,
  patient_id integer references patients(id),
  status varchar(100)
);

create table treatments (
  id serial primary key not null,
  type varchar(100),
  name varchar(100),
);

create table medical_histories_treatments (
  medical_history_id integer references medical_histories(id),
  treatment_id integer references treatments(id),
  primary key (medical_history_id, treatment_id)
);

CREATE Table invoices (
  id serial PRIMARY key not null,
  total_amount decimal(10, 2),
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id int REFERENCES medical_histories (id)
)

create table invoice_items (
  id serial primary key not null,
  unit_price decimal(10, 2),
  quantity int,
  total_price decimal(10, 2),
  invoice_id int REFERENCES invoices (id),
  treatment_id int REFERENCES treatments (id)
)

