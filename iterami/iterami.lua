local addonName, addonTable = ...

SLASH_ITERAMI_CONFIG1 = "/iterami_config";
function SlashCmdList.ITERAMI_CONFIG(msg, editbox)
    C_VoiceChat.SetMuted(true);
    SetActionBarToggles(1, 1, 1, 0, 0);

    SetCVar("autoClearAFK", 1);
    SetCVar("autoDismount", 1);
    SetCVar("autoSelfCast", 1);
    SetCVar("autoStand", 1);
    SetCVar("BlockTrades", 0);
    SetCVar("cameraBobbing", 0);
    SetCVar("ChatBubbles", 1);
    SetCVar("ChatBubblesParty", 0);
    SetCVar("colorChatNamesByClass", 1);
    SetCVar("CombatDamage", 1);
    SetCVar("CombatHealing", 1);
    SetCVar("EnableMicrophone", 0);
    SetCVar("EnableVoiceChat", 0);
    SetCVar("maxFPSBk", 8);
    SetCVar("PetMeleeDamage", 1);
    SetCVar("PetSpellDamage", 1);
    SetCVar("profanityFilter", 0);
    SetCVar("rawMouseEnable", 1);
    SetCVar("rotateMinimap", 0);
    SetCVar("showGameTips", 1);
    SetCVar("showLootSpam", 1);
    SetCVar("showTargetCastbar", 1);
    SetCVar("Sound_EnableEmoteSounds", 1);
    SetCVar("Sound_EnableMusic", 0);
    SetCVar("Sound_ListenerAtCharacter", 1);
    SetCVar("spamFilter", 0);
    SetCVar("UnitNameCompanionName", 1);
    SetCVar("UnitNameEnemyCreationName", 1);
    SetCVar("UnitNameEnemyPetName", 1);
    SetCVar("UnitNameEnemyPlayerName", 1);
    SetCVar("UnitNameFriendlyCreationName", 1);
    SetCVar("UnitNameFriendlyPetName", 1);
    SetCVar("UnitNameFriendlyPlayerName", 1);
    SetCVar("UnitNameNPC", 1);
    SetCVar("UnitNameOwn", 0);
    SetCVar("UnitNamePlayerGuild", 1);
    SetCVar("UnitNamePlayerPVPTitle", 1);

    print(time() .. ": iterami config loaded");
end
