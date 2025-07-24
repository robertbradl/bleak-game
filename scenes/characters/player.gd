extends Node2D

@export var tile_size = 32

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $ValidTileCheck/TileUp.is_colliding():
		$ButtonUp.disabled = true
		$ButtonUp.hidden = true
	else:
		$ButtonUp.disabled = false
		


func _collision_check() -> void:
	var collisions = {
		up = $ValidTileCheck/TileUp.is_colliding(),
		down = $ValidTileCheck/TileDown.is_colliding(),
		}


func _on_button_up_pressed() -> void:
	position.y -= tile_size


func _on_button_down_pressed() -> void:
	position.y += tile_size


func _on_button_left_pressed() -> void:
	position.x -= tile_size


func _on_button_right_pressed() -> void:
	position.x += tile_size
