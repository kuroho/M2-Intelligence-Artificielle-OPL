/*********************************************
 * Modèle pour le problème du carré magique
 *
 * Les données de l'instance sont décrites dans un fichier .dat externe
 *********************************************/
/*********************************************
 * Modèle pour le problème du carré magique
 *
 * Les données de l'instance sont décrites dans un fichier .dat externe
 *********************************************/
using CP;

//----- Parametrage Solveur -----
execute {
    cp.param.searchType = "DepthFirst" ; 
    cp.param.workers = 1;
}

//----- Données du problème -----
int n = 3;
int n_carre = n*n;

//----- Variables et domaines -----
range ind = 1..n*n;
range ind2 = 1..n;
dvar int matrice [ind2][ind2] in ind;
dvar int res;

//----- Contraintes -----
constraints{
	forall(i,i2,j in ind2: i<i2){
		matrice [i][j] != matrice[i2][j];
		matrice[i][i] != matrice[i2][i2];
		forall (j,j1 in ind2: j<j1)
		{
			matrice[i][j] != matrice[i][j1];
		}
	}

	forall(j in ind2) {
		 sum(i in ind2) matrice[i][i] == sum(i in ind2) matrice[i][j] ;
		 sum(i in ind2) matrice[i][j] == sum(i in ind2) matrice [j][i];
		 sum(i in ind2) matrice[i][i]== sum(i in ind2) matrice [j][i];
		 res == sum(i in ind2) matrice[i][i];
	}
}


//----- Post-traitement -----
execute {
	for (i in ind2){
		for(j in ind2){
			write(matrice[i][j]," |");
		}
		write ("  = ",res,"\n");
	}
	
	for(i in ind2){
		write("=");
		write(res," ");
	}
	write ("\n");
}
