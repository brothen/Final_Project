extends KinematicBody2D

onready var SM = $StateMachine

var velocity = Vector2.ZERO
var jump_power = Vector2.ZERO
var direction = 1

export var gravity = Vector2(0,30)

var flipped=false

export var move_speed = 50
export var max_move = 400

export var jump_speed = 10
export var max_jump = 100




func _physics_process(_delta):
	if Input.is_action_just_pressed("flip"):
		velocity.y=0
		if flipped==false:
			gravity=Vector2(0,-30)
			$AnimatedSprite.flip_v=true
			flipped=true
		elif flipped==true:
			gravity=Vector2(0,30)
			$AnimatedSprite.flip_v=false
			flipped=false
	velocity.x = clamp(velocity.x,-max_move,max_move)
		
	if direction < 0 and not $AnimatedSprite.flip_h: $AnimatedSprite.flip_h = true
	if direction > 0 and $AnimatedSprite.flip_h: $AnimatedSprite.flip_h = false
	


func set_direction(d):
	direction = d

func set_animation(anim):
	if $AnimatedSprite.animation == anim: return
	if $AnimatedSprite.frames.has_animation(anim): $AnimatedSprite.play(anim)
	else: $AnimatedSprite.play()
