<annonces>

  <div each={ this.items } class="col-sm-4 col-lg-4 col-md-4">
                <div class="thumbnail">
                      <img src={ nom } alt="">
                      <div class="caption">
                          <h4 class="pull-right"> { date } </h4>
                          <h4><a href="#">{ titre }</a></h4>
                                <p>{ abstract }</p>
                            </div>                   
                </div>
  </div>

  <script>
   this.items = [
      {"id":0 , "titre":"WEST FEST" , "nom":"images/west.png"   , "abstract":"WEST FEST"} ,
      {"id":1 , "titre":"PUNDFGDFG" , "nom":"images/punk.png"   , "abstract":"PUNK FEST"},
      {"id":2 , "titre":"PUNDFGDFG" , "nom":"images/carnet.png" , "abstract":"Carnets de Voyages"},

   ] 
  </script>

</annonces>