extends Node2D

func _draw() -> void:
	for x in range(1, 16):
		x *= 20
		draw_line(Vector2(x, 0.0), Vector2(x, 180.0), Color.GRAY, 1.0)
	
	for y in range(1, 9):
		y *= 20
		draw_line(Vector2(0.0, y), Vector2(320.0, y), Color.GRAY, 1.0)
