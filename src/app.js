import express from 'express';
const app = express();
import morgan from 'morgan';
import cors from 'cors';
import clientesRoute from './routes/clientes.js';
import mesasRoute from './routes/mesas.js';
import establecRoute from './routes/establecimientos.js'
import loginRoute from './routes/login.js';
import desayunRoute from './routes/desayunos.js';
import promocionRoute from './routes/promociones.js';
import platosRoute from './routes/platos.js';
import commentsRoute from './routes/comments.js'


//middlewares
app.use(morgan('dev'));
app.use(express.urlencoded({extended:false}))
app.use(express.json());
app.use(cors());


//routes
app.use('/api', clientesRoute);
app.use('/api', mesasRoute);
app.use('/api', establecRoute);
app.use('/api', loginRoute);
app.use('/api', desayunRoute);
app.use('/api', promocionRoute);
app.use('/api', platosRoute);
app.use('/api', commentsRoute);
app.set('json spaces', 2);

//route not found
app.use((req, res, next) => {
    res.status(404).json({
        message: 'Endpoint no encontrado'
    })
})

export default app;
