extends Node

class_name AbilityCharacterEffectGraph

const GRAPH = {
	"electricity" : {
		"wood": ["shock", "burn"]
	}
}

func get_relation(ability, character):
	if GRAPH.has(ability) and GRAPH[ability].has(character):
		return GRAPH[ability][character]
	return null
