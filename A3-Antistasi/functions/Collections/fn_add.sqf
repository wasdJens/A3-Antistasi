/*
Function:
    col_fnc_add

Description:
    Interface for setting element in a collection.

Scope:
    <ANY>

Environment:
    <ANY>

Parameters:
    <COLLECTIONS_TYPES> Collection
	<ARRAY> Parameters. See documentation on specific collection.

Returns:
    <BOOL> true if success; false is failure; nil if crashed;

Exceptions:


Examples:

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params ["_collection","_parameters"];
private _filename = "Collections\fn_add.sqf";

private _type = [_collection] call col_fnc_type;

[_collection,_parameters] call (switch (_type) do {
	case "ARRAY": { col_fnc_add_ARRAY };
	default {
        private _errorText = format ["Collections | NotImplementedYet | %1 | add",_type];
        [1,_errorText,_filename] call A3A_fnc_log;
        throw ["NotImplementedYet",_errorText,_filename];
    };
});