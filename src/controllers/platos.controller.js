import { mysqlConnection } from "../conexionDB.js";

//add new desayuno
export const addNewPlato = async (req, res) => {
    const {tipo_plato, desc_plato, precio_plato, img_plato, 
        visible, categoria_plato,  id_est_per} = req.body;
    try {
        const [rows] = await mysqlConnection .query(`
        INSERT INTO platos (tipo_plato, desc_plato, precio_plato, img_plato, 
            visible, categoria_plato, id_est_per)
        VALUES (?, ?, ?, ?, ?, ?, ?)`, [tipo_plato, desc_plato, precio_plato, img_plato, 
            visible, categoria_plato, id_est_per])
        return res.send(true);        
    } catch (error) {
        // return res.status(500).json({
        //     message: 'Algo salió mal 😕'
        // })
        return res.send(false);
    }
};

//get Plato By Id and Categoria
export const getPlatoByIdCat = async (req, res) => {
    const {id} = req.params;
    const {categoria_plato} = req.body;
    try {
        const [rows] = await mysqlConnection.query(`
        SELECT * FROM platos
        WHERE id_est_per = ?  and categoria_plato = ?`, [id, categoria_plato]);
        return res.json(rows);
    } catch (error) {
        res.send(false);
    }
};

//update Visibility
export const updateVisibility = async (req, res) => {
    const {id} = req.params;
    const {visible} = req.body;
    try {
        if(visible === 'SI'){
            const [rows] = await mysqlConnection.query(`
            UPDATE platos
            SET visible = 'SI'
            WHERE id_plato = ?`, [id]);
        }else{
            
            const [rows] = await mysqlConnection.query(`
            UPDATE platos
            SET visible = 'NO'
            WHERE id_plato = ?`, [id]);
        }
        return res.send(true);
    } catch (error) {
        return res.send(false);
    }
}

//get Desayunos by ID
export const getDesById = async (req, res) => {
    const {id} = req.params;
    try {
        const [rows] = await mysqlConnection.query(`
        SELECT * FROM platos
        WHERE id_est_per = ?  and categoria_plato = 'DESAYUNO'`, [id]);
        return res.json(rows);
    } catch (error) {
        res.send(false);
    }
};

//get Almuerzos by ID
export const getAlmById = async (req, res) => {
    const {id} = req.params;
    try {
        const [rows] = await mysqlConnection.query(`
        SELECT * FROM platos
        WHERE id_est_per = ?  and categoria_plato = 'ALMUERZO'`, [id]);
        return res.json(rows);
    } catch (error) {
        res.send(false);
    }
};

//get Meriendas by ID
export const getMerById = async (req, res) => {
    const {id} = req.params;
    try {
        const [rows] = await mysqlConnection.query(`
        SELECT * FROM platos
        WHERE id_est_per = ?  and categoria_plato = 'MERIENDA'`, [id]);
        return res.json(rows);
    } catch (error) {
        res.send(false);
    }
};

//get Almuerzos by ID
export const getPVById = async (req, res) => {
    const {id} = req.params;
    try {
        const [rows] = await mysqlConnection.query(`
        SELECT * FROM platos
        WHERE id_est_per = ?  and categoria_plato = 'PV'`, [id]);
        return res.json(rows);
    } catch (error) {
        res.send(false);
    }
};
