extends Area2D



#Using signals
func _on_body_entered(body: Node2D) -> void:
	$pick.play()
	$AnimatedSprite2D.hide()
	await get_tree().create_timer(0.17).timeout
	queue_free()
