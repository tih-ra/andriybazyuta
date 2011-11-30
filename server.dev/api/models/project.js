(function() {
  var Andriybazyuta, Items, Schema, app, mongoose, postSchema;
  Items = require('models/items.js');
  mongoose = require("mongoose");
  app = Andriybazyuta = process['Andriybazyuta'];
  Schema = mongoose.Schema;
  postSchema = new Schema({
    title: String,
    description: String,
    body: String,
    items: [Items]
  });
  module.exports = app.db.model("Project", postSchema);
}).call(this);
