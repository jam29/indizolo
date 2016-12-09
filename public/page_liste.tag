<page_liste>
      
      <!--div class="container-fluid"-->

        <div each={ item , index in this.liste } class="row">
          <div class="col-md-2" style="border: 0px solid red;"></div>
          <div class="col-md-3" style="border: 0px solid red;"><a href="#groupe/{ item._id }">{ item.name }</a></div>
          <div class="col-md-5" style="border: 0px solid red;">{ item.abstract }</div>
          <div class="col-md-2" style="border: 0px solid red;"></div>
        </div>

  <script>

  console.log ('Cherche dans groupe : ',this.opts.cherche);

  var that=this ;
  url =  "http://localhost:8080/bands/liste/"+that.opts.cherche

  var promise = $.getJSON(url) ;

  promise.done(function(liste) {
       console.log("liste:",liste)
         that.liste = liste;
         riot.update();
});
     
</script>

</page_liste>