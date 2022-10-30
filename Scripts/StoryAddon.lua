LogInfo("Запуск ")

local _PinMenu = common.GetAddonMainForm ("PinMenu")
local _BonusPool = common.GetAddonMainForm ("BonusPools")
local _QuestTracker = common.GetAddonMainForm ("QuestTracker")
local _LagMeter = common.GetAddonMainForm ("LagMeter")
local _ChatLog = common.GetAddonMainForm ("ChatLog")
local _Plates = common.GetAddonMainForm ("Plates")
local _Buffs = common.GetAddonMainForm ("Buffs")
local _ContextActionbar = common.GetAddonMainForm ("ContextActionbar")
local _Minimap = common.GetAddonMainForm ("Minimap")
local _ContextPOIMarker = common.GetAddonMainForm ("ContextPOIMarker")
local _ActionbarControls = common.GetAddonMainForm ("ActionbarControls")
local _EventNotification = common.GetAddonMainForm ("EventNotification")
local _ContextActions = common.GetAddonMainForm ("ContextActions")
local _BillingBonuses = common.GetAddonMainForm ("BillingBonuses")


-- Имитация свича для классового аддона
local swich = function (condition, results)

	local exists = results[condition] or results["default"]
	if type(exists) == "function" then
		return exists()
	end
	return exists
end

local sysClassName = avatar.GetClass()
local Class = nil

local _ClassAddons = swich (sysClassName, {
MAGE = function ()
		local _ClassAddon = common.GetAddonMainForm ("ClassAddonMage")
				Class = _ClassAddon
		end,

ENGINEER = function ()
		local _ClassAddon = common.GetAddonMainForm ("ClassAddonEngineer")
				Class = _ClassAddon
		end,

['default'] = function ()
			LogInfo("Фигня какая то случилась ")
			end
})
-- Имитация свича для классового аддона

LogInfo("Пожалуйста блять " , Class)

		--Пихаем названия переменнх в массив
local AddonList = { _PinMenu, 
		_BonusPool,
		_QuestTracker,
		_LagMeter,
		_ChatLog,
		_Plates,
		_Buffs,
		_ContextActionbar,
		_Minimap,
		_ContextPOIMarker,
		_ActionbarControls,
		_EventNotification,
		_ContextActions,
		_BillingBonuses,
		Class}


-- Изменение диалоговых панелей.
		-- Получение дочерних элементов NpcTalk
local _NpcTalk = common.GetAddonMainForm ("NpcTalk")
local NpcTalkChildren = _NpcTalk:GetNamedChildren()
		
		NpcTalkChildren[0]:SetSmartPlacementPlain( { sizeX = 495, sizeY = 754 } ) -- 1 Диалоговое окно 
		NpcTalkChildren[1]:SetSmartPlacementPlain( { sizeX = 495, sizeY = 754, posX = 520 } ) -- 2 Диалоговое окно

		-- Получение дочерних элементов 1 окно
local _NpcTalkDialogPanel = NpcTalkChildren[0]:GetNamedChildren()
		_NpcTalkDialogPanel[1]:SetSmartPlacementPlain( { sizeX = 445, sizeY = 593, posY = 81, posX = 35 } ) -- Изменение внутренного окна 
		_NpcTalkDialogPanel[2]:SetSmartPlacementPlain( { posY = 35 } ) -- Имя НПС
		_NpcTalkDialogPanel[5]:SetSmartPlacementPlain( { highPosY = 25, highPosX = 40 } ) -- Кнопка выхода


		-- Получение дочерних элементов 2 окно
local _NpcTalkQuestPanel = NpcTalkChildren[1]:GetNamedChildren()
		_NpcTalkQuestPanel[1]:SetSmartPlacementPlain( { sizeX = 455, sizeY = 593, posY = 81, highPosX = 17 } ) -- Изменение внутренного окна 
		_NpcTalkQuestPanel[2]:SetSmartPlacementPlain( { posY = 35 } ) -- Имя НПС
		_NpcTalkQuestPanel[3]:SetSmartPlacementPlain( { highPosY = 25, highPosX = 40 } ) -- Кнопка выхода

-- Изменение диалоговых панелей.
		
		
		-- Функции для скрытия/раскрытия элементов, данные берёт из массива TestList
local function Start()
			
			for i = 1, #AddonList do
				AddonList[i]:SetFade(0.0)
			end	

end

local function Stop()

			for i = 1, #AddonList do
				AddonList[i]:SetFade(1.0)
			end	

end


		-- Какая то штука для функций 
common.RegisterEventHandler ( Start, "EVENT_TALK_STARTED" )
common.RegisterEventHandler ( Stop, "EVENT_TALK_STOPPED" )