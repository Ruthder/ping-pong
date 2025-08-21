extends CharacterBody2D

@export var speed: float = 400.0
var init_pos: Vector2 = Vector2.ZERO

func _ready() -> void:
	init_pos = position

func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	position.x = init_pos.x
	
	if Input.is_action_pressed("ui_up"):
		input_vector.y = -1
	elif Input.is_action_pressed("ui_down"):
		input_vector.y = 1
	
	velocity = Vector2(0, input_vector.y * speed)
	move_and_slide()
