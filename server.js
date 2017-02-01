var express = require('express');
var bodyParser = require('body-parser');

const doctype = '<!doctype html>';

app = express() ;

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

app.use(express.static(__dirname + '/public'));
app.set('views', __dirname + '/');
app.set('view engine', 'ejs');

app.get('/', function(req,res){
	res.render("index");
})


app.listen(8000)

console.log("indizolo server listening on port 8000");
