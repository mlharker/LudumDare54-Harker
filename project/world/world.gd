extends Node2D



func _on_win_on_win():
	$EndTimer.start()


func _on_character_died():
	$EndTimer.start()


func _on_end_timer_timeout():
	get_tree().change_scene_to_file("res://menu/menu.tscn")
