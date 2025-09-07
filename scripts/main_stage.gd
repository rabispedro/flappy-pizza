class_name MainStage
extends Node2D

@onready var _restart_label: Label = $AspectRatioContainer/RestartLabel
@onready var _game_over_label: Label = $AspectRatioContainer/GameOverLabel
@onready var _meaty: Meaty = $Meaty

func _ready() -> void:
	SoundManager.set_audio_player(%AudioStreamPlayer)
	return

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("gp_reload"):
		get_tree().paused = false
		get_tree().reload_current_scene()
		return
	
	if _meaty != null && _meaty.is_killed:
		_game_over_label.visible = true
		get_tree().paused = true
		return
	
	if Input.is_action_just_pressed("gp_pause"):
		_pause_stage()
	
	return

func _pause_stage() -> void:
	get_tree().paused = !get_tree().paused
	_restart_label.visible = get_tree().paused
	return
