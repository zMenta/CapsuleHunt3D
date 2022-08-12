extends Spatial

signal duck_spawned(duck)

export(PackedScene) var Duck
export(PackedScene) var TimeDuck
export var duck_counter_threshold := 5

var _duck_counter := 0

onready var path_follow := $DuckPath/PathFollow


func _ready() -> void:
	start_spawner()


func start_spawner() -> void:
	$SpawnTime.start()


func _on_SpawnTime_timeout() -> void:
	path_follow.offset = randi()
	var duck_instance: Spatial = null

	if _duck_counter < duck_counter_threshold:
		duck_instance = Duck.instance()
		_duck_counter += 1
	else:
		_duck_counter = 0
		duck_instance = TimeDuck.instance()

	duck_instance.global_transform = path_follow.global_transform
	duck_instance.rotation_degrees += Vector3(0, 90, 0)
	emit_signal("duck_spawned", duck_instance)
	get_tree().current_scene.add_child(duck_instance)
