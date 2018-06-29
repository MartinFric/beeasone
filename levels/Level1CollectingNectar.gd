extends Node

var objectivePopupMenu
# class member variables go here, for example:
# var a = 2
var nectarCollected = 0
var time_limit = 60
var timer_progress
var score_progress
var flowers
var endPopup
var started = false
var finished = false

func _ready():
	show_objectives()
	init_ui()
	#start_game()

func show_objectives():
	objectivePopupMenu = get_node("ObjectiveFlowersPopup")
	objectivePopupMenu.connect("hidden", self, "on_objectives_read")
	objectivePopupMenu.show()
	
func init_ui():
	flowers = get_tree().get_nodes_in_group("flowers")
	var menu = get_node("Container")
	timer_progress = menu.find_node("Speed")
	score_progress = menu.find_node("Timer")
	score_progress.max_value = flowers.size() * 3
	timer_progress.max_value = time_limit
	timer_progress.value = time_limit

func on_objectives_read():
	start_game()

func update_score():
	score_progress.value = nectarCollected
	get_node("Score").text = String(nectarCollected)		# TODO: remove
	if nectarCollected == flowers.size() * 3:
		finished = true
		get_node("Timer").stop()
		endPopup = get_node("EndPopup")
		endPopup.show()
		endPopup.get_node("Victory").show()
	
func on_collected():
	print("COLLECTED!!")
	nectarCollected += 3
	update_score()
	
func start_game():
	started = true
	get_node("Timer").start()
	for f in flowers:
		f.connect("collected", self, "on_collected")
		f.start_timer()

func _process(delta):
	if started and not finished:
		update_timer(delta)

func update_timer(delta):
	var time = timer_progress.value
	print(time)
	time = time - delta
	timer_progress.value = time

func _on_Timer_timeout():
	finished = true
	endPopup = get_node("EndPopup")
	endPopup.show()
	endPopup.get_node("Loss").show()
