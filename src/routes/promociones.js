import { Router } from "express";
import { addPromo, deletePromo, getAllPromo, getPromoById, searchPromo, updatePromo } from "../controllers/promociones.controller.js";

const router = Router();

//addPromo
router.post('/promo', addPromo);

//getPromoById
router.get('/promo/:id', getPromoById);

//updatePromo
router.put('/promo/:id', updatePromo);

//delete Promo
router.delete('/promo/:id', deletePromo);

//getAllPromo
router.get('/promo', getAllPromo);

//searchPromo
router.post('/promoSear', searchPromo);


export default router;