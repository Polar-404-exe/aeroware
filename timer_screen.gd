extends Node2D

const TOTAL_MINIGAMES := 2

@onready var HealtContainer: HBoxContainer = $HealtContainer
@onready var Vita_1: TextureRect = $HealtContainer/Vita
@onready var Vita_2: TextureRect = $HealtContainer/Vita2
@onready var Vita_3: TextureRect = $HealtContainer/Vita3
@onready var Vita_4: TextureRect = $HealtContainer/Vita4
@onready var Vita_5: TextureRect = $HealtContainer/Vita5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time := 0.0

func _ready() -> void:
	await Timer(5.0)
	if Global.lives <= 0:
		Global.reset()
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
	elif Global.minigames_done < TOTAL_MINIGAMES:
		Global.minigames_done += 1
		get_tree().change_scene_to_file("res://scenes/minigame_%d.tscn" % Global.minigames_done)
	else:
		# hai vinto tutti i minigiochi (done_screen.tscn non esiste ancora)
		Global.reset()
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

func _process(_delta: float) -> void:
	var icone := [Vita_5, Vita_4, Vita_3, Vita_2, Vita_1]
	for i in icone.size():
		icone[i].visible = i < Global.lives
	timer.text = "%.1f" % time
	level.text = "Level " + str(mini(Global.minigames_done + 1, TOTAL_MINIGAMES))

func Timer(start_time: float) -> void:
	time = start_time
	while time > 0.0:
		await wait(0.1)
		time -= 0.1

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
