/*
Function:
    col_fnc_map_namespace

Description:
    Returns a namespace for generic storage.
    Initializes the namespace if it does not exist.
	Will NOT scan for simpleObjects by default.

Scope:
    <ANY>

Environment:
    <ANY>

Parameters:
    <STRING> Name of namespace CASE_SENSITIVE.

Returns:
    <OBJECT> (SIMPLE)("Logic") Map Namespace

Examples:
    private _data_namespace = ["123",true] call col_fnc_map_namespace; // Gets namespace for getVariable and setVariable

Author: Caleb Serafin
Date Updated: June 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
#include "..\col_defines.hpp"
params [ ["_name","",[""]], ["_scanObjects",false,[false]] ];
private _filename = "Collections\fn_map_namespace.sqf";

private _namespaceKeyPairs = missionNamespace getVariable [COLLECTIONS_NAMESPACES, [] ];
private _namespaceIndex = _namespaceKeyPairs findIf {_x#0 isEqualTo _name};

if (!_namespaceIndex isEqualTo -1) then {	// Prioritise found namespaces
	(_namespaceKeyPairs # _namespaceIndex) # 1;
} else {
	private _newNamespace = objNull;
	if (_scanObjects) then {
   		_newNamespace = [_name] call col_fnc_map_namespace_scan;
	} else {
		_newNamespace = createSimpleObject ["Logic", [0,0,0]];
		_newNamespace setVariable [COLLECTIONS_META, _name, true];
	};
	_namespaceKeyPairs pushBack [_name,_newNamespace];
	missionNamespace setVariable [COLLECTIONS_NAMESPACES,_namespaceKeyPairs,true];
};
