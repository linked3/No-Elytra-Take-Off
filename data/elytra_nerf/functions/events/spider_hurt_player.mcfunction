#built using mc-build (https://github.com/mc-build/mc-build)

execute store result score @s nearby_monster_count if entity @e[type=#elytra_nerf:monsters,distance=..10]
execute if score @s nearby_monster_count matches ..3 run setblock ~ ~ ~ minecraft:cobweb keep
tag @s add linked.reset_spider_hurt_player_achievement
advancement revoke @a[tag=linked.reset_spider_hurt_player_achievement] only elytra_nerf:spider_hurt_player