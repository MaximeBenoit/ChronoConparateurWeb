<%-- 
    Document   : TabAdmin
    Created on : 26 janv. 2013, 12:10:37
    Author     : Maxime
--%>

<%@page import="metier.Operateur"%>
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
        <%--     <form action='Projet.do' method='POST'>
                <input type="text" name="inputRechercheOperateur">
                <select name="rechercherOperateur"> 
                    <option value="ref">Référence</option> 
                    <option value="login">Identifiant</option> 
                </select>

                <input type="submit" name="do"value="Ok">

                <input type="submit" name="do" value="Afficher tout">
            </form> --%>
            <%

                List<metier.Operateur> resp = new ArrayList<metier.Operateur>();
               /* String value = (String) request.getAttribute("idRecherche");
                String element = (String) request.getAttribute("type");
                if (value != null) {
                    if (element.equals("ref")) {
                        Operateur operateur = MetierFactory.getOperateurServ().getById(Long.parseLong(value));
                         resp.add(operateur);
                    }else if (element.equals("login")){
                        Operateur operateur = MetierFactory.getOperateurServ().getByLogin(value);
                         resp.add(operateur);
                    }
                }*/
                OperateurService operateurs = MetierFactory.getOperateurServ();
                resp = operateurs.getAll();
                String fonction = null;
                Integer cpt = 0;

                for (int i = 0; i < (resp.size() / 3) + 1; i++) {
                    Integer j;

                    out.print("<TR>");
                    for (j = 0; j < 3 & cpt < resp.size(); j++) {
                        if (resp.get(cpt).isAdmin()) {
                            fonction = "Admin";
                        } else {
                            fonction = "Opérateur";
                        }
                        if (j < resp.size()) {
                            out.print("<TD  style='width:  120px;'><p align='left'><FONT size='2'>" + "Référence : " + resp.get(cpt).getId()
                                    + "<br>" + "Fonction : " + fonction
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


        <div style="width: 600px;"><center>
                <input type="submit" name="do" value="Modifier Operateur">

                <input type="submit" name="do" value="Supprimer"></center></div></form>
</body>
</html>
