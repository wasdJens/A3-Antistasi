private _long = [];
_long resize 1000;
private _i = 0;
_long = _long apply {_i = _i + 1;[str _i,str _i];};


private _namespace = ["123",true] call col_fnc_map_namespace;
private _bucket = "long";
private _keyPairs = _long;
[_namespace,_bucket,_keyPairs] call col_fnc_map_set;

private _results = [];
[{[_namespace,_bucket,_keyPairs] call col_fnc_map_set}] call BIS_fnc_codePerformance


private _namespace = ["123",true] call col_fnc_map_namespace;
private _bucket = "long";
private _keyPairs = [ ["476","-1"], ["999","-1"] ];
[_namespace,_bucket,_keyPairs] call col_fnc_map_get;


private _generateKeyPairs = {
    params ["_length"];

    private _keyPairs = [];
    _keyPairs resize _length;
    private _i = 0;
    _keyPairs = _keyPairs apply {
        _i = _i + 1;
        [str _i,str _i];
    };
    _keyPairs;
};
private _test = {
    params ["_action"];
    private _results = [];
    private _namespace = ["123",true] call col_fnc_map_namespace;
    for "_i" from 0 to 10 do {
        private _keyPairs = [2^_i] call _generateKeyPairs;
        _results pushBack [2^_i, diag_codePerformance [{
            params ["_namespace","_keyPairs", "_action"];
            [_namespace,"long",_keyPairs] call _action;
        }, [_namespace, _keyPairs, _action], 10000]#0 ]; // we only want the ms
    };
    _results;
};
private _resultsToEnglish = {
    params ["_results"];
    _english = "";
    {
        _x params ["_items","_ms"];
        _english = _english + format ["%1 items in %2 ms
",str _items,str _ms];
    } forEach _results;
    _english
};
private _map_set_test = {
    [[col_fnc_map_set] call _test] call _resultsToEnglish;
};
[] call _map_set_test;