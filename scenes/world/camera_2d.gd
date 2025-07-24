extends Camera2D

@export var tile_map: TileMapLayer

func _ready() -> void:
	_set_limits()

func _set_limits() -> void:
	var map_rect = tile_map.get_used_rect()
	var tile_size = tile_map.tile_set.tile_size.x

	var world_origin_in_pixels = map_rect.position * tile_size
	var world_size_in_pixels = map_rect.size * tile_size

	limit_top = world_origin_in_pixels.y
	limit_left = world_origin_in_pixels.x
	limit_right = world_size_in_pixels.x
	limit_bottom = world_size_in_pixels.y
