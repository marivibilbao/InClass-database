-- Ejecutamos en la consola lo siguiente:
mkdir cyf-hotels-api && cd cyf-hotels-api && npm init

npm install express
npm install pg

-- Se crea archivo:
server.js

-- Dentro del archivo server.js se coloca lo siguiente:
const express = require("express");
const app = express();
const { Pool } = require("pg");

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "cyf_hotels",
  password: "",
  port: 5432,
});

app.get("/hotels", function (req, res) {
  pool
    .query("SELECT * FROM hotels")
    .then((result) => res.json(result.rows))
    .catch((e) => console.error(e));
});

app.listen(3000, function () {
  console.log("Server is listening on port 3000. Ready to accept requests!");
});

-- Realizamos prueba con:
http://localhost:3000/hotels

-- En la base de datos se ejecuta:
INSERT INTO hotels (name, rooms, postcode) VALUES ('New Hotel', 5, 'ABC001');

-- Ejecutamos en la consola lo siguiente:
npm install --save body-parser

-- Se incluye en el server.js:
const bodyParser = require("body-parser");
app.use(bodyParser.json());

-- Se añade en server.js lo siguiente, para crear un nuevo hotel:
app.post("/hotels", function (req, res) {
  const newHotelName = req.body.name;
  const newHotelRooms = req.body.rooms;
  const newHotelPostcode = req.body.postcode;

  if (!Number.isInteger(newHotelRooms) || newHotelRooms <= 0) {
    return res
      .status(400)
      .send("The number of rooms should be a positive integer.");
  }

  pool
    .query("SELECT * FROM hotels WHERE name=$1", [newHotelName])
    .then((result) => {
      if (result.rows.length > 0) {
        return res
          .status(400)
          .send("An hotel with the same name already exists!");
      } else {
        const query =
          "INSERT INTO hotels (name, rooms, postcode) VALUES ($1, $2, $3)";
        pool
          .query(query, [newHotelName, newHotelRooms, newHotelPostcode])
          .then(() => res.send("Hotel created!"))
          .catch((e) => console.error(e));
      }
    });
});

-- Exercise 1:
-- Utilizando postman y archivo server.js agrego metodo POST/hotels y POST/Customers, 
-- los resultados se encuentran en la carpeta de imágenes.
http://localhost:3000/hotels
{
    "name": "Caracas Hotel",
    "rooms": 4,
    "postcode": "08094"
}

http://localhost:3000/customers
{
    "name": "Maria Victoria Bilbao",
    "email": "marivibilbao@gmail.com",
    "address": "Carrer dels Enamorats",
    "city": "Barcelona",
    "postcode": "08013",
    "country": "España"
}

-- Exercise 2:
-- En el archivo server.js se añade código para realizar la búsqueda por ID y se adjunta imagen


