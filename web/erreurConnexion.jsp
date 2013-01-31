<article>
    <br />
    <p>
        <% String erreur = (String) request.getAttribute("erreurPage");
            if (erreur == "erreurConnexion") {
        %>
        ErreurConnexion  
    <ul class="menu"> 
        <li><a href="Projet.do?page=connexionAccount">Ok</a></li>
    </ul>
    <% }
        if (erreur == "erreurSuppression") {
    %>
    ErreurSuppression
    <ul class="menu"> 
        <li><a href="Projet.do?page=TabRapport">Ok</a></li>
    </ul>
    <%}
        if (erreur == "loginExistant") {
    %>
    Login déja existant.<br> Veuillez choisir un autre login.
    <ul class="menu"> 
        <li><a href="Projet.do?page=Inscription">Ok</a></li>
    </ul>
    <%}
        if (erreur == "ProblemeMdp") {
    %>
    Erreur mot de passe.
    <ul class="menu"> 
        <li><a href="Projet.do?page=Inscription">Ok</a></li>
    </ul>
    <%}
    %>

</p>   
</article>