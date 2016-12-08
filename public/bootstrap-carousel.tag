<bootstrap-carousel>
  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel"
    data-interval={ this.interval } data-pause={ this.pause }
    data-wrap={ this.wrap } data-keyboard={ this.keyboard }>
      <!-- Indicators -->
      <ol class="carousel-indicators">
          <li each={ item , index in this.items } data-target="#carousel-example-generic" data-slide-to={ index } class="{ active: index==0 }"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner">
          <div each={ item , index in this.items } class="{ item: true, active: index==0 }">
              <img src={ item.image } >
              <div class="carousel-caption">
                  <h2><a href="#groupe/{ item.url }">{ item.title }</a></h2>
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

    /*

     this.items = [
      {"_id":"57dac9318caa76bdb10d4ea7","image":"800x300.png"   , "title":"Working Fuck Zero" ,   "url":"wczo"},
      {"_id":"57dac9398caa76bdb10d4ea8","image":"800x300-1.png" , "title":"bitches"           ,   "url":"wcz"},
      {"_id":"57dac9418caa76bdb10d4ea9","image":"800x300-2.png" , "title":"bitKLIMTches",         "url":"wcz"}
    ]

    */

    var that = this ;

    this.on("before-mount", function() { 
      
      var promise = $.getJSON("http://localhost:8080/carousel/get") 

      promise.done(function(data) {
         console.log("data carousel ->",data)
         that.items = data;
      });

      promise.fail(function(err) {
              $('body').append('<p>Oh no, something went wrong!</p>', err);
      });

      this.interval = 3000 ;
      this.pause = "hover" ;
      this.wrap = true     ;
      this.keyboard = true ; 
    
    });

  </script>

</bootstrap-carousel>