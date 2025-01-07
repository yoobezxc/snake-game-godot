extends CanvasLayer

@onready var snake: Area2D = $SnakePart/Snake
@onready var apple_spawner: Node2D = $AppleSpawner
@onready var background_music: AudioStreamPlayer = $BackgroundMusic

func _ready() -> void:
	snake.position = Global.init_pos_snake
	apple_spawner.create_apple()

func _on_background_music_finished() -> void:
	background_music.play()
