
/**************************************************************
 * Modèle pour le problème du sudoku nxn
 * Modèle naif
 **************************************************************/
using CP;

// --- Parametrage Solveur ---
// A FAIRE
execute {
	cp.param.searchType= "DepthFirst";
	cp.param.workers = 1;
	cp.param.logPeriod = 100000;
	cp.param.logVerbosity = "Quiet";
	cp.param.allDiffInferenceLevel = "Basic";
}

// --- Modèle ---
include "sudoku.mod";

// --- Main (pour trouver toutes les solutions + statistiques) ---
// A INCLURE
include "../shared/allSolutions_and_stats.mod";

execute {
	for(var i in rsud){
		write("[");
		for(var j in rsud){
			write(inco[i][j] + ",");
		}
		write("]");
		writeln();
	}
}
