import { mysqlConnection } from "../conexionDB.js";

//addNewPromo
export const addPromo = async (req, res) => {
    const {titulo_prom, desc_prom, precio_prom, vdesde_prom, vhasta_prom, 
        imagen_prom, estado_prom, id_est_per} = req.body;
    try {
        const rows = await mysqlConnection.query(`
        INSERT INTO promociones (titulo_prom, desc_prom, precio_prom, vdesde_prom, vhasta_prom, 
            imagen_prom, estado_prom, id_est_per)
        VALUES(?,?,?,?,?,?,?,?)`,[titulo_prom, desc_prom, precio_prom, vdesde_prom, vhasta_prom, 
            imagen_prom,estado_prom, id_est_per])

        return res.send(true);        
    } catch (error) {
        return res.send(false);
        
    }
};

//getPromoById
export const getPromoById = async (req, res) => {
    const {id} = req.params;
    try {
        const [rows] = await mysqlConnection.query(`
        SELECT * FROM promociones
        WHERE id_est_per = ?`, [id])

        return res.send(rows);
    } catch (error) {
        return res.status(500).json({
            message: 'Algo salió mal 😕'
        })
    }
};

//getAllPromos
export const getAllPromo = async (req, res) => {
    try {
        const [rows] = await mysqlConnection.query(`
        select * 
        from promociones as p
        inner join establecimientos on p.id_est_per = establecimientos.id_est;`);

        res.json(rows);
    } catch (error) {
        return res.send(false);
    }
}

//updatePromos
export const updatePromo = async (req, res) => {
    const {id} = req.params;
    const {id_prom, estado_prom} = req.body;
    try {
        if(estado_prom === 'visible'){
            const row = await mysqlConnection.query(`
            UPDATE promociones
            SET estado_prom = 'visible'
            WHERE id_prom = ? and id_est_per = ?`, [id_prom, id]);
        }else{
            const row = await mysqlConnection.query(`
            UPDATE promociones
            SET estado_prom = 'oculto'
            WHERE id_prom = ? and id_est_per = ?`, [id_prom, id]);
        }
        return res.send(true);
    } catch (error) {
        return res.send(false);
        
    }
};

//deletePromo
export const deletePromo = async (req, res) => {
    const {id} = req.params;
    try {
        const rows = await mysqlConnection.query(`
        DELETE FROM promociones
        WHERE id_prom = ?`, [id]);
        return  res.send(true);
    } catch (error) {
        return res.send(false);        
    }
};

//searchPromo
export const searchPromo = async (req, res) => {
    const {busqueda} = req.body;
    try {
        const [rows] = await mysqlConnection.query(`
        select distinctrow *
        from promociones as p
        inner join establecimientos on p.id_est_per = establecimientos.id_est
        where (titulo_prom like ? or desc_prom like ?) and p.estado_prom = 'visible'`,
        ['%' +busqueda +'%', '%' +busqueda +'%'])

        return res.json(rows);
    } catch (error) {
        return res.send(false);
    }
}