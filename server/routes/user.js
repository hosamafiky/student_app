const express = require("express");
const userRouter = express.Router();
const auth = require("../middlewares/auth");
const { Course } = require("../models/course");
const User = require("../models/user");

// Get user Data
userRouter.get("/api/user", auth, async (request, response) => {
  try {
    const user = await User.findById(request.user);
    response.json({ ...user._doc, token: request.token });
  } catch (error) {
    response.status(500).json({ message: error.message });
  }
});

// Enroll Course
userRouter.post("/api/enroll-course", auth, async (request, response) => {
  try {
    const { id } = request.body;
    let course = await Course.findById(id);
    let user = await User.findById(request.user);

    if (user.courses.length == 0) {
      user.courses.push(course);
    } else {
      for (let i = 0; i < user.courses.length; i++) {
        if (user.courses[i]._id.equals(course._id)) {
          user.courses.splice(i, 1);
          break;
        } else {
          user.courses.push(course);
          break;
        }
      }
    }

    user = await user.save();
    response.json(user);
  } catch (error) {
    response.status(500).json({ error: error.message });
  }
});

// Rate Course
userRouter.post("/api/rate", auth, async (request, response) => {
  try {
    const { id, instructorRate, courseRate, comment } = request.body;
    let course = await Course.findById(id);
    for (let i = 0; i < course.courseRate.length; i++) {
      if (course.courseRate[i].userId == request.user) {
        course.courseRate.splice(i, 1);
        break;
      }
    }
    for (let i = 0; i < course.instructorRate.length; i++) {
      if (course.instructorRate[i].userId == request.user) {
        course.instructorRate.splice(i, 1);
        break;
      }
    }

    const courseRatingSchema = {
      userId: request.user,
      rating: courseRate,
    };
    const instructorRatingSchema = {
      userId: request.user,
      rating: instructorRate,
    };

    course.courseRate.push(courseRatingSchema);
    course.instructorRate.push(instructorRatingSchema);
    if (comment != "") {
      course.comments.push({
        userId: request.user,
        comment: comment,
      });
    }

    course = await course.save();
    response.json(course);
  } catch (error) {
    response.status(500).json({ error: error.message });
  }
});

// Exit Course
userRouter.post("/api/exit-course", auth, async (request, response) => {
  try {
    const { id } = request.body;
    let course = await Course.findById(id);
    let user = await User.findById(request.user);

    for (let i = 0; i < user.courses.length; i++) {
      if (user.courses[i]._id.equals(course._id)) {
        user.courses.splice(i, 1);
        break;
      }
    }

    user = await user.save();
    response.json(user);
  } catch (error) {
    response.status(500).json({ error: error.message });
  }
});

module.exports = userRouter;
