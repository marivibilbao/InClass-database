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
----- * 1.1.- Add a column date_of_birth of type DATE in the customers table.
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
----- * 1.2.- Rename the column date_of_birth to birthdate in the customers table.
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


----- * 1.3.- Delete the column birthdate from the customers table
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

-- Exercise 2:
----- * 2.1.- Create a new table test
CREATE TABLE test (
cyf_hotels(# );

-- Verificamos si se creó la tabla test:
\dt
         Listado de relaciones
 Esquema |  Nombre   | Tipo  |  Due±o
---------+-----------+-------+----------
 public  | bookings  | tabla | postgres
 public  | customers | tabla | postgres
 public  | hotels    | tabla | postgres
 public  | test      | tabla | postgres
(4 filas)

----- * 2.2.- Drop the table test
DROP TABLE test;

-- Verificamos:
\dt
         Listado de relaciones
 Esquema |  Nombre   | Tipo  |  Due±o
---------+-----------+-------+----------
 public  | bookings  | tabla | postgres
 public  | customers | tabla | postgres
 public  | hotels    | tabla | postgres
(3 filas)














