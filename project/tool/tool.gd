extends CharacterBody2D

var rotation_increment = deg_to_rad(30)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	rotation = clamp(rotation,deg_to_rad(-90), deg_to_rad(90))
	if Input.is_action_pressed("use"):
		if velocity.x > 100:
			rotate(rotation_increment)
		elif velocity.x < -100:
			rotate(-rotation_increment)
	else:
		rotation = move_toward(rotation, 0, deg_to_rad(8))
