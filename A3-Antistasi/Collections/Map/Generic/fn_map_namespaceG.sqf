/*
Function:
    col_fnc_map_namespaceG

Description:
    Returns a namespace for generic storage.
    Initializes the namespace if it does not exist.

Scope:
    <ANY>

Environment:
    <ANY>

Parameters:
    nil

Returns:
    <OBJECT> ("Logic") Map Namespace Generic

Examples:
    private _data_namespace = call col_fnc_map_namespaceG; // Gets namespace for getVariable and setVariable

Author: Caleb Serafin
Date Updated: June 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
#include "..\..\defines.hpp"
private _filename = "Collections\Map\Generic\map_namespaceG.sqf";

private _namespaceG = missionNamespace getVariable [COLLECTIONS_NAMESPACE_MAP_GENERIC,objNull];

if (isNull _namespaceG) then {
    private _namespaces = allSimpleObjects ["logic"] select {(_x getVariable [ COLLECTIONS_META ,""]) isEqualTo COLLECTIONS_NAMESPACE_MAP_GENERIC};
    if (_namespaces isEqualTo []) then {
        _namespaceG = createSimpleObject ["Logic", [0,0,0]];
        _namespaceG setVariable [COLLECTIONS_META, COLLECTIONS_NAMESPACE_MAP_GENERIC, true];
    } else {
        _namespaceG = _namespaces select 0;
    };
    missionNamespace setVariable [COLLECTIONS_NAMESPACE_MAP_GENERIC,_namespaceG,true];
};

_namespaceG;
