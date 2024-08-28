extends CharacterBody3D

@onready var sprite = $Sprite
var flip_speed : float = 15.0
var face_right : bool = true
var face_up : bool = false

var gravity : float = 5.0


func _ready() -> void:
	sprite.play("idle")


func _physics_process(delta):
	# more than 2 directions
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# 2 directions left/right
	#var input_dir = Input.get_axis("ui_left", "ui_right")
	
	velocity.y -= gravity
	
	var new_animation : String = "idle"
	var new_suffix : String = ""
	
	if input_dir.x > 0.0:
		face_right = true
	elif input_dir.x < 0.0:
		face_right = false
	
	if abs(input_dir.x) > abs(input_dir.y):
		face_up = false
	else:
		if input_dir.y < 0.0:
			face_up = true
		elif input_dir.y > 0.0:
			face_up = false
	
	if is_on_floor():
		if input_dir != Vector2.ZERO:
			new_animation = "run"
		else:
			new_animation = "idle"
	
	if face_up:
		new_suffix = "_up"
	
	if face_right:
		sprite.rotation_degrees.y = move_toward(sprite.rotation_degrees.y, 0.0, flip_speed)
	else:
		sprite.rotation_degrees.y = move_toward(sprite.rotation_degrees.y, 180.0, flip_speed)
	
	sprite.play(new_animation + new_suffix)
	
	move_and_slide()
