extends CharacterBody2D
class_name Player
@export var SPEED: float = 50
@export var animation: AnimatedSprite2D

var knockback: Vector2 = Vector2.ZERO

func _process(_delta: float) -> void:
	
	var movement_vector: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("Right"):
		animation.flip_h = false
		movement_vector.x = 1
	elif Input.is_action_pressed("Left"):
		animation.flip_h = true
		movement_vector.x = -1
	if Input.is_action_pressed("Up"):
		movement_vector.y = -1 
	elif Input.is_action_pressed("Down"):
		movement_vector.y = 1
	velocity = SPEED * movement_vector.normalized()
	
	
	if velocity.x != 0 or velocity.y != 0:
		animation.play("Run")
	else:
		animation.play("Idle")
	
	move_and_slide()

	
	
	
