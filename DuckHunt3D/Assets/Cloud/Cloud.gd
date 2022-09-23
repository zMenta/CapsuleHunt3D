extends Sprite3D

func _physics_process(delta):
	global_translation.x += 5 * delta

func _on_VisibilityNotifier_camera_exited(camera):
	queue_free()
