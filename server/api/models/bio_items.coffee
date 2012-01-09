mongoose = require("mongoose")

Schema = mongoose.Schema
bio_itemsSchema = new Schema(
  eventedAt: { type: Date, 'default': Date.now }
  description: String
)

module.exports = bio_itemsSchema