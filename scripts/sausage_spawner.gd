class_name SausageSpawner
extends Node

@onready var _sausage_scene: PackedScene = preload("res://scenes/sausage.tscn")
@onready var _sausage_cooldown: Timer = $Cooldown

func _generate_obstacle() -> void:
	var new_sausage = _sausage_scene.instantiate()
	var random_position: Vector2i = Vector2i(200, randi_range(68, 96))
	new_sausage.global_position = random_position
	self.get_parent().add_child.call_deferred(new_sausage)
	return   

func _on_cooldown_timeout() -> void:  
	_generate_obstacle()
	_sausage_cooldown.start(randf_range(1.2, 3.4))
	return
