extends CanvasLayer


# Called when the node enters the scene tree for the first time.



func _on_start_pressed():
	get_tree().change_scene_to_file("res://world/world.tscn")
