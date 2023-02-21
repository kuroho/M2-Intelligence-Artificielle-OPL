/*********************************************
* Bloc main pour calculer / afficher toutes les solutions
* en les numérotant et en les séparant les unes des autres.
*********************************************/
 
/* Contrôle de flux */
main {
	thisOplModel . generate () ;
	cp . startNewSearch () ;
	i = 1;
	while (cp . next () ) {
		writeln("Solution : ", i);
		thisOplModel . postProcess () ;
		i++;
	}
}

