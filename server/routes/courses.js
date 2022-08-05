const express = require("express");
const courseRouter = express.Router();
const auth = require("../middlewares/auth");
const { Course } = require("../models/course");

courseRouter.get("/api/courses", auth, async (request, response) => {
  try {
    const courses = await Course.find({});
    response.json(courses);
  } catch (error) {
    response.status(500).json({ message: error.message });
  }
});
// Search for course
courseRouter.get("/api/course/search", auth, async (request, response) => {
  try {
    const courses = await Course.find({
      name: { $regex: request.query.name, $options: "i" },
    });
    response.json(courses);
  } catch (error) {
    response.status(500).json({ message: error.toString() });
  }
});

// Best courses
courseRouter.get("/api/best-courses", auth, async (request, response) => {
  let courses = await Course.find({});

  try {
    courses.sort((a, b) => {
      let aSum = 0;
      let bSum = 0;

      for (let i = 0; i < a.courseRate.length; i++) {
        aSum += a.courseRate[i].rating;
      }
      for (let i = 0; i < b.courseRate.length; i++) {
        bSum += b.courseRate[i].rating;
      }

      return aSum < bSum ? 1 : -1;
    });

    response.json(courses);
  } catch (error) {
    response.status(500).json({ error: error.message });
  }
});
module.exports = courseRouter;
