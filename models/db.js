import pgp from 'pg-promise'
import bcrypt from 'bcrypt'
const configObj={
  user: 'postgres',
  host: 'localhost',
  database: 'pickypicker',
  password: 'Horse1815',
  port: 5432
}

const db = pgp()(configObj)
export default db

async function createUser(first_name,last_name,email,password){
  password = await bcrypt.hash(password,10)
  db.none("Insert into users(first_name,last_name,email,password) values ($1,$2,$3,$4)",[first_name,last_name,email,password])
}

createUser("SpongeBob","SquarePants","sbsp@bikinibottom.sea","PineappleHouse99")