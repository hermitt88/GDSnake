extends Node2D

var SnakeUp = preload("res://Images/SnakeUp.png")
var SnakeDown = preload("res://Images/SnakeDown.png")
var SnakeLeft = preload("res://Images/SnakeLeft.png")
var SnakeRight = preload("res://Images/SnakeRight.png")
var SnakeBody = preload("res://Images/SnakeBody.png")

onready var Head = $Snake/Head
onready var HeadImg = $Snake/Head/Sprite
onready var Body = $Snake/Body
onready var BodyImg = $Snake/Body/Sprite

var cell = 40
var Snake
var moveNextTurn

var direction
var keyIn
onready var timer = $Timer

var gotApple = false

func _ready():
	Snake = [Vector2(5, 5), Vector2(4, 5), Vector2(3, 5)]
	moveNextTurn = true
	Head.position = Snake[0] * cell
	direction = Vector2.RIGHT
	keyIn = Vector2.ZERO
	HeadImg.set_texture(SnakeRight)
	
func _process(_delta):
	moveSnake()
	pass

func _on_Timer_timeout():
	pass
	#drawSnake()
	#if gotApple:
	#	newApple()

#func drawSnake():
	#var newHead = Snake[0]
	

func moveSnake():
	if Input.is_action_just_pressed("up"):
		keyIn = Vector2.UP	
	if Input.is_action_just_pressed("down"):
		keyIn = Vector2.DOWN	
	if Input.is_action_just_pressed("left"):
		keyIn = Vector2.LEFT	
	if Input.is_action_just_pressed("right"):
		keyIn = Vector2.RIGHT

	if keyIn and keyIn.dot(direction) == 0 and moveNextTurn:
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
				
