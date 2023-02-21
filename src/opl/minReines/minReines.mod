/*********************************************
Modèle simple permettant de trouver une solution
au problème du Donjon

Un conseil : 
essayer de visulaliser la solution plutot
sous une forme "graphique" (bien qu'en mode texte)
pour mieux visualiser l'emplacement des soldats.
*********************************************/
using CP;

//----- Parametrage Solveur -----

/* nombre de reines */ 
int n = ...;          
/*int n = 8;*/

//----- Données du problème -----

 
//----- Variables et domaines -----
/* les lignes */ 
range index=1..n;

/* les colonnes */ 
dvar int reines[index] in index;  

/*représentation de l'échequier */  
int echeq [index][index];           
        
execute
{
 var f = cp.factory ;
 cp.setSearchPhases(f.searchPhase(reines, f.selectRandomVar(), f.selectSmallest(f.value()))) 
;}


//----- Contraintes -----

constraints {
 forall( i,j in index : i<j){
    reines[i]!=reines[j];
    reines[i]+i!=reines[j]+j;
    reines[i]-i!=reines[j]-j;
 }
}

//----- Post-traitement -----

execute {
for( i in index) {
  write("Placement a la ligne : ",i," et colonne : ",reines[i]);
  write("\n");
  echeq[i][reines[i]]=1;
}

for (i in index){
    for(j in index){
     write(echeq[i][j]," |");
    }
     write(" \n");
}

writeln( "Temps de resolution : ",cp.info.solveTime);
writeln( "Choix: ",cp.info.numberOfChoicePoints);     
  
}     


