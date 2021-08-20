package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IDAO.IDAOParc;
import metier.Difficulte;
import metier.Parc;
import util.Context;

@WebServlet("/parc")
public class ControlParc extends HttpServlet {

	
	private IDAOParc daoP = Context.getInstance().getDaoP();
	


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Parc> p = daoP.findAll();
		request.setAttribute("parc", p);
		this.getServletContext().getRequestDispatcher("/parc.jsp").forward(request, response);
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
			String typeDifficulte=request.getParameter("typeDifficulte");
			Difficulte d= Difficulte.valueOf(typeDifficulte);
			
		
			Parc p=new Parc(Integer.parseInt(request.getParameter("id_parc")),request.getParameter("nomParc"), Double.parseDouble(request.getParameter("taille")), Integer.parseInt(request.getParameter("nbjour")),Double.parseDouble(request.getParameter("argent")), d);

			daoP.insert(p);	
		}
		doGet(request, response);
	}

	protected void doPut(HttpServletRequest request) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("id_parc"));
		String nom=request.getParameter("nom_parc");
		Double taille=Double.parseDouble(request.getParameter("taille"));
		Integer nbjour=Integer.parseInt(request.getParameter("nbjour"));
		Double argent=Double.parseDouble(request.getParameter("argent"));
		String typeDifficulte=request.getParameter("typeDifficulte");
		Difficulte d= Difficulte.valueOf(typeDifficulte);
		
		
		Parc p=new Parc(Integer.parseInt(request.getParameter("id_parc")),request.getParameter("nomParc"), Double.parseDouble(request.getParameter("taille")), Integer.parseInt(request.getParameter("nbjour")),Double.parseDouble(request.getParameter("argent")), d);
		
		System.out.println(p);

		daoP.update(p);
	}

	protected void doDelete(HttpServletRequest request) throws ServletException, IOException {

		daoP.delete(Integer.parseInt(request.getParameter("id")));
	}

	
}
