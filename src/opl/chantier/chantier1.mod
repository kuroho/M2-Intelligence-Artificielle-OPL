/***
* Ordonnancement de tâches pour un chantier de construction
**/

/** Données **/
tuple tache {
        string code;
        string description;
        int duree;
        {string} precedences; }

  {tache} TachesChantier = ...;

// ^
// +--- et là !
dvar int finProjet;

/** Prétraitement **/

{string} code = {t.code | t in TachesChantier };
int totaleDuree = sum(t in TachesChantier) t.duree;


/** Modèle **

dvar int debut[code] in 0..;
dvar int fin[code] in ..totaleDuree;
dvar int finProjet in ..totaleDuree;

minimize
        finProjet
		
        constraint {
                forall (t in TachesChantier){
                        debut[t.code] + t.duree == fin[t.code];
                        forall(p in t.precedences){
                                   debut(t) >= fin[p];
                           }
                }
                finProjet = max(c in code) fin[c];
        }


/** Post-traitement **/

execute
{
        for(t in TachesChantier)
        {
                writeln(t.code +" : " + t.duree);
                writeln("***");
                
        }
		//writeln(finProjet);
} 