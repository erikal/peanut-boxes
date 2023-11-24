extends ColorRect

class_name TargetBox

@export var current = 0
@export var capacity = 10
 
signal box_overflowed
signal box_complete

# Called when the node enters the scene tree for the first time.
func _ready():
	setCurrent(0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func add_peanut(weight: int):
	var new_total = current + weight
	if new_total > capacity:
		box_overflowed.emit()
		setCurrent(0)
	elif new_total == capacity:
		box_complete.emit()
		setCurrent(0)
	else:
		setCurrent(new_total)
		
func setCurrent(new_value: int):
	current = new_value
	$Label.text = str(current) + " of " + str(capacity)
