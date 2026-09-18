extends Node2D

@onready var themed_timer: Node2D = $themed_timer

var garlic_collected := 0
var finished := false

func _ready() -> void:
	await themed_timer.Timer(10.0)
	if not finished:
		lose()

func garlic_collect() -> void:
	garlic_collected += 1

func _process(_delta: float) -> void:
	if garlic_collected >= 3 and not finished:
		win()

func win() -> void:
	finished = true
	Global.vinto()

func lose() -> void:
	finished = true
	Global.perso()
