use library

db.books.insertOne({
    "title": "The Great Gatsby",
    "author": "Vikram Seth",
    "genre": "Fiction"
})

db.books.insertMany([
    {
        "title": "To Kill a Mockingbird",
        "author": "Arundhati Roy",
        "genre": "Fiction"
    },
    {
        "title": "1984",
        "author": "Rabindranath Tagore",
        "genre": "Dystopian"
    },
    {
        "title": "The Catcher in the Rye",
        "author": "Jhumpa Lahiri",
        "genre": "Fiction"
    }
])

db.books.find()

db.books.find({ "genre": "Fiction" })

db.books.find({ "title": "The Great Gatsby" })

db.books.updateOne(
    { "title": "1984" },
    { $set: { "author": "R. K. Narayan" } }
)

db.books.deleteOne({ "title": "The Catcher in the Rye" })

db.books.deleteMany({ "genre": "Fiction" })
