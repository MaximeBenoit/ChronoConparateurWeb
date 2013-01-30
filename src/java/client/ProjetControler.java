package client;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import client.Connexion;

/**
 *
 * @author stephane
 */
public class ProjetControler extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String page = request.getParameter("page");
        String session = request.getParameter("session");
        request.setAttribute("sessionDroit", session);

        if (page != null) {
            page = "/" + page + ".jsp";
        } else {
            page = "/accueil.jsp";
        }

        String doAction = request.getParameter("do");

        /* if ("Inscription".equals(doAction)) {
         String nom = request.getParameter("nom");
         String password = request.getParameter("mdp1");

         Account account = new Account(nom, password, 1);
         try {
         manager.add(account);
         } catch (Exception ex) {
         Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
         }
         }*/

        /*   Xx Debut Connexion xX  */
        if ("Connexion".equals(doAction)) {
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
                            request.setAttribute("sessionDroit", "1");
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
        /*   Xx Fin Connexion xX  */
        
        /*   Xx Debut SupprimerRapport xX  */
        if ("SupprimerRapport".equals(doAction)) {
            System.out.println("test");
        }
        /*   Xx Fin SupprimerRapport xX  */
        
            request.setAttribute("contain", page);
            String template = "Dynamique";
            RequestDispatcher view = request.getRequestDispatcher("Template/" + template + "/main.jsp");
            view.forward(request, response);
        }

        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         * Handles the HTTP
         * <code>GET</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response
        )
            throws ServletException
        , IOException {
            processRequest(request, response);
        }

        /**
         * Handles the HTTP
         * <code>POST</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response
        )
            throws ServletException
        , IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>
    }
