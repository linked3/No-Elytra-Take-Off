#built using mc-build (https://github.com/mc-build/mc-build)

execute if data entity @s Inventory[{Slot: 102b, id: "minecraft:elytra"}] run effect give @s minecraft:levitation 10 128 true
effect give @s minecraft:hunger 3 80 true
playsound minecraft:entity.zombies.hurt player @s ~ ~ ~ 1.5 0.35
advancement revoke @s only elytra_nerf:zombies_hurt_player