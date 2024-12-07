{
  pkgs,
	lib,
	config,
  ...
}:

let
  cfg = config.firefox;
in
{
  options.firefox.enable = lib.mkEnableOption "Enable firefox";

	config = lib.mkIf cfg.enable {
		programs.firefox = {
			enable = true;
			profiles.default = {
				id = 0;
				isDefault = true;

				extensions = with pkgs.nur.repos.rycee.firefox-addons; [
					ublock-origin
					sponsorblock
					return-youtube-dislikes
					darkreader
					bitwarden
				];

				settings = {
					"extensions.autoDisableScopes" = 0;
					"extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
					"extensions.pocket.enabled" = false;

					"datareporting.healthreport.uploadEnabled" = false;

					"dom.security.https_only_mode" = true;

					"browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["sponsorblocker_ajay_app-browser-action","ublock0_raymondhill_net-browser-action","addon_darkreader_org-browser-action","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","urlbar-container","downloads-button","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button"],"vertical-tabs":[],"PersonalToolbar":["personal-bookmarks"]},"seen":["save-to-pocket-button","addon_darkreader_org-browser-action","sponsorblocker_ajay_app-browser-action","ublock0_raymondhill_net-browser-action","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","developer-button"],"dirtyAreaCache":["unified-extensions-area","nav-bar","vertical-tabs","PersonalToolbar","toolbar-menubar","TabsToolbar"],"currentVersion":20,"newElementCount":8}'';

					"browser.uidensity" = 1;

					"browser.search.suggest.enabled" = false;

					"browser.urlbar.suggest.addons" = false;
					"browser.urlbar.suggest.bookmark" = false;
					"browser.urlbar.suggest.calculator" = true;
					"browser.urlbar.suggest.engines" = false;
					"browser.urlbar.suggest.fakespot" = false;
					"browser.urlbar.suggest.history" = false;
					"browser.urlbar.suggest.mdn" = false;
					"browser.urlbar.suggest.openpage" = false;
					"browser.urlbar.suggest.pocket" = false;
					"browser.urlbar.suggest.recentsearches" = false;
					"browser.urlbar.suggest.remotetab" = false;
					"browser.urlbar.suggest.searches" = false;
					"browser.urlbar.suggest.topsites" = false;
					"browser.urlbar.suggest.trending" = false;
					"browser.urlbar.suggest.weather" = false;
					"browser.urlbar.suggest.yelp" = false;

					"browser.startup.page" = 1; # not a clue what this does but it removes the start page from the history
					"browser.startup.homepage" = "about:blank"; # new tabs in general need an extension

					"browser.vpn_promo.enabled" = false;
					#"browser.tabs.closeWindowWithLastTab" = false;

					"identity.fxaccounts.enabled" = false;

					"identity.fxaccounts.toolbar.enabled" = false;
					"identity.fxaccounts.toolbar.pxiToolbarEnabled.monitorEnabled" = false;
					"identity.fxaccounts.toolbar.pxiToolbarEnabled.relayEnabled" = false;
					"identity.fxaccounts.toolbar.pxiToolbarEnabled.vpnEnabled" = false;
				};
			};
		};
	};
}
