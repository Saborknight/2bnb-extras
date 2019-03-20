if (!isServer) exitWith {}; 

_unit = (_this select 0);
_anim = (_this select 1);
_shans = (_this select 2);
_shooter = (_this select 3);

private ["_unit", "_anim", "_shans", "_unitGrp", "_unitGrpPR", "_pWeapon", "_sWeapon", "_hWeapon", "_magsremove", "_unitStance", "_dis", "_Pos", "_timer","_numberOfKits", "_pWItems", "_sWItems", "_hWItems", "_pmag", "_smag", "_hmag", "_binocs", "_udalenie", "_shooter","_unitLdr"];    

_unitGrp = group _unit;
_unitLdr = leader _unit;
_unitGrpPR = str side group _unit;
_unitStance = stance _unit;
_udalenie = 0;
IF !(PiR_captive_on) then {
_unit setcaptive true;
};

	IF  (alive _unit) then {
	 
     [ _unit, true ] remoteExec [ "setUnconscious", _unit ];
	 [_unit] joinSilent grpNull;
 
	 _pWeapon = primaryWeapon _unit;
	 _sWeapon = secondaryWeapon _unit;
	 _hWeapon = handgunWeapon _unit;	
	 _pWItems = primaryWeaponItems _unit;
	 _sWItems = secondaryWeaponItems _unit;				
	 _hWItems = handgunItems _unit;				
				
	 _pmag	= primaryWeaponMagazine _unit;
	 _smag	= secondaryWeaponMagazine _unit;
	 _hmag	= handgunMagazine _unit;				
				
	 _binocs = binocular _unit;

	 waitUntil { sleep 0.1; ((AnimationState _unit == "UnconsciousReviveDefault") or (!alive _unit)) };

		If (alive _unit) then {
		 _udalenie = 1;

		 [_unit, (primaryWeapon _unit)] remoteExec ["removeWeapon", 0];
		 [_unit, (secondaryWeapon _unit)] remoteExec ["removeWeapon", 0];		 
		 [_unit, (handgunWeapon _unit)] remoteExec ["removeWeapon", 0];		 
		 [_unit, (binocular _unit)] remoteExec ["removeWeapon", 0];
		 
 		 _magsremove = magazines _unit;
		 {_unit removeMagazineGlobal _x} forEach magazines _unit;

		 [ _unit, false ] remoteExec [ "setUnconscious", _unit ];
		 [_unit,"UnconsciousOutProne"] remoteExec ["switchMove", 0];

		 sleep 5.033;
			IF (alive _unit) then {

			 [_unit, "ApanPpneMstpSnonWnonDnon"] remoteExec ["switchMove", 0];

			 sleep 2;
			 IF ("CROUCH" ==  _unitStance ) then {
			 [ _unit, "AUTO" ] remoteExec [ "setUnitPos", _unit ];
				};

			 [ _unit, "CARELESS" ] remoteExec [ "setBehaviour", _unit ];

			 _dis = ((PiR_crawl_on) + random ((PiR_crawlM_on max PiR_crawl_on) - (PiR_crawl_on min PiR_crawlM_on)));  
			 _Pos = [_unit, _dis,(((getDir _unit)-25) + (random 50))] call BIS_fnc_relPos;

   
			 _timer = (time +  ((PiR_crawl_on) + (random ((PiR_crawlM_on max PiR_crawl_on) - (PiR_crawl_on min PiR_crawlM_on))) / 2));   
			 [ _unit, _Pos ] remoteExec [ "domove", _unit ];	
			 [ _unit, "FULL" ] remoteExec [ "setSpeedMode", _unit ];
			 
			 sleep 2;
			 			 [ _unit, "DOWN" ] remoteExec [ "setUnitPos", _unit ];

//__________________Добавляем действие на перетаскивание для игрока__________________________________________________	 
	 
	 

	 
[_unit, 
[
    "<img size='3'  image='PiR\Icons\klast_CA.paa'/>", 
    {

		
		_unit = (_this select 0);
		_dragger = (_this select 1);

		IF (alive _unit) then {
			IF ("STAND" == stance _dragger )  then {
			 [_dragger, "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon"] remoteExec ["playMove", 0];
			} ELSE {
				IF ("CROUCH" == stance _dragger ) then {
				 [_dragger, "AinvPknlMstpSrasWrflDnon_Putdown_AmovPknlMstpSrasWrflDnon"] remoteExec ["playMove", 0];
				} ELSE {
					IF ("PRONE" == stance _dragger ) then {
					 [_dragger, "AinvPpneMstpSrasWrflDnon_Putdown_AmovPpneMstpSrasWrflDnon"] remoteExec ["playMove", 0];
					} ELSE {
						IF ("UNDEFINED" == stance _dragger ) then {
						 [_dragger, "AinvPknlMstpSrasWrflDnon_Putdown_AmovPknlMstpSrasWrflDnon"] remoteExec ["playMove", 0];
						};	
					};
				};
			};
		};

	 sleep 1;		
	 _unit setVariable ["dam_player_lecit0",true,true];




	},
    [],
    6, 
    true, 
    true, 
    "",
    "(_this distance _target < 2) && !(_target getVariable ['dam_player_lecit0',false]) && !(_this getVariable ['dam_ignore_injured0',false])", // _target, _this, _originalTarget
    2,
    false,
    "",
    ""
]	 
] remoteExec ["addAction",0];
	 
	 
	 
	 
	 
	 
	 
	 
	 
//________________________________________________________________________________________________________________________________	 

			 while {true}                  
				do {
					IF ((_unit distance _Pos < 6 ) or (!alive _unit) or (time >= _timer) or (_unit getVariable ['dam_player_lecit0',false])) exitWith {};	 
						IF (( AnimationState _unit != "ApanPpneMstpSnonWnonDnon") && ( AnimationState _unit != "ApanPpneMstpSnonWnonDnon_G01") && ( AnimationState _unit != "ApanPpneMstpSnonWnonDnon_G02") && ( AnimationState _unit != "ApanPpneMstpSnonWnonDnon_G03") && ( AnimationState _unit != "ApanPpneMsprSnonWnonDf") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDb") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDbl") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDbr") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDf") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDfl") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDfr") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDl") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDr")) then {
						 [_unit, "ApanPpneMstpSnonWnonDnon_G02"] remoteExec ["playMove", 0];
						 sleep 2;
						};
				 sleep 0.5;
				};
			 [_unit] remoteExec [ "removeAllActions", 0, true ];
			 _unit setVariable ["dam_player_lecit0",false,true];			  
			 _unit doMove getpos _unit;

