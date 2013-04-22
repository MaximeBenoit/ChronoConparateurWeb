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
import client.AjoutOperateur;
import metier.MetierFactory;
import metier.Montre;
import metier.MontreService;

/**
 *
 * @author maxime
 */
public class ProjetControler extends HttpServlet {
    
    private OperateurORMService operateurORMSrv = PhysiqueDataFactory.getOperateurORMSrv();
    AjoutOperateur ajoutOperateurSrv = new AjoutOperateur();

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
        long idMontreBdd;
        long idRapportBdd = 0;
        long idClient;
        long idOperateur;
        String page = request.getParameter("page");
//        String session = request.getParameter("session");
//        request.setAttribute("sessionDroit", session);
        Operateur o = null;
        if (page != null) {
            page = "/" + page + ".jsp";
        } else {
            page = "/accueil.jsp";
        }
        
        String doAction = request.getParameter("do");
        System.out.println("DOACTION : " + doAction);
        String doActionModifierRapport = request.getParameter("doModifierRapport");
        
        if (">>".equals(doAction)) {
            String finList = request.getParameter("finList");
            request.setAttribute("nb", Integer.parseInt(finList) - 10);
            page = "/TabRapport.jsp";
        }
        if ("<<".equals(doAction)) {
            
            request.setAttribute("nb", 0);
            page = "/TabRapport.jsp";
        }
        
