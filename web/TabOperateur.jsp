<%-- 
    Document   : TabAdmin
    Created on : 26 janv. 2013, 12:10:37
    Author     : Maxime
--%>

<%@page import="metier.OperateurService"%>
<%@page import="metier.RapportService"%>
<%@page import="metier.MetierFactory"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tableau operateur</title>
    </head>
    <body>
        <div class="table">
            <TABLE BORDER="1">
                <CAPTION> Operateur </CAPTION> 
                <TR> 
                    <TH> ID </TH> 
                    <TH> Administrateur </TH> 
                    <TH> Login </TH> 
                    <TH> Mot de passe </TH>  
                    <TH> Nom </TH> 
                    <TH> Prenom </TH> 
                    <TH> Opération </TH> 
                </TR>
                <%
                    List<metier.Operateur> resp = new ArrayList<metier.Operateur>();
                    OperateurService operateurs = MetierFactory.getOperateurServ();
                    resp = operateurs.getAll();
                    String isAdmin = null;
                    
                    for (int i = 0; i < resp.size(); i++) {
                        if(resp.get(i).isAdmin()) {
                            isAdmin = "Administrateur";
                        } else {
                            isAdmin = "Opérateur";
                        }
                        out.print("<TR><TH>" + resp.get(i).getId() + "</TH>"
                                + "<TH>" + isAdmin + "</TH>"
                                + "<TH>" + resp.get(i).getLogin() + "</TH>"
                                + "<TH>" + resp.get(i).getMdp()+ "</TH>"
                                 + "<TH>" + resp.get(i).getNom()+ "</TH>"
                                  + "<TH>" + resp.get(i). getPrenom()+ "</TH>"
                                + "<TH>" + "<form action='Projet.do' method='POST'><input type='hidden' name='supprimerRapport' value='"+resp.get(i).getId()+"'><input type='submit' name='do' value='Supprimer'></form></TH></TR>");}
                    
                %>
           </TABLE> 
        </div>
    </body>
</html>
