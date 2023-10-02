extends Area2D

var tool_inside = false

var key = preload("res://key/key.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if tool_inside == true and Input.is_action_just_pressed("use"):
		var key_instance = key.instantiate()
		key_instance.position = global_position
		get_tree().get_root().add_child(key_instance)
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("tool"):
		tool_inside = true


func _on_body_exited(body):
	if body.is_in_group("tool"):
		tool_inside = false
