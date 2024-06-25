extends CharacterBody2D

var vida = 100

func _ready():
	pass

func _process(delta):
	pass

func quitarVida(cantidad):
	vida -= cantidad
	if vida <= 0:
		vida = 0
		# Aquí puedes llamar a una función de Game Over o reiniciar el nivel

func agregarVida(cantidad):
	vida += cantidad
	# Puedes establecer un límite máximo de vida si lo deseas

# Aquí puedes agregar la lógica de colisiones para detectar cuando el jugador es golpeado y llamar a quitarVida()

# Puedes llamar a la función agregarVida() cuando el jugador recoge un objeto de curación
