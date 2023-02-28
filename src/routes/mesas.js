import { Router } from 'express';
import { addMesa, deleteRes, getMesas, getMesasById, libMesa, resMesa, updateMesaState } from '../controllers/mesas.controller.js';


const router = Router();

//get All Mesas
router.get('/mesas', getMesas);

//add Mesas
router.post('/mesas', addMesa);

//getMesasById
router.get('/mesas/:id', getMesasById);

//updateState
router.put('/mesas/:id', updateMesaState);

//libMesa
router.put('/mesasLib/:id', libMesa);

//resMesa
router.post('/mesasRes', resMesa);

//deleteRserva
router.delete('/mesasDel', deleteRes);

export default router;