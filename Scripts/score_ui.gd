extends CanvasLayer

@onready var score: Label = $Control/Score

func _process(_delta: float) -> void:
	score.text = "SCORE : " + str(Global.score)
