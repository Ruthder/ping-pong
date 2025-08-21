extends Node2D

var jugador1 = 0
var jugador2 = 0

func _on_arco_derecho_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bola"):
		jugador2 += 1
		reiniciar_nivel()

func _on_arco_izquierdo_body_entered(body: Node2D) -> void:
	if body.is_in_group("Bola"):
		jugador1 += 1
		reiniciar_nivel()
	
func reiniciar_nivel():
	$ScoreIzquierda.text = str(jugador1)
	$ScoreDerecha.text = str(jugador2)
	$Bola.reset()
