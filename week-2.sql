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


-- Exercise 3:
----- * 3.1.- Update the postcode of the hotel named Elder Lake Hotel to L10XYZ
SELECT * FROM hotels
cyf_hotels-# ;
 id |           name           | rooms | postcode
----+--------------------------+-------+----------
  1 | Golden Cavern Resort     |    10 | L10ABC
  2 | Elder Lake Hotel         |     5 | L10ABC
  3 | Pleasant Mountain Hotel  |     7 | ABCDE1
  4 | Azure Crown Resort & Spa |    18 | DGQ127
  5 | Jade Peaks Hotel         |     4 | DGQ127
  6 | Elegant Resort           |    14 | DGQ127
  7 | Cozy Hotel               |    20 | AYD189
  8 | Snowy Echo Motel         |    15 | AYD189
(8 filas)
-- ACTUALIZAR DATOS EN UNA TABLA:
UPDATE table SET column1 = value1, column2 = value2 WHERE condition;
UPDATE hotels SET postcode = 'L10XYZ' WHERE name='Elder Lake Hotel';
-- Verificamos el cambio:
cyf_hotels=# SELECT * FROM hotels;
 id |           name           | rooms | postcode
----+--------------------------+-------+----------
  1 | Golden Cavern Resort     |    10 | L10ABC
  3 | Pleasant Mountain Hotel  |     7 | ABCDE1
  4 | Azure Crown Resort & Spa |    18 | DGQ127
  5 | Jade Peaks Hotel         |     4 | DGQ127
  6 | Elegant Resort           |    14 | DGQ127
  7 | Cozy Hotel               |    20 | AYD189
  8 | Snowy Echo Motel         |    15 | AYD189
  2 | Elder Lake Hotel         |     5 | L10XYZ
(8 filas)


----- * 3.2.- Update the number of rooms of Cozy Hotel to 25
UPDATE hotels SET rooms = 25 WHERE name='Cozy Hotel';
-- Verificamos el cambio:
SELECT * FROM hotels;
 id |           name           | rooms | postcode
----+--------------------------+-------+----------
  1 | Golden Cavern Resort     |    10 | L10ABC
  3 | Pleasant Mountain Hotel  |     7 | ABCDE1
  4 | Azure Crown Resort & Spa |    18 | DGQ127
  5 | Jade Peaks Hotel         |     4 | DGQ127
  6 | Elegant Resort           |    14 | DGQ127
  8 | Snowy Echo Motel         |    15 | AYD189
  2 | Elder Lake Hotel         |     5 | L10XYZ
  7 | Cozy Hotel               |    25 | AYD189
(8 filas)


----- * 3.3.- For the customer named Nadia Sethuraman, update her address to 2 Blue Street, her city to Glasgow and her postcode to G11ABC in one query
 SELECT * FROM customers;
 id |       name       |           email            |       address        |    city    | postcode | country
----+------------------+----------------------------+----------------------+------------+----------+---------
  1 | John Smith       | j.smith@johnsmith.org      | 11 New Road          | Liverpool  | L10 2AB  | UK
  2 | Sue Jones        | s.jones1234@gmail.com      | 120 Old Street       | London     | N10 3CD  | UK
  3 | Alice Evans      | alice.evans001@hotmail.com | 3 High Road          | Manchester | m13 4ef  | UK
  4 | Mohammed Trungpa | mo.trungpa@hotmail.com     | 25 Blue Road         | Manchester | M25 6GH  | UK
  5 | Steven King      | steve.king123@hotmail.com  | 19 Bed Street        | Newtown    | xy2 3ac  | UK
  6 | Nadia Sethuraman | nadia.sethuraman@mail.com  | 135 Green Street     | Manchester | M10 4BG  | UK
  7 | Melinda Marsh    | mel.marsh-123@gmail.com    | 7 Preston Road       | Oldham     | OL3 5XZ  | UK
  8 | Mart├¡n Sommer   | martin.sommer@dfgg.net     | C/ Romero, 33        | Madrid     | 28016    | Spain
  9 | Laurence Lebihan | laurence.lebihan@xmzx.net  | 12, rue des Bouchers | Marseille  | 13008    | France
 10 | Keith Stewart    | keith.stewart@gmail.com    | 84 Town Lane         | Tadworth   | td5 7ng  | UK
(10 filas)

UPDATE customers SET address = '2 Blue Street', city = 'Glasgow', postcode = 'G11ABC'  WHERE name='Nadia Sethuraman';
-- Verificamos:
SELECT * FROM customers;
 id |       name       |           email            |       address        |    city    | postcode | country
