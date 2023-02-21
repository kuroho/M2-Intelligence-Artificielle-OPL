/*********************************************
 * Modèle OPL Pour le problème des billes
 *
 * Utiliser un (ou plusieurs) tableau(x) afin de regrouper les variables 
 * dans des structures adéquates.
 * Cela doit permettre de simplifier l'énoncé de certaines contraintes 
 * ainsi que l'affichage de la solution.
 *********************************************/
using CP;			/* Utilisation du solveur CP-Solver */

/* Déclarations domaines et variables */
range age = 4..7;

davr int var[] = [anne, bernard, denis, claudine, bleue, jaune, noire, rouge, parc, chambre, salon, jardin];
var[] in age;

/* Paramétrage du solveur */
 execute {
    cp.param.searchType = "DepthFirst" ; 
    cp.param.workers = 1;
}


/* Contraintes */
// TODO 


/* Post-traitement (Affichage Solution) */
// TODO 

