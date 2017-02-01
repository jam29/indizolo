
<page_artiste>
 <div class="row">
            <div class="col-sm-3"></div>
		<div class="col-sm-6">
			<p>
				Indizolo vous permet de créer et renseigner les éléments pour créer votre page de présentation de groupe. Cette page vous permettra de présenter votre production et si vous vous abonnez INDIZOLO rajoute dans votre page un lien vers votre boutique (12€ par an) ou sur une de nos boutiques partenaire.
			</p>

			<form onsubmit={ this.addGroup }>

				<div class="form-group">
					<label class="control-label" for="inputTitle">Nom du groupe</label>
					<input type="text" class="form-control"  name="group_name" onKeyup={handler} />
				</div>

				<div  show={ this.gn } class="form-group">
					<label class="control-label"  for="inputTitle">Ville principale</label>
					<input type="text" class="form-control" name="city"/>

				<div class="form-group">
					<label class="control-label"  for="inputTitle">Présentation</label>
					<textarea type="text" class="form-control"  name="abstract"/></textarea>
				</div>

				<div class="form-group">
					<label class="control-label"  for="inputTitle">email</label> 
					<input type="text" class="form-control"  name="email"/>
				</div>

				<div class="form-group">
					<label class="control-label"  for="inputTitle">Réseau social</label> 
					<input type="text" class="form-control" name="diaspora" />
				</div>

				<div class="form-group">
					<label class="control-label" for="inputTitle">Site web / blog</label> 
					<input type="text" class="form-control"  name="weburl" />
				</div>

				<tags></tags>
				
				<!--label class="control-label" for="inputTitle">cover</label> 
				<input type="text" class="form-control"  />
				
				<label class="control-label" for="inputTitle">lien video</label> 
				<input type="text" class="form-control"  /-->
				 
				 	<button type="submit" class="btn btn-primary">ENREGISTRER</button>
				 </form>
				
 				
 			</form>
		</div>
		 <div class="col-sm-3"></div>
 </div>

 <style>
	.control-label { color:white ;}
 </style>
 


 <script src="https://cdn.jsdelivr.net/superagent/0.18.0/superagent.min.js"></script>
 <script>
  

 
 this.mixin(SharedMixin);
 var afficheTag = [];
 this.observable.on('tagAdded',function(quoi) { 
 	afficheTag = quoi ;
 }) ;

 this.gn = false ;
 var that = this ;

 this.handler = function(e) {
 	if ( e.target.value.length > 0 ) 
 	{
 		that.gn = true ; } 
 		else 
 	{ that.gn = false; }
 }
var request = window.superagent;
  this.addGroup = function(e) {
  		 e.preventDefault();
  		 request.post('http://localhost:8080/bands/post')
    			.send( 	  { name:     e.target.group_name, 
                            city:     e.target.city, 
                            abstract: e.target.abstract,
                            contact:  e.target.contact,
                            weblink:  e.target.weblink,
                            facebook: "",
                            twitter:  "",
                            google:   "", 
                            style:    afficheTag , 
                            members:  [],
                            albums:   [],
                            announce: "",
                            cover:    "",
                            video:    "" } )
    			.end(function(err,res){if(err){console.log('ERR')}})
   }

 </script>

</page_artiste>
