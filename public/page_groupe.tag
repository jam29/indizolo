<page_groupe>
      <!--div class="row featurette"-->
     
      <div class="container-fluid">  
        <div class="row">
        <div class="col-md-2" style="border: 0px solid red;"></div>
        <div class="col-md-5" style="border: 0px solid red;">

          <h2 class="featurette-heading">{ this.band.name }</h2>
              
          <p>{ this.band.abstract }</p>
          <p>
            Membres : 
            <span each={ member in this.band.members} > { member.name }
                                                  &nbsp;{ member.instrument} / </span>
          </p>
          <p class="lead">
          <a href="{ this.band.google }">{ this.band.google }</a>
          </p>

        </div>

        <div class="col-md-5" style="border: 0px solid red;">
          <img class="featurette-image img-responsive center-block" src="images/thierr.jpg" >
        </div>
      </div>

      <!--hr class="featurette-divider"-->

      <div each={ album in this.band.albums } class="row">
        <div class="col-md-2" style="border: 0px solid red;"></div>

        <div class="col-md-5" > 
          <div>
            <img src=images/{ album.cover } class="img-responsive" style="padding:20px"/>
          </div>
        </div>
          <div class="col-md-5" style="border: 0px solid red; padding:20px">    
            <p>{ album.title }  - { album.type }</p> 
            <p>Date de sortie : { album.release_date }</p>
            <p>{ album.price } €</p>
            <p><button type="button" class="btn btn-primary">ACHETER</button></p> 
          </div>
      </div>
      
      <!--hr class="featurette-divider"-->    

      <div class="row">
        <div class="col-md-2"></div>
        <div class="col-sm-8">
          <span each={ tag in this.band.style } class="label label-danger" style="margin-right:5px" }>{ tag }</span>
        </div>
      <div class="col-md-2"></div>
      </div>
      
      <div class="row">
        <div class="col-md-2"></div>
        <div class="col-sm-8">
          <div class="embed-responsive embed-responsive-16by9">
          <iframe class="embed-responsive-item" src="http://www.youtube.com/embed/RDcixURK0H0"></iframe>
            <!--iframe class="embed-responsive-item" src="{ this.band.video }" ></iframe-->
        </div>
        <div class="col-md-2"></div>
      </div>
      </div>

<script>

console.log ('GROUPE:',this.opts._id);

var that=this ;
url =  "http://localhost:8080/bands/getOne/"+that.opts._id
console.log(url)
var promise = $.getJSON(url) ;

promise.done(function(aBand) {
         console.log("BAND:",aBand)
         that.band = aBand;
         riot.update();
});
     
</script>

</page_groupe>