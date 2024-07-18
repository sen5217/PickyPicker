import express from 'express'

const app = express();
const port = 3000;

app.set("views", "./templates")
app.set("view engine", "pug")  

const LOGGEDIN = false

app.get('/', (req, res) => {
  res.render('index.pug',{loggedIn: LOGGEDIN} )
});

app.get('/index', (req, res) => {
  res.render('index.pug',{loggedIn: LOGGEDIN} )
});

app.get('/login', (req, res) => { 
  res.render('logIn.pug', {loggedIn: LOGGEDIN})
});

app.get('/signup', (req, res) => { 
  res.render('signUp.pug', {loggedIn: LOGGEDIN})
});

app.post('/login', (req, res) => { 
  res.render('logIn.pug', {loggedIn: true})
  //https://stackoverflow.com/questions/5710358/how-to-access-post-form-fields-in-express
}); 


app.get('/addMenu', (req, res) => { 
  res.render('addMenu.pug', {loggedIn: LOGGEDIN})
});

app.get('/profile', (req, res) => { 
  res.render('profile.pug', {loggedIn: LOGGEDIN})
});


app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});



