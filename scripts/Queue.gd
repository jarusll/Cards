extends Node

class_name Queue

var queue = []

func add(item):
	queue.append(item)

func remove(item):
	queue.erase(item)

func next():
	if queue.size() == 0:
		return null
	var first = queue.pop_front()
	queue.push_back(first)
	if is_instance_valid(queue[0]):
		return queue[0]
	queue.pop_front()
	return next()

func items():
	return queue

func make_last_first():
	var last = queue.pop_back()
	queue.push_front(last)
