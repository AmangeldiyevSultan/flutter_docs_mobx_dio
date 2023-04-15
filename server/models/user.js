const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  name: {
    type: String,
    required: false,
  },
  email: {
    type: String,
    required: true,
  },
  profilePic: {
    type: String,
    required: false,
  },
});

const User = mongoose.model("User", userSchema);
module.exports = User;  