extends TileMap

var width = 17
var height = 17

func _draw():
	for i in range(height):
		for j in range(width):
			if (i + j) % 2 == 0:
				self.set_cellv(Vector2(i, j), 1)
			else:
				self.set_cellv(Vector2(i, j), 2)
