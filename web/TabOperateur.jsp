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
    <center><h1>Opérateur</h1></center>
</head>
<body>
    <form name="Supprimer" action="Projet.do" method="post" style="width:800px; padding-bottom:15px;" onsubmit="return validation()" >

        <br>
        <TABLE style="width:  700px;" BORDER="1">

            <%

                List<metier.Operateur> resp = new ArrayList<metier.Operateur>();
                OperateurService operateurs = MetierFactory.getOperateurServ();
                resp = operateurs.getAll();
                String isAdmin = null;
                Integer cpt = 0;

                for (int i = 0; i < (resp.size() / 3) + 1; i++) {
                    Integer j;
                    if (resp.get(i).isAdmin()) {
                        isAdmin = "Admin";
                    } else {
                        isAdmin = "Opérateur";
                    }
                    out.print("<TR>");
                    for (j = 0; j < 3 & cpt < resp.size(); j++) {

                        if (j < resp.size()) {
                            out.print("<TD  style='width:  120px;'><p align='left'><FONT size='2'>" + "Référence : " + resp.get(cpt).getId()
                                    + "<br>" + "Fonction : " + isAdmin
                                    + "<br>" + "Login : " + resp.get(cpt).getLogin()
                                    + "<br>" + "Mot de passe : " + resp.get(cpt).getMdp()
                                    + "<br>" + "Nom : " + resp.get(cpt).getNom()
                                    + "<br>" + "Prénom : " + resp.get(cpt).getPrenom() + "<br><br></TH>"
                                    + "<TH style='width:  10px;'>" + "<input type='checkbox' value='" + cpt + "' name='checkOperateur' /><br>"
                                    + "</form>" + "</TD>");
                            cpt++;
                        }
                    }
                    out.print("</TR>");


                    /* + "<TD style='width:  120px;'><p align='left'><FONT size='2'>" + "Référence : " + resp.get(i + 1).getId()
                     + "<br>" + "Fonction : " + isAdmin
                     + "<br>" + "Login : " + resp.get(i + 1).getLogin()
                     + "<br>" + "Mot de passe : " + resp.get(i + 1).getMdp()
                     + "<br>" + "Nom : " + resp.get(i + 1).getNom()
                     + "<br>" + "Prénom : " + resp.get(i + 1).getPrenom() + "<br><br></TH>"
                     + "<TH style='width:  10px;'>" + "<input type='checkbox' value='" + i + 1 + "' name='checkOperateur' /><br>"
                     + "</form>" + "</TD>"
                     + "<TD style='width:  120px;'><p align='left'><FONT size='2'>" + "Référence : " + resp.get(i + 2).getId()
                     + "<br>" + "Fonction : " + isAdmin
                     + "<br>" + "Login : " + resp.get(i + 2).getLogin()
                     + "<br>" + "Mot de passe : " + resp.get(i + 2).getMdp()
                     + "<br>" + "Nom : " + resp.get(i + 2).getNom()
                     + "<br>" + "Prénom : " + resp.get(i + 2).getPrenom() + "<br><br></TH>"
                     + "<TH style='width:  10px;'>" + "<input type='checkbox' value='" + i + 2 + "' name='checkOperateur' /><br>"
                     + "</form>" + "</TD>"
                     + "</FONT></p></TH></TR>");*/
                }

            %>
        </TABLE> 


        <div style="width: 600px;
             "><center>
                <input type="submit" name="do" value="Modifier Operateur">

                </input><input type="submit" name="do" value="Supprimer"></input></center></div></form>
</body>
</html>
