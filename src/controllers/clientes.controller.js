import { mysqlConnection } from "../conexionDB.js";
import { encrypt } from "../helpers/handleBcrypt.js";

//getClientes
export const getClientes = async (req, res) => {
    try {
        const [rows] = await mysqlConnection.query('SELECT * FROM clientes')
        res.json(rows);   
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })
    }
};
//getLastCliente
export const getLastCliente = async (req , res) => {
    try {
        const [rows] = await mysqlConnection.query('SELECT * from clientes order by id_cli desc limit 1');
        return res.send(rows[0]);
    } catch (error) {
        return res.send(false);
    }
}
//getClienteById
export const getClienteById = async (req, res) => {
    try {
        const [rows] = await mysqlConnection.query('SELECT * FROM clientes WHERE id_cli = ?', 
        [req.params.id])
        if(rows.length <= 0) return res.status(404).json({
            message: 'Cliente no encontrado'
        })
        res.json(rows[0]);   
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })
    }
};
//addClient
export const addCliente = async (req, res) => {
    const {nombre, apellido, telefono, correo, passwd} = req.body;
    try {
        const passwdHash = await encrypt(passwd);
        const [rows] = await mysqlConnection.query(`
        INSERT INTO clientes (nombre_cli, apellido_cli, telef_cli, correo_cli, passwd_cli)
        VALUES (?,?,?,?,?)`,[nombre, apellido, telefono, correo, passwdHash]);
        res.send(rows[0]);
        //res.send({rows});
    } catch (error) {
        //return res.status(500).json({
          //  message: 'Algo salió mal 😕'
        //});
        return res.send(false);        
    }
    
};
//deleteCliente
export const deleteCliente = async (req, res) => {
    try {
        const [result] = await mysqlConnection.query('DELETE FROM clientes WHERE id_cli = ?', [req.params.id])
        if(result.affectedRows <= 0) return res.status(404).json({
            message: 'Cliente no encontrado'
        }) 
        res.send(true);
    } catch (error) {
        //return res.status(500).json({
          //  message: 'Algo salió mal 😕'
        //})
        return res.send(false);
    }
    
};
//updateClient
export const updateClient = async (req, res) => {
    const {id} = req.params;
    const {nom_cli, ape_cli, telef_cli, correo_cli, passwd_cli} = req.body;
    try {
        const [result] = await mysqlConnection.query(`UPDATE clientes 
                                SET nom_cli = IFNULL(?, nom_cli),
                                SET ape_cli = IFNULL(?, ape_cli),
                                SET telef_cli = IFNULL(?, telef_cli),
                                SET correo_cli = IFNULL(?, correo_cli),
                                SET passwd_cli = IFNULL(?, passwd_cli),
                                WHERE id_clientes = ?`,
                                [nom_cli, ape_cli, telef_cli, correo_cli, passwd_cli, id])
        if(result.affectedRows === 0) return res.status(404).json({
            message: 'Cliente no encontrado'
        });

        const [rows] = await mysqlConnection.query('SELECT * FROM clientes WHERE id_clientes = ?', [id])
        res.json(rows[0]);
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })
    } 
};

//getClientesByMail{
export const getClienteByMail = async (req, res) => {
    const {correo_cli} = req.body;
    try {
        const [rows] = await mysqlConnection.query(`
        SELECT * FROM clientes WHERE correo_cli = ?`,
        [correo_cli])
        if(rows.length <= 0) return res.status(404).json({
            message: 'Cliente no encontrado'
        })
        res.json(rows[0]);  
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })
    }
};