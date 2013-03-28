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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import metier.Operateur;
import metier.OperateurService;

/**
 *
 * @author Max
 */
@WebServlet(name = "AjoutOperateur", urlPatterns = {"/AjoutOperateur"})
public class AjoutOperateur extends HttpServlet {

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
        String loginBDD = null;
        String page = request.getParameter("page");
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
    }  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
