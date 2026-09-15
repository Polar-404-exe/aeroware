extends Node

var minigames_done = 0 #Numero di minigiochi fatti
var lives = 5 #vite
#minigiochi
var lista_minigiochi : Array = [
	"res://minigame_1.tscn",
	"res://minigame_2.tscn",
]
# Prossimo gioco a random
func prossimo_gioco():
	# gioco a random
	var indice_a_caso = randi() % lista_minigiochi.size()
	var gioco_scelto = lista_minigiochi[indice_a_caso]
	get_tree().change_scene_to_file(gioco_scelto)
