import express from 'express'
import siteRouter from "./routes/site.js"
import userRouter from "./routes/user.js"
const app = express();
const port = 3000;

app.set("views", "./templates")
app.set("view engine", "pug")  
app.use(express.static("./static"))

app.use("/",siteRouter)
app.use("/user",userRouter)

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});



