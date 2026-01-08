// Use or create database
use fleximart_nosql;

// ----------------------------
// Operation 1: Load Data
// ----------------------------

db.products.insertMany([
  {
    product_id: "ELEC001",
    name: "Samsung Galaxy S21",
    category: "Electronics",
    price: 79999,
    stock: 150,
    specs: { ram: "8GB", storage: "128GB" },
    reviews: [
      { user: "U001", rating: 5, comment: "Great!", date: ISODate("2024-01-15") }
    ]
  }
]);