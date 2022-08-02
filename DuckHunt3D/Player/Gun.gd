extends Spatial

onready var ray := $RayCast

var ammo = 2
var busy = false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		if ammo > 0:
			print("fired")
			fire()
			$AnimationPlayer.play("fire")
			ammo -= 1
		else:
			reload()
		
	
	if event.is_action_pressed("reload"):
		reload()

func fire() -> void:
	var collider : Object = ray.get_collider()
	
	if collider:
		if collider.has_method("die"):
			collider.die()
		elif collider.is_in_group("target"):
			collider.queue_free()
			
func eject_shells() -> void:
	$ShellParticles.emitting = true

func reload() -> void:
	$AnimationPlayer.play("Reload")
	ammo = 2
	busy = true

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	busy = false
