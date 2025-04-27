extends CharacterBody3D
@onready var camera: Camera3D = $pivo_Camera/Camera
@onready var coracoes_vida: Control = $"../CanvasLayer/coracoes_vida"

@export var speed = 3.0
@export var gravidade = -10.0
@export var forca_pulo  = 3.5
@export var vida_max : float 
@export var vida_atual : float
@export var dano : float 

# Função para computar o dano
func computar_dano(dano_dado):
	print("Chamando computar_dano")
	vida_atual -= dano_dado
	# Certifique-se de que a vida não seja menor que 0
	if vida_atual < 0:
		vida_atual = 0
	print("Vida atual após dano: ", vida_atual)
	# Atualiza a interface com a vida
	coracoes_vida.atualizar_vida_gui()

# Função de movimentação básica
func _physics_process(delta):
	# Verifique se o botão de dano foi pressionado e aplique o dano
	#Usei aqui para não precisar criar outra process
	if Input.is_action_just_pressed("Dano"):
		computar_dano(dano)
		
	#Movimentação
	var direcao = Vector3.ZERO
	
	if Input.is_action_pressed("Direita"):
		direcao.x += 1

	if Input.is_action_pressed("Esquerda"):
		direcao.x -= 1

	if Input.is_action_pressed("Cima"):
		direcao.y -= 1

	if Input.is_action_pressed("Baixo"):
		direcao.y += 1

	if Input.is_action_pressed("Devagar"):
		velocity.x = direcao.x * (speed - 2.0)
	else:
		velocity.x = direcao.x * speed
	
	# Normalizar direção para evitar movimento mais rápido em diagonal
	direcao = direcao.normalized()	
	
	# Pulo
	if is_on_floor():
		velocity.y = 0
		# Quando ele aperta o botão de pulo, a velocidade recebe a força do pulo
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = forca_pulo
	else:
		velocity.y += gravidade * delta

	# Deixando o eixo z como 0 (personagem não anda nesse eixo)
	velocity.z = 0
	
	move_and_slide()
