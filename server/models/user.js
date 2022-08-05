const mongoose = require("mongoose");
const { courseSchema } = require("./course");

const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
    validate: {
      validator: function (value) {
        const re =
          /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return value.match(re);
      },
      message: "البريد الإلكتروني غير صالح",
    },
  },
  phone: {
    type: String,
    required: true,
    validate: {
      validator: function (value) {
        return value.length === 11 || value.length <= 15;
      },
      message: "رقم الجوال غير صالح",
    },
  },
  password: {
    type: String,
    required: true,
    validate: {
      validator: function (value) {
        return value.length >= 8;
      },
      message: "كلمة المرور يجب أن تكون 8 أرقام على الأقل",
    },
  },
  confirmPassword: {
    type: String,
    required: true,
  },
  address: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    default: "student",
  },
  profilePicture: {
    type: String,
    default:
      "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png",
  },
  courses: [courseSchema],
});

const User = mongoose.model("User", userSchema);

module.exports = User;
