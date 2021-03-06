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

-- JOIN:
SELECT A.column1, B.column2 FROM A INNER JOIN B ON A.b_id=B.id;

-- Para cargar todas las reservas junto con los datos del cliente y los datos del hotel:
SELECT * FROM bookings
cyf_hotels-# INNER JOIN customers ON customers.id=bookings.customer_id
cyf_hotels-# INNER JOIN hotels ON hotels.id=bookings.hotel_id;
 id | customer_id | hotel_id | checkin_date | nights | id |       name       |           email            |    address     |    city    | postcode | country | id |           name           | rooms | postcode
----+-------------+----------+--------------+--------+----+------------------+----------------------------+----------------+------------+----------+---------+----+--------------------------+-------+----------
  3 |           1 |        3 | 2019-07-20   |      4 |  1 | John Smith       | j.smith@johnsmith.org      | 11 New Road    | Liverpool  | L10 2AB  | UK      |  3 | Pleasant Mountain Hotel  |     7 | ABCDE1
  4 |           2 |        3 | 2020-03-10   |      4 |  2 | Sue Jones        | s.jones1234@gmail.com      | 120 Old Street | London     | N10 3CD  | UK      |  3 | Pleasant Mountain Hotel  |     7 | ABCDE1
  5 |           2 |        5 | 2020-04-01   |      1 |  2 | Sue Jones        | s.jones1234@gmail.com      | 120 Old Street | London     | N10 3CD  | UK      |  5 | Jade Peaks Hotel         |     4 | DGQ127
  6 |           3 |        1 | 2019-11-01   |      1 |  3 | Alice Evans      | alice.evans001@hotmail.com | 3 High Road    | Manchester | m13 4ef  | UK      |  1 | Golden Cavern Resort     |    10 | L10ABC
  7 |           3 |        2 | 2019-11-23   |      2 |  3 | Alice Evans      | alice.evans001@hotmail.com | 3 High Road    | Manchester | m13 4ef  | UK      |  2 | Elder Lake Hotel         |     5 | L10XYZ
  8 |           4 |        8 | 2019-12-23   |      3 |  4 | Mohammed Trungpa | mo.trungpa@hotmail.com     | 25 Blue Road   | Manchester | M25 6GH  | UK      |  8 | Snowy Echo Motel         |    15 | AYD189
  9 |           4 |        2 | 2019-09-16   |      5 |  4 | Mohammed Trungpa | mo.trungpa@hotmail.com     | 25 Blue Road   | Manchester | M25 6GH  | UK      |  2 | Elder Lake Hotel         |     5 | L10XYZ
 12 |           8 |        4 | 2020-02-01   |      3 |  8 | Mart├¡n Sommer   | martin.sommer@dfgg.net     | C/ Romero, 33  | Madrid     | 28016    | Spain   |  4 | Azure Crown Resort & Spa |    18 | DGQ127
 14 |           8 |        8 | 2019-12-25   |      4 |  8 | Mart├¡n Sommer   | martin.sommer@dfgg.net     | C/ Romero, 33  | Madrid     | 28016    | Spain   |  8 | Snowy Echo Motel         |    15 | AYD189
  1 |           1 |        1 | 2019-10-01   |      5 |  1 | John Smith       | j.smith@johnsmith.org      | 11 New Road    | Liverpool  | L10 2AB  | UK      |  1 | Golden Cavern Resort     |    10 | L10ABC
  2 |           1 |        1 | 2019-12-10   |      5 |  1 | John Smith       | j.smith@johnsmith.org      | 11 New Road    | Liverpool  | L10 2AB  | UK      |  1 | Golden Cavern Resort     |    10 | L10ABC
(11 filas)
-- Más  --

-- Para cargar las fechas de registro de la reserva para el ID de cliente 1 junto con el nombre del cliente y el nombre del hotel:
SELECT bookings.checkin_date,customers.name,hotels.name FROM bookings
cyf_hotels-# INNER JOIN customers ON customers.id=bookings.customer_id
cyf_hotels-# INNER JOIN hotels ON hotels.id=bookings.hotel_id
cyf_hotels-# WHERE customers.id=1;
 checkin_date |    name    |          name
--------------+------------+-------------------------
 2019-12-10   | John Smith | Golden Cavern Resort
 2019-10-01   | John Smith | Golden Cavern Resort
 2019-07-20   | John Smith | Pleasant Mountain Hotel
(3 filas)


-- Exercise 5:
----- * 5.1.- Try and understand each of the queries above in your psql prompt
----- * 5.2.- Retrieve all the bookings along with customer data for bookings starting in 2020
SELECT * FROM customers 
INNER JOIN bookings ON customers.id=bookings.customer_id WHERE bookings.checkin_date > '2020-01-01';
 id |      name      |         email          |    address     |  city  | postcode | country | id | customer_id | hotel_id | checkin_date | nights
----+----------------+------------------------+----------------+--------+----------+---------+----+-------------+----------+--------------+--------
  2 | Sue Jones      | s.jones1234@gmail.com  | 120 Old Street | London | N10 3CD  | UK      |  4 |           2 |        3 | 2020-03-10   |      4
  2 | Sue Jones      | s.jones1234@gmail.com  | 120 Old Street | London | N10 3CD  | UK      |  5 |           2 |        5 | 2020-04-01   |      1
  8 | Mart├¡n Sommer | martin.sommer@dfgg.net | C/ Romero, 33  | Madrid | 28016    | Spain   | 12 |           8 |        4 | 2020-02-01   |      3
