--[[
  @Authors: Ben Dol (BeniS)
  @Details: 
]]

PvpModule = {}

-- load module events
dofiles('events')

local Panel = {
  --
}

function PvpModule.getPanel() return Panel end
function PvpModule.setPanel(panel) Panel = panel end

function PvpModule.init()
  -- create tab
  local botTabBar = CandyBot.window:getChildById('botTabBar')
  local tab = botTabBar:addTab(tr('PvP'))

  local tabPanel = botTabBar:getTabPanel(tab)
  local tabBuffer = tabPanel:getChildById('tabBuffer')
  Panel = g_ui.loadUI('pvp.otui', tabBuffer)

  PvpModule.parentUI = CandyBot.window

  -- register module
  Modules.registerModule(PvpModule)
  KeepTarget.init()
end

function PvpModule.terminate()
  --CreatureList.terminate()
  PvpModule.stop()

  Panel:destroy()
  Panel = nil
  KeepTarget.terminate()
end

function PvpModule.loadUI(panel)
  UI = {
    KeepTarget = panel:recursiveGetChildById('KeepTarget'),
  }
end


function PvpModule.onStopEvent(eventId)
end
-- Any global module functions here

return PvpModule
