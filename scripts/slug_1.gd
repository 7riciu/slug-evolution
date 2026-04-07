extends Area2D

@onready var game_scene = get_tree().get_first_node_in_group("game")
var goo_scene = load("res://scenes/goo.tscn")
var goo_instance = null

func _ready() -> void:
	spawn_goo()

func _process(_delta: float) -> void:
	if goo_instance != null:
		if Input.is_action_just_pressed("click"):
			goo_instance.queue_free()

func spawn_goo():
	while true:
		if goo_instance == null:
			goo_instance = goo_scene.instantiate()
			goo_instance.position = self.position + Vector2(-50, 0)
			game_scene.add_child(goo_instance)
			
		await get_tree().create_timer(2.0).timeout
