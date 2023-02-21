/***********************************************
* Ordonnancement de tâches pour un chantier de construction  
************************************************/
using CP;
/*********** Données ***********/
// Completer ICI
tuple Tache {
    string nom; 
    string description;
    int duree;
    {string} taches_precedentes;
}
   {Tache}  TachesChantier = ...;
// ^
// +--- et là !

/*********** Prétraitement ***********/
 int duree_maximale_chantier = sum(t in TachesChantier ) t.duree;   					 /* duree maximale chantier */
 


// Completer ICI - Extraction des informations utiles à partir des données brutes


/*********** Modèle ***********/


dvar int lancement_tache [TachesChantier] in 0..duree_maximale_chantier;  				/* quand est ce que on lance la tache  */

// Completer ICI - Objectif et Contraintes


minimize 
		 sum ( t in TachesChantier ) (lancement_tache  [t] + t.duree) ;   /**/ 
	
		 
subject to {
	forall ( tache2 in TachesChantier ){
		forall (tache1 in TachesChantier: tache1.nom in tache2.taches_precedentes){
			
			lancement_tache[tache1] <= lancement_tache[tache2] + tache2.duree;   /* la tache doit etre realiser apres ses taches */
			
	}
	
	
	} 

	

}

/*********** Post-traitement ***********/

execute {
for( t in TachesChantier){
write( " code : " , t.nom , " lancement : ", lancement_tache[t]," duree : " , t.duree);
write("\n");
}
}

