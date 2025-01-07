extends Node2D

const SCORE_SCENE : PackedScene = preload("res://Scenes/score_ui.tscn")
const GAMEPLAY_SCENE : PackedScene = preload("res://Scenes/gameplay.tscn")
const TITLE_SCENE : PackedScene = preload("res://Scenes/title.tscn")

func _ready() -> void:
	var new_score : CanvasLayer = SCORE_SCENE.instantiate()
	var new_gameplay : CanvasLayer = GAMEPLAY_SCENE.instantiate()
	var new_title : CanvasLayer = TITLE_SCENE.instantiate()
	
	new_title.visible = false
	
	add_child(new_score)
	add_child(new_gameplay)
	add_child(new_title)
