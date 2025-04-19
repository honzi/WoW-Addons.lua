local addonName, addonTable = ...;

local cvarkeys = {};
for key in pairs(addonTable.cvars) do
    table.insert(cvarkeys, key);
end
table.sort(cvarkeys);

-- Anchor tooltips to mouse.
hooksecurefunc(
  "GameTooltip_SetDefaultAnchor",
  function(self, parent)
      self:SetOwner(
        parent,
        "ANCHOR_CURSOR"
      );
  end
);

-- Modify various default UI frames.
Minimap:SetMaskTexture("Interface\\ChatFrame\\ChatFrameBackground");

-- Update watched faction reputation.
local handle_reputation = CreateFrame("FRAME");
handle_reputation:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE");
handle_reputation:SetScript(
  "OnEvent",
  function(self, event, ...)
      local text = ...;
      local pattern = string.gsub(
        string.gsub(
          FACTION_STANDING_INCREASED,
          "(%%s)",
          "(.+)"
        ),
        "(%%d)",
        "(.+)"
      );
      local _, _, faction = string.find(
        text,
        pattern
      );

      if faction and faction ~= GetWatchedFactionInfo() then
          for index = 1, GetNumFactions() do
              if GetFactionInfo(index) == faction then
                  SetWatchedFactionIndex(index);
                  break;
              end
          end
      end
  end
);

-- Add extra mana display for druids.
local _, classname = UnitClass("player");
if classname == "DRUID" then
    local druidframe = CreateFrame(
      "FRAME",
      nil,
      PlayerFrame
    );
    druidframe:SetPoint(
      "CENTER",
      PlayerFrame,
      50,
      40
    );
    druidframe:SetSize(1, 1);
    druidframe.text = druidframe:CreateFontString(
      nil,
      "OVERLAY",
      "GameFontNormal"
    );
    druidframe.text:SetPoint("CENTER");

    druidframe:RegisterEvent("UNIT_POWER_FREQUENT");
    druidframe:RegisterEvent("UPDATE_SHAPESHIFT_FORM");
    druidframe:SetScript(
      "OnEvent",
      function(self, event, ...)
          local power = UnitPower("player", 0) .. "/" .. UnitPowerMax("player", 0);
          local spec = GetSpecialization();
          if spec then
              if spec == 1 then
                  power = power .. ", " .. UnitPower("player", 8);
              elseif spec == 2 then
                  power = power .. ", " .. UnitPower("player", 3);
              end
          end

          self.text:SetText(power);
      end
    );
end

-- Slash command for setting CVar values to Honzi's defaults.
SLASH_HONZI_CONFIG1 = "/honzi_config";
function SlashCmdList.HONZI_CONFIG(msg, editbox)
    for key,value in ipairs(cvarkeys) do
        if C_CVar.GetCVarDefault(value) == nil then
            print(value .. " has no default value!");
        else
            local default = addonTable.cvars[value];
            if C_CVar.GetCVar(value) ~= default then
                print(value .. "=" .. default .. ": " .. tostring(C_CVar.SetCVar(value, addonTable.cvars[value])));
            end
        end
    end

    C_VoiceChat.SetMuted(true);
    SetActionBarToggles(1, 1, 1, 0, 0);

    print(date("%H:%M:%S") .. " /honzi_config");
end

-- Slash command for printing CVars that have values that differ from Honzi's defaults.
SLASH_HONZI_PRINT1 = "/honzi_print";
function SlashCmdList.HONZI_PRINT(msg, editbox)
    for key,value in ipairs(cvarkeys) do
        local cvar_default = C_CVar.GetCVarDefault(value);
        if cvar_default == nil then
            print(value .. " has no default value!");
        else
            local cvar_value = C_CVar.GetCVar(value);
            if cvar_value ~= addonTable.cvars[value] then
                print(value .. "=" .. cvar_value .. ", honzi=" .. addonTable.cvars[value] .. ", default=" .. cvar_default);
            end
        end
    end

    print(date("%H:%M:%S") .. " /honzi_print");
end
