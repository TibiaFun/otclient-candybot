--[[
  @Authors: Ben Dol (BeniS)
  @Details: Auto targeting event logic
]]

TargetsModule.AutoTarget = {}
AutoTarget = TargetsModule.AutoTarget

local targetData = {}

function AutoTarget.UpdateData()
  
end

function AutoTarget.Event(event)
  if g_game.isAttacking() then
    EventHandler.rescheduleEvent(TargetsModule.getModuleId(), 
      event, Helper.safeDelay(1500, 4000))
    return
  end

  local targetList = {}
  for k,v in pairs(TargetsModule.getTargets()) do
    table.insert(targetList, v:getName())
  end

  local player = g_game.getLocalPlayer()
  local targets = player:getTargetsInArea(targetList, true)

  for k,target in pairs(targets) do
    if target then g_game.attack(target) break end
  end
  EventHandler.rescheduleEvent(TargetsModule.getModuleId(), 
    event, Helper.safeDelay(800, 3000))
end