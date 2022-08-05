const jwt = require("jsonwebtoken");
const User = require("../models/user");

const admin = (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token)
      return res.status(401).json({ msg: "No token, authorization denied" });
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) {
      return res.status(401).json({ msg: "Not authorized" });
    }
    const user = User.findById(verified.id);
    if (user.type == "student" || user.type == "instructor") {
      return res
        .status(401)
        .json({ msg: "You are not authorized to access this route" });
    }
    req.user = verified.id;
    req.token = token;
    next();
  } catch (err) {
    res.status(500).json({ message: err.toString() });
  }
};

module.exports = admin;
