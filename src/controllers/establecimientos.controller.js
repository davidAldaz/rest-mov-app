import { mysqlConnection } from "../conexionDB.js";
import { encrypt } from "../helpers/handleBcrypt.js";

//getEstablecimientos
export const getEstablecim = async (req, res) => {
    try {
        const [rows] = await mysqlConnection.query('SELECT * FROM establecimientos order by likes_est desc;')
        res.json(rows);   
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })
    }
};
//getEstablecId
export const getEstablecById = async (req, res) => {
    try {
        const [rows] = await mysqlConnection.query('SELECT * FROM establecimientos WHERE id_est = ?', 
        [req.params.id])
        if(rows.length <= 0) return res.status(404).json({
            message: 'Establecimiento no encontrado'
        }) 
        res.send(rows[0]);  
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })
    }
};
//getEstabComments
export const getComments = async (req, res) => {
    try {
        const [rows] = await mysqlConnection.query(`
        select concat(c.nombre_cli,' ', c.apellido_cli) as _nusuario, cm.comentario
        from comentarios as cm
        inner join clientes as c
        on cm.id_usuario = c.id_cli
        inner join establecimientos est
        on cm.id_est = est.id_est
        where cm.id_est = ?;`,
        [req.params.id]);
        if(rows.length <= 0) return res.status(404).json({
            message: 'No existen comentarios'
        });
        res.send(rows)
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })
    }
}
//addEstablec
export const addEstablec = async (req, res) => {
    const {ruc_est, nombre_est, direccion_est, latitud_est, longitud_est, telefono_est,
            horario_est, correo_est, passwd_est, imagen_est} = req.body;
    try {
        const passwdHash = await encrypt(passwd_est);
        const [rows] = await mysqlConnection.query(`INSERT INTO establecimientos (ruc_est, nombre_est, direccion_est, latitud_est, longitud_est, telefono_est,
            horario_est, correo_est, passwd_est, imagen_est, likes_est)
        VALUES (?,?,?,?,?,?,?,?,?,?)`,[ruc_est, nombre_est, direccion_est, latitud_est, longitud_est, telefono_est,
           horario_est, correo_est, passwdHash, imagen_est, 1]);
          res.send([rows]);
    } catch (error) {
        //return res.status(500).json({
          //  message: 'Algo salió mal 😕'
        //})
        return res.send(false);        
    }
    
};

//getLastId
export const getLastId = async (req, res) => {
    try {
        const [rows] = await mysqlConnection.query('select LAST_INSERT_ID() AS idLast;')
        if(rows.length <= 0) return res.status(404).json({
            message: 'Establecimiento no encontrado'
        })
        res.json(rows); 
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })
    }
};

//addTables
export const addTables = async (req, res) => {
    try {
        const mesas = req.body;
        for(const item of mesas){
            await mysqlConnection.query(`
            INSERT INTO mesas (numero_mesa, capac_mesa, estado_mesa, id_estab)
            VALUES(?,?,?,?)`,[item.numero_mesa, item.capac_mesa, item.estado_mesa, item.id_estab]);
        }
        res.send(true);
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        });
    }
};

//getTables
export const getTablesById = async (req, res) => {
    try {
        const [rows] = await mysqlConnection.query(`
        SELECT * FROM mesas
        WHERE id_estab = ?`, [req.params.id]);
        res.json(rows);
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        });
    }
};
//getEstabBy mail
export const getEstabByMail = async (req, res) => {
    const {correo_est} = req.body;
    try {
        const [rows] = await mysqlConnection.query(`
        SELECT * FROM establecimientos WHERE correo_est = ?`,
        [correo_est])
        if(rows.length <= 0) return res.status(404).json({
            message: 'Establecimiento no encontrado'
        })
        res.json(rows[0]);  
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })
    }
};

//updateLikes
export const updateLikes = async (req, res) => {
    const {id} = req.params;
    try {
        const [row] = await mysqlConnection.query(`
        UPDATE establecimientos
        SET likes_est = (likes_est + 1)
        WHERE id_est = ?`, [id])
        if(row.affectedRows === 0) return res.status(404).json({
            message: 'Establecimiento no encontrado'
        });

        const [rows] = await mysqlConnection.query(`
        SELECT * FROM establecimientos WHERE id_est = ?`, [id])
        res.json(rows[0]);
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })
    }
}

//updateStateMesa
export const updateMesa = async (req, res) => {
    const {id} = req.params;
    const {numero_mesa} = req.body;
    try {
        const row = await mysqlConnection.query(`
        UPDATE mesas
        SET estado_mesa = 'disponible'
        WHERE id_estab = ? and numero_mesa = ?`, [id, numero_mesa]);
        return res.send(true);
    } catch (error) {
        return res.send(false);
    }
}

//
//updateStateMesa
export const updateMesaOrd = async (req, res) => {
    const {id} = req.params;
    const {numero_mesa} = req.body;
    try {
        const row = await mysqlConnection.query(`
        UPDATE mesas
        SET estado_mesa = 'ordenada'
        WHERE id_estab = ? and numero_mesa = ?`, [id, numero_mesa]);
        return res.send(true);
    } catch (error) {
        return res.send(false);
    }
};

//search platos in establecimientos
export const searchPlato = async (req, res) => {
    const {busqueda} = req.body;
    try {
        const [row] = await mysqlConnection.query(`
        select distinctrow *
        from establecimientos as e
        inner join platos on e.id_est = platos.id_est_per 
        where (tipo_plato like ? or desc_plato like ?) and platos.visible = 'SI'`,
        ['%' + busqueda + '%', '%' + busqueda +'%']);

        return res.json(row);
    } catch (error) {
        res.send(error);
    }
}