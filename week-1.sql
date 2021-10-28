--En el terminal se ejecutan los siguientes comandos:
psql -U postgres

-- Exercise 1
CREATE DATABASE cyf_hotels owner postgres;

\q

psql -U postgres cyf_hotels

CREATE TABLE customers (
cyf_hotels(#   id        SERIAL PRIMARY KEY,
cyf_hotels(#   name      VARCHAR(30) NOT NULL,
cyf_hotels(#   email     VARCHAR(120) NOT NULL,
cyf_hotels(#   address   VARCHAR(120),
cyf_hotels(#   city      VARCHAR(30),
cyf_hotels(#   postcode  VARCHAR(12),
cyf_hotels(#   country   VARCHAR(20)
cyf_hotels(# );

\d customers
-- Da como resultado:
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

CREATE TABLE hotels (
cyf_hotels(# id SERIAL PRIMARY KEY,
cyf_hotels(# name VARCHAR(30) NOT NULL,
cyf_hotels(# rooms VARCHAR(100),
cyf_hotels(# postcode VARCHAR(12)
cyf_hotels(# );

CREATE TABLE bookings (
cyf_hotels(#   id               SERIAL PRIMARY KEY,
cyf_hotels(#   customer_id      INT REFERENCES customers(id),
cyf_hotels(#   hotel_id         INT REFERENCES hotels(id),
cyf_hotels(#   checkin_date     DATE NOT NULL,
cyf_hotels(#   nights           INT NOT NULL
cyf_hotels(# );

-- Exercise 2
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('John Smith','j.smith@johnsmith.org','11 New Road','Liverpool','L10 2AB','UK');

INSERT INTO hotels (name, rooms, postcode) VALUES ('Triple Point Hotel', 10, 'CM194JS');

INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (1, 1, '2019-10-01', 2);

-- Exercise 3
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Maria Victoria Bilbao','marivibilbaog@gmail.com','Nou Barris','Barcelona','08042','España');

INSERT INTO hotels (name, rooms, postcode) VALUES ('Triple Point Hotel', 10, 'CM194JS');

INSERT INTO hotels (name, rooms, postcode) VALUES ('Royal Cosmos Hotel', 5, 'TR209AX');

INSERT INTO hotels (name, rooms, postcode) VALUES ('Pacific Petal Motel', 15, 'BN180TG');

-- Exercise 4
SELECT * FROM customers;
--Da como resultado lo siguiente:
 id |         name          |          email          |   address   |   city    | postcode | country
----+-----------------------+-------------------------+-------------+-----------+----------+---------
  1 | John Smith            | j.smith@johnsmith.org   | 11 New Road | Liverpool | L10 2AB  | UK
  2 | Maria Victoria Bilbao | marivibilbaog@gmail.com | Nou Barris  | Barcelona | 08042    | España
(2 filas)


SELECT * FROM hotels;
--Da como resultado lo siguiente:
 id |        name         | rooms | postcode
----+---------------------+-------+----------
  1 | Triple Point Hotel  | 10    | CM194JS
  2 | Triple Point Hotel  | 10    | CM194JS
  3 | Royal Cosmos Hotel  | 5     | TR209AX
  4 | Pacific Petal Motel | 15    | BN180TG
(4 filas)


SELECT * FROM bookings;
--Da como resultado lo siguiente:
 id | customer_id | hotel_id | checkin_date | nights
----+-------------+----------+--------------+--------
  1 |           1 |        1 | 2019-10-01   |      2
(1 fila)


SELECT name,address FROM customers;
--Da como resultado lo siguiente:
         name          |   address
-----------------------+-------------
 John Smith            | 11 New Road
 Maria Victoria Bilbao | Nou Barris
(2 filas)


SELECT * FROM hotels WHERE rooms > 7;
--Da como resultado lo siguiente:
ERROR:  el operador no existe: character varying > integer
LÍNEA 1: SELECT * FROM hotels WHERE rooms > 7;

---- El error aparecia porque hice mal la creación del valor de rooms y realice el siguiente paso:
ALTER TABLE hotels ALTER COLUMN rooms TYPE integer USING (trim(rooms)::integer);
---- Vuelvo a ejecutar y me aparece:
cyf_hotels=# SELECT * FROM hotels WHERE rooms > 7;
 id |        name         | rooms | postcode
----+---------------------+-------+----------
  1 | Triple Point Hotel  |    10 | CM194JS
  2 | Triple Point Hotel  |    10 | CM194JS
  4 | Pacific Petal Motel |    15 | BN180TG
(3 filas)


SELECT name,address FROM customers WHERE id = 1;
--Da como resultado lo siguiente:
    name    |   address
------------+-------------
 John Smith | 11 New Road
(1 fila)


SELECT * FROM bookings WHERE checkin_date > '2019/10/01';
--Da como resultado lo siguiente:
 id | customer_id | hotel_id | checkin_date | nights
----+-------------+----------+--------------+--------
(0 filas)


SELECT * FROM bookings WHERE checkin_date > '2019/10/01' AND nights >= 2;
--Da como resultado lo siguiente:
 id | customer_id | hotel_id | checkin_date | nights
----+-------------+----------+--------------+--------
(0 filas)


SELECT * FROM hotels WHERE postcode = 'CM194JS' OR postcode = 'TR209AX';
--Da como resultado lo siguiente:
 id |        name        | rooms | postcode
----+--------------------+-------+----------
  1 | Triple Point Hotel | 10    | CM194JS
  2 | Triple Point Hotel | 10    | CM194JS
  3 | Royal Cosmos Hotel | 5     | TR209AX
(3 filas)


-- Exercise 5
-- Descargamos el archivo y nos vamos a la ruta donde se encuentra y ejecutamos el comando:
psql -U postgres -d cyf_hotels -f cyf_hotels_exercise5.sql

SELECT * FROM customers WHERE name = Laurence;
                                              ^
cyf_hotels=# SELECT * FROM customers WHERE name = 'Laurence Lebihan';
 id |       name       |           email           |       address        |   city    | postcode | country
----+------------------+---------------------------+----------------------+-----------+----------+---------
  9 | Laurence Lebihan | laurence.lebihan@xmzx.net | 12, rue des Bouchers | Marseille | 13008    | France
(1 fila)


SELECT * FROM customers WHERE country = 'UK';
 id |       name       |           email            |     address      |    city    | postcode | country
----+------------------+----------------------------+------------------+------------+----------+---------
  1 | John Smith       | j.smith@johnsmith.org      | 11 New Road      | Liverpool  | L10 2AB  | UK
  2 | Sue Jones        | s.jones1234@gmail.com      | 120 Old Street   | London     | N10 3CD  | UK
  3 | Alice Evans      | alice.evans001@hotmail.com | 3 High Road      | Manchester | m13 4ef  | UK
  4 | Mohammed Trungpa | mo.trungpa@hotmail.com     | 25 Blue Road     | Manchester | M25 6GH  | UK
  5 | Steven King      | steve.king123@hotmail.com  | 19 Bed Street    | Newtown    | xy2 3ac  | UK
  6 | Nadia Sethuraman | nadia.sethuraman@mail.com  | 135 Green Street | Manchester | M10 4BG  | UK
  7 | Melinda Marsh    | mel.marsh-123@gmail.com    | 7 Preston Road   | Oldham     | OL3 5XZ  | UK
 10 | Keith Stewart    | keith.stewart@gmail.com    | 84 Town Lane     | Tadworth   | td5 7ng  | UK
(8 filas)


SELECT address, city, postcode FROM customers WHERE name = 'Melinda Marsh';
    address     |  city  | postcode
----------------+--------+----------
 7 Preston Road | Oldham | OL3 5XZ
(1 fila)


SELECT * FROM hotels WHERE postcode = 'DGQ127';
 id |           name           | rooms | postcode
----+--------------------------+-------+----------
  4 | Azure Crown Resort & Spa |    18 | DGQ127
  5 | Jade Peaks Hotel         |     4 | DGQ127
  6 | Elegant Resort           |    14 | DGQ127
(3 filas)


SELECT * FROM hotels WHERE rooms > 11;
 id |           name           | rooms | postcode
----+--------------------------+-------+----------
  4 | Azure Crown Resort & Spa |    18 | DGQ127
  6 | Elegant Resort           |    14 | DGQ127
  7 | Cozy Hotel               |    20 | AYD189
  8 | Snowy Echo Motel         |    15 | AYD189
(4 filas)


SELECT * FROM hotels WHERE rooms > 6 AND rooms < 15;
 id |          name           | rooms | postcode
----+-------------------------+-------+----------
  1 | Golden Cavern Resort    |    10 | L10ABC
  3 | Pleasant Mountain Hotel |     7 | ABCDE1
  6 | Elegant Resort          |    14 | DGQ127
(3 filas)


SELECT * FROM hotels WHERE rooms = 10  or rooms = 20;
 id |         name         | rooms | postcode
----+----------------------+-------+----------
  1 | Golden Cavern Resort |    10 | L10ABC
  7 | Cozy Hotel           |    20 | AYD189
(2 filas)


SELECT * FROM bookings WHERE id = 1;
 id | customer_id | hotel_id | checkin_date | nights
----+-------------+----------+--------------+--------
  1 |           1 |        1 | 2019-10-01   |      2
(1 fila)


SELECT * FROM bookings WHERE nights > 4 ;
 id | customer_id | hotel_id | checkin_date | nights
----+-------------+----------+--------------+--------
  2 |           1 |        1 | 2019-12-10   |      6
  9 |           4 |        2 | 2019-09-16   |      5
 11 |           6 |        6 | 2020-01-14   |      5
 13 |           8 |        5 | 2020-01-03   |      7
(4 filas)








