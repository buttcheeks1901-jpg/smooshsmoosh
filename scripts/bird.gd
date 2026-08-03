extends CharacterBody2D

signal game_over

@export var jump_strength: float = -300.0
@export var gravity: float = 980.0

var is_game_over: bool = false

func _ready() -> void:
	is_game_over = false

func _physics_process(delta: float) -> void:
	if is_game_over:
		return
	
	# Apply gravity
	velocity.y += gravity * delta
	
	# Jump when space or touch is pressed
	if Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		velocity.y = jump_strength
	
	move_and_slide()
	
	# Check if bird fell off screen
	if position.y > 750:
		emit_signal("game_over")
