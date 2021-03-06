function init()
  local bounds = mcontroller.boundBox()
  script.setUpdateDelta(5)
  self.healthRatio = 1
end

function update(dt)

 if status.statPositive("maxHealth") then 
   self.healthRatio = status.resource("health") / status.stat("maxHealth") 
 else 
   self.healthRatio = 0 
 end


  if self.healthRatio < 0.2 then
    status.setPersistentEffects("healthpower", {{stat = "powerMultiplier", baseMultiplier = 1.25}})
  elseif self.healthRatio < 0.3 then
    status.setPersistentEffects("healthpower", {{stat = "powerMultiplier", baseMultiplier = 1.20}})
  elseif self.healthRatio < 0.4 then
    status.setPersistentEffects("healthpower", {{stat = "powerMultiplier", baseMultiplier = 1.17}}) 
  elseif self.healthRatio < 0.5 then
    status.setPersistentEffects("healthpower", {{stat = "powerMultiplier", baseMultiplier = 1.14}})  
  elseif self.healthRatio < 0.6 then
    status.setPersistentEffects("healthpower", {{stat = "powerMultiplier", baseMultiplier = 1.10}})    
  elseif self.healthRatio < 0.7 then
    status.setPersistentEffects("healthpower", {{stat = "powerMultiplier", baseMultiplier = 1.07}}) 
  elseif self.healthRatio < 0.75 then
    status.setPersistentEffects("healthpower", {{stat = "powerMultiplier", baseMultiplier = 1.04}})        
  else
    status.clearPersistentEffects("healthpower") 
  end

end

function uninit()
  status.clearPersistentEffects("healthpower")
end












