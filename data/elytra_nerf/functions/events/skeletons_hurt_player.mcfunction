#built using mc-build (https://github.com/mc-build/mc-build)

execute if data entity @s Inventory[{Slot: 102b, id: "minecraft:elytra"}] run effect give @s minecraft:levitation 10 128 true
advancement revoke @s only elytra_nerf:skeletons_hurt_player