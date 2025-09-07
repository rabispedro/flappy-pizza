extends Node

var _audio_player: AudioStreamPlayer

var boom_sfx: AudioStreamWAV = preload("res://assets/sounds/boom.wav")
var score_sfx: AudioStreamWAV = preload("res://assets/sounds/score.wav")

var sfx_factory: Dictionary = {
	"boom": boom_sfx,
	"score": score_sfx
}

func set_audio_player(audio_player: AudioStreamPlayer) -> void:
	_audio_player = audio_player
	return

func play_sfx(sfx_name: String) -> void:
	print("Playing SFX: '", sfx_name, "'") 
	
	match(sfx_name):
		"boom", "score":
			_audio_player.stream = sfx_factory[sfx_name]
			_audio_player.play()
	return
