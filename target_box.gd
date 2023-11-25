extends ColorRect

class_name TargetBox

@export var current = 0
@export var capacity = 10
@onready var boxFill := $BoxFill

signal box_overflowed
signal box_complete

# Called when the node enters the scene tree for the first time.
func _ready():
	setCurrent(0)
	boxFill.color = Color(.5, .5, .2, 1)
	boxFill.size = Vector2(size.x, 100)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updateFill()
	

func add_peanut(weight: int):
	var new_total = current + weight
	if new_total > capacity:
		box_overflowed.emit()
		explode()
		setCurrent(0)
	elif new_total == capacity:
		box_complete.emit()
		setCurrent(0)
	else:
		setCurrent(new_total)
		
func setCurrent(new_value: int):
	current = new_value
	$Label.text = str(current) + " of " + str(capacity)

func updateFill():
	var fill_ratio = float(current)/capacity
	var fill_pixels = int(size.y * fill_ratio)
	boxFill.size.y = fill_pixels
	boxFill.position.y = size.y - fill_pixels

func explode():
	$ExplodeTimer.start()
	$ExplodeParticles.show()
	$ExplodeParticles.restart()
	
func _on_explode_timer_timeout() -> void:
	$ExplodeParticles.hide()
