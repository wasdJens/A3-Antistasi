/*
Function:
    col_fnc_type

Description:
    Returns type of collection

Scope:
    <ANY>

Environment:
    <ANY>

Parameters:
    <ANY> Collection to find type of

Returns:
    <STRING> Registered type of collection

Examples:
    private _type = ["hello world"] call col_fnc_type; // "STRING"
    private _type = [242] call col_fnc_type; // "SCALAR"
    private _type = [ ["COL_KEYPAIR", ["test",5] ] ] call col_fnc_type; // "COL_KEYPAIR"
    private _type = [ ["COL_MAP_KEYPAIR", [["test",5]] ] ] call col_fnc_type; // "COL_MAP_KEYPAIR"

Author: Caleb Serafin
Date Updated: June 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
#include "col_defines.hpp"
params [
    ["_collection"]
];
private _filename = "Collections\fn_type.sqf";

if !(_collection isEqualType []) exitWith {
	typeName _collection;
};
private _col_type = _collection # 0;
if (isNil {_col_type}) exitWith {"ARRAY"};
if (_col_type in COLLECTIONS_TYPES) then {
	_col_type
} else {
	"ARRAY"
};