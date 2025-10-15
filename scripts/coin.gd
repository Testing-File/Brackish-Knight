extends Area2D



#Using signals
func _on_body_entered(body: Node2D) -> void:
	queue_free()
