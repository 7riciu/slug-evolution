extends Area2D

@onready var game_scene = get_tree().get_first_node_in_group("game")
var slug1_scene = preload("res://scenes/slug1.tscn")

func _ready() -> void:
	self.position = Vector2(100, 30)
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		$AnimatedSprite2D.play("open")
		await get_tree().create_timer(1.0).timeout
		var slug1_instance = slug1_scene.instantiate()
		game_scene.add_child(slug1_instance)
		slug1_instance.position = self.position + Vector2(10,10)
