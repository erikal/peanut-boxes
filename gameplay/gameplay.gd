extends Node2D

@export var targetBoxScene: PackedScene
@onready var peanutLabel := $PeanutLabel
@onready var scoreLabel := $ScoreLabel
@onready var livesLabel := $LivesLabel

var currentPeanut := 5
@export var score := 0
@export var lives := 3

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

var boxes := []
var offset := 300

func _ready():
	for i in range(3):
		var box: TargetBox = targetBoxScene.instantiate()
		box.position.x += i * offset
		add_child(box)
		boxes.append(box)
		box.box_complete.connect(on_box_complete)
		box.box_overflowed.connect(on_box_overflowed)

	new_peanut()
	
func new_peanut():
	currentPeanut = randi_range(1,5)
	peanutLabel.text = "Peanut: %d" % currentPeanut

	
func on_box_complete():
	score += 1
	scoreLabel.text = "Score: %d" % score

func on_box_overflowed():
	lives -= 1
	livesLabel.text = "Lives: %d" % lives
