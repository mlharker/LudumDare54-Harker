extends Area2D

signal on_unlock

func _on_body_entered(body):
	if body.is_in_group("key"):
		body.die()
		on_unlock.emit()

