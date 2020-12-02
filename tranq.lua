-- Event Type: COMBAT_LOG_EVENT_UNFILTERED
function()
    local timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = CombatLogGetCurrentEventInfo()
    
    if event == "SPELL_DISPEL" then
        local in_instance, instance_type = IsInInstance()
        
        if sourceGUID == UnitGUID("player") then
            local spellId, spellName, spellSchool, amount = select(12, CombatLogGetCurrentEventInfo())
            
            if destName:sub(-1):find('[sxzSXZ]') then
                destName = destName .. "'"
            else
                destName = destName .. "'s"
            end
            
            -- DEBUG
            print(sourceGUID, destGUID)
            
            if in_instance == false then
                print("Dispelled " .. destName .. " " .. GetSpellLink(amount))
            else
                SendChatMessage("Dispelled " .. destName .. " " .. GetSpellLink(amount), "SAY")
            end
        end
    end
end
