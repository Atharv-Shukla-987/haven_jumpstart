extends CharacterBody2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
const G = 1200
const MAX_JUMPS = 3

var max_hp = 100
var hp
var is_dead: bool = false
var jumps_used = 0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += G *delta
	else :
		jumps_used = 0
		
	if Input.is_action_just_pressed("jump") and jumps_used<MAX_JUMPS:
		velocity.y = JUMP_VELOCITY
		jumps_used +=1
		if jumps_used ==1 :
			sprite_2d.play("jump")
		else:
			sprite_2d.play("double jump")
	var x = Input.get_axis("left","right")
	if x:
		velocity.x = x * SPEED
		sprite_2d.flip_h = x <0
	else:
		velocity.x = move_toward(velocity.x, 0,SPEED)
		
	if is_on_floor():
		if x == 0:
			sprite_2d.play("idle")
		else :
			sprite_2d.play("run")
	move_and_slide()
