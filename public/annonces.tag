<annonces>

  <div each={ this.items } class="col-xs-12 col-sm-4 col-lg-4 col-md-4">
                <div class="thumbnail">
                      <img src={ flyer } alt="">
                      <div class="caption">
                          <h6 class="pull-right"> { date } </h6>
                          <h6>{ title }</h6>
                                <p>{ abstract }</p>
                            </div>                   
                </div>
  </div>

  <script>
  
  /*

   this.items = [
      {"id":0 , "title":"WEST FEST" , "flyer":"images/west.png"   , "abstract" : "WEST FEST", "date":"22-12-2015" } ,
      {"id":1 , "title":"PUNDFGDFG" , "flyer":"images/punk.png"   , "abstract" : "PUNK FEST" , "date":"22-12-2015" },
      {"id":2 , "title":"PUNDFGDFG" , "flyer":"images/carnet.png" , "abstract" : "Carnets de Voyages" , "date":"22-12-2015" },
   ]

   */

   var that = this ;
  
   var promise = $.getJSON("/banners/get") 

   promise.done(function(data) {
        console.log('data banners',data)
       that.items = data;
       riot.update();
    });

   promise.fail(function(err) {
            $('body').append('<p>Oh no, something went wrong!</p>', err);
    });


  </script>

</annonces>