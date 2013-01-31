<article>
    <br />
    <p>
        <% String erreur = (String) request.getAttribute("erreurPage"); 
        if(erreur == "erreurConnexion"){
%>
            ErreurConnexion
       <% } if(erreur == "erreurSuppression"){
           %>
           ErreurSuppression
       <%}
        %>
       
    </p>   
</article>