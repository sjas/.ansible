//https://ffprofile.com/
//https://github.com/juju4/ansible-firefox-config/blob/master/templates/firefox-mozilla.cfg.j2

// no defaultbrowser check
user_pref("browser.shell.checkDefaultBrowser", false);
// start with previous tabs
user_pref("browser.startup.page", 3);
// proper scrollspeed
user_pref("mousewheel.default.delta_multiplier_y", 225);
// disable disk caching
//user_pref("browser.cache.disk.parent_directory", '/dev/null');
//user_pref("browser.cache.disk.enable", 'false');
//user_pref("browser.cache.disk.parent_directory", '1048576');  //in KB
//user_pref("browser.cache.disk.parent_directory", '10485760');  //in KB
//user_pref("browser.cache.disk.smart_size.enabled", 'false');
// scroll tabs by mousewheel - not
user_pref("toolkit.tabbox.switchByScrolling", 'false');
// no titlebar
user_pref("browser.tabs.inTitlebar", '1');
user_pref("browser.ctrlTab.recentlyUsedOrder", false);
// scrollbar
user_pref("widget.gtk.overlay-scrollbars.enabled", false);  //always show scrollbars
user_pref("widget.non-native-theme.win.scrollbar.use-system-size", false);
user_pref("widget.non-native-theme.scrollbar.size.override",  '25');

user_pref("browser.aboutConfig.showWarning", false);
//user_pref("browser.messaging-system.whatsNewPanel.enabled", false);
//user_pref("browser.laterrun.enabled", false);
//user_pref("browser.library.activity-stream.enabled", false);
//user_pref("browser.discovery.enabled", false);
//user_pref("toolkit.telemetry.eventping.minimumFrequency", 6000);
//user_pref("toolkit.telemetry.eventping.maximumFrequency", 6001);
user_pref("xpinstall.signatures.required", false);

// fuck pocket
user_pref("extensions.pocket.enabled", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);

// main window
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

// blank tabs
user_pref("browser.newtabpage.enabled", false;)
user_pref("browser.newtab.preload", false);
user_pref("browser.newtabpage.enhanced", false);
user_pref("browser.newtabpage.introShown", true);

// do not track
user_pref("privacy.donottrackheader.enabled", true);

// devtools
user_pref("devtools.everOpened", true);
user_pref("devtools.toolbox.splitconsoleEnabled", true);
user_pref("devtools.toolsidebar-height.inspector", 350);
user_pref("devtools.toolsidebar-width.inspector", 700);
user_pref("devtools.toolsidebar-width.inspector.splitsidebar", 350);

// spellcheck
user_pref("layout.spellcheckDefault", 0);

// searchbar
user_pref("browser.urlbar.tipShownCount.searchTip_persist", 1);


// tron theme
//user_pref("lightweightThemes.persisted.headerURL", true);
//user_pref("lightweightThemes.persisted.footerURL", true);
//user_pref("lightweightThemes.selectedThemeID", "265427");
//user_pref("lightweightThemes.usedThemes", "[{\"id\":\"265427\",\"name\":\"Tron Legacy Beau Garrett\",\"headerURL\":\"https://addons.cdn.mozilla.net/user-media/addons/265427/h_tron1.jpg?modified=060a68f9\",\"footerURL\":\"https://addons.cdn.mozilla.net/user-media/addons/265427/f_tron1.jpg?modified=060a68f9\",\"textcolor\":\"#bdebfc\",\"accentcolor\":\"#0c1c2b\",\"iconURL\":\"https://addons.cdn.mozilla.net/user-media/addons/265427/preview_small.jpg?modified=060a68f9\",\"previewURL\":\"https://addons.cdn.mozilla.net/user-media/addons/265427/preview_large.jpg?modified=060a68f9\",\"author\":\"EatingStick\",\"description\":\"Beau Garrett in TRON Legacy. Movie, Disney, blue, black, pretty, sexy\",\"updateURL\":\"https://versioncheck.addons.mozilla.org/en-US/themes/update-check/265427\",\"version\":\"1.0\",\"updateDate\":1538861699460,\"installDate\":1538861699460}]");


// RIP Chromium Wheel Smooth Scroller, but this is pretty awesome, too

