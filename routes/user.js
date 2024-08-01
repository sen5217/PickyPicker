import express from "express"
import { logIn } from "../controller/user.js";
const router = express.Router()

router.post('/login', logIn)

export default router;