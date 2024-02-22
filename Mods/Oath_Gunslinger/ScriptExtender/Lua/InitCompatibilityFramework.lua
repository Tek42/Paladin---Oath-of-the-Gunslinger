modGuid = "806da522-1517-4e22-81d6-ff121c437a5d"
subClassGuid = "239e3ddc-9d91-47f8-9a2c-02eaecd7c6a0"

if Ext.Mod.IsModLoaded("67fbbd53-7c7d-4cfa-9409-6d737b4d92a9") then
  local subClasses = {
    GunslingerSubclass = {
      modGuid = modGuid,
      subClassGuid = subClassGuid,
      class = "paladin",
      subClassName = "Oath of the Gunslinger"
    }
  }

  local function OnStatsLoaded()
    Mods.SubclassCompatibilityFramework.Api.InsertSubClasses(subClasses)
  end

  Ext.Events.StatsLoaded:Subscribe(OnStatsLoaded)
end