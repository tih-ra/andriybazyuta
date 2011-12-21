Items = require('models/items.js');
Embeds = require('models/embeds.js');

mongoose = require("mongoose")
app = Andriybazyuta = process['Andriybazyuta']

Schema = mongoose.Schema
postSchema = new Schema(
  slug: String
  title: String
  description: String
  address: String
  items: [Items]
  embeds: [Embeds]
)

module.exports = app.db.model("Main", postSchema)