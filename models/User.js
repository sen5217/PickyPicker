import db from "./db.js"
class User{
    constructor(first_name,last_name,email){
        this.first_name=first_name
        this.last_name=last_name
        this.email=email
    }
    static async getUserById(id){
        let user_data = await db.one("SELECT first_name,last_name,email FROM users WHERE user_id = $1",[id])
        return new User(user_data["first_name"],user_data["last_name"],user_data["email"])
    }
}

