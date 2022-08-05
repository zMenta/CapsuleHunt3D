extends KinematicBody


signal duck_died


export(PackedScene) var dead_body

export var move_speed := 8
export var direction := Vector3(1,1,0)

func _ready() -> void:
	direction = Vector3(rand_range(-1,1),1,rand_range(-0.5,0))


func _physics_process(_delta: float) -> void:
	move_and_slide(move_speed * direction.normalized())


func die() -> void:
	var body = dead_body.instance() as RigidBody
	body.global_transform = self.global_transform
	body.apply_central_impulse(direction * 5)
	body.apply_torque_impulse(Vector3(rand_range(0,3),rand_range(0,3),rand_range(0,3)))
	
	emit_signal("duck_died")
	get_parent().add_child(body)
	queue_free()
	


func _on_VisibilityNotifier_screen_exited() -> void:
	queue_free()
