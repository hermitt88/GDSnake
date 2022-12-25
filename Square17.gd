extends TileMap

var cells = 17

func _draw():
	for i in range(cells):
		for j in range(cells):
			if (i + j) % 2 == 0:
				self.set_cellv(Vector2(i, j), 1)
			else:
				self.set_cellv(Vector2(i, j), 2)
