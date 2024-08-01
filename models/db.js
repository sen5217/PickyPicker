import pgp from 'pg-promise'
const configObj={
  user: 'postgres',
  host: 'localhost',
  database: 'pickypicker',
  password: 'Horse1815',
  port: 5432
}

const db = pgp()(configObj)

db.one("SELECT * FROM customer WHERE customer_id = 1").then((res)=>{console.log(res)}).catch((err)=>{console.log(err)})