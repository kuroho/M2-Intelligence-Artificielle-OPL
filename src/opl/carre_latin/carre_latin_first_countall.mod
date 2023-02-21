/*********************************************
 * Modèle pour le problème du carré latin
 *
 * Affiche uniquement la première solution trouvée 
 * ainsi que le nombre total de solutions.
 *********************************************/
using CP;

/*** Données du problème  ***/
int n = 3;
 
/*** Variables et domaines  ***/
range index = 0..n-1;
dvar int matrice[index][index] in index;
 
/*** Contraintes  ***/
constraints
{
	forall(i,col1,col2 in index: col2>col1)
			matrice[i][col2]!= matrice[i][col1];
		
	forall(j,ligne1,ligne2 in index: ligne2>ligne1)
			matrice[ligne2][j]!= matrice[ligne1][j];
}

/*** Post-traitement  ***/
execute
{
	writeln("       ", matrice);
}

include "../shared/first_countallSolutions.mod";
