import { Router } from 'express';
import { addEstablec, addTables, getComments, getEstabByMail, getEstablecById, getEstablecim, getLastId, getTablesById, searchPlato, updateLikes, updateMesa, updateMesaOrd } from '../controllers/establecimientos.controller.js';

const router = Router();

//getAllEstablec
router.get('/establec', getEstablecim);

//getEstabById
router.get('/establec/:id', getEstablecById);

//addEstablec
router.post('/establec', addEstablec);

//getLastId
router.get('/lastId', getLastId);

//getComments
router.get('/comments/:id', getComments);

//addTables
router.post('/tablesEst', addTables);

//getTablesByID
router.get('/tablesEst/:id', getTablesById);

//getEstabByMAil
router.post('/establecR', getEstabByMail);

//updateLikes
router.get('/estLikes/:id', updateLikes);

//updateEstadoMesa
router.put('/tablesEst/:id', updateMesa);

//updateEstadoMesaOrdenada
router.put('/tablesEst2/:id', updateMesaOrd);

//searchPlatos
router.post('/searchEst', searchPlato);

export default router;