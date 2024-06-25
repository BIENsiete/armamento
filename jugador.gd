extends CharacterBody2D
signal shoot(bullet, direction, location)

@export var salud = 5
var inmune : bool = false
var Bullet = preload("res://bala.tscn")

func _process(_delta):
	daño_ctrl()
	pass


func  daño_ctrl():
	if inmune == true:
		if salud >0:
			salud -= 1
			$barra.value = salud
			inmune = false
		if salud <= 0:
			get_tree().reload_current_scene()
	pass

func _ready():
	$Animaciones.play("Animaciones")
	$barra.max_value = salud

func _physics_process(_delta):
	var direccion = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = direccion * 200
	move_and_slide()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			shoot.emit(Bullet, rotation, position)

func _proces(delta):
	look_at(get_global_mouse_position())
	
func _on_player_shoot(Bullet, direction, location):
	var spawned_bullet = Bullet.instantiate()
	add_child(spawned_bullet)
	spawned_bullet.rotation = direction
	spawned_bullet.position = location
	spawned_bullet.velocity = spawned_bullet.velocity.rotated(direction)
