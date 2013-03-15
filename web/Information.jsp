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
        
            Object info =session.getAttribute("information");
            Operateur operateur = (Operateur) info;
        %>
        <title>Information opérateur</title>
    </head>
    <body>
    <center> <h1>Information opérateur</h1></center>
    <form name="ModifierOperateur" action="Projet.do" method="post" style="width:65%;margin:auto;padding-bottom:15px;" onsubmit="return validation()" >
        <table align="center">
            <tr>
                <td>&nbsp;</td>
                <th align="right">Nom :</th>
                <td colspan="2"><input type="text" name="nomInformation"value="<%= operateur.getNom()%>" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Prénom :</th>
                <td colspan="2"><input type="text" name="prenomInformation" value="<%= operateur.getPrenom()%>" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Login :</th>
                <td colspan="2"><input type="text" name="loginInformation"value="<%= operateur.getLogin()%>" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Mot de passe :</th>
                <td colspan="2"><input type="text" name="mdpInformation" value="<%= operateur.getMdp()%>"/></td>
            </tr>
                <td colspan="2"><input type="hidden" name="idInformation" value="<%= operateur.getId()%>" /></td>
            <tr>
                <td>&nbsp;</td>
                 
                <th align="center" colspan="4"><input type="submit" name="do" value="Modifier"></input><input type= "reset" /></th>                
            </tr>
        </table>
    </form>
</body>
</html>
