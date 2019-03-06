["PiR_injuriplayer_on", "CHECKBOX", ["STR_Enable_injuries_for_player", "STR_Enable_injuries_for_player_back"], "STR_PIR", true] call cba_settings_fnc_init;
["PiR_civilian_on", "CHECKBOX", ["STR_Turn_on_civilian", "STR_Turn_on_civilian_back"], "STR_PIR", true] call cba_settings_fnc_init;
["PiR_smoke_on", "CHECKBOX", ["STR_Turn_on_smoke", "STR_Turn_on_smoke_back"], "STR_PIR", true] call cba_settings_fnc_init;
["PiR_helmet_on", "CHECKBOX", ["STR_Turn_on_helmet", "STR_Turn_on_helmet_back"], "STR_PIR", true] call cba_settings_fnc_init;
["PiR_weapon_on", "CHECKBOX", ["STR_Turn_on_weapon", "STR_Turn_on_weapon_back"], "STR_PIR", true] call cba_settings_fnc_init;
["PiR_captive_on", "CHECKBOX", ["STR_Turn_on_captive", "STR_Turn_on_captive_back"], "STR_PIR", true] call cba_settings_fnc_init;

["PiR_bloodlosing_on", "SLIDER", ["STR_Turn_on_bloodlosing", "STR_Turn_on_bloodlosing_back"], "STR_PIR",[60, 600, 130, 0], true] call cba_settings_fnc_init;
["PiR_bloodlosingM_on", "SLIDER", ["STR_Turn_on_bloodlosingM", "STR_Turn_on_bloodlosingM_back"], "STR_PIR",[60, 600, 190, 0], true] call cba_settings_fnc_init;
["PiR_bloodhill_on", "SLIDER", ["STR_Turn_on_bloodhill", "STR_Turn_on_bloodhill_back"], "STR_PIR",[10, 120, 20, 0], true] call cba_settings_fnc_init;
["PiR_bloodhillM_on", "SLIDER", ["STR_Turn_on_bloodhillM", "STR_Turn_on_bloodhill_backM"], "STR_PIR",[10, 120, 30, 0], true] call cba_settings_fnc_init;
["PiR_bloodkill_on", "SLIDER", ["STR_Turn_on_bloodkill", "STR_Turn_on_bloodkill_back"], "STR_PIR",[5, 60, 15, 0], true] call cba_settings_fnc_init;
["PiR_bloodkillM_on", "SLIDER", ["STR_Turn_on_bloodkillM", "STR_Turn_on_bloodkill_backM"], "STR_PIR",[5, 60, 20, 0], true] call cba_settings_fnc_init;

EyeEffect0 = compile preprocessfilelinenumbers "\PiR\Functions\EyeEffect0.sqf";
PiRredirect = compile preprocessfilelinenumbers "\PiR\Functions\PiRredirect.sqf";
PiRredirect0 = compile preprocessfilelinenumbers "\PiR\Functions\PiRredirect0.sqf";



if (isServer) then {

Uncondition = compile preprocessfilelinenumbers "\PiR\Functions\Uncondition.sqf";
Crawl = compile preprocessfilelinenumbers "\PiR\Functions\Crawl.sqf";
DropWeapon = compile preprocessfilelinenumbers "\PiR\Functions\DropWeapon.sqf";
Helmet = compile preprocessfilelinenumbers "\PiR\Functions\Helmet.sqf";
BendsDown = compile preprocessfilelinenumbers "\PiR\Functions\BendsDown.sqf";
UnconditionAnim = compile preprocessfilelinenumbers "\PiR\Functions\UnconditionAnim.sqf";
EyeEffect = compile preprocessfilelinenumbers "\PiR\Functions\EyeEffect.sqf";
PiR = compile preprocessfilelinenumbers "\PiR\Functions\PiR.sqf";


Uncondition0 = compile preprocessfilelinenumbers "\PiR\Functions\Uncondition0.sqf";
Crawl0 = compile preprocessfilelinenumbers "\PiR\Functions\Crawl0.sqf";
DropWeapon0 = compile preprocessfilelinenumbers "\PiR\Functions\DropWeapon0.sqf";
Helmet0 = compile preprocessfilelinenumbers "\PiR\Functions\Helmet0.sqf";
BendsDown0 = compile preprocessfilelinenumbers "\PiR\Functions\BendsDown0.sqf";
UnconditionAnim0 = compile preprocessfilelinenumbers "\PiR\Functions\UnconditionAnim0.sqf";
UnconditionDrag0 = compile preprocessfilelinenumbers "\PiR\Functions\UnconditionDrag0.sqf";
PiR0 = compile preprocessfilelinenumbers "\PiR\Functions\PiR0.sqf";


_null = [] execvm "\PiR\Functions\PiRstart.sqf";

};