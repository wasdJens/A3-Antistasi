/*
Function:
    col_fnc_map_namespaceL

Description:
    Returns a local namespace for generic storage.
    Initializes the namespace if it does not exist.

Scope:
    <LOCAL>

Environment:
    <ANY>

Parameters:
    <STRING> Name of namespace CASE_SENSITIVE.

Returns:
    <LOCATION> ("Invisible") Map Namespace

Examples:
    private _data_namespace = ["123"] call col_fnc_map_namespaceL; // Gets namespace for getVariable and setVariable

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
#include "col_defines.hpp"
params [ ["_name","",[""]] ];
private _filename = "Collections\fn_map_namespaceL.sqf";

private _namespaceKeyPairs = missionNamespace getVariable [COLLECTIONS_DB_LOCATION, [] ];
private _namespaceIndex = _namespaceKeyPairs findIf {_x#0 isEqualTo _name};

if !(_namespaceIndex isEqualTo -1) then {	// Prioritise found namespaces
	(_namespaceKeyPairs # _namespaceIndex) # 1;
} else {
	private _newNamespace = createLocation ["Invisible", [0,0,0], 0, 0];
	_newNamespace setVariable [COLLECTIONS_ID, _name];
	_namespaceKeyPairs pushBack [_name,_newNamespace];
	missionNamespace setVariable [COLLECTIONS_DB_LOCATION,_namespaceKeyPairs];
    _newNamespace;
};