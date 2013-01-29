<%-- 
    Document   : TabAdmin
    Created on : 26 janv. 2013, 12:10:37
    Author     : Maxime
--%>

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
            <TABLE BORDER="1">
                <CAPTION> Rapport </CAPTION> 
                <TR> 
                    <TH> ID </TH> 
                    <TH> DateUpdate </TH> 
                    <TH> Montre </TH> 
                    <TH> Client </TH>  
                    <TH> Select </TH> 
                </TR>
                <%
                    List<metier.Rapport> resp = new ArrayList<metier.Rapport>();
                    RapportService rapports = MetierFactory.getRapportServ();
                    resp = rapports.getAll();
                    for (int i = 0; i < resp.size(); i++) {
                        out.print("<TR><TH>" + resp.get(i).getId() + "</TH>"
                                + "<TH>" + resp.get(i).getDateUpdate() + "</TH>"
                                + "<TH>" + resp.get(i).getMontre() + "</TH>"
                                + "<TH>" + resp.get(i).getMontre().getProprietaire().getId() + "</TH>"
                                + "<TH>" +"<input type='checkbox' name='option1' value='"+resp.get(i).getId()+"'></TH></TR>");
                                               }
                %>
           </TABLE> 
        </div>
    </body>
</html>
