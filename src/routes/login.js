import { Router } from 'express';
import { addUsuario, getUsuario, getLastUsuario, deleteUsuario } from '../controllers/login.controller.js'

const router = Router();

//addUser
router.post('/login', addUsuario);

//getUserById
router.post('/loginR', getUsuario);

//getLasUser
router.get('/loginLast', getLastUsuario);

//deleteUser
router.delete('/login/:id', deleteUsuario);

export default router;