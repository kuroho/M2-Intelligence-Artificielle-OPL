
/**************************************************************
 * Modèle pour le problème du sudoku nxn
 * (à inclure dans  un modèle contenant le l'entête "using CP;" + paramétrage du solveur
 **************************************************************/

// --- Données ---
int n = ...	;						
// square order
int square = ftoi(sqrt(n));
range rsud = 1..n;
int instance[rsud][rsud] = ...;
range rsquare = 0..square-1;


// --- Pretraitement ---


// --- Modèle ---
// variable inconnue
dvar int inco[1..n][1..n] in 1..n;

constraints {
	forall(i in rsud) {
		allDifferent(all(j in rsud) inco[j][i]);
		allDifferent(all(j in rsud) inco[i][j]);
	}
	forall(i,j in rsud : instance[i][j] != 0){
		inco[i][j] == instance[i][j];
	}
	forall(i,j in rsquare) {
		allDifferent(all(l, c in rsquare) inco[(i*square)+l+1][(j*square)+c+1]);
	}
}

// --- Main (pour trouver toutes les solution + statistiques) ---
// A FAIRE

// --- PostTraitement --- (affichage solution)


