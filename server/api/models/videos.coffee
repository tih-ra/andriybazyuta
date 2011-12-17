mongoose = require("mongoose")

Schema = mongoose.Schema
videosSchema = new Schema(
  vimeo_id: Number
)

module.exports = videosSchema