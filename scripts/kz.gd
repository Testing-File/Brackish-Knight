extends Area2D

@onready var d_delay: Timer = $d_delay

#We use a timer for dealy b/w death and respawn
func _on_body_entered(body: Node2D) -> void:
	d_delay.start()
	

func _on_d_delay_timeout() -> void:
	get_tree().reload_current_scene()
