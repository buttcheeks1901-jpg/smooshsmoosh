extends Area2D

@export var speed: float = 200.0
@export var spawn_height_range: Vector2 = Vector2(100, 400)

var pipe_gap: float = 150.0
var has_passed: bool = false

func _ready() -> void:
	# Randomize pipe position
	var random_height = randf_range(spawn_height_range.x, spawn_height_range.y)
	$TopPipe.position.y = -random_height - pipe_gap / 2
	$BottomPipe.position.y = random_height + pipe_gap / 2
	
	# Move pipes off screen to the right
	position.x = 550

func _process(delta: float) -> void:
	position.x -= speed * delta
	
	# Remove pipe when it goes off screen
	if position.x < -100:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.has_signal("game_over"):
		body.emit_signal("game_over")

func _on_visibility_notifier_2d_screen_exited() -> void:
	queue_free()
