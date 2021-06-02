const mysql = require('mysql');

const conexion=mysql.createConnection({
host: 'localhost',
database: 'trobify_1',
user: 'root',
password: '',
});

conexion.connect((err)=>{
    if(err){
        throw err;
    }
    else{
        console.log("Conexion exitosa");
    }
});

conexion.query('select * from inmueble;', (err, results, fields)=>{
    if(err){
        throw err;
    }

    if(results){
        results.forEach(result => {
            console.log(result);
        });
    }
    else{
        console.log("Empty table")
    }
})

conexion.end();