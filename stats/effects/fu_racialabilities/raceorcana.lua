require("/scripts/vec2.lua")
function init()
    inWater=0
  effect.addStatModifierGroup({{stat = "maxHealth", amount = 40}})
  effect.addStatModifierGroup({{stat = "waterbreathProtection", amount = 1}})
  effect.addStatModifierGroup({{stat = "wetImmunity", amount = 1}})
  script.setUpdateDelta(5)	
end

function isDry()
local mouthPosition = vec2.add(mcontroller.position(), status.statusProperty("mouthPosition"))
	if not world.liquidAt(mouthPosition) then
	    status.removeEphemeralEffect("regenerationminor",math.huge)
            status.clearPersistentEffects("orcanaprotection")
            status.clearPersistentEffects("orcanaprotection2")
            status.clearPersistentEffects("orcanaprotection3")
            status.clearPersistentEffects("orcanaprotection4")
	    inWater = 0
	end
end

function update(dt)
local mouthPosition = vec2.add(mcontroller.position(), status.statusProperty("mouthPosition"))
	if world.liquidAt(mouthPosition) and inWater == 0 then
	    status.addEphemeralEffect("regenerationminor",math.huge)
            status.setPersistentEffects("orcanaprotection2", {{stat = "foodDelta", amount = -0.03}})
            status.setPersistentEffects("orcanaprotection4", {{stat = "fallDamageMultiplier", amount = 0.0}})
	    inWater = 1
	else
	  isDry()
        end  
end

function uninit()
              status.clearPersistentEffects("orcanaprotection")
              status.clearPersistentEffects("orcanaprotection2")
              status.clearPersistentEffects("orcanaprotection3")
            status.clearPersistentEffects("orcanaprotection4")
end
