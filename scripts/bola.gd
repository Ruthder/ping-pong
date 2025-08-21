extends RigidBody2D

func _draw() -> void:
	draw_circle(Vector2.ZERO, 10, Color(1, 1, 1))

@export var initial_speed: float = 800.0
@export var bounce_factor: float = 1.1

var direction: Vector2 = Vector2(1, 1)  # inicialmente hacia abajo-derecha

func _ready() -> void:
	linear_velocity = direction.normalized() * initial_speed
	
func _physics_process(delta: float) -> void:
	print(global_position)
	linear_velocity = linear_velocity + direction

func _on_body_entered(body: Node) -> void:
	print("Colisión con: ", body.name)

	if body.is_in_group("paredes"):
		direction.y = -direction.y  # invertir vertical
	elif body.is_in_group("Jugador"):
		direction.x = -direction.x  # invertir horizontal

	# aplicar rebote con factor
	linear_velocity = direction.normalized() * initial_speed
	
	
func reset():
	global_position = get_viewport_rect().size / 2
	# 2. Reiniciar dirección (ej: hacia un lado aleatorio)
	direction = Vector2(randf_range(-1, 1), randf_range(-0.5, 0.5)).normalized()

	# 3. Limpiar la velocidad acumulada del motor
	linear_velocity = Vector2.ZERO
	angular_velocity = 0.0

	# 4. Asignar nueva velocidad
	linear_velocity = direction * initial_speed
