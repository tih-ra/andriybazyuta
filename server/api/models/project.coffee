mongoose = require("mongoose")
app = Andriybazyuta = process['Andriybazyuta']

Schema = mongoose.Schema
postSchema = new Schema(
  title: String
  description: String
  body: String
)

module.exports = app.db.model("Project", postSchema)