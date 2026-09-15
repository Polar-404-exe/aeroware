extends Node2D

@onready var HealtContainer: HBoxContainer = $HealtContainer
@onready var Vita_1: TextureRect = $HealtContainer/Vita
@onready var Vita_2: TextureRect = $HealtContainer/Vita2
@onready var Vita_3: TextureRect = $HealtContainer/Vita3
@onready var Vita_4: TextureRect = $HealtContainer/Vita4
@onready var Vita_5: TextureRect = $HealtContainer/Vita5
@onready var level: RichTextLabel = $Level
@onready var timer_label: RichTextLabel = $Timer
@onready var game_timer: Timer = $Timer # Collegalo al tuo nodo Timer (quello con l'icona dell'orologio)

func _ready() -> void:
	# Configura e avvia il timer di 5 secondi
	game_timer.wait_time = 5.0
	game_timer.one_shot = true
	game_timer.start()
	
	# Quando il tempo scade, esegue automaticamente la funzione sotto per cambiare scena
	game_timer.timeout.connect(_on_timer_timeout)

func _process(delta: float) -> void:
	# Mostra i secondi rimanenti e si ferma a 0.0 senza andare in negativo
	if game_timer.time_left > 0:
		timer_label.text = "%0.1f" % game_timer.time_left
	else:
		timer_label.text = "0.0"

	# Gestione visiva delle icone dei cuori
	match Global.lives:
		4:
			Vita_1.hide()
		3:
			Vita_1.hide()
			Vita_2.hide()
		2:
			Vita_1.hide()
			Vita_2.hide()
			Vita_3.hide()
		1:
			Vita_1.hide()
			Vita_2.hide()
			Vita_3.hide()
			Vita_4.hide()
		0:
			HealtContainer.hide()
			
	level.text = "Level " + str(Global.minigames_done)

# prossima scena
func _on_timer_timeout() -> void:
	if Global.minigames_done < 3:
		Global.minigames_done += 1
		# Gioco a caso
		Global.prossimo_gioco() 
	else:
		# Se i minigiochi sono finiti, torna al menu principale
		get_tree().change_scene_to_file("res://title_screen.tscn")
