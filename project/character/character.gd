extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
signal died
var tool: CharacterBody2D = null
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var perimeter_radius := 30
var tool_dir


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		if get_platform_velocity().y < 0:
			position.y += get_platform_velocity().y * delta - gravity
	move_horizontal()
	jump_control()
	move_and_slide()
	if tool != null:
		tool_orbit()
		tool.move_and_slide()
		drop_tool()


func move_horizontal():
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction == 1:
		$AnimatedSprite2D.play("right")
	elif direction == -1:
		$AnimatedSprite2D.play("left")


func jump_control():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


func tool_orbit():
	tool.global_position.x = clamp(tool.global_position.x, global_position.x-perimeter_radius, global_position.x+perimeter_radius)
	tool.global_position.y= clamp(tool.global_position.y, global_position.y-perimeter_radius, global_position.y-20)
	tool_dir = (get_local_mouse_position() - tool.to_local(tool.global_position))
	tool.velocity = (tool_dir.normalized() * 200)

func drop_tool():
	if Input.is_action_just_pressed("drop"):
		tool = null

func _on_pickup_body_entered(body):
	if body is CharacterBody2D:
		tool = body
	elif body.is_in_group("spikes"):
		died.emit()
		print("die")
