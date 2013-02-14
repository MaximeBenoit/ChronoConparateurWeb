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
    
    <TABLE>
        <CAPTION> Operateur </CAPTION> 
        <TR> 
            <TH> Opérateur </TH> 
            <TH> Check </TH> 
           
        </TR>
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
                        +"<br>"+"Fonction : "+isAdmin 
                        +"<br>"+"Login : "+resp.get(i).getLogin() 
                        +"<br>"+"Mot de passe : "+resp.get(i).getMdp()
                        +"<br>"+ "Nom : "+resp.get(i).getNom() 
                        +"<br>"+"Prénom : "+resp.get(i).getPrenom() +"<br><br></TH>"
                        + "<TH>" + "<form action='Projet.do' method='POST'><input type='hidden' name='supprimerOperateur' value='" + resp.get(i).getId() + "'><input type='checkbox' name='checkOperateur'  /><br>"
                        + "<input type='hidden' name='modifierOperateur' value='" + resp.get(i).getId() + "'><input type='submit' name='do' value='Modifier Operateur'>"
                        + "</form>" + "</TH>"
                        +"</FONT></p></TH></TR>");
            }
                        /*+ "<TH>" + resp.get(i).getLogin() + "</TH>"
                        + "<TH>" + resp.get(i).getMdp() + "</TH>"
                        + "<TH>" + resp.get(i).getNom() + "</TH>"
                        + "<TH>" + resp.get(i).getPrenom() + "</TH>"
                        + "<TH>" + "<form action='Projet.do' method='POST'><input type='hidden' name='supprimerOperateur' value='" + resp.get(i).getId() + "'><input type='submit' name='do' value='Supprimer operateur'><br>"
                        + "<input type='hidden' name='modifierOperateur' value='" + resp.get(i).getId() + "'><input type='submit' name='do' value='Modifier Operateur'>"
                        + "</form>*/
        %>
    </TABLE> 
    
</body>
</html>
