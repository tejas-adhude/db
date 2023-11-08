use sampleDB

db.createCollection("sampleCollection")

db.sampleCollection.insertMany([
    { "name": "Aarav", "age": 25, "score": 80 },
    { "name": "Aditi", "age": 30, "score": 75 },
    { "name": "Rohan", "age": 27, "score": 90 },
    { "name": "Dia", "age": 35, "score": 85 },
    { "name": "Isha", "age": 28, "score": 95 }
])

var mapFunction = function() {
    emit(this.age, this.score);
};

var reduceFunction = function(key, values) {
    return Array.avg(values);
};

var mapReduceResult = db.sampleCollection.mapReduce(
    mapFunction,
    reduceFunction,
    {
        out: "avg_score_by_age"
    }
);

db.avg_score_by_age.find()
