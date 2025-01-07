extends Area2D

@onready var controller: Node2D = $"../../Controller"
@onready var apple_spawner: Node2D = $"../../AppleSpawner"
@onready var snake_part: Node2D = $".."
@onready var sfx: AudioStreamPlayer = $"../../SFX"

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("food"):
		area.call_deferred("queue_free")
		apple_spawner.create_apple()
		
		var snake_pos = controller.prev_position[0]
		snake_part.call_deferred("create_snake_tail", snake_pos)
		
		Global.score += 1
		
		sfx.play()
	
	if area.is_in_group("snake"):
		Global.new_score = Global.score
		if Global.new_score > Global.highscore:
			Global.highscore = Global.new_score
		Global.score = 0
		get_tree().reload_current_scene()