// https://www.reddit.com/r/firefox/comments/lev5wy/natural_smooth_scrolling/
// https://github.com/AveYo/fox/blob/main/Natural%20Smooth%20Scrolling%20for%20user.js
///  NATURAL SMOOTH SCROLLING V4 "SHARP" - AveYo, 2020-2022             preset     [default]
///  copy into firefox/librewolf profile as user.js, add to existing, or set in about:config
user_pref("general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS",   12);//NSS    [120]
user_pref("general.smoothScroll.msdPhysics.enabled",                    true);//NSS  [false]
user_pref("general.smoothScroll.msdPhysics.motionBeginSpringConstant",   200);//NSS   [1250]
user_pref("general.smoothScroll.msdPhysics.regularSpringConstant",       250);//NSS   [1000]
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaMS",           25);//NSS     [12]
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaRatio",     "2.0");//NSS    [1.3]
user_pref("general.smoothScroll.msdPhysics.slowdownSpringConstant",      250);//NSS   [2000]
user_pref("general.smoothScroll.currentVelocityWeighting",             "1.0");//NSS ["0.25"]
user_pref("general.smoothScroll.stopDecelerationWeighting",            "1.0");//NSS  ["0.4"]

/// adjust multiply factor for mousewheel - or set to false if scrolling is way too fast  
user_pref("mousewheel.system_scroll_override.horizontal.factor",         200);//NSS    [200]
user_pref("mousewheel.system_scroll_override.vertical.factor",           200);//NSS    [200]
user_pref("mousewheel.system_scroll_override_on_root_content.enabled",  true);//NSS   [true]
user_pref("mousewheel.system_scroll_override.enabled",                  true);//NSS   [true]

/// adjust pixels at a time count for mousewheel - cant do more than a page at once if <100
user_pref("mousewheel.default.delta_multiplier_x",                       100);//NSS    [100]
//user_pref("mousewheel.default.delta_multiplier_y",                       100);//NSS    [100] // set on top of file
user_pref("mousewheel.default.delta_multiplier_z",                       100);//NSS    [100]

///  this preset will reset couple extra variables for consistency
user_pref("apz.allow_zooming",                                          true);//NSS   [true]
user_pref("apz.force_disable_desktop_zooming_scrollbars",              false);//NSS  [false]
user_pref("apz.paint_skipping.enabled",                                 true);//NSS   [true]
user_pref("apz.windows.use_direct_manipulation",                        true);//NSS   [true]
user_pref("dom.event.wheel-deltaMode-lines.always-disabled",           false);//NSS  [false]
user_pref("general.smoothScroll.durationToIntervalRatio",                200);//NSS    [200]
user_pref("general.smoothScroll.lines.durationMaxMS",                    150);//NSS    [150]
user_pref("general.smoothScroll.lines.durationMinMS",                    150);//NSS    [150]
user_pref("general.smoothScroll.other.durationMaxMS",                    150);//NSS    [150]
user_pref("general.smoothScroll.other.durationMinMS",                    150);//NSS    [150]
user_pref("general.smoothScroll.pages.durationMaxMS",                    150);//NSS    [150]
user_pref("general.smoothScroll.pages.durationMinMS",                    150);//NSS    [150]
user_pref("general.smoothScroll.pixels.durationMaxMS",                   150);//NSS    [150]
user_pref("general.smoothScroll.pixels.durationMinMS",                   150);//NSS    [150]
user_pref("general.smoothScroll.scrollbars.durationMaxMS",               150);//NSS    [150]
user_pref("general.smoothScroll.scrollbars.durationMinMS",               150);//NSS    [150]
user_pref("general.smoothScroll.mouseWheel.durationMaxMS",               200);//NSS    [200]
user_pref("general.smoothScroll.mouseWheel.durationMinMS",                50);//NSS     [50]
user_pref("layers.async-pan-zoom.enabled",                              true);//NSS   [true]
user_pref("layout.css.scroll-behavior.spring-constant",                "250");//NSS    [250]
user_pref("mousewheel.transaction.timeout",                             1500);//NSS   [1500]
user_pref("mousewheel.acceleration.factor",                               10);//NSS     [10]
user_pref("mousewheel.acceleration.start",                                -1);//NSS     [-1]
user_pref("mousewheel.min_line_scroll_amount",                             5);//NSS      [5]
user_pref("toolkit.scrollbox.horizontalScrollDistance",                    5);//NSS      [5]
user_pref("toolkit.scrollbox.verticalScrollDistance",                      3);//NSS      [3]




