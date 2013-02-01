package client;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.context.FacesContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import metier.Operateur;
import metier.OperateurService;
import physique.data.*;

/**
 *
 * @author maxime
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String loginBDD = null;
        String mdpBDD = null;
        boolean IsAdmin = false;
        String page = request.getParameter("page");
//        String session = request.getParameter("session");
//        request.setAttribute("sessionDroit", session);

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


//                            request.setAttribute("sessionDroit", "2");

                            page = "/TabRapport.jsp";
                            HttpSession httpSession = request.getSession(true);
                            httpSession.setAttribute("sessionDroit", Boolean.TRUE);
                        } else {
                            page = "/TabRapport.jsp";
                            HttpSession httpSession = request.getSession(true);
                            httpSession.setAttribute("sessionDroit", Boolean.FALSE);

                        }
                    } else {
                        page = "/erreurConnexion.jsp";
                        request.setAttribute("erreurPage", "erreurConnexion");
                    }
                }
            } else {
                page = "/erreurConnexion.jsp";
                request.setAttribute("erreurPage", "erreurConnexion");
            }
        }
        /*   Xx Fin Connexion xX  */

        /*   Xx Début Déconnexion xX  */
        if ("Deconnexion".equals(doAction)) {
            HttpSession httpSession = request.getSession(false);
            httpSession.setAttribute("sessionDroit", null);
        }
        /*   Xx Fin Déconnexion xX  */

        /*   Xx Début Ajout opérateur xX  */
        if ("Ajout".equals(doAction)) {
            OperateurService operateurORMService = metier.MetierFactory.getOperateurServ();
            Operateur operateur = new Operateur();

            String nomInscription = request.getParameter("nomInscription");
            String prenomInscription = request.getParameter("prenomInscription");
            String loginInscription = request.getParameter("loginInscription");
            String mdpInscription = request.getParameter("mdpInscription");
            String confirmMdpInscription = request.getParameter("confirmMdpInscription");
            boolean isAdminInscription = false;
            try {
                loginBDD = metier.MetierFactory.getOperateurServ().getByLogin(loginInscription).getLogin();
            } catch (Exception ex) {
                Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (loginInscription.equals(loginBDD)) {
                page = "/erreurConnexion.jsp";
                request.setAttribute("erreurPage", "loginExistant");
            }
            else if (mdpInscription.equals(confirmMdpInscription)) {
                operateur.setNom(nomInscription);
                operateur.setPrenom(prenomInscription);
                operateur.setLogin(loginInscription);
                operateur.setMdp(mdpInscription);
                operateur.setAdmin(isAdminInscription);
                try {
                    operateurORMService.addOperateur(operateur);
                } catch (Exception ex) {
                    Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                page = "/erreurConnexion.jsp";
                request.setAttribute("erreurPage", "ProblemeMdp");
            }





        }

        /*   Xx Debut SupprimerRapport xX  */
        if ("Supprimer".equals(doAction)) {

            String id = request.getParameter("supprimerRapport");

            if (id == null) {
                page = "/erreurConnexion.jsp";
                request.setAttribute("erreurPage", "erreurSuppression");
            } else {
                RapportORMService rapportORMService = PhysiqueDataFactory.getRapportORMSrv();

                try {
                    rapportORMService.removeRapport(rapportORMService.getById(Long.parseLong(id)));
                } catch (Exception ex) {
                    Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
                }

                System.out.println("Suppression id : " + id);
                page = "/TabRapport.jsp";
            }
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
