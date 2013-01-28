
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
    <head>
        <title>Chrono-comparateur</title>	 
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <meta http-equiv="content-language" content="fr" />
        <link href="Template/Dynamique/style.css" title="Défaut" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <body>	
        <div id="conteneur">
            <!--******* HEADER *******-->

            <!-- Inclure le fichier head.jsp -->
            <%@ include file="./modele/head.jsp" %>

            <!--******* HEADER *******-->
            <!--******* DIV ENTOURANT COLONNE GAUCHE ET DROITE *******-->	     
            <div id="contenu">
                <!--******* COLENNE GAUCHE *******-->		   

                
                
                 <!-- Inclure le fichier colonneGauche.jsp -->               
                <%
                    String droit = (String) request.getAttribute("sessionDroit");
                    System.out.println("droit = "+droit);
                %>
               
                <%        
                    if(droit == null){
                %>    
                            <%@ include file="./modele/colonneGaucheHorsLigne.jsp" %>
                <%                            
                    }if(droit != null){
                        if(droit.equals("1")){
                %>
                            <%@ include file="./modele/colonneGaucheEnLigne.jsp" %> 
                <%
                    }
                        if(droit.equals("2")){
                %>
                            <%@ include file="./modele/colonneGaucheEnLigneAdmin.jsp" %>
                <%        
                        }
                    }
                %>


                
                
           
                
                

                <!--******* COLONNE GAUCHE *******-->	

                <!--******* COLONNE DROITE *******-->
                <div id="right">	

                    <div class="haut_contenu"><img src="Template/Dynamique/images/puce.png" style="margin:0 5px" alt="" /></div>
                    <div class="fond_contenu">


                        <section>                
                            <% 
                                String contain = (String) request.getAttribute("contain");
                                if (contain != null) {
                            %>
                            <jsp:include page="${contain}" flush="false"/> 
                            <%  
                                } else {
                            %>    
                            <jsp:include page="/accueil.jsp" flush="false"/>             
                            <% 
                                }
                            %>
                        </section>


                        <!-- Inclure le fichier BasParagrapheColonneDroite.jsp --> 
                        <%@ include file="./modele/BasParagrapheColonneDroite.jsp" %>



                    </div>
                    <!--******* COLONNE DROITE *******-->	
                    <div style="clear:both"></div></div>						  
                <!--******* DIV ENTOURANT COLONNE GAUCHE ET DROITE *******-->		
                <!--******* Pied *******-->
                <div id="pied"></div>
            </div>

    </body>
</html>