//// eventual extensions stuff like disable first run page
////  https://issues.adblockplus.org/ticket/206
//
//// https://wiki.mozilla.org/Privacy/Privacy_Task_Force/firefox_about_config_privacy_tweeks
//user_pref("privacy.sanitize.sanitizeOnShutdown", true);
//user_pref("privacy.sanitize.promptOnSanitize", false);
//
//user_pref("geo.enabled", false);
//user_pref("network.cookie.lifetimePolicy", 2);
//user_pref("network.http.referer.trimmingPolicy", 2);
//user_pref("network.http.referer.XOriginPolicy", 2);
//user_pref("network.http.referer.XOriginTrimmingPolicy", 2);
//
//// https://www.ghacks.net/2018/01/07/firefox-59-ui-options-to-block-notifications-microphone-camera-and-location/
//// https://support.mozilla.org/en-US/questions/1140700
//// https://support.mozilla.org/en-US/questions/1141800
//user_pref("dom.webnotifications.serviceworker.enabled", false);
//user_pref("dom.webnotifications.enabled", false);
//
//
//// https://github.com/pyllyukko/user.js
//// PREF: Disable Service Workers
//// https://developer.mozilla.org/en-US/docs/Web/API/Worker
//// https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorker_API
//// https://wiki.mozilla.org/Firefox/Push_Notifications#Service_Workers
//// NOTICE: Disabling ServiceWorkers breaks functionality on some sites (Google Street View...)
//// Unknown security implications
//// CVE-2016-5259, CVE-2016-2812, CVE-2016-1949, CVE-2016-5287 (fixed)
//user_pref("dom.serviceWorkers.enabled", false);
//
//// PREF: Disable Web Workers
//// https://developer.mozilla.org/en-US/docs/Web/API/Web_Workers_API/Using_web_workers
//// https://www.w3schools.com/html/html5_webworkers.asp
//user_pref("dom.workers.enabled", false);
//
//// PREF: Disable DOM timing API
//// https://wiki.mozilla.org/Security/Reviews/Firefox/NavigationTimingAPI
//// https://www.w3.org/TR/navigation-timing/#privacy
//user_pref("dom.enable_performance", false);
//
//// PREF: Make sure the User Timing API does not provide a new high resolution timestamp
//// https://trac.torproject.org/projects/tor/ticket/16336
//// https://www.w3.org/TR/2013/REC-user-timing-20131212/#privacy-security
//user_pref("dom.enable_user_timing", false);
//
//// PREF: Disable raw TCP socket support (mozTCPSocket)
//// https://trac.torproject.org/projects/tor/ticket/18863
//// https://www.mozilla.org/en-US/security/advisories/mfsa2015-97/
//// https://developer.mozilla.org/docs/Mozilla/B2G_OS/API/TCPSocket
//user_pref("dom.mozTCPSocket.enabled", false);
//
//// PREF: Disable leaking network/browser connection information via Javascript
//// Network Information API provides general information about the system's connection type (WiFi, cellular, etc.)
//// https://developer.mozilla.org/en-US/docs/Web/API/Network_Information_API
//// https://wicg.github.io/netinfo/#privacy-considerations
//// https://bugzilla.mozilla.org/show_bug.cgi?id=960426
//user_pref("dom.netinfo.enabled", false);
//
//// PREF: Disable telephony API
//// https://wiki.mozilla.org/WebAPI/Security/WebTelephony
//user_pref("dom.telephony.enabled", false);
//
//// PREF: Disable speech recognition
//// https://dvcs.w3.org/hg/speech-api/raw-file/tip/speechapi.html
//// https://developer.mozilla.org/en-US/docs/Web/API/SpeechRecognition
//// https://wiki.mozilla.org/HTML5_Speech_API
//user_pref("media.webspeech.recognition.enable", false);
//
//// PREF: Disable speech synthesis
//// https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis
//user_pref("media.webspeech.synth.enabled", false);
//
//// PREF: Disable sensor API
//// https://wiki.mozilla.org/Sensor_API
//user_pref("device.sensors.enabled", false);
//
//// PREF: Disable WebIDE
//// https://trac.torproject.org/projects/tor/ticket/16222
//// https://developer.mozilla.org/docs/Tools/WebIDE
//user_pref("devtools.webide.enabled", false);
//user_pref("devtools.webide.autoinstallADBHelper", false);
//user_pref("devtools.webide.autoinstallFxdtAdapters", false);
//
//// PREF: Disable remote debugging
//// https://developer.mozilla.org/en-US/docs/Tools/Remote_Debugging/Debugging_Firefox_Desktop
//// https://developer.mozilla.org/en-US/docs/Tools/Tools_Toolbox#Advanced_settings
//user_pref("devtools.debugger.remote-enabled", false);
//user_pref("devtools.chrome.enabled", false);
//user_pref("devtools.debugger.force-local", true);
//
//// https://ffprofile.com
//user_pref("app.normandy.api_url", "");
//user_pref("app.normandy.enabled", false);
//user_pref("app.shield.optoutstudies.enabled", false);
//user_pref("app.update.auto", false);
//user_pref("beacon.enabled", false);
//user_pref("breakpad.reportURL", "");
//user_pref("browser.crashReports.unsubmittedCheck.autoSubmit", false);
//user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
//user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
//user_pref("browser.disableResetPrompt", true);
//user_pref("browser.fixup.alternate.enabled", false);
//user_pref("browser.safebrowsing.appRepURL", "");
//user_pref("browser.safebrowsing.blockedURIs.enabled", false);
//user_pref("browser.safebrowsing.downloads.enabled", false);
//user_pref("browser.safebrowsing.downloads.remote.enabled", false);
//user_pref("browser.safebrowsing.downloads.remote.url", "");
//user_pref("browser.safebrowsing.enabled", false);
//user_pref("browser.safebrowsing.malware.enabled", false);
//user_pref("browser.safebrowsing.phishing.enabled", false);
//user_pref("browser.search.suggest.enabled", false);
//user_pref("browser.selfsupport.url", "");
//user_pref("browser.send_pings", false);
//user_pref("browser.startup.homepage_override.mstone", "ignore");
//user_pref("browser.tabs.crashReporting.sendReport", false);
//user_pref("browser.urlbar.speculativeConnect.enabled", false);
//user_pref("browser.urlbar.trimURLs", false);
//user_pref("datareporting.healthreport.service.enabled", false);
//user_pref("datareporting.healthreport.uploadEnabled", false);
//user_pref("datareporting.policy.dataSubmissionEnabled", false);
//user_pref("dom.battery.enabled", false);
//user_pref("dom.event.clipboardevents.enabled", false);
//user_pref("dom.indexedDB.enabled", false);
//user_pref("dom.webaudio.enabled", false);
//user_pref("experiments.activeExperiment", false);
//user_pref("experiments.enabled", false);
//user_pref("experiments.manifest.uri", "");
//user_pref("experiments.supported", false);
//user_pref("extensions.CanvasBlocker@kkapsner.de.whiteList", "");
//user_pref("extensions.autoDisableScopes", 0);
//user_pref("extensions.enabledScopes", 15);
//user_pref("extensions.getAddons.cache.enabled", false);
//user_pref("extensions.getAddons.showPane", false);
//user_pref("extensions.greasemonkey.stats.optedin", false);
//user_pref("extensions.greasemonkey.stats.url", "");
//user_pref("extensions.shield-recipe-client.api_url", "");
//user_pref("extensions.shield-recipe-client.enabled", false);
//user_pref("extensions.webservice.discoverURL", "");
//user_pref("keyword.enabled", true);
//user_pref("media.autoplay.default", 1);
//user_pref("media.autoplay.enabled", false);
//user_pref("media.navigator.enabled", false);
//user_pref("media.peerconnection.enabled", false);
//user_pref("media.video_stats.enabled", false);
//user_pref("network.allow-experiments", false);
//user_pref("network.captive-portal-service.enabled", false);
//user_pref("network.cookie.cookieBehavior", 1);
//user_pref("network.dns.disablePrefetch", true);
//user_pref("network.http.referer.XOriginPolicy", 1);
//user_pref("network.http.speculative-parallel-limit", "0");
//user_pref("network.prefetch-next", false);
//user_pref("network.trr.mode", 5);
//user_pref("privacy.donottrackheader.enabled", true);
//user_pref("privacy.donottrackheader.value", 1);
//user_pref("privacy.firstparty.isolate", true);
//user_pref("privacy.resistFingerprinting", true);
//user_pref("privacy.trackingprotection.enabled", true);
//user_pref("privacy.trackingprotection.pbmode.enabled", true);
//user_pref("privacy.usercontext.about_newtab_segregation.enabled", true);
//user_pref("security.ssl.disable_session_identifiers", true);
//user_pref("signon.autofillForms", false);
//user_pref("toolkit.telemetry.archive.enabled", false);
//user_pref("toolkit.telemetry.bhrPing.enabled", false);
//user_pref("toolkit.telemetry.cachedClientID", "");
//user_pref("toolkit.telemetry.enabled", false);
//user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
//user_pref("toolkit.telemetry.hybridContent.enabled", false);
//user_pref("toolkit.telemetry.newProfilePing.enabled", false);
//user_pref("toolkit.telemetry.prompted", 2);
//user_pref("toolkit.telemetry.rejected", true);
//user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
//user_pref("toolkit.telemetry.server", "");
//user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
//user_pref("toolkit.telemetry.unified", false);
//user_pref("toolkit.telemetry.unifiedIsOptIn", false);
//user_pref("toolkit.telemetry.updatePing.enabled", false);
//user_pref("webgl.disabled", true);
