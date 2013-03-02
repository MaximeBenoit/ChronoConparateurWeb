package client;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    private OperateurORMService operateurORMSrv = PhysiqueDataFactory.getOperateurORMSrv();
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
        Long idBDD = null;
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
        System.out.println("DOACTION : "+doAction);
        String doActionModifierRapport = request.getParameter("doModifierRapport");
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
                        request.setAttribute("erreurPage", "erreurMdp");
                    }
                }
            } else {
                page = "/erreurConnexion.jsp";
                request.setAttribute("erreurPage", "erreurLogin");
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
            } else if (mdpInscription.equals(confirmMdpInscription)) {
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
                request.setAttribute("erreurPage", "erreurMdpPasEgal");
            }
        }
        /*   Xx Debut SupprimerRapport xX  */
        if ("Supprimer rapport".equals(doAction)) {

            String id = request.getParameter("supprimerRapport");
            System.out.println("Suppression id : " + id);
            if (id == null) {
                page = "/erreurConnexion.jsp";
                request.setAttribute("erreurPage", "erreurSuppressionRapport");
            } else {
                RapportORMService rapportORMService = PhysiqueDataFactory.getRapportORMSrv();

                try {
                    rapportORMService.removeRapport(rapportORMService.getById(Long.parseLong(id)));
                } catch (Exception ex) {
                    Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
                }
                page = "/TabRapport.jsp";
            }

        }
        /*   Xx Fin SupprimerRapport xX  */

        /*   Xx Debut ModifierRapport xX  
         if ("Modifier Rapport".equals(doAction)) {
         Rapport rapport = null;
         String id = request.getParameter("modifierRapport");
         System.out.println("id : " + id);
         if (id == null) {
         page = "/erreurConnexion.jsp";
         request.setAttribute("erreurPage", "erreurModificationRapport");
         } else {
         RapportORMService rapportORMService = PhysiqueDataFactory.getRapportORMSrv();

         try {
         rapport = rapportORMService.getById(Long.parseLong(id));
         System.out.println("rapport : " + rapport);
         page = "/ModifierRapport.jsp";
         request.setAttribute("rapport", rapport);
         } catch (Exception ex) {
         Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
         }
         System.out.println("Rapport : " + rapport);
         }
         }*/
        /*   Xx Fin ModifierRapport xX  */


        /*
         if ("Modifier".equals(doActionModifierRapport)) {
         RapportORMService rapportORMService = PhysiqueDataFactory.getRapportORMSrv();
         MontreORMService montreORMService = PhysiqueDataFactory.getMontreORMSrv();

         Rapport rapport = new Rapport();
         String fabricantMontre = request.getParameter("fabricantMontre");
         String referenceMontre = request.getParameter("referenceMontre");
         String referenceClient = request.getParameter("referenceClient");
         String reference = request.getParameter("reference");
         //rapport.getMontre().setFabricant(fabricantMontre);
         Montre montre = new Montre();
         try {
         montre = montreORMService.getById(Long.parseLong(referenceMontre));
         } catch (Exception ex) {
         Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
         }
         montre.setId(Long.parseLong(referenceMontre));

         rapport.setMontre(montre);
         rapport.setDateUpdate(new Date());
         rapport.setId(Long.parseLong(reference));
         try {
         rapportORMService.updateRapport(rapport);
         } catch (Exception ex) {
         Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
         }
         page = "/TabRapport.jsp";
         }
         */
        /*   Xx Fin ModifierRapport xX  */

        /*   Xx Debut ModifierOperateur xX  */
        if ("Modifier Operateur".equals(doAction)) {
            Operateur operateur = null;
            String id = request.getParameter("modifierOperateur");
            System.out.println("id : " + id);
            if (id == null) {
                page = "/erreurConnexion.jsp";
                request.setAttribute("erreurPage", "erreurModificationOperateur");
            } else {
                OperateurORMService operateurORMService = PhysiqueDataFactory.getOperateurORMSrv();

                try {
                    operateur = operateurORMService.getById(Long.parseLong(id));
                    System.out.println("opérateur : " + operateur);
                    page = "/Modifieroperateur.jsp";
                    request.setAttribute("operateur", operateur);
                } catch (Exception ex) {
                    Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
                }
                System.out.println("opérateur : " + operateur);
            }
        }
        /*   Xx Fin ModifierOperateur xX  */
        /*   Xx Debut ModifierRapport xX  */
        /*   Xx Debut ModifierOperateur xX  */
        if ("Modifier".equals(doAction)) {
            OperateurORMService operateurORMService = PhysiqueDataFactory.getOperateurORMSrv();
            Operateur operateur = new Operateur();
            String nom = request.getParameter("nomModification");
            String prenom = request.getParameter("prenomModification");
            String login = request.getParameter("loginModification");
            String mdp = request.getParameter("mdpModification");
            String id = request.getParameter("idModification");
            boolean admin = false;
            String param = request.getParameter("checkOperateur");
            System.out.println("check : " + param);
            if (param == null) {
                admin = false;
            } else {
                admin = true;
            }
            System.out.println("admin : " + admin);
            operateur.setNom(nom);
            operateur.setPrenom(prenom);
           operateur.setLogin(login);
            operateur.setMdp(mdp);
            operateur.setAdmin(admin);
            operateur.setId(Long.parseLong(id));
            try {
                operateurORMService.updateOperateur(operateur);
            } catch (Exception ex) {
                Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
            }
            page = "/TabOperateur.jsp";
        }

        /*   Xx Fin ModifierOperateur xX  */

        /*   Xx Debut supprimerOperateur xX  */
        if ("Supprimer".equals(doAction)) {//ModifierOperateur
            String id = request.getParameter("supprimerOperateur");
            String checkOperateur = request.getParameter("checkOperateur");
            List<Operateur> operateurs =null;
            try {
               operateurs= operateurORMSrv.getAll();
            } catch (Exception ex) {
                Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("OPERATEUR A SUPPRIMER : "+operateurs.get(Integer.parseInt(checkOperateur)));
            Operateur o = operateurs.get(Integer.parseInt(checkOperateur));
            if (o.getId()==0 ) {
                page = "/erreurConnexion.jsp";
                request.setAttribute("erreurPage", "erreurSuppressionOperateur");
            } else {
                try {
                    operateurORMSrv.removeOperateur(o);
                } catch (Exception ex) {
                    Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
                }
                page = "/TabOperateur.jsp";
            }
        }

        /*   Xx Fin supprimerOperateur xX  */

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
