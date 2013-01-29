<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <style type="text/css">

a.boldbuttons{
background: transparent url('Template/Dynamique/images/roundedge-blue-right.gif') no-repeat top left;
display: block;
float: left;
font: bold 13px Arial; /* Change 13px as desired */
line-height: 22px; /* This value + 4px + 4px (top and bottom padding of SPAN) must equal height of button background (default is 30px) */
height: 30px; /* Height of button background height */
padding-left: 8px; /* Width of left menu image */
text-decoration: none;

}

a:link.boldbuttons, a:visited.boldbuttons, a:hover.boldbuttons, a:active.boldbuttons{
color: white; /*button text color*/
}

a.boldbuttons span{
background: transparent url('media/roundedge-gray-right.gif') no-repeat top right;
display: block;
padding: 4px 10px 4px 2px; /*Set 10px to be equal or greater than'padding-left' value above*/
}

a:hover.boldbuttons{ /* Hover state CSS */
text-decoration: underline;
}


.buttonwrapper{ /* Container you can use to surround a CSS button to clear float */
overflow: hidden; /*See: http://www.quirksmode.org/css/clearing.html */
width: 100%;
}

</style>
 
<article>
    <div class="buttonwrapper">
    <form name="connexionForm" action="Projet.do" method="post" style="width:65%;margin:auto;padding-bottom:15px;" onsubmit="return validation()" >
      
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
            <th align="center" colspan="4"><input type="submit" name="do" value="Connexion"></input><input type= "reset" /></th>                
            </tr>
        </table>
    </form>
        </div>
</article>