local addonName, addonTable = ...

local cvars = {
  alwayscompareitems = 1,
  autoclearafk = 1,
  autodismount = 1,
  autodismountflying = 0,
  autointeract = 0,
  autojoinbgvoice = 0,
  autojoinpartyvoice = 0,
  autolootdefault = 1,
  autoquestwatch = 1,
  autoselfcast = 1,
  autostand = 1,
  autounshift = 1,
  blocktrades = 0,
  breakuplargenumbers = 1,
  buffdurations = 1,
  camerabobbing = 0,
  cameradistancemaxzoomfactor = 2.6,
  camerawatercollision = 0,
  chatbubbles = 1,
  chatbubblesparty = 0,
  chatclasscoloroverride = 0,
  chatmousescroll = 1,
  colorchatnamesbyclass = 1,
  componenttexturelevel = 1,
  countdownforcooldowns = 1,
  deselectonclick = 1,
  displayfreebagslots = 0,
  displayworldpvpobjectives = 1,
  donotflashlowhealthwarning = 1,
  emphasizemyspelleffects = 0,
  enablefloatingcombattext = 1,
  enablemovepad = 0,
  enabletwitter = 0,
  farclip = 185,
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
  moviesubtitle = 1,
  profanityfilter = 0,
  raidoptiondisplaypets = 1,
  raidoptionshowborders = 0,
  rawmouseenable = 1,
  rippledetail = 0,
  rotateminimap = 0,
  screenedgeflash = 0,
  scripterrors = 1,
  scriptprofile = 0,
  scriptwarnings = 1,
  showarenaenemyframes = 1,
  showarenaenemypets = 1,
  showhonorasexperience = 1,
  showpartypets = 1,
  showquestunitcircles = 1,
  showtargetcastbar = 1,
  showtargetoftarget = 1,
  showtutorials = 1,
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
  violencelevel = 5,
  waterdetail = 0,
  weatherdensity = 3,
  whispermode = "popout",
  windowresizelock = 0,
  worldbasemip = 2,
};

SLASH_ITERAMI_CONFIG1 = "/iterami_config";
function SlashCmdList.ITERAMI_CONFIG(msg, editbox)
    C_VoiceChat.SetMuted(true);
    SetActionBarToggles(1, 1, 1, 0, 0);

    for key,value in ipairs(cvars) do
        SetCVar(key, value);
    end

    print(time() .. ": iterami config loaded");
end

SLASH_ITERAMI_PRINT1 = "/iterami_print";
function SlashCmdList.ITERAMI_PRINT(msg, editbox)
    local keys = {};
    for key in pairs(cvars) do
        table.insert(keys, key);
    end
    table.sort(keys);

    for key,value in ipairs(keys) do
        print(value .. ": " .. GetCVar(value));
    end
end
