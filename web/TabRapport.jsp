<%-- 
    Document   : TabAdmin
    Created on : 26 janv. 2013, 12:10:37
    Author     : Maxime
--%>

<%@page import="metier.Client"%>
<%@page import="metier.Rapport"%>
<%@page import="metier.Montre"%>
<%@page import="metier.MontreService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="metier.RapportService"%>
<%@page import="metier.MetierFactory"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="table">
            <center>
                <TABLE BORDER="1"> 
                    <center><h1 id="Rapport"> Rapport </h1><br></center>
                    
                    <form action='Projet.do' method='POST'>
                        <input type="text" name="inputRecherche">
                        <select name="recherche"> 
                            <option value="reference">Référence</option> 
                            <option value="montre">Montre</option> 
                            <option value="referenceClient">Référence client</option> 
                        </select>

                        <input type="submit" name="do"value="Ok">

                        <input type="submit" name="do" value="Afficher tout">
                    </form>

                    <TR> 
                        <TH> Référence </TH>
                        <TH> Date de modification </TH> 
                        <TH> Montre </TH> 
                        <TH> Référence client </TH>  
                        <TH> Opération </TH> 
                    </TR>
                    <%

                        String id = (String) request.getAttribute("idRecherche");
                        String element = (String) request.getAttribute("type");
                        Integer nb = (Integer) request.getAttribute("nb");
                        List<metier.Montre> resp = new ArrayList<metier.Montre>();
                        MontreService montres = MetierFactory.getMontreServ();
                        long size = montres.count();
                        if (nb == null) {
                            nb = 0;
                        }
                        if (id != null) {
                            if (element.equals("reference")) {
                                Rapport rapport = MetierFactory.getRapportServ().getById(Long.parseLong(id));
                                Montre montre = MetierFactory.getMontreServ().getByRapport(rapport);
                                resp.add(montre);
                            } else if (element.equals("montre")) {
                                Montre montre = MetierFactory.getMontreServ().getById(Long.parseLong(id));
                                resp.add(montre);
                            } else if (element.equals("referenceClient")) {
                                Client client = MetierFactory.getClientServ().getById(Long.parseLong(id));
                                List<Montre> montre = MetierFactory.getMontreServ().getByProprietaire(client);
                                if (montre.size() > 1) {
                                    resp = montre;
                                } else {
                                    resp.add(montre.get(0));
                                }
                            }
                        } else {

                            resp = montres.getAll(nb, 5);
                        }

                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                        String compoMontre;
                        for (int i = 0; i < resp.size(); i++) {
                            compoMontre = "Référence : " + resp.get(i).getId();
                            out.print("<TR><TH>" + resp.get(i).getRapport().getId() + "</TH>"
                                    + "<TH>" + sdf.format(resp.get(i).getRapport().getDateUpdate()) + "</TH>"
                                    + "<TH>" + compoMontre + "</TH>"
                                    + "<TH>" + resp.get(i).getProprietaire().getId() + "</TH>"
                                    + "<TH>" + "<form action='Projet.do' method='POST'>"
                                    + "<input type='hidden' name='supprimerRapport' value='" + resp.get(i).getRapport().getId() + "'>"
                                    + "<input type ='hidden' name='supprimerMontre' value='" + resp.get(i).getId() + "'>"
                                    + " <input type='submit' name='do' value='Supprimer rapport' style='vertical-align: middle' >"
 + "                                    <br><input type ='submit' name='do' value='Detail' style='vertical-align: middle'></form></TH></TR>");

                        }

                    %>
                </TABLE> 
                <br>
                <form action='Projet.do' method='POST'> 
                    <div style="float: left">
                        <input  type="submit" name="do" style="width: 50px" value="<<" <%if (nb == 0) {%> disabled <%}%> >&nbsp
                    </div>
                    <div style="float: left">
                        <input type="submit" name="do" style="width: 100px"value="Precedent" <%if (nb == 0) {%> disabled <%}%> >&nbsp
                    </div>
                     <input type="hidden" name="nbList" value="<%= nb%>">
                    <div style="float: right">
                        <input type="hidden" name="finList" value="<%= size%>">
                        <input  type="submit" name="do" style="width: 50px" value=">>"<%if ((long) nb + 10 >= size) {%> disabled <%}%> >&nbsp
                    </div> 
                    <div style="float:  right">
                        <input type="submit" name="do" style="width: 100px"value="Suivant" <%if ((long) nb + 10 >= size) {%> disabled <%}%> >&nbsp
                    </div> 
                </form>
                <br>
            </center>
        </div>
    </body>
</html>
