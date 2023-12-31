extends Sprite2D


var HP5 = load("res://Assets/life5.png")
var HP4 = load("res://Assets/life4.png") 
var HP3 = load("res://Assets/life3.png") 
var HP2 = load("res://Assets/life2.png") 
var HP1 = load("res://Assets/life1.png") 

var DashOn = load("res://Assets/DashButton.png") 
var DashOff = load("res://Assets/DashButtonOff.png") 
var ShootOn = load("res://Assets/Ammo.png") 
var ShootOff = load("res://Assets/AmmoOff.png") 

@onready var Player = get_node("../../HBoxContainer/SubViewPortP1/SubViewport/Level/Player1")

@onready var ButtonDash = get_node("../CanDash1")
@onready var ButtonShoot = get_node("../CanShoot1")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (Player.Health == 5):
		texture = HP5
	if (Player.Health == 4):
		texture = HP4
	if (Player.Health == 3):
		texture = HP3
	if (Player.Health == 2):
		texture = HP2
	if (Player.Health == 1):
		texture = HP1
	if (Player.canDash == true):
		ButtonDash.texture = DashOn
	else:
		ButtonDash.texture = DashOff
	if (Player.canShoot == true):
		ButtonShoot.texture = ShootOn
	else:
		ButtonShoot.texture = ShootOff
