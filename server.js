var express = require('express');
var bodyParser = require('body-parser');


const doctype = '<!doctype html>';

app = express() ;

app.use(express.static(__dirname + '/public'));
app.set('views', __dirname + '/');
app.set('view engine', 'ejs');

app.get('/', function(req,res){
	res.render("index");
})

app.listen(8000)

console.log("indizolo server listening on port 8000")