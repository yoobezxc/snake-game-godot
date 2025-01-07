extends Node2D

@onready var snake: Area2D = $"../SnakePart/Snake"
@onready var snake_part: Node2D = $"../SnakePart"

var direction : Vector2 = Vector2.RIGHT
var move_cell : float = 20.0
var time_move : float = 0.0
var time_to_move : float = 1.0
var speed : float = 5.0

var snake_parts : Array[Area2D]
var prev_position : Array[Vector2]

func _ready() -> void:
	snake_parts.push_front(snake)
	prev_position.push_back(snake_parts[0].position)

func _physics_process(delta: float) -> void:
	time_move += delta * speed
	
	if time_move >= time_to_move:
		time_move = 0.0
		snake_move()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("UP") and direction != Vector2.DOWN:
		direction = Vector2.UP
	if event.is_action_pressed("DOWN") and direction != Vector2.UP:
		direction = Vector2.DOWN
	if event.is_action_pressed("LEFT") and direction != Vector2.RIGHT:
		direction = Vector2.LEFT
	if event.is_action_pressed("RIGHT") and direction != Vector2.LEFT:
		direction = Vector2.RIGHT

func snake_move() -> void:
	var new_direction : Vector2 = snake.position + direction * move_cell
	var wrapper : Vector2 = wrap_wall(new_direction)
	snake.position = wrapper
	
	prev_position.push_back(snake_parts[0].position)
	
	for i in range(1, snake_parts.size(), 1):
		var pos_index : int = prev_position.size() - i - 1
		snake_parts[i].position = prev_position[pos_index]
	
	while prev_position.size() > snake_parts.size():
		prev_position.pop_front()
	
	if snake_part.get_child_count() > snake_parts.size():
		snake_parts.push_back(snake_part.get_child(snake_part.get_child_count() - 1))
		snake_part.get_child(snake_part.get_child_count() - 1).get_child(1).disabled = false

func wrap_wall(dir : Vector2) -> Vector2:
	var pos_x : float = fposmod(dir.x, 320.0)
	var pos_y : float = fposmod(dir.y, 180.0)
	
	var wrap_direction : Vector2 = Vector2(pos_x, pos_y)
	
	return wrap_direction
