extends Node

signal character_died

class_name AbstractCharacter

var HP

func set_HP(new_hp):
    HP = new_hp

func take_damage(damage):
    HP -= damage
    emit_signal("character_died")