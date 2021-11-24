local addonName, addonTable = ...;

-- iterami CVar values.
addonTable.cvars = {
  actionbuttonusekeydown = 1,
  addfriendinfoshown = 1,
  advancedcombatlogging = 0,
  advancedwatchframe = 1,
  alwayscompareitems = 1,
  alwaysshowactionbars = 0,
  animframeskiplod = 1,
  assistattack = 1,
  autoacceptquickjoinrequests = 0,
  autoclearafk = 1,
  autocompleteusecontext = 1,
  autocompletewheneditingfromcenter = 1,
  autodismount = 1,
  autodismountflying = 0,
  autointeract = 0,
  autojoinbgvoice = 0,
  autojoinpartyvoice = 0,
  autolootdefault = 1,
  autolootrate = 100,
  autopushspelltoactionbar = 0,
  autoquestprogress = 1,
  autoquestwatch = 1,
  autoselfcast = 1,
  autostand = 1,
  autounshift = 1,
  blockchannelinvites = 0,
  blocktrades = 0,
  breakuplargenumbers = 1,
  bspcache = 1,
  buffdurations = 1,
  calendarshowbattlegrounds = 1,
  calendarshowdarkmoon = 1,
  calendarshowholidays = 1,
  calendarshowlockouts = 1,
  calendarshowweeklyholidays = 1,
  camerabobbing = 0,
  cameradistancemaxzoomfactor = 2.6,
  camerafollowonstick = 0,
  camerapivot = 0,
  camerasmoothstyle = 0,
  cameraterraintilt = 0,
  camerawatercollision = 0,
  chatbubbles = 1,
  chatbubblesparty = 1,
  chatclasscoloroverride = 0,
  chatmousescroll = 1,
  checkaddonversion = 1,
  clipcursor = 0,
  colorblindmode = 0,
  colorchatnamesbyclass = 1,
  combatlogretentiontime = 120,
  combopointlocation = 2,
  communitiesshowoffline = 1,
  componenttexturelevel = 1,
  countdownforcooldowns = 1,
  cursorsizepreferred = -1,
  deselectonclick = 1,
  disableaelooting = 0,
  disableautorealmselect = 0,
  displayfreebagslots = 1,
  displayspellactivationoverlays = 1,
  displayworldpvpobjectives = 1,
  donotflashlowhealthwarning = 1,
  dontshowequipmentsetsonitems = 0,
  dynamiclod = 1,
  emphasizemyspelleffects = 0,
  enableblinkapplicationicon = 0,
  enablefloatingcombattext = 1,
  enablemovepad = 0,
  enablepetbattlefloatingcombattext = 1,
  enablepvpnotifyafk = 1,
  enabletwitter = 0,
  enablewowmouse = 0,
  farclip = 1500,
  ffxdeath = 0,
  ffxglow = 0,
  ffxnether = 0,
  findYourselfAnywhere = 0,
  findYourselfAnywhereOnlyInCombat = 0,
  findYourselfInBG = 0,
  findYourselfInBGOnlyInCombat = 0,
  findYourselfInRaid = 0,
  findYourselfInRaidOnlyInCombat = 0,
  floatingcombattextallspellmechanics = 1,
  floatingcombattextauras = 1,
  floatingcombattextcombatdamage = 1,
  floatingcombattextcombatdamageallautos = 1,
  floatingcombattextcombathealing = 1,
  floatingcombattextcombathealingabsorbself = 1,
  floatingcombattextcombathealingabsorbtarget = 1,
  floatingcombattextcombatlogperiodicspells = 1,
  floatingcombattextcombatstate = 1,
  floatingcombattextcombopoints = 1,
  floatingcombattextdamagereduction = 1,
  floatingcombattextdodgeparrymiss = 1,
  floatingcombattextenergygains = 1,
  floatingcombattextfriendlyhealers = 1,
  floatingcombattexthonorgains = 1,
  floatingcombattextlowmanahealth = 1,
  floatingcombattextperiodicenergygains = 1,
  floatingcombattextpetmeleedamage = 1,
  floatingcombattextpetspelldamage = 1,
  floatingcombattextreactives = 1,
  floatingcombattextrepchanges = 1,
  floatingcombattextspellmechanics = 1,
  floatingcombattextspellmechanicsother = 1,
  footstepsounds = 1,
  forceresolutiondefaulttomaxsize = 0,
  friendsviewbuttons = 0,
  fulldump = 0,
  fullsizefocusframe = 1,
  gamepadenable = 0,
  graphicsdeptheffects = 1,
  graphicsenvironmentdetail = 1,
  graphicsgroundclutter = 1,
  graphicsliquiddetail = 1,
  graphicsoutlinemode = 1,
  graphicsparticledensity = 3,
  graphicsprojectedtextures = 2,
  graphicsquality = 1,
  graphicsshadowquality = 1,
  graphicsspelldensity = 6,
  graphicsssao = 1,
  graphicstextureresolution = 1,
  graphicsviewdistance = 1,
  groundeffectdensity = 16,
  groundeffectdist = 40,
  gxaftermathenabled = 0,
  gxmaximize = 0,
  interactonleftclick = 0,
  lootundermouse = 0,
  mapfade = 0,
  maxfps = 20,
  maxfpsbk = 5,
  maxfpsloading = 10,
  minimapinsidezoom = 0,
  minimapshowarchblobs = 1,
  minimapshowquestblobs = 1,
  minimapzoom = 0,
  miniworldmap = 1,
  missingtransmogsourceinitemtooltips = 1,
  mouseinvertpitch = 0,
  mouseuselazyrepositioning = 1,
  moviesubtitle = 1,
  multibarrightverticallayout = 0,
  nobuffdebufffilterontarget = 1,
  objectselectioncircle = 1,
  particledensity = 10,
  particlemtdensity = 10,
  particulatesenabled = 1,
  physicslevel = 0,
  predictedhealth = 1,
  preventosidlesleep = 0,
  profanityfilter = 0,
  projectedtextures = 1,
  pushtotalksound = 1,
  questlogopen = 1,
  questpoi = 1,
  questtextcontrast = 1,
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
  raidsettingsenabled = 0,
  rawmouseenable = 1,
  refraction = 0,
  remotetexttospeech = 1,
  remotetexttospeechvoice = 1,
  rippledetail = 0,
  rotateminimap = 0,
  screenedgeflash = 0,
  scripterrors = 1,
  scriptprofile = 0,
  scriptwarnings = 1,
  secondaryprofessionsfilter = 1,
  secureabilitytoggle = 1,
  shadowmode = 0,
  shadowrt = 0,
  showarenaenemycastbar = 1,
  showarenaenemyframes = 1,
  showarenaenemypets = 1,
  showbattlefieldminimap = 0,
  showbuilderfeedback = 1,
  showcastablebuffs = 0,
  showclasscolorinfriendlynameplate = 1,
  showclasscolorinnameplate = 1,
  showdispeldebuffs = 0,
  showdungeonentrancesonmap = 1,
  showerrors = 1,
  showfootprintparticles = 0,
  showhonorasexperience = 1,
  showingamenavigation = 1,
  showloadingscreentips = 1,
  shownameplateloseaggroflash = 1,
  showoutfitdetails = 1,
  shownpetutorials = 0,
  showpartypets = 1,
  showquestobjectivesonmap = 1,
  showquestunitcircles = 1,
  showspectatorteamcircles = 1,
  showspenderfeedback = 1,
  showtamers = 1,
  showtargetcastbar = 1,
  showtargetoftarget = 1,
  showtimestamps = "%H:%M:%S ",
  showtutorials = 1,
  skycloudlod = 0,
  sound_ambiencevolume = 0.6,
  sound_dialogvolume = 1.0,
  sound_enableambience = 1,
  sound_enabledialog = 1,
  sound_enableemotesounds = 1,
  sound_enableerrorspeech = 0,
  sound_enablemusic = 0,
  sound_enablepetsounds = 1,
  sound_enablepositionallowpassfilter = 0,
  sound_enablereverb = 0,
  sound_enablesoundwhengameisinbg = 1,
  sound_listeneratcharacter = 1,
  sound_mastervolume = 1.0,
  sound_musicvolume = 0.4,
  sound_sfxvolume = 1.0,
  specular = 0,
  speechtotext = 0,
  spellclutter = 0,
  ssao = 0,
  statustext = 1,
  statustextdisplay = "NUMERIC",
  stopautoattackontargetchange = 0,
  sunshafts = 0,
  synchronizebindings = 1,
  synchronizechatframes = 1,
  synchronizeconfig = 1,
  synchronizemacros = 1,
  synchronizesettings = 1,
  taintlog = 0,
  targetfps = 0,
  targetnearestusenew = 0,
  targetprioritycombatlock = 0,
  targetprioritypvp = 2,
  terrainmiplevel = 1,
  texttospeech = 0,
  texturefilteringmode = 0,
  threatplaysounds = 1,
  threatshownumeric = 1,
  threatwarning = 3,
  threatworldtext = 1,
  timemgralarmenabled = 0,
  timemgruselocaltime = 0,
  timemgrusemilitarytime = 1,
  trackquestsorting = "top",
  transmogcurrentspeconly = 0,
  transmogrifyshowcollected = 1,
  transmogrifyshowuncollected = 0,
  ttsusecharactersettings = 0,
  turnspeed = 360,
  ubertooltips = 1,
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
  unitslookatplayers = 1,
  usecompactpartyframes = 1,
  usehighresolutionuitextures = 0,
  violencelevel = 5,
  voiceenablewhengameisinbg = 0,
  voiceselfmuted = 1,
  volumefoglevel = 0,
  wardrobeshowcollected = 1,
  wardrobeshowuncollected = 0,
  waterdetail = 0,
  weatherdensity = 3,
  whispermode = "popout",
  wholechatwindowclickable = 1,
  windowresizelock = 0,
  worldbasemip = 2,
  worldquestfilteranima = 1,
  worldquestfilterartifactpower = 1,
  worldquestfilterequipment = 1,
  worldquestfiltergold = 1,
  worldquestfilterprofessionmaterials = 1,
  worldquestfilterreputation = 1,
  worldquestfilterresources = 1,
  xpbartext = 1,
};