//__________________________________________________________Выход_______________________________________________________________			 
			 

			 {_unit addMagazine [_x, 9999]} forEach _magsremove;
			 
			IF (alive _unit) then {
				IF ((_shans - (random 10)) >=0) then {

			 	 [_unit] joinSilent _unitGrp;
				 IF (_unit == _unitLdr) then {_unitGrp selectLeader _unit};
				 _null = [_unit, _anim, _shans, _shooter] spawn Uncondition;
				  sleep 6;

				} Else {

						IF ((_shans - (random 10)) >=0) then {

						_unit setdamage 1;

						IF (_shans == 10)  then {
						 _unit setHitPointDamage ["hitBody", 0];

						 _unit setHitPointDamage ["hitHands", 0];

						 _unit setHitPointDamage ["hitLegs", 0];
						};


						IF ((_shans == 7) or (_shans == 9))  then {
						 _unit setHitPointDamage ["hitHead", 0];

						 _unit setHitPointDamage ["hitHands", 0];

						 _unit setHitPointDamage ["hitLegs", 0];
						};

						IF ((_shans == 1) or (_shans == 3)) then {
						 _unit setHitPointDamage ["hitHead", 0];

						 _unit setHitPointDamage ["hitBody", 0];

						 _unit setHitPointDamage ["hitLegs", 0];
						};

						IF ((_shans == 2) or (_shans == 4) or (_shans == 6)) then {
						 _unit setHitPointDamage ["hitHead", 0];
	
						 _unit setHitPointDamage ["hitBody", 0];

						 _unit setHitPointDamage ["hitHands", 0];
						};
	 
				 
					 
					 _unit setVariable ["dam_ignore_injured0",false,true];
				 
					 sleep 1;

						

					} Else {


					 [ _unit, true ] remoteExec [ "setUnconscious", _unit ];
						waitUntil { sleep 0.1; ((AnimationState _unit == "UnconsciousReviveDefault") or (!alive _unit)) 
						};	
					 [ _unit, false ] remoteExec [ "setUnconscious", _unit ];
					 _unit setVariable ["dam_ignore_injured0",false,true];

					 [ _unit, "AUTO" ] remoteExec [ "setUnitPos", _unit ];					 
					 [ _unit, "RED" ] remoteExec [ "setCombatMode", _unit ];
 					 [ _unit, "COMBAT" ] remoteExec [ "setBehaviour", _unit ];


					 [_unit] joinSilent _unitGrp;
					 IF (_unit == _unitLdr) then {_unitGrp selectLeader _unit};
					 _unit setVariable ["dam_player_lecitsebia0",false,true];
					 PIRjipId = [_unit, {
					 _ehId = _this addEventHandler ["HitPart", {(_this select 0) call PiRredirect;}];
					 _this setVariable ["hitPartEhId", _ehId];
					}] remoteExec ["call", 0, true];

					IF !(PiR_captive_on) then {
					 _unit setcaptive false;
					};
					
					};
				};

			};


			};

		
		};


		sleep 2;
		IF (_udalenie == 1) then {

			IF (_sWeapon != "") then {
				IF ((_smag select 0) != "") then {
				 _unit addMagazine [(_smag select 0), 9999];
				};	
			  [_unit, _sWeapon] remoteExec ["addWeapon", 0];
			 {[_unit, _x] remoteExec ["addprimaryWeaponItem", 0]} forEach _sWItems;
			 };
			IF (_pWeapon != "") then {
				IF ((_pmag select 0) != "") then {
				 _unit addMagazine [(_pmag select 0), 9999];
				};
			[_unit, _pWeapon] remoteExec ["addWeapon", 0];
			 {[_unit, _x] remoteExec ["addprimaryWeaponItem", 0]} forEach _pWItems;
			 };
			IF (_hWeapon != "") then {
				IF ((_hmag select 0) != "") then {
				 _unit addMagazine [(_hmag select 0), 9999];
				};
			[_unit, _hWeapon] remoteExec ["addWeapon", 0];
			 {[_unit, _x] remoteExec ["addprimaryWeaponItem", 0]} forEach _hWItems;
			 };
			IF (_binocs != "") then {
			 [_unit, _binocs] remoteExec ["addWeapon", 0];
			 };
			
		};	




	};





	IF (!alive _unit) then {
	 _unit setVariable ["dam_ignore_injured0",false,true]; 

	 IF !(PiR_captive_on) then {
	 _unit setcaptive false;
	};

	};
	
//_____________________________________________________________________________________________________________________________________	


