mongoose = require("mongoose")
app = Andriybazyuta = process['Andriybazyuta']

Schema = mongoose.Schema
postSchema = new Schema(
  slug: String
  title: String
  description: String
  address: String
  file: String
  embed: String
)

module.exports = app.db.model("Main", postSchema)