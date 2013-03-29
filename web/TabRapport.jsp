<%-- 
    Document   : TabAdmin
    Created on : 26 janv. 2013, 12:10:37
    Author     : Maxime
--%>

<%@page import="metier.Rapport"%>
<%@page import="metier.Montre"%>
<%@page import="metier.MontreService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="metier.RapportService"%>
<%@page import="metier.MetierFactory"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="table">

            <center><h1> Rapport </h1><br></center>

            <center>
                <TABLE BORDER="1">
                    <form action='Projet.do' method='POST'>
                        <input type="text" name="inputRecherche">
                        <select name="recherche"> 
                            <option value="reference">Référence</option> 
                            <option value="montre">Montre</option> 
                            <option value="referenceClient">Référence client</option> 
                        </select>
                        <input type="hidden" value="">
                        <input type="submit" name="do"value="Ok">
                    </form>
                    <TR> 
                        <TH> Référence </TH> 
                        <TH> Date de modification </TH> 
                        <TH> Montre </TH> 
                        <TH> Référence client </TH>  
                        <TH> Opération </TH> 
                    </TR>
                    <%

                        String id = (String) request.getAttribute("idRecherche");
                        String element = (String) request.getAttribute("type");
                        if (element.equals("reference")) {
                            if ((Long.parseLong(id)!=0)) {
                                Montre montre = MetierFactory.getMontreServ().getById(Long.parseLong(id));
                                /* out.print("<TR><TH>" + rapport.getId()+ "</TH>"
                                    + "<TH>" + rapport.getDateUpdate() + "</TH>"
                                    + "<TH>" + rapport.get + "</TH>"
                                    + "<TH>" + resp.get(i).getProprietaire().getId() + "</TH>");*/
                            }
                        } else if (element.equals("montre")) {
                            if (id != null) {
                            }
                        } else if (element.equals("referenceClient")) {
                            if (id != null) {
                            }
                        }
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                        String compoMontre;
                        List<metier.Montre> resp = new ArrayList<metier.Montre>();
                        MontreService montres = MetierFactory.getMontreServ();
                        resp = montres.getAll();
                        for (int i = 0; i < resp.size(); i++) {
                            compoMontre = "Référence : " + resp.get(i).getId();

                            out.print("<TR><TH>" + resp.get(i).getRapport().getId() + "</TH>"
                                    + "<TH>" + sdf.format(resp.get(i).getRapport().getDateUpdate()) + "</TH>"
                                    + "<TH>" + compoMontre + "</TH>"
                                    + "<TH>" + resp.get(i).getProprietaire().getId() + "</TH>"
                                    + "<TH>" + "<form action='Projet.do' method='POST'>"
                                    + "<input type='hidden' name='supprimerRapport' value='" + resp.get(i).getRapport().getId() + "'>"
                                    + "<input type ='hidden' name='supprimerMontre' value='" + resp.get(i).getId() + "'>"
                                    + " <input type='submit' name='do' value='Supprimer rapport' style='vertical-align: middle' ></form></TH></TR>");
                        }
                    %>
                </TABLE> 
            </center>
        </div>
    </body>
</html>
