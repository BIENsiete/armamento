extends CharacterBody2D
class_name Enemy

var speed = 150

var player = null

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	
	$yumba.play("yumba")
	
func _process(delta: float) -> void:
	fllow()
	
func fllow():
	if player != null:
		velocity = position.direction_to(player.position) * speed
		
		move_and_slide()




