/*
Function:
    col_fnc_map_set

Description:
    Sets key-Values in a bucket of a namespace;
    There are no safety checks. Make sure your data is verified.

Scope:
    <ANY>

Environment:
    <ANY>

Parameters:
    <OBJECT> Namespace, preferably from col_fnc_map_namespace.
    <STRING> Bucket.
    <ARRAY<KEYPAIR>> List of key pairs; KEYPAIR=[Name<STRING>,Value<ANY>].

Returns:
    <BOOLEAN> true if it hasn't crashed; nil if it has crashed.

Examples:
    private _namespace = ["123",true] call col_fnc_map_namespace;
    private _bucket = "123";
    private _keyPairs = [ ["test","frost"], ["420",69], ["bob","ban"] ];
    [_namespace,_bucket,_keyPairs] call col_fnc_map_set; // In namespace:bucket "123":"123": Sets values of key "test" to "frost" and "420" to 69

Author: Caleb Serafin
Date Updated: June 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [
    ["_namespace",objNull, [objNull,locationNull] ],
    ["_bucket","",[""]],
    ["_keyPairs",[],[ [] ]]
];
private _filename = "Collections\fn_map_set.sqf";

private _global = [_namespace] call col_fnc_map_isGlobal;
private _list = _namespace getVariable [_bucket, [] ]; // Passes reference to _list

private _index = 0;
private _pair = [];
{
    _pair = _x;
    _index = _list findIf {_x#0 isEqualTo _pair#0};
    if (_index isEqualTo -1) then {
        _list pushBack _pair;
    } else {
        _list set [_index,_pair];
    };
} forEach _keyPairs;
if(_global) then {_namespace setVariable [_bucket, _list, _global]}; // Although the global map is modified by reference, it will not propagate over network.
true;