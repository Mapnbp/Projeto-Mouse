class_name Aliados
extends Personagem

# Deve mudar entre -127 e 127 ( talvez menos a decidir )
# Pensei em comecar em 0 para ser neutro ( possivel mudanca ) 
@export var lealdade = 0 
var quantidade_missoes_feitas = 0 

# Nao implementamos movimento aqui, vamos implementar em classes de mais baixo nivel ( Como iterativo )

# Funcao que calcula a quantidade de missoes feitas e atualiza a lealdade conforme uma missao for completa
func missoesCompletas(missao_feita : bool) -> void:
	quantidade_missoes_feitas += 1
	# PENSAR COMO A VARIAVEL LEALDADE MUDA CONFORME UMA MISSAO E COMPLETA
	lealdade += 10
