extends Node2D

const SNAKE_SCENE : PackedScene = preload("res://Scenes/snake.tscn")
var snake_index : int = 0

func create_snake_tail(pos : Vector2) -> void:
	var snake_tail : Area2D = SNAKE_SCENE.instantiate()
	snake_index += 1
	snake_tail.name = "SnakeTail" + str(snake_index)
	snake_tail.position = pos
	snake_tail.get_child(1).disabled = true
	snake_tail.get_child(0).color = "#54b3e6"
	add_child(snake_tail)
