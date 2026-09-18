extends Node2D

@onready var themed_timer: Node2D = $themed_timer

var buttons_pressed := 0
var finished := false

func _ready() -> void:
	await themed_timer.Timer(7.0)
	if not finished:
		lose()

func _process(_delta: float) -> void:
	if buttons_pressed >= 4 and not finished:
		win()

func win() -> void:
	finished = true
	Global.vinto()

func lose() -> void:
	finished = true
	Global.perso()
