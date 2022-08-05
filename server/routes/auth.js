const express = require("express");
const bcryptjs = require("bcrypt");
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");
const User = require("../models/user");

const authRouter = express.Router();

authRouter.post("/api/register", async (request, response) => {
  try {
    const { name, email, phone, password, confirmPassword } = request.body;

    const existingPhone = await User.findOne({ phone });
    if (existingPhone) {
      return response.status(400).json({ message: "رقم الجوال مستخدم من قبل" });
    }
    const existingEmail = await User.findOne({ email });
    if (existingEmail) {
      return response
        .status(400)
        .json({ message: "البريد الإلكتروني مستخدم من قبل" });
    }
    if (password !== confirmPassword) {
      return response.status(400).json({ message: "كلمتا السر غير متطابقتين" });
    }
    const hashPassword = await bcryptjs.hash(password, 8);

    let newUser = new User({
      name,
      email,
      phone,
      password: hashPassword,
      confirmPassword: hashPassword,
    });

    newUser = await newUser.save();
    response.json(newUser);
  } catch (error) {
    response.status(500).json({ message: error.message });
  }
});

// Sign  in..
authRouter.post("/api/login", async (request, response) => {
  try {
    const { phone, password } = request.body;
    const user = await User.findOne({ phone });
    if (!user)
      return response.status(400).json({ message: "رقم الجوال غير مسجل" });

    const isPasswordValid = await bcryptjs.compare(password, user.password);
    if (!isPasswordValid)
      return response.status(400).json({ message: "كلمة المرور غير صحيحة" });

    const token = jwt.sign({ id: user._id }, "passwordKey");
    response.json({ token, ...user._doc });
  } catch (error) {
    response.status(500).json({ message: error.message });
  }
});

authRouter.post("/api/tokencheck", async (request, response) => {
  try {
    const token = request.header("x-auth-token");
    if (!token) return response.json(false);
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return response.json(false);

    const user = await User.findById(verified.id);
    if (!user) return response.json(false);

    response.json(true);
  } catch (error) {
    response.status(500).json({ message: error.message });
  }
});

module.exports = authRouter;
