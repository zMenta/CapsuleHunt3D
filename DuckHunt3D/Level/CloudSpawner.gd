extends Spatial

export(PackedScene) var Cloud
onready var path_follow = $Path/PathFollow


func _on_Timer_timeout():
	path_follow.offset = randi()
	var cloud: Spatial = Cloud.instance()
	
	cloud.global_transform = path_follow.global_transform
	cloud.scale = Vector3(60,30,30)
	get_tree().current_scene.add_child(cloud)
	
