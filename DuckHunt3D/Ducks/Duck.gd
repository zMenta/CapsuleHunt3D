extends KinematicBody

export(PackedScene) var dead_body

export var move_speed := 8
export var direction := Vector3(1,1,0)


func _physics_process(delta: float) -> void:
	move_and_slide(move_speed * direction.normalized())


func die() -> void:
	var body = dead_body.instance() as RigidBody
	body.global_transform = self.global_transform
	body.apply_central_impulse(direction * 5)
	body.apply_torque_impulse(Vector3(rand_range(0,3),rand_range(0,3),rand_range(0,3)))
	
	get_parent().add_child(body)
	queue_free()
	
