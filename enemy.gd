extends CharacterBody2D
class_name Enemy

@onready var player_node: CharacterBody2D = get_parent().get_node("Player")

@export var animation: AnimatedSprite2D

var speed: float = 25

var should_chase: bool = false
var knockback: Vector2 = Vector2.ZERO
var knockback_timer: float = 0.0

func _physics_process(delta: float) -> void:
	if should_chase:
		var direction = (player_node.global_position-global_position).normalized()
		velocity = direction*speed
		move_and_slide()
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = false
		elif direction.x < 0:
			$AnimatedSprite2D.flip_h = true;
	if velocity.x != 0 or velocity.y != 0:
		animation.play("Run")
