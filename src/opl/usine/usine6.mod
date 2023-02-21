/*
   Modèle utilisant des variables de décision d'intervalle
   - prenant en compte les contraintes de consommation à l'aide
     d'une contrainte globale.
   - qui tient compte de la machine en panne et du fait que
     les tâches F, G, H et K, qui ne peuvent s’effectuer en parallèle.
   - qui cherche retarder au maximume le moment ou a lieu la tâche P
*/

using CP;

// ----- Structures de données pour décrire une instance de problème -----

// Modélisation des informations caractérisant une tâche
tuple Tache{
    string code;		// le code de la tache
    int duree;		    // la duree de la tache
    int puissance;		// la puissance consommee par la tache
}

// Modélisation des contraintes d'ordonnancement à respecter
tuple Ord{
   string avant;		// le code de la tache qui doit se derouler en premier
   string apres;		// le code de la tache qui doit se derouler en second 	
}

//----------------------- Données ---------------------------
{Tache} taches = ...;        // les taches du probleme
{Ord}   cords = ...;       // les contraintes d'ordonnancement entre taches
int	  puissanceMax = ...;   // la puissance maximale de l'usine

//----------------------- Pretraitement ---------------------------
	    
// A compléter si nécessaire

//----------------------- Modèle ---------------------------

// -- variables de décisions --

// -- Critère d'optimisation --


minimize 
   // Objectif - A completer
subject to {
    // Contraintes - A completer
    
}	


//----------------------- Affichage Solution ---------------------------

execute {
    
}