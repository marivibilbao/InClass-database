-- AÑADIR COLUMNAS
ALTER TABLE customers ADD COLUMN date_of_birth DATE;

-- Verificamos si se añadio la nueva columna:
\d customers
                                         Tabla ½public.customers╗
    Columna    |          Tipo          | Ordenamiento | Nulable  |              Por omisi¾n
---------------+------------------------+--------------+----------+---------------------------------------
 id            | integer                |              | not null | nextval('customers_id_seq'::regclass)
 name          | character varying(30)  |              | not null |
 email         | character varying(120) |              | not null |
 address       | character varying(120) |              |          |
 city          | character varying(30)  |              |          |
 postcode      | character varying(12)  |              |          |
 country       | character varying(20)  |              |          |
 date_of_birth | date                   |              |          |
═ndices:
    "customers_pkey" PRIMARY KEY, btree (id)
Referenciada por:
    TABLE "bookings" CONSTRAINT "bookings_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(id)


-- ELIMINAR COLUMNAS
ALTER TABLE customers DROP COLUMN date_of_birth;

-- Verificamos:
\d customers
                                      Tabla ½public.customers╗
 Columna  |          Tipo          | Ordenamiento | Nulable  |              Por omisi¾n        
----------+------------------------+--------------+----------+---------------------------------------
 id       | integer                |              | not null | nextval('customers_id_seq'::regclass)
 name     | character varying(30)  |              | not null |
 email    | character varying(120) |              | not null |
 address  | character varying(120) |              |          |
 city     | character varying(30)  |              |          |
 postcode | character varying(12)  |              |          |
 country  | character varying(20)  |              |          |
═ndices:
    "customers_pkey" PRIMARY KEY, btree (id)
Referenciada por:
    TABLE "bookings" CONSTRAINT "bookings_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(id)


-- RENOMBRAR tabla:
ALTER TABLE customers RENAME TO clients;

-- Verificamos:
cyf_hotels=# \d clients;
                                       Tabla ½public.clients╗
 Columna  |          Tipo          | Ordenamiento | Nulable  |              Por omisi¾n        
----------+------------------------+--------------+----------+---------------------------------------
 id       | integer                |              | not null | nextval('customers_id_seq'::regclass)
 name     | character varying(30)  |              | not null |
 email    | character varying(120) |              | not null |
 address  | character varying(120) |              |          |
 city     | character varying(30)  |              |          |
 postcode | character varying(12)  |              |          |
 country  | character varying(20)  |              |          |
═ndices:
    "customers_pkey" PRIMARY KEY, btree (id)
Referenciada por:
    TABLE "bookings" CONSTRAINT "bookings_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES clients(id)


-- Regreso el cambio de nombre que se realizó anteriormente en la tabla:
ALTER TABLE clients RENAME TO customers;


-- Exercise 1: 
----- * Add a column date_of_birth of type DATE in the customers table.
cyf_hotels=# ALTER TABLE customers ADD COLUMN date_of_birth DATE;

-- Verificamos:
cyf_hotels=# \d customers
                                         Tabla ½public.customers╗
    Columna    |          Tipo          | Ordenamiento | Nulable  |              Por omisi¾n   
---------------+------------------------+--------------+----------+---------------------------------------
 id            | integer                |              | not null | nextval('customers_id_seq'::regclass)
 name          | character varying(30)  |              | not null |
 email         | character varying(120) |              | not null |
 address       | character varying(120) |              |          |
 city          | character varying(30)  |              |          |
 postcode      | character varying(12)  |              |          |
 country       | character varying(20)  |              |          |
 date_of_birth | date                   |              |          |
═ndices:
    "customers_pkey" PRIMARY KEY, btree (id)
Referenciada por:
    TABLE "bookings" CONSTRAINT "bookings_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(id)


-- RENOMBRAR COLUMNA DE UNA TABLA:
----- * Rename the column date_of_birth to birthdate in the customers table.
ALTER TABLE customers RENAME COLUMN date_of_birth TO birthdate;

-- Verificamos:
\d customers
                                       Tabla ½public.customers╗
  Columna  |          Tipo          | Ordenamiento | Nulable  |              Por omisi¾n       
-----------+------------------------+--------------+----------+---------------------------------------
 id        | integer                |              | not null | nextval('customers_id_seq'::regclass)
 name      | character varying(30)  |              | not null |
 email     | character varying(120) |              | not null |
 address   | character varying(120) |              |          |
 city      | character varying(30)  |              |          |
 postcode  | character varying(12)  |              |          |
 country   | character varying(20)  |              |          |
 birthdate | date                   |              |          |
═ndices:
    "customers_pkey" PRIMARY KEY, btree (id)
Referenciada por:
    TABLE "bookings" CONSTRAINT "bookings_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(id)


----- * Delete the column birthdate from the customers table
ALTER TABLE customers DROP COLUMN birthdate;

-- Verificamos:
\d customers
                                      Tabla ½public.customers╗
 Columna  |          Tipo          | Ordenamiento | Nulable  |              Por omisi¾n        
----------+------------------------+--------------+----------+---------------------------------------
 id       | integer                |              | not null | nextval('customers_id_seq'::regclass)
 name     | character varying(30)  |              | not null |
 email    | character varying(120) |              | not null |
 address  | character varying(120) |              |          |
 city     | character varying(30)  |              |          |
 postcode | character varying(12)  |              |          |
 country  | character varying(20)  |              |          |
═ndices:
    "customers_pkey" PRIMARY KEY, btree (id)
Referenciada por:
    TABLE "bookings" CONSTRAINT "bookings_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(id)
















