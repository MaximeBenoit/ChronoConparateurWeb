<article>
    <br />
    <p>
        <% String erreur = (String) request.getAttribute("erreurPage");
            if (erreur == "erreurLogin") {
        %>
        Erreur d'authentification.<br>
        Veuillez v�rifier votre login de connexion.  
        <% }
            if (erreur == "erreurSuppressionOperateur") {
        %>
        Vous ne pouvez pas supprimer cet op�rateur.
        <%}
            if (erreur == "loginExistant") {
        %>
        Login d�ja existant.<br>
        Veuillez choisir un autre login.
        <%}
            if (erreur == "erreurMdp") {
        %>
        Erreur d'authentification.<br>
        Veuillez v�rifier votre mot de passe de connexion.
        <%}
            if (erreur == "erreurSuppressionRapport") {
        %>
        Vous ne pouvez pas supprimer se rapport.
        <%}
           if (erreur == "erreurModificationOperateur") {
        %>
        Vous ne pouvez pas modifier cet op�rateur.
        <%}
            if (erreur == "erreurMdpPasEgal") {
        %>
        Confiramtion de mot de passe invalide.
        <%}
        if(erreur == "elementIsNull"){
        %>
        Veuillez entrer un �l�ment.
        <% }
        %>
        
    <ul class="menu"> 
        <li><a href="javascript:history.go(-1)">Ok</a></li>
    </ul>
</p>   
</article>