import { mysqlConnection } from "../conexionDB.js";

//addComment
export const addComment = async (req, res) => {
    const {id_cli, id_est, comentario} = req.body;
    try {
        const [rows] = await mysqlConnection.query(`
        INSERT INTO comentarios (id_usuario, id_est, comentario)
        VALUES (?,?,?)`,[id_cli,id_est,comentario]);
        res.send(true);
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })
    }
};
