extends Node2D

const Queue = preload("res://scripts/Queue.gd")

class_name Game

var current_turn = "enemies"

func _ready():
	enemy_deck().generate()
	enemy_deck().connect("enemies_turn_played", self, "next_turn")
	enemy_deck().connect("enemies_cleared", self, "next_dungeon")
	player_deck().connect("player_turn_played", self, "next_turn")
	player().connect("player_died", self, "game_over")
	next_turn()
	pass # Replace with function body.

func game_over():
	get_tree().quit()

func enemy_deck():
	return $EnemyDeck

func player_deck():
	return $PlayerDeck

func player():
	return $PlayerCard

func next_turn():
	if current_turn == "enemies":
		toggle_turn()
		player_deck().generate()
	else:
		toggle_turn()
		enemy_deck().play(player())

func next_dungeon():
	enemy_deck().generate()
	current_turn = "enemies"
	next_turn()

func toggle_turn():
	if current_turn == "player":
		current_turn = "enemies"
	else:
		current_turn = "player"
