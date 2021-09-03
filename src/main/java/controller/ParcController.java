package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import attraction.model.Difficulte;
import attraction.model.Joueur;
import attraction.model.Parc;
import attraction.repositories.ParcRepository;


@Controller
@RequestMapping("/parcs")
public class ParcController {


	@Autowired
	ParcRepository daoP;
	

	@GetMapping("")
	public ModelAndView listParcs(HttpSession session) {
		ModelAndView mAv  = new ModelAndView("MenuJoueur");
		mAv.addObject("parcs",daoP.findByJoueur((Joueur) session.getAttribute("joueur")));
		mAv.addObject("typesDifficultes",Difficulte.values());
		return mAv;
	}
	

	@PostMapping("addparc")
	public ModelAndView addParc(@Valid @ModelAttribute Parc parc,BindingResult br) {
		if (br.hasErrors())
		{
			System.out.println(br.getAllErrors());
		}
		else if (parc.getJoueur()!=null)
		{
			System.out.println("Pas de joueur associés");
		}
		else{
			daoP.save(parc);
		}
		return new ModelAndView("redirect:/parcs");
	}
	


	@GetMapping("play")
	public ModelAndView play (@RequestParam Integer id,HttpSession session) {
		session.setAttribute("parc", daoP.findById(id).get());
		return new ModelAndView("Modification");
	}
	


	@GetMapping("delete")
	public ModelAndView deleteParc (@RequestParam Integer id) {
		daoP.deleteById(id);
		return new ModelAndView("redirect:/parcs");
	}
	
}
