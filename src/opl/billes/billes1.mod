/*********************************************
 * Modèle OPL Pour le problème des billes
 *
 * Dans ce modèle, chaque variable doit être déclarée explicitement
 * avec son nom d'origine dans le modèle initial
 *
 *********************************************/

/* Utilisation du solveur CP-Solver */
using CP;


/* Déclaration du domaine de toutes les variables */
range age = 4..7;

/* Variable de décisions */
dvar int anne in age;
dvar int bernard in age;
dvar int claudine in age;
dvar int denis in age;

dvar int bleue in age;
dvar int jaune in age;
dvar int noire in age;
dvar int rouge in age;

dvar int parc in age;
dvar int jardin in age;
dvar int chambre in age;
dvar int salon in age;

/* paramétrage pour le solveur */
execute {
    cp.param.searchType = "DepthFirst" ; 
    cp.param.workers = 1;
}
 


/* Contraintes */
constraints {
	/* Les enfant ont un age different */	
   anne != bernard;
   anne != claudine;
   anne != denis;
   bernard != claudine;
   bernard != denis;
   claudine != denis;

   /* les couleurs ont un age different entre elle */
    bleue != jaune;
	bleue != noire;
	bleue != rouge;
	jaune != noire;
	jaune != rouge;
	noire != rouge;
	
	/* Les endroits doivent être différents */
	parc != jardin;
	parc != chambre;
	parc != salon;
	jardin != chambre;
	jardin != salon;
	chambre != salon;
	
	 /* Denis joue dans le parc et n''a pas 4 ans, contrairement à l'enfant qui a des billes bleues. */
	denis == parc && denis != 4 && bleue == 4 && bleue != parc;
	
	   /* La fille de 6 ans a des billes jaunes. */
	bernard != 6 && denis != 6 && jaune == 6 && denis != jaune && bernard != jaune;
	
	 /* Lenfant qui joue avec des billes noires est plus âgé que l''enfant qui joue dans le jardin mais plus jeune que Anne. */
	noire >	jardin && noire < anne;
	
	 /* Anne, qui joue dans sa chambre, a 1 an de plus que l'enfant qui joue dans le salon. */
	anne == chambre && chambre == salon +1 && anne  == salon +1;
}

/* Post-traitement (Affichage Solution) */
execute {
	writeln("Anna a : ",anne);
	writeln("Bernard a :",bernard);
	writeln("Claudine a :",claudine);
	writeln("Denis a :",denis);
	
	writeln("L'age de l'enfant qui joue dans le parc est ",parc);
	writeln("L'age de l'enfant qui joue dans le jardin est ",jardin);
	writeln("L'age de l'enfant qui joue dans la chambre est ",chambre);
	writeln("L'age de l'enfant qui joue dans le salon est ",salon);

	writeln("L'age de l'enfant qui joue avec la couleur bleue est ",bleue);
	writeln("L'age de l'enfant qui joue avec la couleur jaune est ",jaune);
	writeln("L'age de l'enfant qui joue avec la couleur noire est ",noire);
	writeln("L'age de l'enfant qui joue avec la couleur rouge est ",rouge);
}
	