(3 filas)


----- * 5.3.- Retrieve the customer names, booking start dates and number of nights for all customers who booked the hotel name Jade Peaks Hotel 
SELECT * FROM bookings 
INNER JOIN customers ON customers.id=bookings.customer_id INNER JOIN hotels ON hotels.id=bookings.hotel_id WHERE hotels.id=5;
 id | customer_id | hotel_id | checkin_date | nights | id |   name    |         email         |    address     |  city  | postcode | country | id |       name       | rooms | postcode
----+-------------+----------+--------------+--------+----+-----------+-----------------------+----------------+--------+----------+---------+----+------------------+-------+----------
  5 |           2 |        5 | 2020-04-01   |      1 |  2 | Sue Jones | s.jones1234@gmail.com | 120 Old Street | London | N10 3CD  | UK      |  5 | Jade Peaks Hotel |     4 | DGQ127
(1 fila)


----- * 5.4.- Retrieve all the booking start dates with customer names and hotel names for all bookings for more than 5 nights
SELECT * FROM bookings 
INNER JOIN customers ON customers.id=bookings.customer_id 
INNER JOIN hotels ON hotels.id=bookings.hotel_id WHERE bookings.nights > 5;
 id | customer_id | hotel_id | checkin_date | nights | id | name | email | address | city | postcode | country | id | name | rooms | postcode
----+-------------+----------+--------------+--------+----+------+-------+---------+------+----------+---------+----+------+-------+----------
(0 filas)


-- Returning all customers whose ID is 1, 2, 3 or 4:
SELECT * FROM customers WHERE id IN (1,2,3,4);
 id |       name       |           email            |    address     |    city    | postcode | country
----+------------------+----------------------------+----------------+------------+----------+---------
  1 | John Smith       | j.smith@johnsmith.org      | 11 New Road    | Liverpool  | L10 2AB  | UK
  2 | Sue Jones        | s.jones1234@gmail.com      | 120 Old Street | London     | N10 3CD  | UK
  3 | Alice Evans      | alice.evans001@hotmail.com | 3 High Road    | Manchester | m13 4ef  | UK
  4 | Mohammed Trungpa | mo.trungpa@hotmail.com     | 25 Blue Road   | Manchester | M25 6GH  | UK
(4 filas)


-- Query by pattern matching, for example retrieve all customers whose name starts with Bob:
SELECT * FROM customers WHERE name LIKE 'Bob%';
 id | name | email | address | city | postcode | country
----+------+-------+---------+------+----------+---------
(0 filas)


-- If you want to retrieve all the booking start dates with the customer names and hotel names for customer names starting with the letter M ordered by hotel name with a limit of 3 results:
SELECT bookings.checkin_date,customers.name,hotels.name FROM bookings
INNER JOIN customers ON customers.id=bookings.customer_id
INNER JOIN hotels ON hotels.id=bookings.hotel_id
WHERE customers.name LIKE 'M%'
ORDER BY hotels.name
LIMIT 3;
 checkin_date |       name       |           name
--------------+------------------+--------------------------
 2020-02-01   | Mart├¡n Sommer   | Azure Crown Resort & Spa
 2019-09-16   | Mohammed Trungpa | Elder Lake Hotel
 2019-12-23   | Mohammed Trungpa | Snowy Echo Motel
(3 filas)


-- Exercise 6:
----- * 6.1.- Retrieve all customers whose name starts with the letter S.
SELECT * FROM customers WHERE name LIKE 'S%';
 id |    name     |           email           |    address     |  city   | postcode | country
----+-------------+---------------------------+----------------+---------+----------+---------
  2 | Sue Jones   | s.jones1234@gmail.com     | 120 Old Street | London  | N10 3CD  | UK
  5 | Steven King | steve.king123@hotmail.com | 19 Bed Street  | Newtown | xy2 3ac  | UK
(2 filas)


----- * 6.2.- Retrieve all hotels which have the word Hotel in their name.
SELECT * FROM hotels WHERE name LIKE '%Hotel';
 id |          name           | rooms | postcode
----+-------------------------+-------+----------
  3 | Pleasant Mountain Hotel |     7 | ABCDE1
  5 | Jade Peaks Hotel        |     4 | DGQ127
  2 | Elder Lake Hotel        |     5 | L10XYZ
  7 | Cozy Hotel              |    25 | AYD189
(4 filas)


----- * 6.3.- Retrieve the booking start date, customer name, hotel name for the top 5 bookings ordered by number of nights in descending order.
SELECT bookings.checkin_date,customers.name,hotels.name FROM bookings
INNER JOIN customers ON customers.id=bookings.customer_id
INNER JOIN hotels ON hotels.id=bookings.hotel_id
ORDER BY bookings.nights DESC LIMIT 5;
checkin_date |       name       |          name
--------------+------------------+-------------------------
 2019-12-10   | John Smith       | Golden Cavern Resort
 2019-09-16   | Mohammed Trungpa | Elder Lake Hotel
 2019-10-01   | John Smith       | Golden Cavern Resort
 2019-07-20   | John Smith       | Pleasant Mountain Hotel
 2020-03-10   | Sue Jones        | Pleasant Mountain Hotel
(5 filas)














