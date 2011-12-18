mongoose = require("mongoose")

Schema = mongoose.Schema
embedsSchema = new Schema(
  src: String
  createdAt: { type: Date, 'default': Date.now }
)

module.exports = embedsSchema