extends KinematicBody2D

onready var SM=$StateMachine

var velocity=Vector2.ZERO
var jump_power=Vector2.ZERO
var direction=1

export var gravity=Vector2(0,30)

export var move_speed=300
export var max_move=300

export var jump_speed=10
export var max_jump=160




func _physics_process(_delta):
	velocity.x=clamp(velocity.x,-max_move,max_move)
		
	if direction<0 and not $AnimatedSprite.flip_h: $AnimatedSprite.flip_h=true
	if direction>0 and $AnimatedSprite.flip_h: $AnimatedSprite.flip_h=false
	

func set_direction(d):
	direction=d

func set_animation(anim):
	if $AnimatedSprite.animation==anim: return
	if $AnimatedSprite.frames.has_animation(anim): $AnimatedSprite.play(anim)
	else: $AnimatedSprite.play()

func is_moving():
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		return true
	return false

func move_vector():
	return Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"),1.0)

func _unhandled_input(event):
	if event.is_action_pressed("left"):
		direction = -1
	if event.is_action_pressed("right"):
		direction = 1
