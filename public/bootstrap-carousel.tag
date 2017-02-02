<bootstrap-carousel>
  <div id="carousel" class="carousel slide" data-ride="carousel"
    data-interval={ this.interval } data-pause="hover" 
    data-wrap={ this.wrap } data-keyboard={ this.keyboard }>
      <!-- Indicators -->
      <ol class="carousel-indicators">
          <li each={ item , index in this.items.sort(compare) } data-target="#carousel" data-slide-to={ index }  class="{ active: index==0 }"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner">
          <div each={ item , index in this.items } class="{ item: true, active: index==0 }">
              <img class="slide-image" src={ item.image } ></img>
              <div class="caption" style="text-align:center">
                  <h5>{ item.title }</h5>
                  <h5><a class="btn btn-xs btn-primary" href="#groupe/{ item.url }">Plus...</a></h5>
              </div>
          </div>
      </div>

      <!-- Controls -->
      <a class="left carousel-control" href="#carousel" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
  </div>

  <script>

    var that = this ;
    this.items=[];
    //this.interval=3000 ;
    this.wrap = false     ;
    this.keyboard = true ; 
    
    this.on("before-mount", function() { 
      //alert("before");
      var promise = $.getJSON("/carousel/get") 

      promise.done(function(data) {
          console.log("promise done data carousel ->",data)
          that.items = data.sort(compare);
          
          riot.update(this.items)
      });

      promise.fail(function(err) {
              $('body').append('<p>Oh no, something went wrong!</p>', err);
      });
         
    })

    this.on("mount",function(){
            // alert("mount")
           $('#carousel').carousel({
             interval: 3000
         })
    })

    function compare(a,b) { 
      return (b.title.localeCompare(a.title)) 
    }


  </script>

</bootstrap-carousel>