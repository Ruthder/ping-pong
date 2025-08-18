extends RigidBody2D

func _draw() -> void:
	draw_circle(Vector2.ZERO, 10, Color(1, 1, 1))

@export var initial_speed: float = 300.0
@export var bounce_factor: float = 1.1

var direction: Vector2 = Vector2(1, 1)  # inicialmente hacia abajo-derecha

func _ready() -> void:
	linear_velocity = direction.normalized() * initial_speed

func _on_body_entered(body: Node) -> void:
	print("Colisión con: ", body.name)
	print("Colisión con paredes?: ", body.is_in_group("paredes"))
	print("Colisión con jugador?: ", body.is_in_group("Jugador"))

	if body.is_in_group("paredes"):
		direction.y = -direction.y  # invertir vertical
	elif body.is_in_group("Jugador"):
		direction.x = -direction.x  # invertir horizontal

	# aplicar rebote con factor
	linear_velocity = direction.normalized() * initial_speed * bounce_factor
