/*
Function:
    col_fnc_map_isGlobal

Description:
    Checks if a given namespace is global.

Scope:
    <LOCAL>

Environment:
    <ANY>

Parameters:
    <OBJECT> Namespace being tested.

Returns:
    <BOOL> true is global; false if local;

Examples:
    private _global = [_data_namespace] call col_fnc_map_isGlobal; // Gets namespace for getVariable and setVariable

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [ ["_namespace",objNull,[objNull,locationNull]] ];
private _filename = "Collections\fn_map_isGlobal.sqf";

switch (typeName _namespace) do {
	case "OBJECT": { true };
	case "LOCATION": { false };
	default { false };
};