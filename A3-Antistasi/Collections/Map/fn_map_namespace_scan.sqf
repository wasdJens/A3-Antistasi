/*
Function:
    col_fnc_map_namespace_scan

Description:
    Scans all simple objects for desired namespace.
	Returns desired namespace if found; or objNull is not found.

Scope:
    <ANY>

Environment:
    <ANY>

Parameters:
    <STRING> Name of namespace CASE_SENSITIVE.

Returns 1:
    <OBJECT> (SIMPLE)("Logic") Map Namespace

Returns 2:
    <OBJECT> objNull

Examples:
    private _data_namespace = ["A3A_testVars"] call col_fnc_map_namespace_scan;

Author: Caleb Serafin
Date Updated: June 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
#include "..\col_defines.hpp"
params [ ["_name","",[""]] ];
private _filename = "Collections\Map\map_namespace.sqf";

private _allSimpleObjects = allSimpleObjects ["logic"];
private _namespaceIndex =  _allSimpleObjects findIf {(_x getVariable [ COLLECTIONS_META ,""]) isEqualTo _name};
if (_namespaceIndex isEqualTo -1) then {
    objNull;
} else {
    _allSimpleObjects # _namespaceIndex;
};