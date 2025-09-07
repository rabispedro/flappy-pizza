class_name Sausage
extends Node2D

const VELOCITY: float = -100

@onready var _upper_sausages: Sprite2D = $Upper/UpperSprite
@onready var _lower_sausages: Sprite2D = $Lower/LowerSprite

func _process(delta: float) -> void:
	global_position.x += delta * VELOCITY
	
	var tween: Tween = create_tween().set_parallel(false)
	tween.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
	
	tween.tween_property(_upper_sausages, "scale:y", 0.4, 0.05)
	tween.tween_property(_lower_sausages, "scale:y", 0.4, 0.05)
	
	tween.tween_property(_upper_sausages, "scale:y", 1, 0.05)
	tween.tween_property(_lower_sausages, "scale:y", 1, 0.05)
	
	if global_position.x < -32:
		call_deferred("queue_free")
	return

func _on_point_area_body_exited(body: Node2D) -> void:
	if body is Meaty:
		SoundManager.play_sfx("score")
		body.score_point()
	return

func _on_upper_body_entered(body: Node2D) -> void:
	if body is Meaty:
		SoundManager.play_sfx("boom")
		body.kill()
	return

func _on_lower_body_entered(body: Node2D) -> void:
	if body is Meaty:
		SoundManager.play_sfx("boom")
		body.kill()
	return
