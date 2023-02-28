import { Router } from "express";
import { addNewDesayuno, getDesayunos, updateVisibilityDes } from "../controllers/desayunos.controller.js";

const router = Router();

//getAllDesayunos
router.get('/desayunos/:id', getDesayunos);

//add new DEsayuno
router.post('/desayunos', addNewDesayuno);

//updateVisibility
router.put('/desayunos/:id', updateVisibilityDes);

export default router;
