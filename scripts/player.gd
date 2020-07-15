extends KinematicBody2D

#-------------------Travel--------------
var travel_set = false #Variável para ativar o modo Travel
var travel_time = 0 #Tempo de travel, para ativar o ciclo
var max_speed = 300

export var speed = 15 #Velocidade da nava
#-------------------Travel--------------

#-------------------Fight--------------
var fight_set = false # Mema coisa

onready var laser = $Fight/laser_visual #Particula do laser
onready var real_laser = $Fight/laser_real #Ray_cast do laser
onready var destroy = $Fight/laser_real/destroyer #Area2d para quando colidir
onready var destroy_collider = $Fight/laser_real/destroyer/collider #Colisão da área
#-------------------Fight--------------

#-------------------Redirect--------------
var redirect_set = false
var rotation_dir = 0 #Rotação da nave
#-------------------Redirect--------------

#-------------------Global--------------
export var mouse_pos = Vector2() #Posição local do mouse
export var mouse_glob_pos = Vector2() # Posição global do mouse
export var velocity = Vector2() #Vetor de velocidade

onready var sprite = $ship

var energy # a energia em tempo para o resfriamento do reator
#-------------------Global--------------
func travel():
	if travel_set == true:
	#Fazer o sprite olhar para o mouse
		
		if Input.is_action_pressed("M1"): # Para se movimentar de acordo com a rotação da nave
			speed = 150
			velocity += Vector2(speed, 0).rotated(sprite.rotation)

func redirect():
	if redirect_set == true:
		if Input.is_action_pressed("M1"): # Rotacionar de acordo com o botão do mouse
			rotation_dir += 0.05
		if Input.is_action_pressed("M2"):
			rotation_dir -= 0.05
		sprite.rotation = lerp(sprite.rotation ,rotation_dir, 0.3) # Rotação suave

func fight():
	if fight_set == true:
		
		if Input.is_action_pressed("M1"): #Se acertar algo
			destroy.set_position(mouse_pos)
			laser.set_point_position(1, mouse_pos)
			real_laser.set_cast_to(mouse_pos)
			if real_laser.is_colliding():
				
				destroy_collider.set_disabled(false) # Fazer a colisão acontecer
		else:
			laser.set_point_position(1, Vector2(0,0))
			destroy_collider.set_disabled(true)
	velocity = move_and_slide(velocity)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

	mouse_pos = get_local_mouse_position()
	mouse_glob_pos = get_global_mouse_position()
	
func _physics_process(delta):
	
	if Input.is_action_just_pressed("Fight"):
		fight_set = true
		travel_set = false
		redirect_set = false
		
	elif Input.is_action_just_pressed("Travel"):
		fight_set = false
		travel_set = true
		redirect_set = false
		
	elif Input.is_action_just_pressed("Redirect"):
		fight_set = false
		travel_set = false
		redirect_set = true
		
	travel()
	fight()
	redirect()
	velocity = move_and_slide(velocity)


func _on_enemie_entered(body):
	print("player_killed")
	print(body)
	if body.is_in_group("enem"):
		queue_free()
