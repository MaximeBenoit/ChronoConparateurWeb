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
    <form name="Supprimer" action="Projet.do" method="post" style="width:65%;margin:auto;padding-bottom:15px;" onsubmit="return validation()" >
<center><h1>Opérateur</h1></center>
<br>
<TABLE>

        <%
        
            List<metier.Operateur> resp = new ArrayList<metier.Operateur>();
            OperateurService operateurs = MetierFactory.getOperateurServ();
            resp = operateurs.getAll();
            String isAdmin = null;

            for (int i = 0; i < resp.size(); i++) {
                if (resp.get(i).isAdmin()) {
                    isAdmin = "Admin";
                } else {
                    isAdmin = "Opérateur";
                }
                out.print("<TR><TH><p align='left'><FONT size='2'>" +"Référence : "+ resp.get(i).getId() 
                        + "<br>"+"Fonction : "+isAdmin 
                        + "<br>"+"Login : "+resp.get(i).getLogin() 
                        + "<br>"+"Mot de passe : "+resp.get(i).getMdp()
                        + "<br>"+ "Nom : "+resp.get(i).getNom() 
                        + "<br>"+"Prénom : "+resp.get(i).getPrenom() +"<br><br></TH>"
                        + "<TH>" + "<input type='checkbox' value='"+i+"' name='checkOperateur' /><br>"
                        + "</form>" + "</TH>"
                        + "</FONT></p></TH></TR>");
            }
                        /*"<input type='hidden' name='modifierOperateur' value='" + resp.get(i).getId() + "'><input type='submit' name='do' value='Modifier Operateur'>"
                        + "<TH>" + resp.get(i).getLogin() + "</TH>"
                        + "<TH>" + resp.get(i).getMdp() + "</TH>"
                        + "<TH>" + resp.get(i).getNom() + "</TH>"
                        + "<TH>" + resp.get(i).getPrenom() + "</TH>"
                        + "<TH>" + "<form action='Projet.do' method='POST'><input type='hidden' name='supprimerOperateur' value='" + resp.get(i).getId() + "'><input type='submit' name='do' value='Supprimer operateur'><br>"
                        + "<input type='hidden' name='modifierOperateur' value='" + resp.get(i).getId() + "'><input type='submit' name='do' value='Modifier Operateur'>"
                        + "</form>*/
        %>
        
    </TABLE> 
        <input type="submit" name="do" value="Modifier Operateur"></input><input type="submit" name="do" value="Supprimer"></input>
    </form>
</body>
</html>