----+------------------+----------------------------+----------------------+------------+----------+---------
  1 | John Smith       | j.smith@johnsmith.org      | 11 New Road          | Liverpool  | L10 2AB  | UK
  2 | Sue Jones        | s.jones1234@gmail.com      | 120 Old Street       | London     | N10 3CD  | UK
  3 | Alice Evans      | alice.evans001@hotmail.com | 3 High Road          | Manchester | m13 4ef  | UK
  4 | Mohammed Trungpa | mo.trungpa@hotmail.com     | 25 Blue Road         | Manchester | M25 6GH  | UK
  5 | Steven King      | steve.king123@hotmail.com  | 19 Bed Street        | Newtown    | xy2 3ac  | UK
  7 | Melinda Marsh    | mel.marsh-123@gmail.com    | 7 Preston Road       | Oldham     | OL3 5XZ  | UK
  8 | Mart├¡n Sommer   | martin.sommer@dfgg.net     | C/ Romero, 33        | Madrid     | 28016    | Spain
  9 | Laurence Lebihan | laurence.lebihan@xmzx.net  | 12, rue des Bouchers | Marseille  | 13008    | France
 10 | Keith Stewart    | keith.stewart@gmail.com    | 84 Town Lane         | Tadworth   | td5 7ng  | UK
  6 | Nadia Sethuraman | nadia.sethuraman@mail.com  | 2 Blue Street        | Glasgow    | G11ABC   | UK
(10 filas)


----- * 3.4.- Update all the bookings of customer with ID 1 for the hotel with ID 1 to 5 nights in one query
SELECT * FROM bookings;
 id | customer_id | hotel_id | checkin_date | nights
----+-------------+----------+--------------+--------
  1 |           1 |        1 | 2019-10-01   |      2
  2 |           1 |        1 | 2019-12-10   |      6
  3 |           1 |        3 | 2019-07-20   |      4
  4 |           2 |        3 | 2020-03-10   |      4
  5 |           2 |        5 | 2020-04-01   |      1
  6 |           3 |        1 | 2019-11-01   |      1
  7 |           3 |        2 | 2019-11-23   |      2
  8 |           4 |        8 | 2019-12-23   |      3
  9 |           4 |        2 | 2019-09-16   |      5
 10 |           6 |        5 | 2019-09-14   |      2
 11 |           6 |        6 | 2020-01-14   |      5
 12 |           8 |        4 | 2020-02-01   |      3
 13 |           8 |        5 | 2020-01-03   |      7
 14 |           8 |        8 | 2019-12-25   |      4
(14 filas)

UPDATE table SET column1 = value1, column2 = value2 WHERE condition;
UPDATE bookings SET nights = 5 WHERE customer_id = 1 AND hotel_id = 1;
-- Verificamos:
SELECT * FROM bookings;
 id | customer_id | hotel_id | checkin_date | nights
----+-------------+----------+--------------+--------
  3 |           1 |        3 | 2019-07-20   |      4
  4 |           2 |        3 | 2020-03-10   |      4
  5 |           2 |        5 | 2020-04-01   |      1
  6 |           3 |        1 | 2019-11-01   |      1
  7 |           3 |        2 | 2019-11-23   |      2
  8 |           4 |        8 | 2019-12-23   |      3
  9 |           4 |        2 | 2019-09-16   |      5
 10 |           6 |        5 | 2019-09-14   |      2
 11 |           6 |        6 | 2020-01-14   |      5
 12 |           8 |        4 | 2020-02-01   |      3
 13 |           8 |        5 | 2020-01-03   |      7
 14 |           8 |        8 | 2019-12-25   |      4
  1 |           1 |        1 | 2019-10-01   |      5
  2 |           1 |        1 | 2019-12-10   |      5
(14 filas)


-- Exercise 4:
----- * 4.1.- Delete the booking of customer ID 8 for the date 2020-01-03
DELETE FROM bookings WHERE customer_id = 8 AND checkin_date = '2020-01-03';
-- Verificamos:
SELECT * FROM bookings;
 id | customer_id | hotel_id | checkin_date | nights
