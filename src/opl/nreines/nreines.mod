/*********************************************
 * Modèle pour le problème des n-reines
 *********************************************/
using CP;

/*** Données du problème  ***/
int n = 10; //Nombre de reines
//int n = 4; 

/*** Variables et domaines  ***/
range index = 1..n;
dvar int queens[index] in index; // index c'est le numero de la ligne et queens[index] c'est les colonnes
int echequier[index][index];

/*** Contraintes  ***/
constraints 
{
  	forall(i,j in index : i<j)
	{
		queens[i] != queens[j];
		queens[i]+i != queens[j]+j;
		queens[i]-i != queens[j]-j;
	}
}

/*** Post-traitement  ***/
execute
{
	for(var i in index)
	{
		write("la ligne : ",i," colonne : ",queens[i]);
		write("\n");
		echequier[i][queens[i]] = 1;
 	}

	for (var i in index) 
	{
		for(var j in index)
		{
			write(echequier[i][j]," |");
		}
		write("\n");
	}
    writeln( "Solving time : ",cp.info.solveTime);
	writeln( "Choice Points : ",cp.info.numberOfChoicePoints);      
}