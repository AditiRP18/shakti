const mongoose = require('mongoose');

// Set MongoDB URI based on environment
const MONGO_URI =
  process.env.NODE_ENV === 'production'
    ? process.env.MONGO_PROD_URI
    : process.env.MONGO_DEV_URI || 'mongodb://localhost:27017/womens-safety-network';

// Function to connect to MongoDB
const connectToDatabase = async () => {
  try {
    await mongoose.connect(MONGO_URI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
      poolSize: 10, // Maintain up to 10 socket connections for better performance
    });

    console.log(`Connected to MongoDB in ${process.env.NODE_ENV || 'development'} mode`);
  } catch (error) {
    console.error('Error connecting to MongoDB:', error.message);

    // Exit the process if the connection fails
    process.exit(1);
  }

  // Event listeners for connection monitoring
  mongoose.connection.on('connected', () => {
    console.log('Mongoose connected to MongoDB');
  });

  mongoose.connection.on('error', (err) => {
    console.error('Mongoose connection error:', err);
  });

  mongoose.connection.on('disconnected', () => {
    console.log('Mongoose disconnected from MongoDB');
  });
};

// Export the connection function
module.exports = connectToDatabase;
