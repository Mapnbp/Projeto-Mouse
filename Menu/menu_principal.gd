# Classe responsavel pela cena do menu principal
class_name MenuPrincipal
extends Control

@onready var jogar_button = $MarginContainer/HBoxContainer/VBoxContainer/jogar_Button as Button
@onready var carregar_button = $MarginContainer/HBoxContainer/VBoxContainer/carregar_Button as Button
@onready var opcao_button = $MarginContainer/HBoxContainer/VBoxContainer/opcao_Button as Button
@onready var menu_de_opcoes = $menu_de_opcoes as MenuDeOpcoes
@onready var sair_button = $MarginContainer/HBoxContainer/VBoxContainer/sair_Button as Button
@onready var margin_container = $MarginContainer as MarginContainer


# Deve ser modificado posteriormente porque esta com um problema de nao reconhecimento do botao,
# e nao sei como resolve essa porra
@onready var pagar_button = $MarginContainer/VBoxContainer2/HBoxContainer2/pagar_Button as Button

# Leva o jogador para o começo do jogo, deve ser modificada posteriormente para levar ao jogo atual
@onready var começar_jogo = preload("res://cena0.tscn") as PackedScene

# Funcao responsavel por direcionar o que faz cada botao
func _ready():
	segurar_conectores_signals()

# Funcao responsavel por levar o jogador para o jogo em si, atualmente leva sempre para o começo
func on_jogar_pressed() -> void:
	get_tree().change_scene_to_packed(começar_jogo)

func on_carregar_pressed() -> void:
	pass

# Funcao responsavel por ligar a tela de opcoes
func on_opcao_pressed() -> void:
	margin_container.visible = false
	menu_de_opcoes.set_process(true)
	menu_de_opcoes.visible = true

# Funcao responsavel por desligar a tela de opcoes
func on_sair_das_opcoes_pressed() -> void:
	margin_container.visible = true
	menu_de_opcoes.visible = false

# Fecha o jogo
func on_sair_pressed() -> void:
	get_tree().quit()

func on_pagar_pressed() -> void:
	pass

# Funcao responsqavel por vincular os conectores
func segurar_conectores_signals() -> void:
	jogar_button.button_down.connect(on_jogar_pressed)
	carregar_button.button_down.connect(on_carregar_pressed)
	opcao_button.button_down.connect(on_opcao_pressed)
	menu_de_opcoes.sair_das_opcoes.connect(on_sair_das_opcoes_pressed)
	sair_button.button_down.connect(on_sair_pressed)
	pagar_button.button_down.connect(on_pagar_pressed)
