extends CanvasLayer

@onready var label: Label = $Control/CenterContainer/VBoxContainer/Label

func _process(_delta: float) -> void:
	label.text = "HIGHSCORE : " + str(Global.highscore)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ESC"):
		visible = !visible
		get_tree().paused = !get_tree().paused
	
	if event.is_action_pressed("ONE"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
	if event.is_action_pressed("TWO"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)

func _on_play_again_button_pressed() -> void:
	Global.new_score = Global.score
	if Global.new_score > Global.highscore:
		Global.highscore = Global.new_score
	Global.score = 0
	get_tree().paused = !get_tree().paused
	get_tree().reload_current_scene()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
