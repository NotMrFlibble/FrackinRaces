function init()
  baseValue = config.getParameter("healthBonus",0)*(status.resourceMax("health"))
  effect.addStatModifierGroup({{stat = "maxHealth", amount = baseValue }})
  baseValue2 = config.getParameter("energyBonus",0)*(status.resourceMax("energy"))
  effect.addStatModifierGroup({{stat = "maxEnergy", amount = baseValue2 }})  
  self.gritBoost = config.getParameter("gritBonus",0)
  effect.addStatModifierGroup({{stat = "grit", baseMultiplier = self.gritBoost }})
  self.movementParams = mcontroller.baseParameters()  
  
  local bounds = mcontroller.boundBox()
  script.setUpdateDelta(5)
  
  
  self.liquidMovementParameter = {
    liquidJumpProfile = {
      jumpHoldTime = 0.275
    }
  }  
end


function update(dt)
  mcontroller.controlParameters(self.liquidMovementParameter)
end

function uninit()
  
end
