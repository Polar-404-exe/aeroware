extends Node

var score := 0
var lives := 5
var ultimo_gioco := ""

var lista_minigiochi: Array = [
	"res://scenes/minigame_1.tscn",
	"res://scenes/minigame_2.tscn",
]

func reset() -> void:
	score = 0
	lives = 5
	ultimo_gioco = ""

func prossimo_gioco() -> void:
	var scelte := lista_minigiochi.duplicate()
	if scelte.size() > 1:
		scelte.erase(ultimo_gioco)
	ultimo_gioco = scelte.pick_random()
	get_tree().change_scene_to_file(ultimo_gioco)

func vinto() -> void:
	score += 1
	get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")

func perso() -> void:
	lives -= 1
	get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
