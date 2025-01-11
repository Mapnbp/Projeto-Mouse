extends CharacterBody3D
@onready var camera: Camera3D = $pivo_Camera/Camera

@export var speed = 3.0
@export var gravidade = -10.0
@export var forca_pulo  = 3.5


#FUNÇÃO DE MOVIMENTAÇÃO BÁSICA
#O nome da função é essa, pois com esse nome ela sera chamada melhor pelo motor
func _physics_process(delta):
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
	
	#Normalizar direção para evitar movimento mais rápido em diagonal
	direcao = direcao.normalized()	
	
	#Pulo
	if is_on_floor():
		velocity.y = 0
		#A velocidade é 0 aqui por que ele esta no chão 
		#Quando ele aperta o botão de pulo ele é aceito
		#E a velocidade recebe a força do pulo (fazendo o boneco pular)
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = forca_pulo
	else:
		velocity.y += gravidade * delta

	#Deixando o eixo z como 0 ( nosso personagem nao anda nele )
	velocity.z = 0
	
	move_and_slide()
