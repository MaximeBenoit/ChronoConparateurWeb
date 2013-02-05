<%-- 
    Document   : Inscription
    Created on : 31 janv. 2013, 19:52:41
    Author     : Maxime
--%>

<%@page import="physique.data.OperateurORMService"%>
<%@page import="physique.data.PhysiqueDataFactory"%>
<%@page import="metier.Operateur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            Object object = request.getAttribute("operateur");
            Operateur operateur = (Operateur) object;

        %>
        <title>Modifier opérateur</title>
    </head>
    <body>
    <center> <h1>Modification opérateur</h1></center>
    <form name="ModifierOperateur" action="Projet.do" method="post" style="width:65%;margin:auto;padding-bottom:15px;" onsubmit="return validation()" >
        <table align="center">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Nom :</th>
                <td colspan="2"><input type="text" name="nomModification"value="<%= operateur.getNom()%>" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Prénom :</th>
                <td colspan="2"><input type="text" name="prenomModification" value="<%= operateur.getPrenom()%>" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Login :</th>
                <td colspan="2"><input type="text" name="loginModification"value="<%= operateur.getLogin()%>" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Mot de passe :</th>
                <td colspan="2"><input type="text" name="mdpModification" value="<%= operateur.getMdp()%>"/></td>
            </tr>
              <tr>
                <td>&nbsp;</td>
                <th align="right">Référence :</th>
                <td colspan="2"><input type="text" name="idModification" value="<%= operateur.getId()%>"/></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Administrateur</th>
                <% if (operateur.isAdmin()) {
    %>
                <td colspan="2"><input type="checkbox" name="checkOperateur" checked /></td>
                    <% } else {%>
                <td colspan="2"><input type="checkbox" name="checkOperateur"  /></td>
                    <% }%>
            </tr>
            <tr>
                <td>&nbsp;</td>
                 
                <th align="center" colspan="4"><input type="submit" name="do" value="Modifier"></input><input type= "reset" /></th>                
            </tr>
        </table>
    </form>
</body>
</html>
