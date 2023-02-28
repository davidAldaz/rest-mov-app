import { mysqlConnection } from "../conexionDB.js";
import { encrypt, compare } from "../helpers/handleBcrypt.js";

//addUsuario
export const addUsuario = async (req, res) => {
    const {correo_log, passwd_log, rol_log} = req.body;
    try {
        const passwdHash = await encrypt(passwd_log);
        const [rows] = await mysqlConnection.query(`INSERT INTO login (correo_log, passwd_log, rol_log)
        VALUES (?,?,?)`,[correo_log, passwdHash, rol_log])
        res.send(true);
    } catch (error) {
        //return res.status(500).json({
          //  message: 'Algo salió mal 😕'
        //});
        return res.send(false);        
    }
};

//getUsuario
export const getUsuario = async(req, res) => {
    const {correo_log, passwd_log} = req.body;
    try {
        const [rows] = await mysqlConnection.query('SELECT * FROM login WHERE correo_log = ?',
        [correo_log]);
        if(rows.length <= 0){
            return res.status(404).json({message: 'Usuario no encontrado'});
        }
        const checkPasswd = await compare(passwd_log, rows[0].passwd_log);
        if(checkPasswd){
            res.json(rows[0]);
        }else{
            res.send({message:'Contraseña incorrecta'});
        }
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })
    }
};

//getLastUser
export const getLastUsuario = async (req , res) => {
    try {
        const [rows] = await mysqlConnection.query('SELECT * from login order by id_log desc limit 1');
        return res.send(rows[0]);
    } catch (error) {
        return res.send(false);
    }
};

//deleteUser
export const deleteUsuario = async (req, res) => {
    try {
        const [result] = await mysqlConnection.query('DELETE FROM login WHERE id_log = ?', [req.params.id])
        if(result.affectedRows <= 0) return res.status(404).json({
            message: 'Usuario no encontrado'
        }) 
        res.send(true);
    } catch (error) {
        //return res.status(500).json({
          //  message: 'Algo salió mal 😕'
        //})
        return res.send(false);
    }
    
};