<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
	<c:set var="ctx" value = "${pageContext.servletContext.contextPath}"/>
<head>
	<meta charset="UTF-8">
	<title>Yloocoaster Tycoon Possession </title>
</head>

<body>
	

<div id="listAttraction" hidden="${hidden_attraction}">
	&emsp; &emsp; 
	<a href="${ctx}/achats/attraction" type="button" class="btn btn-sucess">Acheter une nouvelle attraction</a>
	&emsp;
	<input id="filterAttraction" placeholder="filtre attraction">	
     <table class="table table-striped">
       <thead>
		 <tr> <th colspan=6>Liste des attractions du parc ${parc.nomParc}</th></tr>
         <tr>
           <th>Nom</th>
           <th>Taille</th>
           <th>Prix de fonctionnement quotidient (€)</th>
           <th>Niveau d'amélioration</th>
           <th>Affluence maximum quotidient</th>
           </tr>
       </thead>
        <tbody class="contentTable">
			<c:forEach items="${attractions}" var="attraction">
				<tr>
					<td>${attraction.key.nom}</td>
					<td>${attraction.key.taille}</td>
					<td>${attraction.key.prixFonctionnement}</td>
					<td>${attraction.value} / ${attraction.key.nbAmelioration}</td>
					<td>${attraction.key.affluence}</td>
					<td>
                   		<a href="${ctx}/possessions/ameliorer?type=attraction&id=${attraction.key.id}" type="button" class ="btn btn-warning">Améliorer</a>
                   		<a href="${ctx}/possessions/vendre?type=attraction&id=${attraction.key.id}" type="button" class ="btn btn-danger">Vendre</a>
                	 </td>
				</tr>
			</c:forEach>  
		</tbody>
     </table>
</div>


<div id="listBoutique" hidden="${hidden_boutique}">
	&emsp; &emsp; 
	<a href="${ctx}/achats/boutique" type="button" class="btn btn-sucess">Acheter une nouvelle boutique</a>
	&emsp;
	<input id="filterBoutique" placeholder="filtre boutique">	
     <table class="table table-striped">
       <thead>
		 <tr> <th colspan=7>Liste des boutiques du parc ${parc.nomParc}</th></tr>
         <tr>
           <th>Nom</th>
           <th>Taille</th>
           <th>Prix de fonctionnement quotidient (€)</th>
           <th>Niveau d'amélioration</th>
           <th>Affluence maximum quotidient</th>
           <th>Revenu / jour / visiteur</th>
           </tr>
       </thead>
        <tbody class="contentTable">
			<c:forEach items="${boutiques}" var="boutique">
				<tr>
					<td>${boutique.key.nom}</td>
					<td>${boutique.key.taille}</td>
					<td>${boutique.key.prixFonctionnement}</td>
					<td>${boutique.value} / ${boutique.key.nbAmelioration}</td>
					<td>${boutique.key.affluence}</td>
					<td>${boutique.key.revenuJourPersonne}</td>
					<td>
                   		<a href="${ctx}/possessions/ameliorer?type=boutique&id=${boutique.key.id}" type="button" class ="btn btn-warning">Améliorer</a>
                   		<a href="${ctx}/possessions/vendre?type=boutique&id=${boutique.key.id}" type="button" class ="btn btn-danger">Vendre</a>
                	 </td>
				</tr>
			</c:forEach>  
		</tbody>
     </table>
</div>


<div id="listRestaurant" hidden="${hidden_restaurant}">
	&emsp; &emsp; 
	<a href="${ctx}/achats/restaurant" type="button" class="btn btn-sucess">Acheter un nouveau restaurant</a>
	&emsp;
	<input id="filterRestaurant" placeholder="filtre restaurant">	
     <table class="table table-striped">
       <thead>
		 <tr> <th colspan=7>Liste des restaurants du parc ${parc.nomParc}</th></tr>
         <tr>
           <th>Nom</th>
           <th>Taille</th>
           <th>Prix de fonctionnement quotidient (€)</th>
           <th>Niveau d'amélioration</th>
           <th>Affluence maximum quotidient</th>
           <th>Revenu / jour / visiteur</th>
           </tr>
       </thead>
        <tbody class="contentTable">
			<c:forEach items="${restaurants}" var="restaurant">
				<tr>
					<td>${restaurant.key.nom}</td>
					<td>${restaurant.key.taille}</td>
					<td>${restaurant.key.prixFonctionnement} (€)</td>
					<td>${restaurant.value} / ${restaurant.key.nbAmelioration}</td>
					<td>${restaurant.key.affluence}</td>
					<td>${restaurant.key.revenuJourPersonne}</td>
					<td>
                   		<a href="${ctx}/possessions/ameliorer?type=restaurant&id=${restaurant.key.id}" type="button" class ="btn btn-warning">Améliorer</a>
                   		<a href="${ctx}/possessions/vendre?type=restaurant&id=${restaurant.key.id}" type="button" class ="btn btn-danger">Vendre</a>
                	 </td>
				</tr>
			</c:forEach>  
		</tbody>
     </table>
</div>


<div id="listCommodite" hidden="${hidden_commodite}">
	&emsp; &emsp; 
	<a href="${ctx}/achats/commodite" type="button" class="btn btn-sucess">Acheter une nouvelle commodite</a>
	&emsp;
	<input id="filterCommodite" placeholder="filtre commodite">	
     <table class="table table-striped">
       <thead>
		 <tr> <th colspan=4>Liste des commodités du parc ${parc.nomParc}</th></tr>
         <tr>
           <th>Quantité</th>
           <th>Nom</th>
           <th>Taille</th>
           </tr>
       </thead>
        <tbody class="contentTable">
			<c:forEach items="${commodites}" var="commodite">
				<tr>
					<td>${commodite.value}</td>
					<td>${commodite.key.nom}</td>
					<td>${commodite.key.taille}</td>
					<td>
                   		<a href="${ctx}/possessions/vendre?type=commodite&id=${commodite.key.id}" type="button" class ="btn btn-danger">Vendre</a>
                	</td>
				</tr>
			</c:forEach>  
		</tbody>
     </table>
</div>


<div id="listEmploye" hidden="${hidden_employe}">
	&emsp; &emsp; 
	<a href="${ctx}/achats/employe" type="button" class="btn btn-sucess">Embaucher un nouvel employé</a>
	&emsp;
	<input id="filteremploye" placeholder="filtre employe">	
     <table class="table table-striped">
       <thead>
		 <tr> <th colspan=4>Liste des employés du parc ${parc.nomParc}</th></tr>
         <tr>
           <th>Nombre</th>
           <th>Métier</th>
           <th>Salaire quotidient (€)</th>
           </tr>
       </thead>
        <tbody class="contentTable">
			<c:forEach items="${employes}" var="employe">
				<tr>
					<td>${employe.value}</td>
					<td>${employe.key.metier}</td>
					<td>${employe.key.salaire}</td>
					<td>
                   		<a href="${ctx}/possessions/vendre?type=employe&id=${employe.key.id}" type="button" class ="btn btn-danger">Renvoyer</a>
                	</td>
				</tr>
			</c:forEach>  
		</tbody>
     </table>
</div>
</body>
</html>