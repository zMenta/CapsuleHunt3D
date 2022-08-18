extends RigidBody


func _on_DespawnTimer_timeout() -> void:
	queue_free()
