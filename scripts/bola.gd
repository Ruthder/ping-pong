extends RigidBody2D

@export var initial_speed = 300.0
@export var max_speed = 600.0 # Optional: to prevent excessive speed
@export var bounce_factor = 1.1 # Optional: to slightly increase speed on bounce

func _draw() -> void:
	draw_circle(Vector2(0,0),10,Color(1,1,1))
