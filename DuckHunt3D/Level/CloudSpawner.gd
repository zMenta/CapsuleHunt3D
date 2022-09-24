extends Spatial

export(PackedScene) var Cloud
onready var path_follow = $Path/PathFollow
onready var timer = $Timer


func _on_Timer_timeout():
	timer.wait_time = randi() % 80 + 25
	path_follow.offset = randi()
	var cloud: Spatial = Cloud.instance()
	
	cloud.global_transform = path_follow.global_transform
#	cloud.scale = Vector3(60,30,30)
	cloud.scale = Vector3(3,3,3)
	cloud.rotation_degrees = Vector3(30, 0, 0)
	get_tree().current_scene.add_child(cloud)
	
