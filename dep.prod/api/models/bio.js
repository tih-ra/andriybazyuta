(function() {
  var Andriybazyuta, Items, Schema, app, mongoose, postSchema;
  Items = require('models/bio_items.js');
  mongoose = require("mongoose");
  app = Andriybazyuta = process['Andriybazyuta'];
  Schema = mongoose.Schema;
  postSchema = new Schema({
    title: String,
    body: String,
    items: [Items]
  });
  module.exports = app.db.model("Bio", postSchema);
}).call(this);
