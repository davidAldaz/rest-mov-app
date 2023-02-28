import { mysqlConnection } from "../conexionDB.js";

//get All Desayunos
export const getDesayunos = async (req, res) => {
    try {
        const [rows] = await mysqlConnection.query('SELECT * FROM desayunos WHERE id_est_per = ?', 
        [req.params.id])
        if(rows.length <= 0) return res.status(404).json({
            message: 'No existen desayunos disponibles'
        }) 
        res.json(rows);
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })
    }
};

//add new desayuno
export const addNewDesayuno = async (req, res) => {
    const {tipo_des, descrip_des, precio_des, img_des, visible, id_est_per} = req.body;
    try {
        const [rows] = await mysqlConnection .query(`
        INSERT INTO desayunos (tipo_des, descrip_des, precio_des, img_des, visible, id_est_per)
        VALUES (?, ?, ?, ?, ?, ?)`, [tipo_des, descrip_des, precio_des, img_des, visible, id_est_per])
        return res.send(true);        
    } catch (error) {
        // return res.status(500).json({
        //     message: 'Algo salió mal 😕'
        // })
        return res.send(false);
    }
};

//updateDesayuno
export const updateVisibilityDes = async (req, res) => {
    const {id} = req.params;
    const {visible} = req.body;
    try {
        if(visible === 'SI'){
            const [rows] = await mysqlConnection.query(`
            UPDATE desayunos
            SET visible = 'SI'
            WHERE id_des = ?`, [id]);
        }else{
            
            const [rows] = await mysqlConnection.query(`
            UPDATE desayunos
            SET visible = 'NO'
            WHERE id_des = ?`, [id]);
        }
        return res.send(true);
    } catch (error) {
        return res.send(false);
    }
}