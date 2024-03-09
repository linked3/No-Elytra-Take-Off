function load {
  function elytra_nerf:reset_event_based_advancements
  function elytra_nerf:clocks/1s
  scoreboard objectives add nearby_monster_count dummy
}

function reset_event_based_advancements {
  advancement revoke @a only elytra_nerf:zombies_hurt_player
  advancement revoke @a only elytra_nerf:spider_hurt_player
  advancement revoke @a only elytra_nerf:skeletons_hurt_player
}

dir clocks {
  function 1s {
    schedule function elytra_nerf:clocks/1s 1s
    execute as @a run execute at @s if entity @e[type=creeper,distance=..5] run function elytra_nerf:events/creeper_near_player
  }
}

dir events {
  function creeper_near_player {
    effect give @s minecraft:levitation 10 128 true
    effect give @s minecraft:slowness 1 0 true
  }

  function zombies_hurt_player {
    effect give @s minecraft:levitation 10 128 true
    effect give @s minecraft:hunger 3 80 true
    playsound minecraft:entity.zombies.hurt player @s ~ ~ ~ 1.5 0.35
    advancement revoke @s only elytra_nerf:zombies_hurt_player
  }
  
  function spider_hurt_player {
    execute store result score @s nearby_monster_count if entity @e[type=#elytra_nerf:monsters,distance=..10]
    execute if score @s nearby_monster_count matches ..3 run setblock ~ ~ ~ minecraft:cobweb keep
    tag @s add linked.reset_spider_hurt_player_achievement
    advancement revoke @a[tag=linked.reset_spider_hurt_player_achievement] only elytra_nerf:spider_hurt_player
  }

  function skeletons_hurt_player {
    effect give @s minecraft:levitation 10 128 true
    advancement revoke @s only elytra_nerf:skeletons_hurt_player
  }
}