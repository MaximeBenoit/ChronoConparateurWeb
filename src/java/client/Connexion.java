/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Max
 */
public class Connexion {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String page = request.getParameter("page");
        String login = request.getParameter("login");
        String mdp = request.getParameter("mdp");
        String loginBDD = null;
        String mdpBDD = null;
        boolean IsAdmin = false;
        try {
            loginBDD = metier.MetierFactory.getOperateurServ().getByLogin(login).getLogin();
            mdpBDD = metier.MetierFactory.getOperateurServ().getByLogin(login).getMdp();
            IsAdmin = metier.MetierFactory.getOperateurServ().getByLogin(login).isAdmin();
        } catch (Exception ex) {
            Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
        }


        if (loginBDD != null) {
            if (loginBDD.equals(login)) {
                if (mdpBDD.equals(mdp)) {
                    if (IsAdmin == true) {

                        request.setAttribute("sessionDroit", "2");
                        page = "/TabRapport.jsp";


                    } else {
                        request.setAttribute("sessionDroit", 1);
                        page = "/accueil.jsp";
                    }
                } else {
                    page = "/erreurConnexion.jsp";
                }
            }
        } else {
            page = "/erreurConnexion.jsp";
        }
    }
}
