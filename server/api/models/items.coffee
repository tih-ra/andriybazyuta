mongoose = require("mongoose")

Schema = mongoose.Schema
itemsSchema = new Schema(
  file: String
)

module.exports = itemsSchema