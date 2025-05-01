class_name BarraVida
extends Control

@export var player : Node
@export var sprite_vida_cheia : Texture2D
@export var sprite_vida_meio : Texture2D
@export var sprite_vida_vazia : Texture2D
var vida_atual_na_barra : float
var vida_max_na_barra : float

# Vetor para armazenar a vida atual do jogador
# A soma de todos os indices da a vida atual do jogador
var array_vida : Array = []

# Comeca atualizando a vida na gui e desenhando o coracao na escala
func _ready() -> void:
	atualizar_vida_gui()
	desenhar_coracoes()
	scale = Vector2(0.3, 0.3)

# A cada frame verifica se precisa atualizar a vida do jogador na gui
func _process(delta: float) -> void:
	atualizar_vida_gui()

# Funcao para atualizar o vetor com base na vida atual do jogador
func atualizar_vida_gui() -> void:
	# limpa o array de vida antes de atualizar
	array_vida.clear()
	
	vida_atual_na_barra = player.vida_atual
	vida_max_na_barra = player.vida_max
	
	for i in range(vida_max_na_barra): # Esse for percorre a vida do personagem e bota no array 
		if vida_atual_na_barra >= 1:
			array_vida.append(1)
			vida_atual_na_barra -= 1
		elif vida_atual_na_barra >= 0.5:
			array_vida.append(0.5)
			vida_atual_na_barra -= 0.5
		else:
			array_vida.append(0)
	
	desenhar_coracoes()

# Funcao de desenhar os coracoes com base nos valores na casa do array
func desenhar_coracoes():

	for child in get_children(): # Esse for pecorre os filhos Sprite2D e limpa eles para nao sobrepor sprite na tela.
		if child is Sprite2D:
			child.queue_free()
	
	for i in range(array_vida.size()): # For para criamos os filhos do sprite da vida e pormos na tela em posicao
		var sprite_vida : Sprite2D = Sprite2D.new()
		var posicao_x = (i + 0.6) * sprite_vida_cheia.get_width()
		var sprite_vida_posicao = Vector2(posicao_x, 100)
		
		# Cria o sprite com base no valor da vida na casa
		if array_vida[i] == 1:
			sprite_vida.texture = sprite_vida_cheia
		elif array_vida[i] == 0.5:
			sprite_vida.texture = sprite_vida_meio
		else:
			sprite_vida.texture = sprite_vida_vazia
		
		sprite_vida.position = sprite_vida_posicao
		
		# Adiciona na arvore da cena o sprite
		add_child(sprite_vida)
