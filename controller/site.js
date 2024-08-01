const LOGGEDIN = false

function index(req,res){
    res.render('index.pug',{loggedIn: LOGGEDIN} )
}

function login(req,res){
    res.render('logIn.pug', {loggedIn: LOGGEDIN})
}

function signUp(req,res){
    res.render('signUp.pug', {loggedIn: LOGGEDIN})
}

function addMenu(req,res){
    res.render('addMenu.pug', {loggedIn: LOGGEDIN})
}

function profile(req,res){
    res.render('profile.pug', {loggedIn: LOGGEDIN})
}

export {index,login,signUp,addMenu,profile}