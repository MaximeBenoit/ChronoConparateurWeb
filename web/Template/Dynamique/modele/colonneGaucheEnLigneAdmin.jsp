<!--******* COLENNE GAUCHE *******-->		   
<div id="left">

    <div class="hautmenu">Menu</div><div class="fondmenu">
        <ul class="menu"> 
            <li><a href="Projet.do?page=TabRapport">Rapport</a></li>
            <li><a href="Projet.do?page=Information">Information</a></li>
            <li><a href="Projet.do?page=TabOperateur">Administration</a></li>
            <!-- <li><a onclick="deco();return false;">Déconexion</a></li>-->
            <li><a  href="http://localhost:8080/chronoComparateurWeb/Projet.do?do=Deconnexion">Déconnexion</a></li>

        </ul>

        <br/>
        <!--  <form method="GET">
              <input type="hidden" value="Deconnexion" name="do"/>
              <button type="submit" value="Sub"/>            
          </form>-->	


        <%--<ul class="menu"> 
           <li>Administration</li>
           <li><a href="Projet.do?page=gestionUser">Gestion Utilisateur</a></li>
           <li><a href="#">Gestion Questions</a></li>
           <li><a href="Projet.do?page=gestionStats">Gestion Statistiques</a></li>
       </ul>
        <br />		
        <script>
            var http;
            function createRequest(){
                var http;
                if(window.XMLHttpRequest){
                    //Mozilla,safari,IE7
                    http = new XMLHttpRequest();  
                }else if (window.ActiveXobjet)
                {http=new ActiveXobjet("Microsoft.XMLHTTP");
                }
                return http;
            }
            function deco(){
              http = createRequest();
              http.open('POST', "http://localhost:8080/chronoComparateurWeb/Projet.do?do=Deconnexion", true);
              http.onreadystatechange = coucou;
              http.send(null);
               
            }
            function coucou(){
                if(http.readyState ==4){
                    if(http.status == 200){
                        document.getElementById('resultat').innerHTML = http.responseText;
                    }
                }
            }
        </script>--%>
    </div><div class="basmenu"></div>
</div>
<!--******* COLONNE GAUCHE *******-->