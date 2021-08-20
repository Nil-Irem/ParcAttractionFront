package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import metier.Admin;
import metier.Compte;
import metier.Joueur;
import util.Context;


@WebServlet("/compte")
public class ControlCompte extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Compte> c = Context.getInstance().getDaoCpt().findAll();
		request.setAttribute("comptes", c);
		this.getServletContext().getRequestDispatcher("/compte.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameter("type_form").equals("PUT"))
		{
			doPut(request);
		}
		else if(request.getParameter("type_form").equals("DELETE"))
		{
			doDelete(request);
		}
		else if(request.getParameter("type_form").equals("POST"))
		{
			Compte c=null;
			if(request.getParameter("type_compte").equals("joueur")) 
			{
				c=new Joueur(request.getParameter("login"), request.getParameter("password"));
			}
			else if(request.getParameter("type_compte").equals("admin"))
				c = new Admin(request.getParameter("login"), request.getParameter("password"));
			Context.getInstance().getDaoCpt().insert(c);			
		}
		doGet(request, response);
	}




	protected void doPut(HttpServletRequest request) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));

		String login=request.getParameter("login");
		String password=request.getParameter("password");
		String typeCompte=request.getParameter("type_compte");

		Compte c=null;
		if(typeCompte.equals("joueur")) 
		{
			c=new Joueur(id,login, password);
		}
		else if(typeCompte.equals("admin"))
		{
			c = new Admin(id,login,password);
		}

		Context.getInstance().getDaoCpt().update(c);
	}
	
	
	

	protected void doDelete(HttpServletRequest request) throws ServletException, IOException {

		Context.getInstance().getDaoCpt().delete(Integer.parseInt(request.getParameter("id")));
	}

	
	

}
