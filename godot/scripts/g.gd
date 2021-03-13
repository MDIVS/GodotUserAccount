extends Node
const GAME_VERSION = "v0.1"
const DEFAULT_BUS = preload("res://default_bus_layout.tres")

var RDW = OS.get_screen_size().x
var RDH = OS.get_screen_size().y
var DW = ProjectSettings.get_setting("display/window/size/width")
var DH = ProjectSettings.get_setting("display/window/size/height")
var BackMusic = AudioStreamPlayer.new()
var FileSy = File.new()
var DirectorySy = Directory.new()

var __OBJECTS__ = [BackMusic]

func _ready():
	randomize()
	BackMusic.pause_mode = PAUSE_MODE_PROCESS
	BackMusic.bus = "Music"

	display_adaptation()

func display_adaptation():
	#landscaped with fixed vertical size
	var window_size = OS.get_window_size()
	DW = window_size.x/window_size.y*480
	ProjectSettings.set_setting("display/window/size/width",DW)

func radius_bounce_inside_rect(rect:Rect2,position:Vector2,velocity:Vector2,radius):
	var r = velocity
	if position.x<rect.position.x+radius:
		r.x = abs(r.x)
	if position.x>rect.end.x-radius:
		r.x = -abs(r.x)
	if position.y<rect.position.y+radius:
		r.y = abs(r.y)
	if position.y>rect.end.y-radius:
		r.y = -abs(r.y)
	return Vector2(r.x,r.y)
