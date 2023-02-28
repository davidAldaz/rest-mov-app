import { Router } from "express";
import { addNewPlato, getAlmById, getDesById, getMerById, getPlatoByIdCat, getPVById, updateVisibility } from "../controllers/platos.controller.js";

const router = Router();

//addNewPlato
router.post('/platos', addNewPlato);

//getPlatoByIdAndCategoria
router.get('/platos/:id', getPlatoByIdCat);

//getDesayunosById
router.get('/platosDes/:id', getDesById);

//updateVisibility
router.put('/platos/:id', updateVisibility);

//getAlmuerzosById
router.get('/platosAlm/:id', getAlmById);

//getMeriendasById
router.get('/platosMer/:id', getMerById);

//getPVById
router.get('/platosPV/:id', getPVById);

export default router;