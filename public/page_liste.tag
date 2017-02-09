<page_liste>
      
      <!--div class="container-fluid"-->

        <div each={ item , index in this.liste } class="row">
         
          <div class="col-md-2" style="border: 0px solid red;"><a href="#groupe/{ item._id }">{ item.name }</a></div>
           <div class="col-md-2" style="border: 0px solid red;"><img class="img-responsive img-rounded" style="max-width:120px" src={item.cover}/></div>
          <div class="col-md-6" style="border: 0px solid red;">{ item.abstract }</div>
          <div class="col-md-2" style="border: 0px solid red;">
            
            <span each={ tag in item.style } class="label label-danger" style="margin-right:5px;margin-top:5px" }>{ tag }</span>

          </div>
        </div>

  <script>

  console.log ('Cherche dans groupe : ',this.opts.cherche);

  var that=this ;
  url =  "/bands/liste/"+that.opts.cherche

  var promise = $.getJSON(url) ;

  promise.done(function(liste) {
       console.log("liste:",liste)
         that.liste = liste;
         riot.update();
});
     
</script>

</page_liste>