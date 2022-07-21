extends Spatial

export(PackedScene) var Duck

onready var path_follow := $DuckPath/PathFollow


func _on_SpawnTime_timeout() -> void:
	path_follow.offset = randi()
	
	var duck_instance = Duck.instance() as Spatial
	duck_instance.global_transform = path_follow.global_transform
	duck_instance.rotation_degrees += Vector3(0,90,0)
	
	get_tree().current_scene.add_child(duck_instance)
	
	
	
