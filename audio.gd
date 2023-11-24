class_name Audio
extends Node2D

# sounds
@onready var gameOverAudio := $GameOver
@onready var peanutPlacedAudio := $PeanutPlaced
@onready var boxCompleteAudio := $BoxComplete
@onready var boxOverflowAudio := $BoxOverflow


func play_sound(name: Global.SoundEffects):
	if name == Global.SoundEffects.GAME_OVER:
		gameOverAudio.play()
	if name == Global.SoundEffects.BOX_COMPLETE:
		boxCompleteAudio.play()
	if name == Global.SoundEffects.BOX_OVERFLOW:
		boxOverflowAudio.play()
	if name == Global.SoundEffects.PEANUT_PLACED:
		peanutPlacedAudio.play()
