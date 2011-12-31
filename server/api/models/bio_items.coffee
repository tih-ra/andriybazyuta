mongoose = require("mongoose")

Schema = mongoose.Schema
bio_itemsSchema = new Schema(
  date: Date
  description: String
)

module.exports = bio_itemsSchema