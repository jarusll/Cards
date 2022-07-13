extends Control

class_name Game

const Queue = preload("res://scripts/Queue.gd")
const AbilityCard = preload("res://scenes/AbilityCard.tscn")

var turn_queue = Queue.new()
var selected_ability
var selected_enemy
var turn_state
var player_turn_state 
var enemies_turn_state

func _ready():
	enemy_deck().generate()

	for card in cards_with_turn():
		turn_queue.add(card)
	for enemy in enemy_cards():
		enemy.connect("turn_played", self, "next_turn")
		enemy.connect("enemy_down", self, "on_enemy_down")
	for card in player_cards():
		card.connect("player_turn_played", self, "after_player_turn")

	player_deck().connect("ability_selected", self, "on_player_card_select")
	player_deck().connect("deck_empty", self, "on_player_deck_empty")
	enemy_deck().connect("enemy_selected", self, "on_enemy_card_select")
	enemy_deck().connect("deck_empty", self, "on_enemy_deck_empty")

	enemy_deck().make_cards_uninteractive()
	next_turn()

func enemy_deck():
	return $GameContainer/EnemyDeckContainer/EnemyDeck

func player_deck():
	return $GameContainer/PlayerDeckContainer/PlayerDeck

func enemy_cards():
	return enemy_deck().cards()

func player_cards():
	return player_deck().cards()

func all_deck_cards():
	var cards = []
	cards.append_array(player_cards())
	cards.append_array(enemy_cards())
	return cards

func player():
	return $GameContainer/HBoxContainer/PlayerCard

func enemies():
	return enemy_deck()

func cards_with_turn():
	var cards = []
	cards.append(player())
	cards.append_array(enemy_cards())
	return cards

func next_turn():
	var t = Timer.new()
	t.set_wait_time(1)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	var card_with_turn = turn_queue.next()
	card_with_turn.highlight()
	if card_with_turn == player():
		player_deck().show()
		player_deck().generate()
		player().enable_turn()
	else:
		player().disable_turn()
		player_deck().hide()
		card_with_turn.play(player())

func on_enemy_card_select(enemy_card):
	selected_ability.use(enemy_card)
	player_deck().remove(selected_ability)
	clear_turn()
	
func on_player_card_select(ability_card):
	enemy_deck().make_cards_interactive()
	selected_ability = ability_card

func clear_turn():
	selected_ability = null
	enemy_deck().clear_turn()
	player_deck().clear_turn()

func after_player_turn():
	if player_cards().size() == 0:
		next_turn()
	pass

func on_player_deck_empty():
	player().disable_turn()
	next_turn()

func on_enemy_deck_empty():
	get_tree().quit()

func on_enemy_down(enemy):
	enemy_deck().remove(enemy)
