/*
Function:
    col_fnc_map_set

Description:
    Sets key-Values in a bucket of a namespace;
    There are no safety checks. Make sure your data is verified.

    1 items in 0.0332 ms
    2 items in 0.0402 ms
    4 items in 0.0545 ms
    8 items in 0.105955 ms
    16 items in 0.279799 ms
    32 items in 0.738007 ms
    64 items in 2.6178 ms
    128 items in 9.80392 ms
    256 items in 37.8889 ms
    512 items in 152.143 ms
    1024 items in 659 ms

    y ~ 0.000663616x^2 -0.0377189x +1.10129;
    R^2 = 0.9999;

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
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params [
    ["_namespace",objNull, [objNull,locationNull] ],
    ["_bucket","",[""]],
    ["_keyPairs",[],[ [] ]]
];
private _filename = "Collections\fn_map_set.sqf";

private _global = [_namespace] call col_fnc_map_isGlobal;
private _list = _namespace getVariable [_bucket, [] ]; // Passes reference to _list // Somehow modifying this reference isn't slower than copying.
private _initialise = _list isEqualTo [];

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
if !(_initialise || _global) exitWith { true };
if(_global) then {
    _namespace setVariable [_bucket, _list, true]; // Although the global map is modified by reference, it will not propagate over network.
} else {
    _namespace setVariable [_bucket, _list];
};
true;