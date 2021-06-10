const express = require ('express');
const router = express.Router();

//importar rutas
const sesion_controler = require
('../controllers/index.js');


router.get('/', sesion_controler.index)

router.get('/lista', sesion_controler.lista);

/* router.get('/products', (req, res, next)=>{
    res.render('products', {
        title: 'List of Products'
    })
})

router.get('/user', (req, res)=>{
    res.json({
        nombre:"Alejandro",
        ciudad: "Mexico CDMX"
    })
}) */

router.get('/averts', sesion_controler.index);

router.post('/registro', sesion_controler.registro);

module.exports = router;