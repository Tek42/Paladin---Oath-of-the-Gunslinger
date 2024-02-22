Ext.Require("InitCompatibilityFramework.lua")

local function on_session_loaded()
    _P('Oath_Gunslinger session loaded!')
  end
  Ext.Events.SessionLoaded:Subscribe(on_session_loaded)
  
--[[
  local FTH=
  {
    "GS_FTH_MH_1",
    "GS_FTH_MH_2",
    "GS_FTH_MH_3",
    "GS_FTH_MH_4",
    "GS_FTH_MH_5",
    "GS_FTH_MH_6",
  }

  local FTHOH=
  {
    "GS_FTH_OH_1",
    "GS_FTH_OH_2",
    "GS_FTH_OH_3",
    "GS_FTH_OH_4",
    "GS_FTH_OH_5",
    "GS_FTH_OH_6",
  }

  function RemoveActionResource(entity, resourceGuid, amountToRemove, subResource)
    if entity and entity.ActionResources and entity.ActionResources.Resources and entity.ActionResources.Resources[resourceGuid] then
        subResource = subResource or 1
        local currentAmount = entity.ActionResources.Resources[resourceGuid][subResource].Amount
        currentAmount = math.max(currentAmount - amountToRemove, 0)
        entity:Replicate("ActionResources")
    else
        --Ideally log an erorr or something, pretty sure it'll throw an error if entity doesn't have ActionResources anyway
        return
    end
end

  Ext.Osiris.RegisterListener("UsingSpellOnTarget", 6, "after",
    function(caster, target, spell, spellType, spellElement, storyActionID)
        if spell == "GS_FTH_MH" then
            local fthAmount = math.random(#FTH)
            Osi.UseSpell(caster, FTH[fthAmount], target)
            print(spell)
            local ammoResource = "2c4475d6-88df-402b-89f1-45745331009d"
            local entity = Ext.Entity.Get(caster)
            RemoveActionResource(entity, ammoResource, fthAmount)
        end
    end)

    Ext.Osiris.RegisterListener("UsingSpellOnTarget", 6, "after",
    function(caster, target, spell, spellType, spellElement, storyActionID)
        if spell == "GS_FTH_OH" then
            local fthAmountOH = math.random(#FTHOH)
            Osi.UseSpell(caster, FTHOH[fthAmountOH], target)
            print(spell)
            local ammoResource = "a4bdee3a-37de-4a54-bee6-1d0217d24ab7"
            local entity = Ext.Entity.Get(caster)
            RemoveActionResource(entity, ammoResource, fthAmountOH)
        end
    end)
--]]