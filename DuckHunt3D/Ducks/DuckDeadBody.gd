extends RigidBody

func _ready():
	$BloodExplosion.emitting = true


func _on_DespawnTimer_timeout() -> void:
	queue_free()
