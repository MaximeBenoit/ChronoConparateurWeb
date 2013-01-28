<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 
 
<article>
    <form name="connexionForm" action="Projet.do" method="post" style="width:65%;margin:auto;padding-bottom:15px;" onsubmit="return validation()">
        <table align="center">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Login :</th>
                <td colspan="2"><input type="text" name="login" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="right">Mot de passe :</th>
                <td colspan="2"><input type="password" name="mdp" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <th align="center" colspan="4"><input type="submit" name="do" value="Connexion"/><input type= "reset" /></th>
            </tr>
        </table>
    </form>
</article>