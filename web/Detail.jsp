<%-- 
    Document   : Detail
    Created on : 11 avr. 2013, 15:05:45
    Author     : Max
--%>

<%@page import="metier.Acquisition"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="metier.Montre"%>
<%@page import="metier.Rapport"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Object detail = request.getAttribute("detail");
            Montre montre = (Montre) detail;
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
            List<Acquisition> test = montre.getRapport().getAcquisition();
            int value = 0;
        %>
    <center>   <h1>Détail du rapport</h1><br>
        <h3> N° de référence : <%=  montre.getRapport().getId()%></center></h3><br>

    Date de modification:  <%=  sdf.format(montre.getRapport().getDateUpdate())%><br><br>

    Référence montre : <%= montre.getId()%><br><br>

    Référence du client : <%= montre.getProprietaire().getId()%><br><br>

    Nom client : <%= montre.getProprietaire().getNom()%><br><br>

    Prenom client : <%= montre.getProprietaire().getPrenom()%><br><br>

    Fabricant de la montre : <%= montre.getFabricant()%><br><br>

    <TABLE BORDER="1">
        <tr>
            <th>/</th>
            <th>Variation de marche</th>
            <th>Repère</th>
            <th>Amplitude</th>
        </tr>
        <tr>
            <th>FH</th>
            <% for (int i = 0; i < test.size(); i++) {
                    if (test.get(i).getPositionMontre().equals("FH")) {
                        value = 1;
            %>

            <th><%
                out.print(test.get(i).getVariationDeMarche());
                %></th><th>
                <%
                    out.print(test.get(i).getRepere());
                    %></th>
            <th>
                <%
                    out.print(test.get(i).getAmplitude());
                %></th>
                <%}
                    }
                    if (value == 0) {%>
            <th>null</th><th>null</th><th>null</th> <%}%>
        </tr>
        <tr>
            <th>CH</th>
            <% for (int i = 0; i < test.size(); i++) {
                    if (test.get(i).getPositionMontre().equals("CH")) {
                    value = 1;%>
            <th><%
                out.print(test.get(i).getVariationDeMarche());
                %></th><th>
                <%
                    out.print(test.get(i).getRepere());
                    %></th>
            <th>
                <%
                    out.print(test.get(i).getAmplitude());
                %></th>
                <%}
                    }
                    if (value == 0) {%>
            <th>null</th><th>null</th><th>null</th> <%}%>
        </tr>
        <tr>
            <th>3H</th>
            <% for (int i = 0; i < test.size(); i++) {
                    if (test.get(i).getPositionMontre().equals("3H")) {
                    value = 1;%>
            <th><%
                out.print(test.get(i).getVariationDeMarche());
                %></th><th>
                <%
                    out.print(test.get(i).getRepere());
                    %></th>
            <th>
                <%
                    out.print(test.get(i).getAmplitude());
                %></th>
                <%}
                    }
                    if (value == 0) {%>
            <th>null</th><th>null</th><th>null</th> <%}%>
        </tr>
        <tr>
            <th>6H</th>
            <% for (int i = 0; i < test.size(); i++) {
                    if (test.get(i).getPositionMontre().equals("6H")) { 
                        value = 1;
        %>

            <th><%
                out.print(test.get(i).getVariationDeMarche());
                %></th><th>
                <%
                    out.print(test.get(i).getRepere());
                    %></th>
            <th>
                <%
                    out.print(test.get(i).getAmplitude());
                %></th>
                <%}
                    }
                    if (value == 0) {%>
            <th>null</th><th>null</th><th>null</th> <%}%>
        </tr>
        <tr>
            <th>9H</th>
            <% for (int i = 0; i < test.size(); i++) {
                    if (test.get(i).getPositionMontre().equals("9H")) {
                    value = 1;%>
            <th><%
                out.print(test.get(i).getVariationDeMarche());
                %></th><th>
                <%
                    out.print(test.get(i).getRepere());
                    %></th>
            <th>
                <%
                    out.print(test.get(i).getAmplitude());
                %></th>
                <%}
                    }
                    if (value == 0) {%>
            <th>null</th><th>null</th><th>null</th> <%}%>
        </tr>

        <tr>
            <th>12H</th>
            <% for (int i = 0; i < test.size(); i++) {
                    if (test.get(i).getPositionMontre().equals("12H")) {
                    value = 1;%>
            <th><%
                out.print(test.get(i).getVariationDeMarche());
                %></th><th>
                <%
                    out.print(test.get(i).getRepere());
                    %></th>
            <th>
                <%
                    out.print(test.get(i).getAmplitude());
                %></th>
                <%}
                    }
                    if (value == 0) {%>
            <th>null</th><th>null</th><th>null</th> <%}%>
        </tr>
    </TABLE>
        
</body>
</html>
