Items = require('models/items.js');
Videos = require('models/videos.js');

mongoose = require("mongoose")
app = Andriybazyuta = process['Andriybazyuta']

Schema = mongoose.Schema
postSchema = new Schema(
  title: String
  description: String
  body: String
  items: [Items]
  videos: [Videos]
)

module.exports = app.db.model("Project", postSchema)