const mongoose = require("mongoose");
const ratingSchema = require("./rating");

const courseSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  price: {
    type: Number,
    required: true,
  },
  studentType: {
    type: String,
    required: true,
    trim: true,
  },
  image: {
    type: String,
    required: true,
  },
  appointments: [
    {
      type: String,
      required: true,
    },
  ],
  courseRate: [ratingSchema],
  instructorRate: [ratingSchema],
  comments: [
    {
      userId: {
        type: String,
        required: true,
      },
      comment: {
        type: String,
        required: true,
      },
    },
  ],
});

const Course = mongoose.model("Course", courseSchema);
module.exports = { Course, courseSchema };
