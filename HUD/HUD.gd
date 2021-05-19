extends CanvasLayer

onready var scoreLabel = $Container/ScoreLabel

func _ready():
	update_score(Score.score)
	Score.connect("score_changed", self, "update_score")

func update_score(value) -> void:
	scoreLabel.text = "Score: " + str(value)
