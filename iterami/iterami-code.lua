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
Minimap:SetMaskTexture("Interface\\ChatFrame\\ChatFrameBackground");
MinimapBorder:Hide();
MinimapBorderTop:Hide();
MinimapNorthTag:SetAlpha(0);
MiniMapWorldMapButton:Hide();
MinimapZoomIn:Hide();
MinimapZoomOut:Hide();
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
local handle_colors = CreateFrame("FRAME");
handle_colors:RegisterEvent("GROUP_ROSTER_UPDATE");
handle_colors:RegisterEvent("PLAYER_FOCUS_CHANGED");
handle_colors:RegisterEvent("PLAYER_TARGET_CHANGED");
handle_colors:RegisterEvent("UNIT_FACTION");
handle_colors:RegisterEvent("UNIT_TARGET");
handle_colors:SetScript(
  "OnEvent",
  function(self, event, ...)
      if UnitExists("focus") then
          update_colors(
            "focus",
            FocusFrame,
            FocusFrameNameBackground
          );

          if UnitExists("focustarget") then
              update_colors_tot(
                "focustarget",
                FocusFrameToT
              );
          end
      end
      if UnitExists("target") then
          update_colors(
            "target",
            TargetFrame,
            TargetFrameNameBackground
          );

          if UnitExists("targettarget") then
              update_colors_tot(
                "targettarget",
                TargetFrameToT
              );
          end
      end
  end
);
function update_colors(type, frame, subframe)
    local classcolor = RAID_CLASS_COLORS[select(2, UnitClass(type))];
    if classcolor ~= nil then
        subframe:SetVertexColor(
          classcolor.r,
          classcolor.g,
          classcolor.b
        );
    else
        subframe:SetVertexColor(
          0,
          0,
          0
        );
    end

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
function update_colors_tot(type, frame)
    local classcolor = RAID_CLASS_COLORS[select(2, UnitClass(type))];
    if classcolor ~= nil then
        frame.name:SetTextColor(
          classcolor.r,
          classcolor.g,
          classcolor.b
        );
    end
end

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
          self.text:SetText(UnitPower("player", 0) .. "/" .. UnitPowerMax("player", 0));
      end
    );

    local spec = GetSpecialization();
    if spec and spec == 1 then
        local boomkinframe = CreateFrame(
          "FRAME",
          nil,
          PlayerFrame
        );
        boomkinframe:SetPoint(
          "CENTER",
          PlayerFrame,
          100,
          40
        );
        boomkinframe:SetSize(1, 1);
        boomkinframe.text = boomkinframe:CreateFontString(
          nil,
          "OVERLAY",
          "GameFontNormal"
        );
        boomkinframe.text:SetPoint("CENTER");

        boomkinframe:RegisterEvent("UNIT_POWER_FREQUENT");
        boomkinframe:RegisterEvent("UPDATE_SHAPESHIFT_FORM");
        boomkinframe:SetScript(
          "OnEvent",
          function(self, event, ...)
              self.text:SetText(UnitPower("player", 8) .. "/" .. UnitPowerMax("player", 8));
          end
        );
    end
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
        local cvar_default = GetCVarDefault(value);
        if cvar_default == nil then
            print(value .. " has no default value!");
        else
            local default = tostring(addonTable.cvars[value]);
            if tostring(GetCVar(value)) ~= default then
                print(value .. "=" .. default .. ": " .. tostring(SetCVar(value, addonTable.cvars[value])));
            end
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
        local cvar_default = GetCVarDefault(value);
        if cvar_default == nil then
            print(value .. " has no default value!");
        else
            local cvar_value = tostring(GetCVar(value));
            if cvar_value ~= tostring(addonTable.cvars[value]) then
                print(value .. "=" .. cvar_value .. ", iterami=" .. addonTable.cvars[value] .. ", default=" .. cvar_default);
            end
        end
    end

    print(date("%H:%M:%S") .. ": /iterami_print");
end
