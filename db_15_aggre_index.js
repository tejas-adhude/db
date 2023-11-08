use myDatabase

db.createCollection("books")

db.books.insertMany([
  {
    title: "The Mahabharata",
    author: "Ved Vyasa",
    genre: "Mythology",
    published_year: -700,
    rating: 4.9
  },
  {
    title: "The Discovery of India",
    author: "Jawaharlal Nehru",
    genre: "Non-fiction",
    published_year: 1946,
    rating: 4.6
  },
  {
    title: "Arthashastra",
    author: "Chanakya",
    genre: "Philosophy",
    published_year: -300,
    rating: 4.7
  },
  {
    title: "The Guide",
    author: "R.K. Narayan",
    genre: "Fiction",
    published_year: 1958,
    rating: 4.4
  },
  {
    title: "Train to Pakistan",
    author: "Khushwant Singh",
    genre: "Historical Fiction",
    published_year: 1956,
    rating: 4.5
  }
])

db.books.aggregate([
  {
    $group: {
      _id: "$genre",
      avgRating: { $avg: "$rating" }
    }
  }
])

db.books.createIndex({ published_year: 1 })

db.books.find({ published_year: { $gt: 1950 } }).explain("executionStats")
