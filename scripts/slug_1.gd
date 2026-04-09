extends Area2D

@onready var game_scene = get_tree().get_first_node_in_group("game")
var goo_scene = load("res://scenes/goo.tscn")
var goo_instance = null
var coin_scene = load("res://scenes/coin.tscn")
var coin_instance = null

func _ready() -> void:
	spawn_goo()

func spawn_goo():
	while true:
		if goo_instance == null:
			print("goo")
			goo_instance = goo_scene.instantiate()
			goo_instance.position = self.position + Vector2(-50, 0)
			game_scene.add_child(goo_instance)
			
		await get_tree().create_timer(2.0).timeout
