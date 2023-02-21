/*********************************************
 * Modèle OPL Pour le problème des billes
 *
 * Utiliser un (ou plusieurs) tableau(x) afin de regrouper les variables 
 * dans des structures adéquates.
 * Cela doit permettre de simplifier l'énoncé de certaines contraintes 
 * ainsi que l'affichage de la solution.
 *********************************************/
using CP;            /* Utilisation du solveur CP-Solver */

/* Déclarations domaines et variables */

range age = 4..7;
//{ string } vd = {"anne", "bernard", "denis", "claudine", "bleue", "jaune", "noire", "rouge", "parc", "chambre", "salon", "jardin"};
//int age [ v ] = [4,5,6,7];

{ string } p = {"anne" ,"claudine" ,"bernard" ,"denis" };
{ string } c = {"bleue" ,"jaune" ,"noire" ,"rouge" };
{ string } l = {"parc" ,"jardin" ,"chambre" ,"salon" };
dvar int v[p union c union l] in age ;

/* Paramétrage du solveur */
 execute {
    cp.param.searchType = "DepthFirst" ; 
    cp.param.workers = 1;
}


/* Contraintes */
constraints {

    // enfant tousDifferents
    forall (i,j in p : i < j) { 
        v [ i ] != v [ j ] ;
    }
    
    // couleurs tousDifferents
    forall (i,j in c : i < j) { 
        v [ i ] != v [ j ] ;
    }
    
    // lieu tousDifferents
    forall (i,j in l : i < j) { 
        v [ i ] != v [ j ] ;
    }
    
    /* Denis joue dans le parc et n''a pas 4 ans, contrairement à l'enfant qui a des billes bleues. */
    v["denis"] == v["parc"] && 
	v["denis"] != 4 &&
	v["bleue"] == 4 &&
	v["bleue"] != v["parc"];
    
    /* La fille de 6 ans a des billes jaunes. */
    v["bernard"] != 6 &&
	v["denis"] != 6 &&
	v["jaune"] == 6 &&
	v["denis"] != v["jaune"] &&
	v["bernard"] != v["jaune"];
    
    /* Lenfant qui joue avec des billes noires est plus âgé que l''enfant qui joue dans le jardin mais plus jeune que Anne. */
    v["noire"] > v["jardin"] &&
	v["noire"] < v["anne"];
    
    /* Anne, qui joue dans sa chambre, a 1 an de plus que l'enfant qui joue dans le salon. */
    v["anne"] == v["chambre"] &&
	v["chambre"] == v["salon"] +1 &&
	v["anne"]  == v["salon"] +1;
    
    
}


/* Post-traitement (Affichage Solution) */
execute {
	for(i in p){
      writeln("l'enfant ", i," a ",v[i]);
    }

    for(i in c){
      writeln("la couleur ", i," est affectee a ",v[i]);
    }

    for(i in l){
      writeln("le lieu ", i," est affecte a ",v[i]);
    }
}

/* Contrôle de flux */
main {
	thisOplModel . generate () ;
	cp . startNewSearch () ;
	i = 1;
	while (cp . next () ) {
		writeln("Solution : ", i);
		thisOplModel . postProcess () ;
		i++;
	}
}
