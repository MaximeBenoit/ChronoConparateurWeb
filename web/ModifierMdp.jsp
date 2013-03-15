<%--    
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
            Object info = session.getAttribute("information");
            Operateur operateur = (Operateur) info;
        %>
        <title>Modification mot de passe</title>
    </head>
    <body>
    <center> <h1>Modification mot de passe</h1></center>
    <form name="ModifierMdp" action="Projet.do" method="post" style="width:65%;margin:auto;padding-bottom:15px;" onsubmit="return validation()" >
        <table align="center">
            <tr>
                <td>&nbsp;</td>
                <th align="right">Login :</th>
                <td colspan="2"><input type='hidden' name='LoginHidden' value="<%= operateur.getLogin()%>"/><input type="text" name="LoginConfirmation"  value="<%= operateur.getLogin()%>" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Mot de passe actuel :</th>
                <td colspan="2"><input type="text" name="MdpActuel" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Nouveau mot de passe :</th>
                <td colspan="2"><input type="text" name="NouveauMdp" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Confirmation mot de passe :</th>
                <td colspan="2"><input type="text" name="ConfirmationMdp"/></td>
            </tr>

            <td>&nbsp;</td>

            <th align="center" colspan="4"><input type="submit" name="do" value="Confirmer"></input><input type= "reset" /></th>                
            </tr>
        </table>
    </form>
</body>
</html>

