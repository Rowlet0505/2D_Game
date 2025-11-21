extends Node2D

@onready var player: Player = $Player
@export var knockback_resistance: float = 1

var en_data = preload ("res://Main/Game/Enemy/enemy.tscn")
func _ready() -> void:
	spawn_enemy()
	
func _on_timer_timeout() -> void:
	var spawned_enemy: Enemy = en_data.instantiate()
	spawned_enemy.position.x = randi() % 120
	spawned_enemy.position.y = randi() % 160
	add_child(spawned_enemy)
	spawned_enemy.player_node = player
	spawned_enemy.should_chase = true


func spawn_enemy() -> void:
	var spawned_enemy: Enemy = en_data.instantiate()
	spawned_enemy.position.x = randi() % 120
	spawned_enemy.position.y = randi() % 160
	add_child(spawned_enemy)
	spawned_enemy.player_node = player
	spawned_enemy.should_chase = true
	

var knockback = Vector2.ZERO

func _physics_process(delta):
		# your normal direction/velocity calculation here
		# after you have your final velocity value, you just need to add knockback vector to it
		# move_toward will reduce knockback vector each frame/call by resistance amount, i.e. bring knockback to a stop
	knockback = knockback.move_toward(Vector2.ZERO, knockback_resistance)
	var velocity = knockback * delta

	global_position += velocity