        if ("Precedent".equals(doAction)) {
            String nbList = request.getParameter("nbList");
            request.setAttribute("nb", Integer.parseInt(nbList) - 10);
            page = "/TabRapport.jsp";
        }
        if ("Suivant".equals(doAction)) {
            String nbList = request.getParameter("nbList");            
            request.setAttribute("nb", Integer.parseInt(nbList) + 10);
            page = "/TabRapport.jsp";            
        }
        /*   Xx Debut Connexion xX  */
        if ("Connexion".equals(doAction)) {
            String login = request.getParameter("login");
            String mdp = request.getParameter("mdp");
            List<Operateur> operateurs = null;
            try {
                operateurs = operateurORMSrv.getAll();
            } catch (Exception ex) {
                Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
            }
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
                            
                            page = "/TabRapport.jsp";
                            HttpSession httpSession = request.getSession(true);
                            httpSession.setAttribute("sessionDroit", Boolean.TRUE);
                        } else {
                            page = "/TabRapport.jsp";
                            
                            try {
                                o = operateurORMSrv.getByLogin(login);
                                HttpSession httpSession = request.getSession(true);
                                httpSession.setAttribute("sessionDroit", Boolean.FALSE);
                                httpSession.setAttribute("information", o);
                            } catch (Exception ex) {
                                Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
                            }
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
        /*  Xx Debut detail xX  */
        if ("Detail".equals(doAction)) {
            try {
                String detail = request.getParameter("supprimerMontre");
                Montre m = null;
                MontreORMService montreORMService = PhysiqueDataFactory.getMontreORMSrv();
                m=montreORMService.getById(Long.parseLong(detail));
                request.setAttribute("detail", m);
                page = "/Detail.jsp";
            } catch (Exception ex) {
                Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        /*  Xx Fin detail xX  */

        /*   Xx Debut recherche rapport xX  */
        if ("Ok".equals(doAction)) {
            
            String element = request.getParameter("recherche");
            String valueRecherche = request.getParameter("inputRecherche");
//            String elementOperateur = request.getParameter("rechercherOperateur");
//            String valueRechercheOperateur = request.getParameter("inputRechercheOperateur");
            try {
                if (!"".equals(valueRecherche)) {
                    if (element.equals("reference")) {
                        idRapportBdd = metier.MetierFactory.getRapportServ().getById(Long.parseLong(valueRecherche)).getId();
                        if (idRapportBdd == Long.parseLong(valueRecherche)) {
                            request.setAttribute("idRecherche", valueRecherche);
                            request.setAttribute("type", element);
                            page = "/TabRapport.jsp";
                        }
                    } else if (element.equals("montre")) {
                        idMontreBdd = metier.MetierFactory.getMontreServ().getById(Long.parseLong(valueRecherche)).getId();
                        if (idMontreBdd == Long.parseLong(valueRecherche)) {
                            request.setAttribute("idRecherche", valueRecherche);
                            request.setAttribute("type", element);
                            page = "/TabRapport.jsp";
                        }
                    } else if (element.equals("referenceClient")) {
                        idClient = metier.MetierFactory.getClientServ().getById(Long.parseLong(valueRecherche)).getId();
                        if (idClient == Long.parseLong(valueRecherche)) {
                            request.setAttribute("idRecherche", valueRecherche);
                            request.setAttribute("type", element);
                            page = "/TabRapport.jsp";
                        }
                    }
                } else {
                    page = "/erreurConnexion.jsp";
                    request.setAttribute("erreurPage", "elementIsNull");
                }
//                if(elementOperateur != null){
//                if (elementOperateur.equals("ref")) {
//                    idOperateur = metier.MetierFactory.getOperateurServ().getById(Long.parseLong(valueRechercheOperateur)).getId();
//                    if (idOperateur == Long.parseLong(valueRechercheOperateur)) {
//                        request.setAttribute("idRecherche", valueRechercheOperateur);
//                        request.setAttribute("type", elementOperateur);
//                        page = "/TabOperateur.jsp";
//                    }
//                } else if (elementOperateur.equals("login")) {
//                    String login = metier.MetierFactory.getOperateurServ().getById(Long.parseLong(valueRechercheOperateur)).getLogin();
//                    if (login.equals(valueRechercheOperateur)) {
//                        request.setAttribute("idRecherche", valueRechercheOperateur);
//                        request.setAttribute("type", elementOperateur);
//                        page = "/TabOperateur.jsp";
//                    }
//                }
//            }else{
//                
//            }
            } catch (Exception ex) {
                page = "/erreurConnexion.jsp";
                request.setAttribute("erreurPage", "elementIsNull");
                Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        /*   Xx Fin recherche rapport xX  */

        /*   Xx Debut Afficher tout xX  */
        if ("Afficher tout".equals(doAction)) {
            page = "/TabRapport.jsp";
        }
        /*   Xx Fin Afficher tout xX  */

        /*   Xx Debut SupprimerRapport xX  */
        if ("Supprimer rapport".equals(doAction)) {
            String idMontre = request.getParameter("supprimerMontre");
            String idRapport = request.getParameter("supprimerRapport");
            System.out.println("Suppression id : " + idRapport);
            if (idRapport == null) {
                page = "/erreurConnexion.jsp";
                request.setAttribute("erreurPage", "erreurSuppressionRapport");
            } else {
                RapportORMService rapportORMService = PhysiqueDataFactory.getRapportORMSrv();
                MontreORMService montreORMService = PhysiqueDataFactory.getMontreORMSrv();
                try {
                    montreORMService.removeMontre(montreORMService.getById(Long.parseLong(idMontre)));
                    rapportORMService.removeRapport(rapportORMService.getById(Long.parseLong(idRapport)));
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

        /*   Xx Debut ModifierTabOperateur xX  */
        if ("Modifier Operateur".equals(doAction)) {
            String checkOperateur = request.getParameter("checkOperateur");
            List<Operateur> operateurs = null;
            try {
                operateurs = operateurORMSrv.getAll();
            } catch (Exception ex) {
                Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("OPERATEUR A modifier : " + operateurs.get(Integer.parseInt(checkOperateur)));
            o = operateurs.get(Integer.parseInt(checkOperateur));
            if (o.getId() == 0) {
                page = "/erreurConnexion.jsp";
                request.setAttribute("erreurPage", "erreurModificationOperateur");
            } else {
                try {
                    System.out.println("opérateur : " + o);
                    page = "/Modifieroperateur.jsp";
                    request.setAttribute("operateur", o);
                } catch (Exception ex) {
                    Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
                }
                System.out.println("opérateur : " + o);
            }
        }
        /*   Xx Fin ModifierTabOperateur xX  */

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

        /*   Xx Debut ModifierInformation xX  */
        if ("Modifier information".equals(doAction)) {
            OperateurORMService operateurORMService = PhysiqueDataFactory.getOperateurORMSrv();
            Operateur operateur = new Operateur();
            String nom = request.getParameter("nomInformation");
            String prenom = request.getParameter("prenomInformation");
            String login = request.getParameter("loginConfirmationHidden");
            Long id = null;
            String mdp = null;
            boolean isAdmin = false;
            try {
                id = operateurORMSrv.getByLogin(login).getId();
                mdp = operateurORMSrv.getByLogin(login).getMdp();
                isAdmin = operateurORMSrv.getByLogin(login).isAdmin();
            } catch (Exception ex) {
                Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
            }
            operateur.setNom(nom);
            operateur.setPrenom(prenom);
            operateur.setLogin(login);
            operateur.setMdp(mdp);
            operateur.setAdmin(isAdmin);
            operateur.setId(id);
            try {
                operateurORMService.updateOperateur(operateur);
            } catch (Exception ex) {
                Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
            }
            page = "/Information.jsp";
        }
        /*   Xx Fin ModifierOperateur xX  */

        /*   Xx Debut ModifierMdp xX  */
        if ("Modifier mot de passe".equals(doAction)) {
            page = "/ModifierMdp.jsp";
        }
        if ("Confirmer".equals(doAction)) {
            OperateurORMService operateurORMService = PhysiqueDataFactory.getOperateurORMSrv();
            Operateur operateur = new Operateur();
            String login = request.getParameter("LoginHidden");
            String mdpTest = request.getParameter("MdpActuel");
            String mdpNew = request.getParameter("NouveauMdp");
            String mdpConfirm = request.getParameter("ConfirmationMdp");
            Long id = null;
            String mdpBdd = null;
            String nom = null, prenom = null;
            boolean isAdmin = false;
            try {
                id = operateurORMSrv.getByLogin(login).getId();
                nom = operateurORMSrv.getByLogin(login).getNom();
                prenom = operateurORMSrv.getByLogin(login).getPrenom();
                isAdmin = operateurORMSrv.getByLogin(login).isAdmin();
                mdpBdd = operateurORMSrv.getByLogin(login).getMdp();
            } catch (Exception ex) {
                Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (mdpBdd.equals(mdpTest)) {
                if (mdpNew.equals(mdpConfirm)) {
                    operateur.setNom(nom);
                    operateur.setPrenom(prenom);
                    operateur.setLogin(login);
                    operateur.setMdp(mdpConfirm);
                    operateur.setAdmin(isAdmin);
                    operateur.setId(id);
                    try {
                        operateurORMService.updateOperateur(operateur);
                    } catch (Exception ex) {
                        Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    page = "/Information.jsp";
                } else {
                    page = "/erreurConnexion.jsp";
                    request.setAttribute("erreurPage", "erreurMdpPasEgal");
                }
            } else {
                page = "/erreurConnexion.jsp";
                request.setAttribute("erreurPage", "erreurMdpPasEgal");
            }
        }
        /*   Xx Fin ModifierMdp xX  */

        /*   Xx Debut supprimerOperateur xX  */
        if ("Supprimer".equals(doAction)) {//ModifierOperateur
            String id = request.getParameter("supprimerOperateur");
            String checkOperateur = request.getParameter("checkOperateur");
            List<Operateur> operateurs = null;
            try {
                operateurs = operateurORMSrv.getAll();
            } catch (Exception ex) {
                Logger.getLogger(ProjetControler.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("OPERATEUR A SUPPRIMER : " + operateurs.get(Integer.parseInt(checkOperateur)));
            o = operateurs.get(Integer.parseInt(checkOperateur));
            if (o.getId() == 0) {
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
        request.setAttribute("information", o);
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
