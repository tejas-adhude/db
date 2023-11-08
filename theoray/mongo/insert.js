//use database
use database_name

//show database
show dbs

//show collections
show collection

// add one Element
db.items.insertOne({name:"tejas",roll:01,branch:"computer"})

// add amny Element
db.items.insertMany([{name:"rohit",branch:"bca"},{name:"anurag",roll:"12",branch:"bcs"}])

//find all element
db.items.find()

//find using speacified quiry
db.items.find({key:value})