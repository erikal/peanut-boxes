extends Node2D

@export var targetBoxScene: PackedScene
@onready var peanutLabel := $PeanutLabel

var currentPeanut := 5

func _process(_delta: float) -> void:
	#$Icon.rotate(_delta)
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_released("pause"):
		call_deferred("_pause")
	
	for i in range(3):
		var action_name = "box%d" % (i + 1)
		if event.is_action_pressed(action_name):
			boxes[i].add_peanut(currentPeanut)
			new_peanut()
	
func _pause() -> void:
	$Paused.pause()
	get_tree().paused = true

var boxes = []
var offset = 300

func _ready():
	for i in range(3):
		var box = targetBoxScene.instantiate()
		box.position.x += i * offset
		add_child(box)
		boxes.append(box)

	new_peanut()
	
func new_peanut():
	currentPeanut = randi_range(1,5)
	peanutLabel.text = "Peanut: %d" % currentPeanut

	
