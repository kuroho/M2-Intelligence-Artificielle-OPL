/*********************************************
A partir d'un ensemble de valeurs (diffÃ©rentes) de piÃ¨ces 
de monnaie on souhaite trouver le nombre minimal de piÃ¨ces
de ces types Ã  rÃ©unir, pour Ãªtre capable de pouvoir 
reconstituer n'importe quelle somme infÃ©rieur Ã  une valeur
donnÃ©e.

Application : 
	on considÃ¨re comme type de piÃ¨ces, des piÃ¨ces
	de 1, 2, 5, 10, 20 et 50 centimes
	
	On souhaite reconsituer toutes les valeurs possibles
	infÃ©rieures *strictement Ã * 1 euro

*********************************************/
using CP;

//----- DonnÃ©es du problÃ¨me -----
int total = 99;
{int} montants = {1, 2, 5, 10, 20, 50}; 

 
//----- Variables et domaines -----
range nb = 0..total;
//nb_piece[m] représente le nombre de pièces du montant m
dvar int nb_piece[montants] in nb;
//ensemble des combinaisons de chaque type de pièce pour constituer la valeur voulue
dvar int portefeuille[nb][montants] in nb; 

//----- Contraintes -----
//On minimise le nombre de pièces de chaque type
minimize 
	sum(piece in montants) nb_piece[piece];

subject to {
  //Pour chaque montant testé : 
  forall (valeur in nb) {
    //On vérifie que le nombre des pièces du portefeuille multiplié par leur valeur est égale au montant testé
    valeur == sum(p in montants) portefeuille[valeur][p] *p;
	//Le nombre de piece par type doit etre inferieur ou egal au nombre de piece minimum calcule par type
    forall (montant in montants) {
		portefeuille[valeur][montant] <= nb_piece[montant];
	}
  }
}

//----- Post-traitement -----
execute {
  for(var valeur in nb) {
		for(var montant in montants) {
			writeln("valeur teste : ",valeur, " | pieces par type : ", portefeuille[valeur]);
			break;
		}
	}
}

