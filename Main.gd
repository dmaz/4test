extends Node2D

var tick:int = 0
var data:Array
var time:int
var zoom:int = 3
var size:int

func _ready() -> void:
	size = get_viewport().size.x
	data.resize(size)
	for i in size:
		data[i] = Vector2(i,400-16*zoom)

	time = Time.get_ticks_msec()


func _physics_process(delta: float) -> void:
	var frameTime = Time.get_ticks_msec() - time

	time = Time.get_ticks_msec()
	tick += 1
	$Label.text = "%s"%tick
	data.append(Vector2(tick % size, 400-frameTime*zoom))
	data.pop_front()
	data[0] = Vector2(data[0].x, 50)
	data[0] = Vector2(data[1].x, 400)
	update()

func _draw() -> void:
	var points = PackedVector2Array(data)
	draw_multiline(points,Color.ALICE_BLUE)
