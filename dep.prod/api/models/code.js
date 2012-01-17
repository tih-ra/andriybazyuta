(function() {
  var Andriybazyuta, Schema, app, mongoose, postSchema;
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
    link: String,
    languages: String
  });
  module.exports = app.db.model("Code", postSchema);
}).call(this);
