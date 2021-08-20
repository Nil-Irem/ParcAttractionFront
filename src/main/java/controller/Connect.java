package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.Admin;
import metier.Compte;
import metier.Joueur;
import util.Context;

@WebServlet("/connect")
public class Connect extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		Compte c = Context.getInstance().getDaoCpt().seConnecter(login, password);
	
		if(c instanceof Joueur) 
		{
			this.getServletContext().setAttribute("id_joueur", c.getId());
			this.getServletContext().getRequestDispatcher("/joueur.jsp").forward(request, response);
		}
		else if(c instanceof Admin) 
		{
			this.getServletContext().getRequestDispatcher("/admin.html").forward(request, response);
		}
		else 
		{
			this.getServletContext().getRequestDispatcher("/Connexion.html").forward(request, response);
		}
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		Compte c = Context.getInstance().getDaoCpt().seConnecter(login, password);
		
		if(c instanceof Joueur) 
		{
			this.getServletContext().getRequestDispatcher("/joueur.jsp").forward(request, response);
		}
		else if(c instanceof Admin) 
		{
			this.getServletContext().getRequestDispatcher("/admin.html").forward(request, response);
		}
		else 
		{
			this.getServletContext().getRequestDispatcher("/Connexion.html").forward(request, response);
		}
	}
}