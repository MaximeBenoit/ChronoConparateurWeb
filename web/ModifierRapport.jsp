<%-- 
    Document   : Inscription
    Created on : 31 janv. 2013, 19:52:41
    Author     : Maxime
--%>

<%@page import="metier.Rapport"%>
<%@page import="physique.data.OperateurORMService"%>
<%@page import="physique.data.PhysiqueDataFactory"%>
<%@page import="metier.Operateur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            Object object = request.getAttribute("rapport");
            Rapport rapport = (Rapport) object;

        %>
        <title>Modifier Rapport</title>
    </head>
    <body>
    <center> <h1>Modification rapport</h1></center>
    <form name="ModifierRapport" action="Projet.do" method="post" style="width:65%;margin:auto;padding-bottom:15px;" onsubmit="return validation()" >
        <table align="center">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Fabricant montre :</th>
                <td colspan="2"><input type="text" name="fabricantMontre"value="<%= rapport.getMontre().getFabricant() %>" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Référence montre :</th>
                <td colspan="2"><input type="text" name="referenceMontre" value="<%= rapport.getMontre().getId() %>" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Référence client :</th>
                <td colspan="2"><input type="text" name="referenceClient"value="<%= rapport.getMontre().getProprietaire().getId() %>" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Date de modification :</th>
                <td colspan="2"><input type="text" name="dateModification" value="<%= rapport.getDateUpdate() %>"/></td>
            </tr>
                <td colspan="2"><input type="hidden" name="reference" value="<%= rapport.getId()%>"/></td>
            <tr>
                <td>&nbsp;</td>
                <th align="center" colspan="4"><input type="submit" name="doModifierRapport" value="Modifier"></input></th>                
            </tr>
        </table>
    </form>
</body>
</html>
