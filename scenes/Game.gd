extends Node2D

const Queue = preload("res://scripts/Queue.gd")

class_name Game

var turn_queue = Queue.new()

func _ready():
	$PlayerDeck.generate()
	$EnemyDeck.generate()
	add_turns()
	turn_queue.make_last_first()
	next_turn()
	pass # Replace with function body.

func add_turns():
	for card in all_playable_cards():
		turn_queue.add(card)

func all_playable_cards():
	var playable_cards = []
	playable_cards.append_array(enemy_deck().cards())
	playable_cards.append(player())
	return playable_cards

func enemy_deck():
	return $EnemyDeck

func player_deck():
	return $PlayerDeck

func player():
	return $PlayerCard

func next_turn():
	var turn_card = turn_queue.next()
	if turn_card.get_class() == "PlayerCard":
		player_deck().generate()
