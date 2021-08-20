<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Yloocoaster Tycoon Joueur</title>
</head>

<body>
	<div id="MenuJoueur">
    	<h3 style="text-align:center">C'est parti pour jouer !</h3>
		<ul>
			<li><a href="newGame">Créer Une Nouvelle Partie</a></li>
			<li><a href="chooseGame">Charger Une Partie</a></li>
			<li><a href="Connexion.html">Se déconnecter</a></li>
		</ul>
	</div>
		
		
	<div id="CreerPartie" hidden>
        <form action="parc" method="post" class="formulaire">
        <br>
        <fieldset>
			<table>
        		<tr>
            		<td>Nom</td>
            		<td><input required name="nomParc" placeholder="Nom du parc" type="text"></td>
        		</tr>
        		<tr>
            		<td>Difficulté</td>
            		<td><select required name="typeDifficulte">
							<option value="Facile">Facile</option>
							<option value="Moyen">Moyen</option>
							<option value="Difficile">Difficile</option>
					</select></td>
        		</tr>
			</table>
        </fieldset>
        <button type="submit">Créer un nouveau parc</button>
        <br><br>
        </form>
	</div>
		
		
	<div id="ChargerPartie" hidden>
	</div>
</body>



<script>
	function newGame()
	{
		MenuJoueur.hidden=true;
		CreerPartie.hidden=false;
	}
	
	function chooseGame()
	{
		MenuJoueur.hidden=true;
		ChargerPartie.hidden=false;
	}
<script>
	

<%
	getServletContext().getAttribute("id_joueur");
%>
</html>