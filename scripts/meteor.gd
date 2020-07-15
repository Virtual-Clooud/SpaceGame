extends KinematicBody2D

var speed = 100
var velocity = Vector2()

func _on_Area2D_area_entered(area):
	if area.is_in_group("kill"):
		queue_free()

func _ready():
	pass # Replace with function body.s
func _physics_process(delta):
	velocity.x += -1 #Meteoro se mover para a esquerda
	move_and_slide(velocity)
