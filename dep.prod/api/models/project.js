(function() {
  var Andriybazyuta, Embeds, Items, Schema, Videos, app, mongoose, postSchema;
  Items = require('models/items.js');
  Videos = require('models/videos.js');
  Embeds = require('models/embeds.js');
  mongoose = require("mongoose");
  app = Andriybazyuta = process['Andriybazyuta'];
  Schema = mongoose.Schema;
  postSchema = new Schema({
    title: String,
    description: String,
    body: String,
    createdAt: {
      type: Date,
      'default': Date.now
    },
    items: [Items],
    videos: [Videos],
    embeds: [Embeds]
  });
  module.exports = app.db.model("Project", postSchema);
}).call(this);
