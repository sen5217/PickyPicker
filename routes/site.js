import express from "express"
import { index,login,signUp,profile } from "../controller/site.js";
const router = express.Router()


router.get('/', index)
router.get('/index', index)
router.get('/home', index)

router.get('/login', login)

router.get('/signup', signUp)

router.get('/profile', profile);


export default router;