local mplayer = util.table.deepcopy(data.raw["player"]["player"])
-- I don't like dying
mplayer.max_health = "-1"
mplayer.healing_per_tick = "0"
data:extend{mplayer}