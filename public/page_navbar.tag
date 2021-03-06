<page_navbar>
   
   <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><img src="images/logo80.png"></a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                     <li>
                        <a href="#qui">À propos.</a>
                    </li>
                   
                </ul>

                <ul class="nav navbar-nav navbar-right">
                     <li>
                        <a href="#search"><span id="coucou" class="glyphicon glyphicon-search"></span>&nbsp;</a>
                    </li>
                     <!--li>
                        <a href="#panier"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;</a>
                    </li-->
                    <li>
                        <a href="https://indizolo.wordpress.com/inscription-des-groupes/"><span>Inscription groupe</span></a>
                        <!--a href="#artiste"><span >Inscription groupe</span></a-->
                    </li>
                    <!--li>
                        <a href="#connecter"><span >Connect.</span></a>
                    </li>
                    <li>
                        <a href="#enregistrer"><span >Enregistr.</span></a>
                    </li-->
                </ul>
            </div>
       </div>
    </nav>

    <script>

    $(function () {

        $(document).on('click',function(){
            $('.navbar-collapse').removeClass('in')
        });

        console.log("script->page_navbar");

        // $('a[href="#search"]').on('click', function(event) {
        $(document).on('click','a[href="#search"]', function(event) {
            event.preventDefault();
            
            $('#search').addClass('open');
            $('#search > form > input[type="search"]').focus();

                $('form').submit(function(event) {
                    console.log(event);
                    $('#search').removeClass('open');
                    event.preventDefault();
                    var cherche = $('form input[type="search"]').val();
                    riot.route('/liste/'+cherche)
                })
        });
    
        $(document).on('click keyup','#search, #search .close', function(event) {
         if (event.target == this || event.target.className == 'close' || event.keyCode == 27) {
            $('#search').removeClass('open');

         }
        });
    
        // Do not include! This prevents the form from submitting for DEMO purposes only!
       

    });
    </script>
</page_navbar>