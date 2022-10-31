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
-- Имитация свича для классового аддона


local function InitUser()

local sysClassName = avatar.GetClass() -- Получение класса
local Class = nil -- Пустышка для класса

local _ClassAddons = swich (sysClassName, {
MAGE = function ()
		local _ClassAddon = common.GetAddonMainForm ("ClassAddonMage")
				Class = _ClassAddon -- Пихаем полученный класс сюда
		end,

ENGINEER = function ()
		local _ClassAddon = common.GetAddonMainForm ("ClassAddonEngineer")
				Class = _ClassAddon
		end,

DRUID = function ()
		local _ClassAddon = common.GetAddonMainForm ("ClassAddonDruid")
				Class = _ClassAddon
		end,

NECROMANCER = function ()
		local _ClassAddon = common.GetAddonMainForm ("ClassAddonNecromancer")
				Class = _ClassAddon
		end,

PALADIN = function ()
		local _ClassAddon = common.GetAddonMainForm ("ClassAddonPaladin")
				Class = _ClassAddon
		end,
		
PSIONIC = function ()
		local _ClassAddon = common.GetAddonMainForm ("ClassAddonPsionic")
				Class = _ClassAddon
		end,
				
WARLOCK = function ()
		local _ClassAddon = common.GetAddonMainForm ("ClassAddonWarlock")
				Class = _ClassAddon
		end,
						
WARRION = function ()
		local _ClassAddon = common.GetAddonMainForm ("ClassAddonWarrion")
				Class = _ClassAddon
		end,

['default'] = function ()
			local _ClassAddon = common.GetAddonMainForm ("NecroVision") -- Чтоб избежать ошибок на классах у которых нет классовых аддонов
			Class = _ClassAddon 
			end
})
return Class -- Возращаем значене в InitUser()
end


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
		}


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

			InitUser():SetFade(0.0) -- Костыль

end

local function Stop()

			for i = 1, #AddonList do
				AddonList[i]:SetFade(1.0)
			end	

			InitUser():SetFade(1.0) -- Костыль

end

		-- Какая то штука для функций 
common.RegisterEventHandler ( Start, "EVENT_TALK_STARTED" )
common.RegisterEventHandler ( Stop, "EVENT_TALK_STOPPED" )
common.RegisterEventHandler( InitUser, "EVENT_AVATAR_CREATED" )