import { Router } from 'express';
import {getClientes, addCliente, getClienteById, deleteCliente, updateClient, getLastCliente, getClienteByMail} from '../controllers/clientes.controller.js'

const router = Router();

//get all clients
router.get('/clientes', getClientes);

//get client by id
router.get('/clientes/:id', getClienteById);

//add client
router.post('/clientes', addCliente);

//delete client
router.delete('/clientes/:id', deleteCliente);

//update client campos parciales
router.patch('/clientes/:id', updateClient);

//obtener el ultimo ingresado
router.get('/clienteLast', getLastCliente);

//getCliente by mail
router.post('/clientesR', getClienteByMail);

export default router;