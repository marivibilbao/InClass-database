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

// GET - /bookings/:customerId 
app.get("/bookings/:customerId", function (req, res) {
  const customerId = req.params.customerId;
  pool
    .query("SELECT bookings.checkin_date, bookings.nights, hotels.name, hotels.postcode FROM bookings JOIN customers ON bookings.customer_id=$1 JOIN hotels ON bookings.hotel_id=hotels.id", [customerId])
    .then((result) => res.json(result.rows))
    .catch((e) => console.error(e));
});

// Exercise 3:
// UPDATE / PATCH
app.patch('/customers/:customerId', function (req, res) {
  let customer_id = parseInt(req.params.customerId)
  let { name, email, address, city, postcode, country } = req.body
  let values = [name, email, address, city, postcode, country, customer_id]
  const selectCustomerById = `SELECT * FROM customers WHERE id = $1`;
  const updateCustomer = `PATCH customers SET name = $1, email = $2, address = $3, city = $4, postcode = $5, country = $6 WHERE id = $7`;

  pool.connect((err, client, release) => {
      if (err) {
          res.send('Error acquiring client')
      }
      client.query(selectCustomerById, [customer_id], (err, result) => {
          if (err) {
              res.send('Error excecuting query.')
          } 
          if (result.rowCount < 1) {
              res.send('The customer with this id does not exist.')
          }
          client.query(updateCustomer, values, (err, result) => {
              res.status(201).send('The customer was updated.')
          });
      });
  });
});

// Exercise 4:
// DELETE /customers/:customerId
app.delete("/customers/:customerId", function (req, res) {
  const customerId = req.params.customerId;

  pool
    .query("DELETE FROM bookings WHERE customer_id=$1", [customerId])
    .then(() => {
      pool
        .query("DELETE FROM customers WHERE id=$1", [customerId])
        .then(() => res.send(`Customer ${customerId} deleted!`))
        .catch((e) => console.error(e));
    })
    .catch((e) => console.error(e));
});

// DELETE /hotels/:hotelId
app.delete("/hotels/:hotelId", function (req, res) {
  const hotelId = req.params.hotelId;

  pool
    .query("DELETE FROM bookings WHERE hotel_id=$1", [hotelId])
    .then(() => {
      pool
        .query("DELETE FROM hotels WHERE id=$1", [hotelId])
        .then(() => res.send(`Hotel ${hotelId} deleted!`))
        .catch((e) => console.error(e));
    })
    .catch((e) => console.error(e));
});


app.listen(3000, function () {
    console.log("Server is listening on port 3000. Ready to accept requests!");
});

