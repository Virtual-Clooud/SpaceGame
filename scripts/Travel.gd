extends Node2D

export var speed = 200
export var velocity = Vector2()
export var mouse_pos = Vector2()
export var mouse_glob_pos = Vector2()
export var int_speed = 0
onready var sprite = $Sprite
onready var camera = $camera

func _physics_process(delta):
	mouse_pos = get_local_mouse_position()
	mouse_glob_pos = get_global_mouse_position()
	int_speed = int(mouse_pos.x)
	sprite.look_at(mouse_glob_pos)
	if Input.is_action_pressed("M1"):
		velocity = lerp(velocity, mouse_pos, 0.1)
		if int_speed <= 10:
			camera.set_zoom(lerp(camera.get_zoom(), Vector2(0.5, 0.5), 0.1))
		if int_speed <= 100:
			camera.set_zoom(lerp(camera.get_zoom(), Vector2(0.8, 0.8), 0.1))
		if int_speed <= 250:
			camera.set_zoom(lerp(camera.get_zoom(), Vector2(1, 1), 0.1))
		if int_speed <= 350:
			camera.set_zoom(lerp(camera.get_zoom(), Vector2(1.3, 1.3), 0.1))
	velocity = move_and_slide(velocity)
	print(camera.get_zoom())
