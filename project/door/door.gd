extends StaticBody2D

var open := false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if open == true:
		$CollisionShape2D.disabled = true
		


func _on_key_hole_on_unlock():
	open = true
	$AnimatedSprite2D.play("open")
