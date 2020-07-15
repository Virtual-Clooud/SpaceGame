extends Control
onready var fight_buttom = $fight
onready var travel_buttom = $travel
onready var redirect_buttom = $redirect

var fight_buttom_0
var fight_buttom_1
var travel_buttom_0
var travel_buttom_1
var redirect_buttom_0
var redirect_buttom_1

func _physics_process(delta):
	fight_buttom_0 = load("res://assets/images/UI/fight_buttom.png")
	fight_buttom_1 = load("res://assets/images/UI/fight_buttom2.png")
	travel_buttom_0 = load("res://assets/images/UI/travel_buttom.png")
	travel_buttom_1 = load("res://assets/images/UI/travel_buttom2.png")
	redirect_buttom_0 = load("res://assets/images/UI/redirect_buttom.png")
	redirect_buttom_1 = load("res://assets/images/UI/redirect_buttom2.png")
	
	if Input.is_action_just_pressed("Fight"):
		fight_buttom.set_texture(fight_buttom_1)
		travel_buttom.set_texture(travel_buttom_0)
		redirect_buttom.set_texture(redirect_buttom_0)
	elif Input.is_action_just_pressed("Travel"):
		fight_buttom.set_texture(fight_buttom_0)
		travel_buttom.set_texture(travel_buttom_1)
		redirect_buttom.set_texture(redirect_buttom_0)
	elif Input.is_action_just_pressed("Redirect"):
		fight_buttom.set_texture(fight_buttom_0)
		travel_buttom.set_texture(travel_buttom_0)
		redirect_buttom.set_texture(redirect_buttom_1)
