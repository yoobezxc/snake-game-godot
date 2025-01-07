extends Node2D

const APPLE_SCENE : PackedScene = preload("res://Scenes/apple.tscn")

func create_apple() -> void:
	var new_apple : Area2D = APPLE_SCENE.instantiate()
	new_apple.name = random_name()
	new_apple.position = random_position()
	call_deferred("add_child", new_apple)

func random_position() -> Vector2:
	var default_pos : float = 10.0
	var pos_x : float = default_pos + randi_range(0, 15) * 20
	var pos_y : float = default_pos + randi_range(0, 8) * 20
	var wrap_direction : Vector2 = Vector2(pos_x, pos_y)
	
	return wrap_direction

func random_name() -> String:
	return "Apple" + str(randi() % 10000)
