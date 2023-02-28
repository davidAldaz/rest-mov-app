import { mysqlConnection } from "../conexionDB.js";

//getMesas
export const getMesas = async (req, res) => {
    try {
        const [rows] = await mysqlConnection.query('SELECT * FROM mesas')
        res.json(rows);   
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })
    }
};
//addMesa
export const addMesa = async (req, res) => {
    const {numero_mesa, capac_mesa, estado_mesa, id_estab} = req.body;
    try {
        const [rows] = await mysqlConnection.query(`INSERT INTO clientes (numero_mesa, capac_mesa, estado_mesa, id_estab)
        VALUES (?,?,?,?,?)`,[numero_mesa, capac_mesa, estado_mesa, id_estab])
        res.send({rows});
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })        
    }
    
};
//getMesasById
export const getMesasById = async (req, res) => {
    const {id} = req.params;
    try {
        const [rows] = await mysqlConnection.query(`
        SELECT * FROM mesas
        WHERE id_estab = ?`, [id]);

        return res.json(rows);
        
    } catch (error) {
        return res.send(false);
    }
};

//updateState
export const updateMesaState = async (req, res) => {
    const {id} = req.params;
    const {id_mesa} = req.body;
    try {
        const row = await mysqlConnection.query(`
        UPDATE mesas
        SET estado_mesa = 'reservada'
        WHERE id_estab = ? and id_mesa = ?`, [id, id_mesa]);
        
        return res.send(true);
    } catch (error) {
        return res.send(false);
    }
};

//libMesa
export const libMesa = async (req, res) => {
    const {id} = req.params;
    const {id_mesa} = req.body;
    try {
        const row = await mysqlConnection.query(`
        UPDATE mesas
        SET estado_mesa = 'disponible'
        WHERE id_estab = ? and id_mesa = ?`, [id, id_mesa]);
        
        return res.send(true);
    } catch (error) {
        return res.send(false);
    }
};

//reservMesa
export const resMesa = async (req, res) => {
    const{id_cliente, id_establec, id_mesa} = req.body;
    try {
        const row = await mysqlConnection.query(`
        INSERT INTO (id_cliente, id_establec, id_mesa)
        VALUES (?,?,?)`,[id_cliente, id_establec, id_mesa]);

        return res.send(true);
    } catch (error) {
        return res.send(false);
    }
};

//deleteReserva
export const deleteRes = async (req, res) => {
    const{id_cliente, id_establec, id_mesa} = req.body;
    try {
        const row = await mysqlConnection.query(`
        DELETE FROM reserva_mesas
        WHERE id_cliente = ? and id_establec = ? and id_mesa = ?`,
        [id_cliente, id_establec, id_mesa])
        
        return res.send(true);
    } catch (error) {
        return res.send(false);
    }
}