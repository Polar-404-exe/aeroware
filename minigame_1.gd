extends Node2D

@onready var themed_timer: Node2D = $themed_timer

var garlic_collected := 0
var finished := false
var start_ms := 0

func _ready() -> void:
	start_ms = Time.get_ticks_msec()
	await themed_timer.Timer(10.0)
	if not finished:
		lose()

func garlic_collect() -> void:
	garlic_collected += 1
	print("aglio preso: ", garlic_collected)

func _process(_delta: float) -> void:
	if garlic_collected >= 3 and not finished:
		win()

# TEST TEMPORANEO: premi F1 per vincere subito. Cancellalo dopo.
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_F1 and not finished:
		print("vittoria forzata")
		win()

func win() -> void:
	finished = true
	print("VINTO")
	get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")

func lose() -> void:
	finished = true
	print("PERSO dopo %.1f s, aglio = %d" % [(Time.get_ticks_msec() - start_ms) / 1000.0, garlic_collected])
	Global.minigames_done -= 1
	Global.lives -= 1
	get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
