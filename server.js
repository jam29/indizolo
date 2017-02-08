var express = require('express');
var bodyParser = require('body-parser');
var mongoose = require('mongoose');
mongoose.Promise = require('bluebird');
//var db = mongoose.connect('mongodb://localhost/indizolo');
 var db = mongoose.connect('mongodb://umv26kv2288lzv7:qAif8N746UNeUm4s9Cx7@b1eflgsgur8yey1-mongodb.services.clever-cloud.com:27017/b1eflgsgur8yey1');


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

  require('./server/models.js');
  var bands     =   require('./server/band_controller');
  var banners   =   require('./server/banner_controller');
  var carousel  =   require('./server/carousel_controller');
  
 // app.get('/', ensureAuthenticated ,function(req, res) { res.redirect('/index'); }); 
 // app.get('/index', ensureAuthenticated ,function(req, res) { 
 // app.get('/', function(req, res) {res.render('index'); });   

  app.get  ('/bands/get' , bands.getBands ) ;  
  app.get  ('/bands/getOne/:id' , bands.getOne ) ;
  // app.post ('/bands/post'   ,   bands.createBand  ) ; 
  // app.post ('/bands/put'    ,         bands.updateBand  ) ; 
  // app.post ('/bands/delete' ,         bands.deleteBand  ) ; 
  app.get  ('/bands/liste/:searchText',  bands.searchBands ) ;

  app.get('/banners/get'   ,  banners.getBanners ) ;
  //app.post('/banners/put'  ,  banners.updateBanners ) ;  

  app.get('/carousel/get'  ,   carousel.getCarousel ) ;
  // app.post('/carousel/put' ,   carousel.updateCarousel ) ;  
  // app.post('/carousel/post' ,  carousel.addCarousel ) ; 
  // app.post ('/carousel/delete' ,  , carousel.deleteCarousel  ) ;  
  
  app.get('*', function(req, res){
  res.render("404");
});


app.listen(8080)

