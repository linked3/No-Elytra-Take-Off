#built using mc-build (https://github.com/mc-build/mc-build)

schedule function elytra_nerf:clocks/1s 1s
execute as @a run execute at @s if entity @e[type=creeper,distance=..5] run function elytra_nerf:events/creeper_near_player