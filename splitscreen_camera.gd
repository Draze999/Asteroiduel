extends Node

@onready var GO1 = get_node("HUD/GOP1") 
@onready var GO2 = get_node("HUD/GOP2") 

@onready var players := {
	"1": {
		view = $"HBoxContainer/SubViewPortP1/SubViewport",
		cam = $"HBoxContainer/SubViewPortP1/SubViewport/Camera2D",
		player = $"HBoxContainer/SubViewPortP1/SubViewport/Level/Player1"
	}, 
	"2": {
		view = $"HBoxContainer/SubViewPortP2/SubViewport",
		cam = $"HBoxContainer/SubViewPortP2/SubViewport/Camera2D",
		player = $"HBoxContainer/SubViewPortP1/SubViewport/Level/Player2",
	}, 
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	players["2"].view.get_viewport().world_2d = players["1"].cam.get_viewport().world_2d
	for i in players.values() :
		var remote_trans := RemoteTransform2D.new()
		remote_trans.remote_path = i.cam.get_path()
		i.player.add_child(remote_trans)
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (players["1"].player.Health <= 0):
		GO2.modulate.a = 1
	if (players["2"].player.Health <= 0):
		GO1.modulate.a = 1
	pass
