extends Node2D

var cell = 40
var Snake = []
var moveNext = true

var direction = Vector2.RIGHT
var keyIn = Vector2.ZERO

var keyBufferLength = 3
var keyBuffer = []

# Called when the node enters the scene tree for the first time.
func _ready():
	#scale = Vector2.ONE * cell / 40
	Snake = [Vector2(5, 5)]
	self.position = Snake[0] * cell

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	headMove()

func headMove():
	if Input.is_action_just_pressed("up"):
		keyIn = Vector2.UP
		$Head/Right.visible = false
		$Head/Down.visible = false
		$Head/Left.visible = false
		$Head/Up.visible = true
	
	if Input.is_action_just_pressed("down"):
		keyIn = Vector2.DOWN
		$Head/Right.visible = false
		$Head/Down.visible = true
		$Head/Left.visible = false
		$Head/Up.visible = false
	
	if Input.is_action_just_pressed("left"):
		keyIn = Vector2.LEFT
		$Head/Right.visible = false
		$Head/Down.visible = false
		$Head/Left.visible = true
		$Head/Up.visible = false
	
	if Input.is_action_just_pressed("right"):
		keyIn = Vector2.RIGHT
		$Head/Right.visible = true
		$Head/Down.visible = false
		$Head/Left.visible = false
		$Head/Up.visible = false
	if keyIn and keyIn.dot(direction) == 0:
		direction = keyIn
		keyIn = Vector2.ZERO
		position += direction * cell
