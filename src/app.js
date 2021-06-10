const express = require('express');
const routes = require('./routes/index');
const path = require('path');//Cargar ruta de archivos
const exphbs = require("express-handlebars");
const passport = require('passport');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const passportLocal = require('passport-local');

const port="3000";



//crear una app de express
const app= express();

//settings
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', exphbs({
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    defaultLayout: 'index',
    extname: '.hbs'
}));
app.set('view engine', '.hbs');

app.use(cookieParser('hola como estas'));

app.use(session({
    secret:'hola como estas',
    resave: true,
    saveUninitialized: true,
}))


app.use(passport.initialize());
app.use(passport.session());
/* passport.use(new passportLocal((username, password, done)=>{

})) */

//middlewares
app.use((req,res, next)=>{
    console.log(`${req.url} - ${req.method}`);
    next();
})

app.use(express.json());
app.use(express.urlencoded({extended: true}));//leer los datos enviados por el formulario

//routes
app.use(routes);

//static files
app.use(express.static(path.join(__dirname, 'public')));

//start the server
app.listen(port,()=>{
    console.log("The server is up")
});