import express from 'express'

const app = express();
const port = 3000;

app.set("views", "./templates")
app.set("view engine", "pug")  

app.get('/', (req, res) => {
  res.render('index.pug',{message: "Hi poo", title: "Meepf"} )
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});


