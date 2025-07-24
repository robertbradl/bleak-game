extends Node2D

@export var tile_map: TileMapLayer
@export var start_position: Vector2i

var tile_size: int
var direction_controller: Dictionary


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tile_size = tile_map.tile_set.tile_size.x
	position = start_position * tile_size
	direction_controller = {
		'up' = {
			'button' = $ButtonUp,
			'ray' = $ValidTileCheck/TileUp
		},
		'down' = {
			'button' = $ButtonDown,
			'ray' = $ValidTileCheck/TileDown
		},
		'left' = {
			'button' = $ButtonLeft,
			'ray' = $ValidTileCheck/TileLeft
		},
		'right' = {
			'button' = $ButtonRight,
			'ray' = $ValidTileCheck/TileRight
		}
	}


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_movement_check()


func _movement_check() -> void:
	for direction in direction_controller.values():
		var collision = direction["ray"].is_colliding()
		direction["button"].visible = !collision


func _on_button_up_pressed() -> void:
	position.y -= tile_size


func _on_button_down_pressed() -> void:
	position.y += tile_size


func _on_button_left_pressed() -> void:
	position.x -= tile_size


func _on_button_right_pressed() -> void:
	position.x += tile_size
