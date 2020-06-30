/*
Function:
    col_fnc_map_rem

Description:
    Namespace must be from col_fnc_map_namespace.
    1. Removes specified Keys in a Bucket;
    2. Removes an entire Bucket from the Namespace;
    3. Deletes the Namespace;

Scope:
    <ANY>

Environment:
    <ANY>

Parameters 1:
    <OBJECT> Namespace.
    <STRING> Bucket.
    <ARRAY<STRING>> List of keys to remove.

Parameters 2:
    <OBJECT> Namespace.
    <STRING> Bucket to remove.
    <OBJECT> objNull.

Parameters 3:
    <OBJECT> Namespace to remove.
    <OBJECT> objNull.
    <OBJECT> objNull.

Returns:
    <BOOLEAN> true if it hasn't crashed; false is invalid params; nil if it has crashed.

Examples:
    private _namespace = ["123",true] call col_fnc_map_namespace;
    private _bucket = "123";
    private _keys = ["test","420"];
    [_namespace,_bucket,_keys] call col_fnc_map_rem; // Removes keys "test" and "frost" in _bucket "123"
    [_namespace,_bucket,[]] call col_fnc_map_rem;    // Removes UID "123" and all it's keys from _namespace "123"
    [_namespace,"",[]] call col_fnc_map_rem;         // Removes namespace

Author: Caleb Serafin
Date Updated: June 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
#include "col_defines.hpp"
params [
    ["_namespace",objNull, [objNull,locationNull] ],
    ["_bucket","", ["",objNull] ],
    ["_keys",[],[ [],objNull ]]
];
private _filename = "Collections\fn_map_rem.sqf";

private _global = [_namespace] call col_fnc_map_isGlobal;
private _namespace_name = _namespace getVariable [COLLECTIONS_META,objNull];
if !((typeName _namespace_name) isEqualTo "STRING") exitWith {
    [1,"INVALID PARAMS | Attempted deleting a non-Collections namespace"] call A3A_fnc_log;
    false;
};
if (typeName _bucket isEqualTo "OBJECT") exitWith {
    private _namespaceKeyPairs = missionNamespace getVariable [COLLECTIONS_NAMESPACES, [] ];
    _namespaceKeyPairs deleteAt (_namespaceKeyPairs findIf {_x#0 isEqualTo _namespace_name});
	missionNamespace setVariable [COLLECTIONS_NAMESPACES,_namespaceKeyPairs,_global];
    if (_global) then {
        deleteVehicle _namespace;
    } else {
        deleteLocation _namespace;
    };
};
if (_bucket isEqualTo COLLECTIONS_META) exitWith {
    [1,format["INVALID PARAMS | Attempted deleting COLLECTIONS META from namespace ""%1""", _namespace_name]] call A3A_fnc_log;
    false;
};
if (typeName _keys isEqualTo "OBJECT") exitWith {
    _namespace setVariable [_bucket, nil, _global];
    true;
};

private _list = _namespace getVariable [_bucket, [] ];
private _key = "";
{
    _key = _x;
    _list deleteAt (_list findIf {(_x#0) == _key});
} forEach _keys;
_namespace setVariable [_bucket, _list, _global];
true;