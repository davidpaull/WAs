-- Event type: COMBAT_LOG_EVENT_UNFILTERED
function()
    local debugg = false
    local timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = CombatLogGetCurrentEventInfo()
    
    if event == "SPELL_INTERRUPT" then
        local in_instance, instance_type = IsInInstance()
        
        if sourceGUID == UnitGUID("player") then
            local spellId, spellName, spellSchool, eSpellName  = select(12, CombatLogGetCurrentEventInfo())
            
            -- Return if player is the target also, ie. Quaking
            if destGUID == UnitGUID("player") then return end
            
            if destName:sub(-1):find('[sxzSXZ]') then
                destName = destName .. "'"
            else
                destName = destName .. "'s"
            end
            
            if debugg == true then
                print(sourceGUID, destGUID)
            end
            
            
            if in_instance == false then
                print("Interrupted " .. destName .. " " .. GetSpellLink(eSpellName))
            else
                SendChatMessage("Interupted " .. destName .. " " .. GetSpellLink(eSpellName), "SAY")
                
            end
        end
    end
end
