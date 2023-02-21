/*********************************************
ModÃ¨le simple permettant de trouver une solution
au problÃ¨me du Donjon

Un conseil : 
essayer de visulaliser la solution plutot
sous une forme "graphique" (bien qu'en mode texte)
pour mieux visualiser l'emplacement des soldats.
*********************************************/
using CP;

//----- Parametrage Solveur -----
 execute {
    cp.param.searchType = "DepthFirst" ; 
    cp.param.workers = 1;
}

//----- DonnÃ©es du problÃ¨me -----
int nb_soldats = 12;
int nb_yeux = 5;

{string} directions = {"N", "NE", "NO", "S", "SE", "SO", "E", "O"};

//----- Variables et domaines -----
range soldats = 0..nb_soldats;

dvar int tour[directions] in soldats;

//----- Contraintes -----
constraints {
	//tour["NO"]+tour["N"]+tour["NE"]+tour["E"]+tour["SE"]+tour["S"]+tour["SO"]+tour["O"] == 12;
    sum(i in directions) tour[i] == nb_soldats;
  
	tour["NO"]+tour["N"]+tour["NE"] >= nb_yeux;
	tour["SO"]+tour["S"]+tour["SE"] >= nb_yeux;
	tour["NE"]+tour["E"]+tour["SE"] >= nb_yeux;
	tour["NO"]+tour["O"]+tour["SO"] >= nb_yeux;
}

//----- Post-traitement -----
execute {
  //Haut tour
  write(tour["NO"]);
  write("---");
  write(tour["N"]);
  write("---");
  writeln(tour["NE"]);
  writeln("|       |");
  
  //Milieu tour
  write(tour["O"]);
  write("   X   ");
  writeln(tour["E"])
  writeln("|       |");
  
  //Bas tour
  write(tour["SO"]);
  write("---");
  write(tour["S"]);
  write("---");
  writeln(tour["SE"]);
  
}

include "../shared/allSolutions.mod";
