extends Node2D

@export var bird_scene: PackedScene
@export var pipe_scene: PackedScene
@export var spawn_timer: float = 1.5

var score: int = 0
var is_game_over: bool = false
var current_spawn_timer: float = 0.0

@onready var bird: CharacterBody2D = $Bird
@onready var score_label: Label = $ScoreLabel
@onready var game_over_label: Label = $GameOverLabel
@onready var restart_button: Button = $RestartButton

func _ready() -> void:
	is_game_over = false
	score = 0
	update_score_display()
	game_over_label.visible = false
	restart_button.visible = false
	bird.game_over.connect(_on_bird_game_over)

func _process(delta: float) -> void:
	if is_game_over:
		return
	
	# Spawn pipes
	current_spawn_timer += delta
	if current_spawn_timer >= spawn_timer:
		current_spawn_timer = 0.0
		spawn_pipe()
	
	# Check for scoring (when bird passes a pipe)
	check_score()

func spawn_pipe() -> void:
	var pipe = pipe_scene.instantiate()
	add_child(pipe)

func check_score() -> void:
	for child in get_children():
		if child is Area2D and child.has_method("_on_body_entered"):
			if not child.has_passed and child.global_position.x < bird.global_position.x:
				child.has_passed = true
				score += 1
				update_score_display()

func update_score_display() -> void:
	score_label.text = "Score: " + str(score)

func _on_bird_game_over() -> void:
	is_game_over = true
	bird.is_game_over = true
	game_over_label.visible = true
	restart_button.visible = true

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
