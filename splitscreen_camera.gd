extends GridContainer

var view1 :Camera2D
var view2 :Camera2D
var cam1 :Camera2D
var cam2 :Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	view1 = get_node("SubViewPortP1/SubViewport/Camera2D")
	view2 = get_node("SubViewPortP2/SubViewport/Camera2D")
	cam1 = get_node("../../Player1/Camera2D")
	cam2 = get_node("../../Player2/Camera2D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
