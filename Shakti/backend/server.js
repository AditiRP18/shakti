require('dotenv').config(); // Load environment variables from .env file
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const connectToDatabase = require('./database/mongodb-config');

// Import route files
const emergencyRoutes = require('./routes/emergency');
const forumRoutes = require('./routes/forum');
const safetyMapRoutes = require('./routes/safety-map');

// Initialize Express app
const app = express();

// Middleware
app.use(cors()); // Enable Cross-Origin Resource Sharing
app.use(bodyParser.json()); // Parse incoming JSON requests
app.use(bodyParser.urlencoded({ extended: true })); // Parse URL-encoded data

// Connect to MongoDB
connectToDatabase();

// Routes
app.use('/api/emergency', emergencyRoutes); // Routes for emergency features
app.use('/api/forum', forumRoutes);         // Routes for forum features
app.use('/api/safety-map', safetyMapRoutes); // Routes for safety map features

// Health check endpoint
app.get('/', (req, res) => {
  res.send('Women’s Safety Network Backend is running!');
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: 'Something went wrong!' });
});

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
