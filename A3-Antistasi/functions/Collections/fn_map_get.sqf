/*
Function:
    col_fnc_map_get

Description:
    Gets values of specified keys in a UID entry;
    There are no safety checks. Make sure your data is verified.

Scope:
    <ANY>

Environment:
    <ANY>

Parameters:
    <OBJECT> Namespace, preferably from col_fnc_map_namespace.
    <STRING> Bucket.
    <ARRAY<KEYPAIR>> List of keys and defaults to fetch values from; KEYPAIR=[Name<STRING>,Value<ANY>].

Returns:
    <ARRAY<ANY>> List of all values requeued from specified UID.

Examples:
    private _namespace = ["123",true] call col_fnc_map_namespace;
    private _bucket = "123";
    private _keyPairs = [ ["test",0], ["420",0] ];
    [_namespace,_bucket,_keyPairs] call col_fnc_map_get; // Return values from key "test" and "420" with default as 0, in _bucket "123"

Author: Caleb Serafin
Date Updated: 12 June 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [
    ["_namespace",objNull, [objNull,locationNull] ],
    ["_bucket","",[""]],
    ["_keyPairs",[],[ [] ]]
];
private _filename = "Collections\fn_map_add.sqf";

private _list = _namespace getVariable [_bucket, [] ]; // Passes reference to _list

private _values = [];
private _index = 0;
private _pair = [];
{
    _pair = _x;
    _index = _list findIf {_x#0 isEqualTo _pair#0};
    if (_index isEqualTo -1) then {
        _values pushBack _pair#1;
    } else {
        _values pushBack _list#_index#1;
    };
} forEach _keyPairs;
_values;