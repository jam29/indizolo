<page_groupe>
     
        <div class="row">
         <!--div class="col-md-1" style="border: 0px solid red;"></div-->
          <div class="col-md-6 col-sm-6" style="border: 0px solid red;">
          <h2 class="featurette-heading" style="border: 0px solid red;">{ this.band.name }</h2><h4>{ this.band.city }</h4>
          <h6><span each={ tag in this.band.style } class="label label-danger" style="margin-right:5px;margin-top:5px" }>{ tag }</span></h6>
          <p style="white-space: pre-line;">{ this.band.abstract }</p>
          <p class="lead">Membres :</p>
          <p> 
            <span each={ member in this.band.members} > { member.name }
                                                  &nbsp;{ member.instrument} / </span>
          </p>
          <p class="lead"><a href="{ this.band.google }">{ this.band.google }</a></p>
          <p class="lead" show={this.band.contact} >Contact: { this.band.contact }</p>

        </div>

        <div class="col-md-6 col-sm-6" style="border: 0px solid red;">
          <img class="featurette-image img-responsive center-block" src="{ this.band.cover }" >
        </div>
        
        </div>

        <hr class="featurette-divider">
        <div class="row">
          <div class="col-md-3"></div>
          <div class="col-sm-6">
          <div class="embed-responsive embed-responsive-16by9">
          <iframe class="embed-responsive-item" src="{ this.band.video }"></iframe>
            <!--iframe class="embed-responsive-item" src="{ this.band.video }" ></iframe-->
          </div>
        <div class="col-md-3"></div>
      </div>
      </div>

      <hr class="featurette-divider">
      <h2 class="featurette-heading" style="border: 0px solid red;">DISCOGRAPHIE</h2>

      <div id="albums"  class="row">
        <div each={ album, index_album in this.band.albums } class="col-md-3" >
          <div class="thumbnail">
            <img class="grouptag" src={ album.cover } />
            <div class="caption">
            <h5>{album.title}</h5>
            <p>{album.release_date}</p>
            
            <p><a href="#" class="btn btn-sm btn-primary" role="button">lien magasin</a></p>
          </div>
        </div>
      </div>

    
      
      <!--hr class="featurette-divider">
      <h2 class="featurette-heading" style="border: 0px solid red;">MERCHANDISING</h2-->    
      
      

<style>
    img.grouptag {
      width: 200px;
      height: 200px;
    }
</style>

<script>

console.log ('GROUPE:',this.opts._id);

var that=this ;
url =  "/bands/getOne/"+that.opts._id
console.log(url)
var promise = $.getJSON(url) ;

promise.done(function(aBand) {
         console.log("BAND:",aBand)
         that.band = aBand;
         riot.update();
});

     
</script>

</page_groupe>