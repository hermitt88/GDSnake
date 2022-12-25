extends Node2D

onready var timer = $Timer
onready var map = $TileMap
onready var Snake = $TileMap/Snake.Snake

var width = 17
var height = 17

func _ready():
	for i in range(height):
		for j in range(width):
			if (i + j) % 2 == 0:
				map.set_cellv(Vector2(i, j), 1)
			else:
				map.set_cellv(Vector2(i, j), 2)
				

func _process(delta):
	pass

func _on_Timer_timeout():
	pass # Replace with function body.

