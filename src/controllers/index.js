const connectDB= require('../conexionDB')

connectDB.conexion;

connectDB.connect;

const index=(req, res)=>{
    res.render('main');
}

const lista=(req, res)=>{
    res.render('resultados');
}


const registro=(req, res)=>{
    console.log('se pidio un metodo post')
}

module.exports={
    index,
    lista,
    registro
};