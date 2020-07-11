/*
File:
    defines.hpp

Description:
    Containse macros for Collections
    Values should NOT EXCEED 15 chars total. This is for performance reasons.
    Forward slashes are used to prevent typing in the global variable by accident.

Examples:
    #include "col_defines.hpp"

Author: Caleb Serafin
Date Updated: 11 June 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
#define COLLECTIONS_ID "col/metaID"
#define COLLECTIONS_TYPE "col/metaType"
#define COLLECTIONS_DB_LOGIC "col/DBLogic"
#define COLLECTIONS_DB_LOCATION "col/DBLocation"

#define COLLECTIONS_TYPES ["ARRAY","COL_ARRAY","COL_NS_LOGIC","COL_NS_LOCATION","COL_STRING","COL_MAP_KEYPAIR","COL_MAP_PARALLEL","COL_HASHMAP_KEYPAIR","COL_HASHMAP_PARALLEL"]