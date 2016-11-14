<bootstrap-carousel>
  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel"
    data-interval={ this.interval } data-pause={ this.pause }
    data-wrap={ this.wrap } data-keyboard={ this.keyboard }>
      <!-- Indicators -->
      <ol class="carousel-indicators">
          <li each={ this.items } data-target="#carousel-example-generic" data-slide-to={ this.id } class="{ active: this.id==0 }"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner">
          <div each={ this.items } class="{ item: true, active: this.id==0 }">
              <img src={ nom } alt={ caption }>
              <div class="carousel-caption">
                  <h2>{ caption }</h2>
              </div>
          </div>
      </div>

      <!-- Controls -->
      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
  </div>

  <script>
   
   this.items = [
      {"id":0 , "nom":"images/800x300.png"   , "caption" : "Caption #1"} ,
      {"id":1 , "nom":"images/800x300-2.jpg" , "caption" : "Caption #2"} ,
        {"id":2 , "nom":"images/800x300-2.jpg" , "caption" : "Caption #3"}
   ]
   
   this.interval = 3000 ;
   this.pause = "hover" ;
   this.wrap = true     ;
   this.keyboard = true ; 

   

  </script>

</bootstrap-carousel>