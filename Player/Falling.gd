extends Node

onready var SM=get_parent()
onready var player=get_node("../..")

func _ready():
	yield(player,"ready")

func start():
	player.set_animation("Falling")
	player.jump_power=Vector2.ZERO

func physics_process(_delta):
	if player.is_on_floor() and player.velocity.dot(Vector2.UP)<0:
		player.velocity.y=0
		SM.set_state("Idle")
	if player.is_on_ceiling():
		player.velocity.y=0
	player.velocity+=player.move_speed*player.move_vector()+player.gravity
	player.move_and_slide(player.velocity,Vector2.UP)
