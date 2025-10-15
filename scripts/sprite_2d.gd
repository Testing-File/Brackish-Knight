extends Sprite2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	$Hurt.play()
	await get_tree().create_timer(0.01).timeout
	get_tree().reload_current_scene()
