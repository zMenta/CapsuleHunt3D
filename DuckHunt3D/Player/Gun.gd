extends Spatial

onready var ray := $RayCast


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		fire()
	
	if event.is_action_pressed("reload"):
		$AnimationPlayer.play("Reload")


func fire() -> void:
	var collider : Object = ray.get_collider()
	
	if collider:
		if collider.has_method("die"):
			collider.die()
		elif collider.is_in_group("target"):
			collider.queue_free()
			
func eject_shells() -> void:
	$ShellParticles.emitting = true
	
