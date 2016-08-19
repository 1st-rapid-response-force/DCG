/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"

if (!isServer || !isMultiplayer) exitWith {};

ADDON = false;

PREP(select);
PREP(cancel);

PREP(prim_vip);
PREP(prim_cache);
PREP(prim_officer);
PREP(prim_defend);
PREP(prim_arty);
PREP(sec_deliver);
PREP(sec_repair);
PREP(sec_officer);
PREP(sec_intel01);
PREP(sec_intel02);

GVAR(primary) = [];
GVAR(secondary) = [];

publicVariable QFUNC(cancel);