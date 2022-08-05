const express = require("express");
const mongoose = require("mongoose");

const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const courseRouter = require("./routes/courses");
const userRouter = require("./routes/user");

const app = express();
const mongoUrl =
  "mongodb+srv://hussam:9121997h@cluster0.gjxe3.mongodb.net/?retryWrites=true&w=majority";
const PORT = 3000;

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(courseRouter);
app.use(userRouter);

mongoose
  .connect(mongoUrl)
  .then(() => {
    console.log("Connected to MongoDB");
  })
  .catch((err) => {
    console.log(err);
  });
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
