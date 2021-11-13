const express = require("express");
const app = express();

const bodyParser = require("body-parser");
app.use(bodyParser.json());

const { Pool } = require("pg");

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "cyf_hotels",
  password: "123456",
  port: 5432,
});

// En donde dice password si se coloca, te carga correctamente los datos

//--------------------------------------------------------------------------------
// GET - Hotels
// app.get("/hotels", function (req, res) {
//   pool
//     .query("SELECT * FROM hotels")
//     .then((result) => res.json(result.rows))
//     .catch((e) => console.error(e));
// });
//--------------------------------------------------------------------------------

// Exercise 1:
//POST - Hotels
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

//--------------------------------------------------------------------------------
// GET - Customers
// app.get("/customers", function (req, res) {
//     pool
//       .query("SELECT * FROM customers")
//       .then((result) => res.json(result.rows))
//       .catch((e) => console.error(e));
// });
//--------------------------------------------------------------------------------

// POST - Customers
// app.post("/customers", function (req, res) {
//     const newCustomerName = req.body.name;
//     const newCustomerEmail = req.body.email;
//     const newCustomerAddress = req.body.address;
//     const newCustomerCity = req.body.city;
//     const newCustomerPostcode = req.body.postcode;
//     const newCustomerCountry = req.body.country;
  
//     const query =
//     "INSERT INTO customers (name, email, address, city, postcode, country) VALUES ($1, $2, $3, $4, $5, $6)";
  
//     pool
//       .query(query, [newCustomerName, newCustomerEmail, newCustomerAddress, newCustomerCity, newCustomerPostcode, newCustomerCountry])
//       .then(() => res.send("Customer created!"))
//       .catch((e) => console.error(e));
// });
//--------------------------------------------------------------------------------

app.post("/customers", function (req, res) {
    const newCustomerName = req.body.name;
    const newCustomerEmail = req.body.email;
    const newCustomerAddress = req.body.address;
    const newCustomerCity = req.body.city;
    const newCustomerPostcode = req.body.postcode;
    const newCustomerCountry = req.body.country;

pool
    .query("SELECT * FROM customers WHERE name=$1", [newCustomerName])
    .then((result) => {
      if (result.rows.length > 0) {
        return res
          .status(400)
          .send("A customers with the same name already exists!");
      } else {
        const query =
        "INSERT INTO customers (name, email, address, city, postcode, country) VALUES ($1, $2, $3, $4, $5, $6)";
        pool
          .query(query, [newCustomerName, newCustomerEmail, newCustomerAddress, newCustomerCity, newCustomerPostcode, newCustomerCountry])
          .then(() => res.send("Customer created!"))
          .catch((e) => console.error(e));
      }
    });
});

//--------------------------------------------------------------------------------
// GET - Hotels --->> Ordenados por orden
// app.get("/hotels", function (req, res) {
//     pool
//       .query("SELECT * FROM hotels ORDER BY name")
//       .then((result) => res.json(result.rows))
//       .catch((e) => console.error(e));
// });
//--------------------------------------------------------------------------------

// GET - Hotels ---->> Filtrar el hotel con una palabra clave
app.get("/hotels", function (req, res) {
    const hotelNameQuery = req.query.name;
    let query = `SELECT * FROM hotels ORDER BY name`;
  
    if (hotelNameQuery) {
      query = `SELECT * FROM hotels WHERE name LIKE '%${hotelNameQuery}%' ORDER BY name`;
    }
  
    pool
      .query(query)
      .then((result) => res.json(result.rows))
      .catch((e) => console.error(e));
});

// Exercise 2:
// GET - Hotels ---->> Filtrar sólo por un ID específico
app.get("/hotels/:hotelId", function (req, res) {
    const hotelId = req.params.hotelId;
  
    pool
      .query("SELECT * FROM hotels WHERE id=$1", [hotelId])
      .then((result) => res.json(result.rows))
      .catch((e) => console.error(e));
});

// GET - Customers ---->> Ordenados por nombre
app.get("/customers", function (req, res) {
    const customerNameQuery = req.query.name;
    let query = `SELECT * FROM customers ORDER BY name`;
  
    if (customerNameQuery) {
      query = `SELECT * FROM customers WHERE name LIKE '%${customerNameQuery}%' ORDER BY name`;
    }
  
    pool
      .query(query)
      .then((result) => res.json(result.rows))
      .catch((e) => console.error(e));
});

// GET - Customers ---->> Filtrar sólo por un ID específico
app.get("/customers/:customerId", function (req, res) {
    const customerId = req.params.customerId;
  
    pool
      .query("SELECT * FROM customers WHERE id=$1", [customerId])
      .then((result) => res.json(result.rows))
      .catch((e) => console.error(e));
});

// ------------------- REVISAR
// GET - Customers ----->> customerId/bookings
app.get("/customers/:customerId/bookings", function (req, res){
    const customerId = req.params.customerId;
    const bookings = req.params.bookings;

    pool
    .query("SELECT * FROM customers WHERE id=$1", [customerId, bookings])
    .then((result) => res.json(result.rows))
    .catch((e) => console.error(e));    
});

// ------------------- REVISAR
// Exercise 3:
// UPDATE / PATCH
app.patch("/customers/:customerId", function (req, res) {
  const customerId = req.params.customerId;
  const newEmail = req.body.email;

  pool
    .query("UPDATE customers SET email=$1 WHERE id=$2", [newEmail, customerId])
    .then(() => res.send(`Customer ${customerId} updated!`))
    .catch((e) => console.error(e));
});







app.listen(3000, function () {
    console.log("Server is listening on port 3000. Ready to accept requests!");
});

