         <!--******* COLENNE GAUCHE *******-->		   
         <div id="left">

               <div class="hautmenu">Menu</div><div class="fondmenu">
                    <ul class="menu"> 
                        <li><a href="#"><% String nom =(String) session.getAttribute("sessionUser");%><%= nom%></a></li>
                        <li><a href="Projet.do?do=decoSession">Se déconnecter</a></li>
			<li><a href="#">Test</a></li>
			<li><a href="Projet.do?do=statistiqueUser">Mes résultats</a></li>
                    </ul>
             
			 <br />
			 
			 <a href="http://fr-fr.facebook.com/login.php" title="" target="_blank"><img src="./Template/Dynamique/images/facebook.png" alt="" /></a>
			 <a href="https://twitter.com/" title="" target="_blank"><img src="./Template/Dynamique/images/twitter.png" alt="" /></a>
			 <a href="" title=""><img src="./Template/Dynamique/images/rss.png" alt="" /></a>
			 
			 <br /><br />
			 
			 
                    <ul class="menu"> 
                        <li>Administration</li>
			<li><a href="Projet.do?page=gestionUser">Gestion Utilisateur</a></li>
			<li><a href="#">Gestion Questions</a></li>
			<li><a href="Projet.do?page=gestionStats">Gestion Statistiques</a></li>
                    </ul>
					
			<br />		
					
               </div><div class="basmenu"></div>
         </div>
         <!--******* COLONNE GAUCHE *******-->