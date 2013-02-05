<%-- 
    Document   : Inscription
    Created on : 31 janv. 2013, 19:52:41
    Author     : Maxime
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inscription</title>
    </head>
    <body>
    <center> <h1>Inscription</h1></center>
 <form name="AjoutOperateur" action="Projet.do" method="post" style="width:65%;margin:auto;padding-bottom:15px;" onsubmit="return validation()" >
    <table align="center">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <th align="right">Nom :</th>
            <td colspan="2"><input type="text" name="nomInscription" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <th align="right">Prénom :</th>
            <td colspan="2"><input type="text" name="prenomInscription" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <th align="right">Login :</th>
            <td colspan="2"><input type="text" name="loginInscription" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <th align="right">Mot de passe :</th>
            <td colspan="2"><input type="password" name="mdpInscription" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <th align="right">Confirmation <br>mot de passe :</th>
            
            <td colspan="2"><input type="password" name="confirmMdpInscription" /></td>
        </tr>
         <tr>
                <td>&nbsp;</td>
                <th align="center" colspan="4"><input type="submit" name="do" value="Ajout"></input><input type= "reset" /></th>                
            </tr>
    </table>
</form>
</body>
</html>
