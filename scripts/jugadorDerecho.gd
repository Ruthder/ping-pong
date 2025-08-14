extends CharacterBody2D

var speed = 400

func _physics_process(delta: float) -> void:
	var direction: float = 0.0

	if Input.is_action_pressed("ui_up"):
		direction = -1.0
	elif Input.is_action_pressed("ui_down"):
		direction = 1.0
	velocity.y = direction * speed
	move_and_slide()
