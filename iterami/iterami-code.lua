local addonName, addonTable = ...;

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

-- Hide various default UI frames.
MainMenuBarArtFrame.LeftEndCap:Hide();
MainMenuBarArtFrame.RightEndCap:Hide();
MainMenuBarArtFrameBackground:Hide();
RegisterStateDriver(
  PlayerFrameGroupIndicator,
  "visibility",
  "hide"
);
RegisterStateDriver(
  StanceBarFrame,
  "visibility",
  "hide"
);

-- Add color target/focus frames based on unit class and reaction.
local frame = CreateFrame("FRAME");
frame:RegisterEvent("PLAYER_FOCUS_CHANGED");
frame:RegisterEvent("PLAYER_TARGET_CHANGED");
frame:SetScript(
  "OnEvent",
  function(self, event, ...)
      if UnitExists("focus") then
          update_colors(
            "focus",
            FocusFrame,
            FocusFrameNameBackground
          );
      end
      if UnitExists("target") then
          update_colors(
            "target",
            TargetFrame,
            TargetFrameNameBackground
          );
      end
  end
);
function update_colors(type, frame, framebackground)
    local classcolor = RAID_CLASS_COLORS[select(2, UnitClass(type))];
    framebackground:SetVertexColor(
      classcolor.r,
      classcolor.g,
      classcolor.b
    );

    local reaction = UnitReaction(type, "player");
    if reaction == nil then
        reaction = 0;
    end

    local green = 0;
    local red = 0;
    if reaction <= 4 then
        red = 1;
    end
    if reaction >= 4 then
        green = 1;
    end
    frame.levelText:SetTextColor(red, green, 0);
    frame.name:SetTextColor(red, green, 0);
end

-- Add extra mana display for druids.
if UnitClass("player") == "Druid" then
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
          self.text:SetText(UnitPower("player", 0) .. "/" .. UnitPowerMax("player", 0));
      end
    );
end

-- Slash command for setting CVar values to iterami defaults.
SLASH_ITERAMI_CONFIG1 = "/iterami_config";
function SlashCmdList.ITERAMI_CONFIG(msg, editbox)
    local keys = {};
    for key in pairs(addonTable.cvars) do
        table.insert(keys, key);
    end
    table.sort(keys);

    for key,value in ipairs(keys) do
        if tostring(GetCVar(value)) ~= tostring(addonTable.cvars[value]) then
            print(value .. "=" .. tostring(addonTable.cvars[value]) .. ": " .. tostring(SetCVar(value, addonTable.cvars[value])));
        end
    end

    C_VoiceChat.SetMuted(true);
    SetActionBarToggles(1, 1, 1, 0, 0);

    print(date("%H:%M:%S") .. ": /iterami_config");
end

-- Slash command for printing CVars that have values that differ from iterami defaults.
SLASH_ITERAMI_PRINT1 = "/iterami_print";
function SlashCmdList.ITERAMI_PRINT(msg, editbox)
    local keys = {};
    for key in pairs(addonTable.cvars) do
        table.insert(keys, key);
    end
    table.sort(keys);

    for key,value in ipairs(keys) do
        if tostring(GetCVar(value)) ~= tostring(addonTable.cvars[value]) then
            print(value .. "=" .. GetCVar(value) .. ", iterami=" .. addonTable.cvars[value] .. ", default=" .. GetCVarDefault(value));
        end
    end

    print(date("%H:%M:%S") .. ": /iterami_print");
end
