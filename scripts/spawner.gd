extends Node2D

var enemy = preload("res://scenes/enemie.tscn") #carregar o inimigo
onready var spawn_range = $spawn_range

func _ready():
	randomize() # ter uma seed diferente a cada vez que for carregado(aleatoriedade)

func _on_Respawntimer_timeout():
	#pegar uma posição aleatṕória no alcance da line2D
	var yLoc = rand_range(spawn_range.get_point_position(1).y, spawn_range.get_point_position(0).y)
	var e = enemy.instance()#Instanciar o inimigo
	add_child(e) 
	e.position = Vector2(0, yLoc) 
