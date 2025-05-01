class_name Personagem
extends CharacterBody3D

# Variaveis fisicas 
@export var velocidade : float
@export var gravidade : float
@export var forca_pulo  : float

# Variaveis nao-fisicas
@export var nome : String
@export var vida_max : float 
@export var vida_atual : float
@export var dano : float 

# Funcao que faz a movimentacao fisica do CharacterBody3d
func movimentacao(movimento_x : float, movimento_y : float):
	# Recebe as variaveis movimento explicadas no codigo do jogador
	
	# Velocidade para eixo z zerada
	# Velocity é um metodo direto do CharacterBody3D que define a velocidade de movimento para um lado
	# E como a variavel movimento no codigo do jogador so que do CharacterBody3D
	velocity.z = 0 
	velocity.x = movimento_x
	velocity.y = movimento_y
	
	# Essa funcao e propria do godot e faz a movimentacao
	move_and_slide()


func inventario() -> void:
	pass
	

# Funcao para computar o dano recebido 
# MUDAR ESSA FUNCAO QUANDO TIVER PERSONAGEM ( SO TESTE POR ENQUANTO )
func computar_dano(dano_recebido : float) -> void:
	vida_atual -= dano_recebido
	if vida_atual <= 0:
		vida_atual = 0
		print("Personagem Morreu")
		
