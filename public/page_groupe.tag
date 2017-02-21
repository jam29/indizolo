<page_groupe>
     
        <div class="row">
         <!--div class="col-md-1" style="border: 0px solid red;"></div-->
          <div class="col-md-6 col-sm-6" style="border: 0px solid red;">
          <h2 class="featurette-heading" style="border: 0px solid red;">{ this.band.name }</h2><h4>{ this.band.city }</h4>
          <h6><span each={ tag in this.band.style } class="label label-danger" style="margin-right:5px;margin-top:5px" }>{ tag }</span></h6>
          <p style="white-space: pre-line;">{ this.band.abstract }</p>
          <p class="lead">Membres :</p>
          <p each={ member in this.band.members} > 
              <span>{ member.name } : { member.instrument} </span>
              <small show={ member.autres_groupes.length > 0 }>,membre de </small>
              <small each={ other in member.autres_groupes }><em><a href="/#groupe/{ other.id }"> - { other.name }</a></em></small>
          </p>
          <ul class="list-inline">
              <li show={ this.band.google }  >  <a href="{ this.band.google }">{ this.band.google }</a></li>
              <li show={ this.band.facebook } > <a href="{ this.band.facebook }"><img src="images/th-3.jpg" width=30></a></li>
              <li show={ this.band.twitter }  > <a href="{ this.band.twitter }"><img src="images/twitter-bird.png" width=30></a></li>
              <li show={ this.band.contact }>Contact: { this.band.contact }</li>
              </ul>

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

      <div  class="row">
        <div class="col-md-1"></div>
        <div id="albums" class="col-md-10">
          <div each={ album, index_album in this.band.albums } class="item" >
            <div class="thumbnail">
              <img class="grouptag" src={ album.cover } />
              <div class="caption">
                <h5>{album.title}</h5>
                <p>{ moment(album.release_date ).format("MMMM YYYY") }</p>
            
                <p show = { album.store.length > 0 }><a href="{ album.store  }" class="btn btn-sm btn-primary" >lien produit en magasin</a></p>
                <p hide = { album.store.length > 0 } <button class="btn btn-sm btn-primary disabled" >Lien produit en magasin</button></p>
              
              </div>
            </div>
        </div>
      </div>
      <div class="col-md-1"></div>
      </div>

    
      <!--hr class="featurette-divider">
      <h2 class="featurette-heading" style="border: 0px solid red;">MERCH</h2-->
      

<style>
    img.grouptag {
      width: 180px;
      height: 180px;
    }
</style>

<script>

console.log ('GROUPE:',this.opts._id);

var that=this ;
url =  "/bands/getOne/"+that.opts._id
console.log(url)
var promise = $.getJSON(url) ;

promise.done(function(aBand) {
        // console.log("BAND:",aBand)
        that.band = aBand ;
        _.map (that.band.members,function(m,index_m) {
                  _.map(m.autres_groupes, function(id_ag,index_ag) {
                        var m_url = "/bands/getOne/"+id_ag ;
                        $.getJSON(m_url,function(ag){
                          console.log(index_m,index_ag,ag.name)
                          that.band.members[index_m].autres_groupes[index_ag] = { "id":ag._id, "name":ag.name }
                          riot.update() ;
                          $('#albums').masonry({
                            itemSelector: '.item',
                            
                            columnWidth: 10
                          });

                        });

                  })
        })   
  riot.update() ;
});

     
</script>

</page_groupe>