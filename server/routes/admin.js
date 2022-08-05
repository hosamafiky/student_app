const express = require("express");
const admin = require("../middlewares/admin");
const { Course } = require("../models/course");
const adminRouter = express.Router();

// Add Course
adminRouter.post("/api/admin/addcourse", admin, async (request, response) => {
  try {
    const { name, description, price, studentType, image, appointments } =
      request.body;
    let newCourse = new Course({
      name,
      description,
      price,
      studentType,
      image,
      appointments,
    });
    newCourse = await newCourse.save();
    response.json(newCourse);
  } catch (error) {
    response.status(500).json({ message: error.toString() });
  }
});

// Delete Course
adminRouter.post(
  "/api/admin/deletecourse",
  admin,
  async (request, response) => {
    try {
      const { id } = request.body;
      let course = await Course.findByIdAndDelete(id);
      response.json(course);
    } catch (error) {
      response.status(500).json({ message: error.toString() });
    }
  }
);

// Get All Courses
adminRouter.get("/api/admin/courses", admin, async (request, response) => {
  try {
    const courses = await Course.find({});
    response.json(courses);
  } catch (error) {
    response.status(500).json({ message: error.toString() });
  }
});

module.exports = adminRouter;
