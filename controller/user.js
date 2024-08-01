function logIn(req,res){
    res.render('logIn.pug', {loggedIn: true})
    //https://stackoverflow.com/questions/5710358/how-to-access-post-form-fields-in-express
}
export {logIn} 