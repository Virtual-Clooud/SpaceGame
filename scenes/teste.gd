extends Node

onready var player = $player
onready var spawner = $spawner
onready var spawn = $spawner_position
onready var camera = $camera
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	spawner.set_position(Vector2(player.get_position().x + 1700, player.get_position().y))
	camera.set_position(player.get_position())
