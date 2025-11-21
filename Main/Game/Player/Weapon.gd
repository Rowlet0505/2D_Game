extends CanvasLayer
@export var empty_cursor = null

func _ready():
	Input.set_custom_mouse_cursor(empty_cursor, Input.CURSOR_ARROW)
func _process(delta):
	$WeaponSword1.global_position = $Sprite.get_global_mouse_position()
