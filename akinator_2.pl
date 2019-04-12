
deducao :- hipotese(Personagem, Personagem_img),
		write('Eu acho que o(a) personagem(a) eh o(a): '),
		write(Personagem),
		nl,
		undo,
		shell(Personagem_img).


/* hipoteses */

hipotese(homem_aranha, 'fotos-windows.reg homem_aranha.jpg')	:- homem_aranha, !.
hipotese(thor, 'C:\Users\mocxo\Desktop\PROLOG_PARADIGMAS-master - Copia homem_aranha.jpg')	:- thor, !.
hipotese(homem_de_ferro, 'C:\Users\mocxo\Desktop\PROLOG_PARADIGMAS-master - Copia homem_aranha.jpg')	:- homem_de_ferro, !.
hipotese(batman, 'C:\Users\mocxo\Desktop\PROLOG_PARADIGMAS-master - Copia batman.jpg')	:- batman, !.
hipotese(jean_grey, 'C:\Users\mocxo\Desktop\PROLOG_PARADIGMAS-master - Copia homem_aranha.jpg')	:- jean_grey, !.
hipotese(mulher_maravilha, 'C:\Users\mocxo\Desktop\PROLOG_PARADIGMAS-master - Copia homem_aranha.jpg')	:- mulher_maravilha, !.
hipotese(mulher_gato, 'C:\Users\mocxo\Desktop\PROLOG_PARADIGMAS-master - Copia homem_aranha.jpg')	:- mulher_gato, !.

hipotese(nao_encontrado).


/* regras de identificacao de cada personagem */
		  
homem_aranha :- homem,
		  preto,
		  super_poder,
		  cabelo_curto,
		  estatura_baixa,
		  verify('Solta teias'),
		  verify('Tem como inimigo o duende verde'). /*Com espaco, so funciona com aspas simples - string*/
		  
thor :- homem,
		  loiro,
		  super_poder,
		  cabelo_longo,
		  estatura_alta,
		  verify('É filho do Deus Odin'),
		  verify('Usa um martelo').

homem_de_ferro :- homem,
		  preto,
		  sem_poder,
		  cabelo_curto,
		  estatura_media,
		  verify('Eh um eximio e inteligente engenheiro mecanico'),
		  verify('Conhecido como Tony Stark').
		  
batman :- homem,
		  preto,
		  super_poder,
		  cabelo_curto,
		  estatura_alta,
		  verify('Conhecido como homem morcego').
		  
jean_grey :- mulher,
		  ruivo,
		  super_poder,
		  cabelo_longo,
		  estatura_media,
		  verify('Conciderada uma mutante').

mulher_maravilha :- mulher,
		  preto,
		  cabelo_longo,
		  super_poder,
		  estatura_alta,
		  verify('Conhecida como Diana Prince, filha da Rainha Hipólita').

mulher_gato :- mulher,
		  preto,
		  sem_poder,
		  cabelo_curto,
		  estatura_baixa,
		  verify('Uma criminosa de Gotham City').


/* regras de classificação */

mulher	:- verify('e mulher'), !.
homem	:- verify('e homem'), !.
loiro   :- verify('tem cabelo loiro').
preto 	:- verify('tem cabelo preto').
ruivo 	:- verify('tem cabelo ruivo').
super_poder :- verify('tem super poder'), !.
sem_poder :- verify('nao tem super poder'), !.
cabelo_longo :- verify('tem cabelo longo').
cabelo_medio :- verify('tem cabelo medio').
cabelo_curto :- verify('tem cabelo curto').
estatura_baixa :- verify('estatura baixa').
estatura_media :- verify('estatura media').
estatura_alta  :- verify('estatura alta').
			  



/* perguntas */
ask(Pergunta) :-
	write('O(a) seu personagem tem a seguinte caracteristica: '),
	write(Pergunta),
	write('? '),
	read(Resposta),
	nl,
	( (Resposta == sim ; Resposta == s)
		->
		assert(sim(Pergunta)) ;
		assert(nao(Pergunta)), fail).

:- dynamic sim/1, nao/1.

/* verificar */
verify(X) :-
	(sim(X)	->	true ;	(nao(X)	 ->	 fail ;	 ask(X))).

/* limpar os asserts */
undo :- retract(sim(_)), fail.
undo :- retract(nao(_)), fail.
undo.
