local addonName, addonTable = ...

local cvars = {
  actionbuttonusekeydown = 1,
  advancedcombatlogging = 0,
  advancedwatchframe = 1,
  alwayscompareitems = 1,
  alwaysshowactionbars = 0,
  assistattack = 1,
  autoclearafk = 1,
  autocompleteusecontext = 1,
  autocompletewheneditingfromcenter = 1,
  autodismount = 1,
  autodismountflying = 0,
  autointeract = 0,
  autojoinbgvoice = 0,
  autojoinpartyvoice = 0,
  autolootdefault = 1,
  autoquestprogress = 1,
  autoquestwatch = 1,
  autoselfcast = 1,
  autostand = 1,
  autounshift = 1,
  blockchannelinvites = 0,
  blocktrades = 0,
  breakuplargenumbers = 1,
  buffdurations = 1,
  calendarshowbattlegrounds = 1,
  calendarshowdarkmoon = 1,
  calendarshowholidays = 1,
  calendarshowlockouts = 1,
  calendarshowweeklyholidays = 1,
  camerabobbing = 0,
  cameradistancemaxzoomfactor = 2.6,
  camerapivot = 0,
  cameraterraintilt = 0,
  camerawatercollision = 0,
  chatbubbles = 1,
  chatbubblesparty = 0,
  chatclasscoloroverride = 0,
  chatmousescroll = 1,
  checkaddonversion = 1,
  clipcursor = 0,
  colorblindmode = 0,
  colorchatnamesbyclass = 1,
  combatlogretentiontime = 120,
  communitiesshowoffline = 1,
  componenttexturelevel = 1,
  countdownforcooldowns = 1,
  deselectonclick = 1,
  displayfreebagslots = 0,
  displayspellactivationoverlays = 1,
  displayworldpvpobjectives = 1,
  donotflashlowhealthwarning = 1,
  dontshowequipmentsetsonitems = 0,
  emphasizemyspelleffects = 0,
  enablefloatingcombattext = 1,
  enablemovepad = 0,
  enablepetbattlefloatingcombattext = 1,
  enabletwitter = 0,
  enablewowmouse = 0,
  farclip = 200,
  ffxdeath = 0,
  ffxglow = 0,
  ffxnether = 0,
  footstepsounds = 1,
  fullsizefocusframe = 1,
  groundeffectdensity = 16,
  groundeffectdist = 32,
  interactonleftclick = 0,
  lootundermouse = 0,
  mapfade = 0,
  maxfps = 20,
  maxfpsbk = 8,
  maxfpsloading = 8,
  mouseinvertpitch = 0,
  mouseuselazyrepositioning = 1,
  moviesubtitle = 1,
  multibarrightverticallayout = 0,
  objectselectioncircle = 1,
  profanityfilter = 0,
  raidframesdisplayaggrohighlight = 1,
  raidframesdisplayclasscolor = 1,
  raidframesdisplayonlydispellabledebuffs = 0,
  raidframesdisplaypowerbars = 1,
  raidframeshealthtext = "health",
  raidframesheight = 36,
  raidframeswidth = 72,
  raidoptiondisplaymaintankandassist = 1,
  raidoptiondisplaypets = 1,
  raidoptionisshown = 1,
  raidoptionlocked = "lock",
  raidoptionshowborders = 0,
  raidoptionsortmode = "group",
  rawmouseenable = 1,
  rippledetail = 0,
  rotateminimap = 0,
  screenedgeflash = 0,
  scripterrors = 1,
  scriptprofile = 0,
  scriptwarnings = 1,
  shadowmode = 0,
  showarenaenemyframes = 1,
  showarenaenemypets = 1,
  showdungeonentrancesonmap = 1,
  showfootprintparticles = 0,
  showhonorasexperience = 1,
  showpartypets = 1,
  showquestunitcircles = 1,
  showtargetcastbar = 1,
  showtargetoftarget = 1,
  showtutorials = 1,
  skycloudlod = 0,
  sound_enableemotesounds = 1,
  sound_enablemusic = 0,
  sound_listeneratcharacter = 1,
  spamfilter = 0,
  sunshafts = 0,
  synchronizebindings = 1,
  synchronizechatframes = 1,
  synchronizeconfig = 1,
  synchronizemacros = 1,
  synchronizesettings = 1,
  taintlog = 0,
  terrainmiplevel = 1,
  threatplaysounds = 1,
  threatshownumeric = 1,
  threatwarning = 3,
  threatworldtext = 1,
  timemgralarmenabled = 0,
  timemgruselocaltime = 0,
  timemgrusemilitarytime = 1,
  transmogcurrentspeconly = 0,
  unitnameenemyguardianname = 1,
  unitnameenemyminionname = 1,
  unitnameenemypetname = 1,
  unitnameenemyplayername = 1,
  unitnameenemytotemname = 1,
  unitnamefriendlyguardianname = 1,
  unitnamefriendlyminionname = 1,
  unitnamefriendlypetname = 1,
  unitnamefriendlyplayername = 1,
  unitnamefriendlytotemname = 1,
  unitnamenoncombatcreaturename = 1,
  unitnamenpc = 1,
  unitnameown = 0,
  unitnameplayerguild = 1,
  unitnameplayerpvptitle = 1,
  usecompactpartyframes = 1,
  violencelevel = 5,
  waterdetail = 0,
  weatherdensity = 3,
  whispermode = "popout",
  windowresizelock = 0,
  worldbasemip = 2,
};

SLASH_ITERAMI_CONFIG1 = "/iterami_config";
function SlashCmdList.ITERAMI_CONFIG(msg, editbox)
    local keys = {};
    for key in pairs(cvars) do
        table.insert(keys, key);
    end
    table.sort(keys);

    for key,value in ipairs(keys) do
        if tostring(GetCVar(value)) ~= tostring(cvars[value]) then
            print("Setting " .. value .. " to " .. tostring(cvars[value]) .. ": " .. tostring(SetCVar(value, cvars[value])));
        end
    end

    C_VoiceChat.SetMuted(true);
    SetActionBarToggles(1, 1, 1, 0, 0);
end

SLASH_ITERAMI_PRINT1 = "/iterami_print";
function SlashCmdList.ITERAMI_PRINT(msg, editbox)
    local keys = {};
    for key in pairs(cvars) do
        table.insert(keys, key);
    end
    table.sort(keys);

    for key,value in ipairs(keys) do
        if tostring(GetCVar(value)) ~= tostring(cvars[value]) then
            print(value .. "=" .. GetCVar(value) .. ", iterami=" .. cvars[value] .. ", default=" .. GetCVarDefault(value));
        end
    end
end
