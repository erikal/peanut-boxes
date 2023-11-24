extends ColorRect

class_name TargetBox

@export var current = 0
@export var capacity = 10
 
# Called when the node enters the scene tree for the first time.
func _ready():
	setCurrent(0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func add_peanut(weight: int):
	setCurrent(current + weight)
		
func setCurrent(new_value: int):
	current = new_value
	$Label.text = str(current) + " of " + str(capacity)
