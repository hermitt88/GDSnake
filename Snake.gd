extends Node2D

var SnakeUp = preload("res://Images/SnakeUp.png")
var SnakeDown = preload("res://Images/SnakeDown.png")
var SnakeLeft = preload("res://Images/SnakeLeft.png")
var SnakeRight = preload("res://Images/SnakeRight.png")
var SnakeBody = preload("res://Images/SnakeBody.png")
onready var Head = $Head
onready var HeadImg = $Head/Sprite

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
	Snake.append(Vector2(5, 5))
	Head.position = Snake[0] * cell
	HeadImg.set_texture(SnakeRight)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	headMove()

func headMove():
	if Input.is_action_just_pressed("up"):
		keyIn = Vector2.UP	
	if Input.is_action_just_pressed("down"):
		keyIn = Vector2.DOWN	
	if Input.is_action_just_pressed("left"):
		keyIn = Vector2.LEFT	
	if Input.is_action_just_pressed("right"):
		keyIn = Vector2.RIGHT

	if keyIn and keyIn.dot(direction) == 0:
		direction = keyIn
		keyIn = Vector2.ZERO
		match direction:
			Vector2.UP:
				HeadImg.set_texture(SnakeUp)
			Vector2.DOWN:
				HeadImg.set_texture(SnakeDown)
			Vector2.LEFT:
				HeadImg.set_texture(SnakeLeft)
			Vector2.RIGHT:
				HeadImg.set_texture(SnakeRight)
		Head.position += direction * cell
				
