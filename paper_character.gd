extends CharacterBody3D

@onready var sprite = $Sprite
var flip_speed : float = 15.0
var face_right : bool = true


func _physics_process(delta):
	# more than 2 directions
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# 2 directions left/right
	#var input_dir = Input.get_axis("ui_left", "ui_right")
	
	if input_dir.x > 0.0:
		face_right = true
	elif input_dir.x < 0.0:
		face_right = false
	
	if face_right:
		sprite.rotation_degrees.y = move_toward(sprite.rotation_degrees.y, 0.0, flip_speed)
	else:
		sprite.rotation_degrees.y = move_toward(sprite.rotation_degrees.y, 180.0, flip_speed)
