extends Spatial

signal duck_spawned(duck)

onready var gun_pivot := $GunPivot
onready var camera := $Camera

var _ray_start_position := Vector3()
var _ray_target_position := Vector3()


func game_start() -> void:
	$DuckSpawner.start_spawner()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var _mouse_position: Vector2 = get_viewport().get_mouse_position()

		_ray_start_position = camera.project_ray_origin(_mouse_position)

		_ray_target_position = (
			_ray_start_position
			+ camera.project_ray_normal(_mouse_position) * 100
		)

		var _space_state := get_world().direct_space_state
		var _intersection := _space_state.intersect_ray(_ray_start_position, _ray_target_position)

		if not _intersection.empty():
			var _position = _intersection.position
			gun_pivot.look_at(_position, Vector3.UP)
		else:
			gun_pivot.look_at(_ray_target_position, Vector3.UP)


func _on_DuckSpawner_duck_spawned(duck) -> void:
	emit_signal("duck_spawned", duck)