----+-------------+----------+--------------+--------
  3 |           1 |        3 | 2019-07-20   |      4
  4 |           2 |        3 | 2020-03-10   |      4
  5 |           2 |        5 | 2020-04-01   |      1
  6 |           3 |        1 | 2019-11-01   |      1
  7 |           3 |        2 | 2019-11-23   |      2
  8 |           4 |        8 | 2019-12-23   |      3
  9 |           4 |        2 | 2019-09-16   |      5
 10 |           6 |        5 | 2019-09-14   |      2
 11 |           6 |        6 | 2020-01-14   |      5
 12 |           8 |        4 | 2020-02-01   |      3
 14 |           8 |        8 | 2019-12-25   |      4
  1 |           1 |        1 | 2019-10-01   |      5
  2 |           1 |        1 | 2019-12-10   |      5
(13 filas)


----- * 4.2.- Delete all the bookings of customer ID 6
DELETE FROM bookings WHERE customer_id = 6;
-- Verificamos:
 SELECT * FROM bookings;
 id | customer_id | hotel_id | checkin_date | nights
----+-------------+----------+--------------+--------
  3 |           1 |        3 | 2019-07-20   |      4
  4 |           2 |        3 | 2020-03-10   |      4
  5 |           2 |        5 | 2020-04-01   |      1
  6 |           3 |        1 | 2019-11-01   |      1
  7 |           3 |        2 | 2019-11-23   |      2
  8 |           4 |        8 | 2019-12-23   |      3
  9 |           4 |        2 | 2019-09-16   |      5
 12 |           8 |        4 | 2020-02-01   |      3
 14 |           8 |        8 | 2019-12-25   |      4
  1 |           1 |        1 | 2019-10-01   |      5
  2 |           1 |        1 | 2019-12-10   |      5
(11 filas)


----- * 4.3.- Delete the customer with ID 6
SELECT * FROM customers;
 id |       name       |           email            |       address        |    city    | postcode | country
----+------------------+----------------------------+----------------------+------------+----------+---------
  1 | John Smith       | j.smith@johnsmith.org      | 11 New Road          | Liverpool  | L10 2AB  | UK
  2 | Sue Jones        | s.jones1234@gmail.com      | 120 Old Street       | London     | N10 3CD  | UK
  3 | Alice Evans      | alice.evans001@hotmail.com | 3 High Road          | Manchester | m13 4ef  | UK
  4 | Mohammed Trungpa | mo.trungpa@hotmail.com     | 25 Blue Road         | Manchester | M25 6GH  | UK
  5 | Steven King      | steve.king123@hotmail.com  | 19 Bed Street        | Newtown    | xy2 3ac  | UK
  7 | Melinda Marsh    | mel.marsh-123@gmail.com    | 7 Preston Road       | Oldham     | OL3 5XZ  | UK
  8 | Mart├¡n Sommer   | martin.sommer@dfgg.net     | C/ Romero, 33        | Madrid     | 28016    | Spain
  9 | Laurence Lebihan | laurence.lebihan@xmzx.net  | 12, rue des Bouchers | Marseille  | 13008    | France
 10 | Keith Stewart    | keith.stewart@gmail.com    | 84 Town Lane         | Tadworth   | td5 7ng  | UK
  6 | Nadia Sethuraman | nadia.sethuraman@mail.com  | 2 Blue Street        | Glasgow    | G11ABC   | UK
(10 filas)

DELETE FROM customers WHERE id = 6;
-- Verificamos:
SELECT * FROM customers;
 id |       name       |           email            |       address        |    city    | postcode | country
----+------------------+----------------------------+----------------------+------------+----------+---------
  1 | John Smith       | j.smith@johnsmith.org      | 11 New Road          | Liverpool  | L10 2AB  | UK
  2 | Sue Jones        | s.jones1234@gmail.com      | 120 Old Street       | London     | N10 3CD  | UK
  3 | Alice Evans      | alice.evans001@hotmail.com | 3 High Road          | Manchester | m13 4ef  | UK
  4 | Mohammed Trungpa | mo.trungpa@hotmail.com     | 25 Blue Road         | Manchester | M25 6GH  | UK
  5 | Steven King      | steve.king123@hotmail.com  | 19 Bed Street        | Newtown    | xy2 3ac  | UK
  7 | Melinda Marsh    | mel.marsh-123@gmail.com    | 7 Preston Road       | Oldham     | OL3 5XZ  | UK
  8 | Mart├¡n Sommer   | martin.sommer@dfgg.net     | C/ Romero, 33        | Madrid     | 28016    | Spain
  9 | Laurence Lebihan | laurence.lebihan@xmzx.net  | 12, rue des Bouchers | Marseille  | 13008    | France
 10 | Keith Stewart    | keith.stewart@gmail.com    | 84 Town Lane         | Tadworth   | td5 7ng  | UK
(9 filas)




