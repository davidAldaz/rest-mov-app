import { Router } from "express";
import { addComment } from "../controllers/comments.controller.js";

const router = Router();

//addComment
router.post('/comments', addComment);


export default router;