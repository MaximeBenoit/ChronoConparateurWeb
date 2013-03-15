<%-- 
    Document   : TabAdmin
    Created on : 26 janv. 2013, 12:10:37
    Author     : Maxime
--%>

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
            <center>
            <TABLE BORDER="1">
                <CAPTION> Rapport </CAPTION>
                
                <TR> 
                    <TH> Référence </TH> 
                    <TH> Date de modification </TH> 
                    <TH> Montre </TH> 
                    <TH> Référence client </TH>  
                    <TH> Opération </TH> 
                </TR>
                <%
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                    String compoMontre;
                
                    List<metier.Rapport> resp = new ArrayList<metier.Rapport>();
                    RapportService rapports = MetierFactory.getRapportServ();
                    resp = rapports.getAll();
                    for (int i = 0; i < resp.size(); i++) {
                        compoMontre = "Référence : " + resp.get(i).getAcquisition().getMontre().getId() + "\nFabricant : " + resp.get(i).getAcquisition().getMontre().getFabricant();
                                
                        out.print("<TR><TH>" + resp.get(i).getId() + "</TH>"
                                + "<TH>" + sdf.format(resp.get(i).getDateUpdate()) + "</TH>"
                                + "<TH>" + compoMontre + "</TH>"
                                + "<TH>" + resp.get(i).getAcquisition().getMontre().getProprietaire().getId() + "</TH>"
                                + "<TH>" + "<form action='Projet.do' method='POST'><input type='hidden' name='supprimerRapport' value='" + resp.get(i).getId() + "'><input type='submit' name='do' value='Supprimer rapport' style='vertical-align: middle' ></form></TH></TR>");}    
                %>
            </TABLE> 
    </center>
        </div>
    </body>
</html>
