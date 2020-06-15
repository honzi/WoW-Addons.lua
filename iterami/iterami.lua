local addonName, addonTable = ...

SLASH_ITERAMI_CONFIG1 = "/iterami_config";
function SlashCmdList.ITERAMI_CONFIG(msg, editbox)
    SetActionBarToggles(1, 1, 1, 0, 0);
    print(time() .. ": iterami config loaded");
end
