class_name Meaty
extends CharacterBody2D

const JUMP_FORCE: float = -220.0

var _gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var _score: int = 0
var is_killed: bool = false

@onready var _score_label: Label = $"../AspectRatioContainer/ScoreLabel"
@onready var _sprite: Sprite2D = $Sprite

func _ready() -> void:
	_update_score_label()
	return

func _process(delta: float) -> void:
	if (is_killed):
		return
		
	if global_position.y > 108  || global_position.y < 0:
		kill()
	
	velocity.y += delta * _gravity
	if Input.is_action_just_pressed("gp_fly"):
		velocity.y = JUMP_FORCE
		
		var tween: Tween = create_tween()
		tween.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
		tween.tween_property(_sprite, "scale:y", 0.4, 0.05)
		tween.tween_property(_sprite, "scale:y", 1, 0.05)
	
	move_and_slide()
	return

func score_point(value: int = 1) -> void:
	_score += value
	_update_score_label()
	return 

func _update_score_label() -> void:
	_score_label.text = ("Score: %d" % _score)
	return

func kill() -> void:
	_score = 0
	is_killed = true
	return
