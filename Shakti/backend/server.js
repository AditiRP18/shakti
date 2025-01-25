// backend/server.js
const express = require('express');
const connectDB = require('./database/connection');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 5000;


app.use(cors());
app.use(express.json());


connectDB();


app.get('/', (req, res) => {
  res.send('Women\'s Safety Network API');
});


app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});