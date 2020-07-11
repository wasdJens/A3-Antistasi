/*
File:
    doc_collection_types.sqf

Description:
    Contains examples of specific types of collections

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
[
	[
		"ARRAY",
		["item1","item2..."]
	],
	[
		"COL_ARRAY",
		["COL_ARRAY",["item1","item2","item3"],3,"STRING"]
	],
	[
		"COL_STRING",
		["COL_STRING","The quick brown fox jumped over the lazy dog.",45]
	],
	[
		"COL_EXCEPTION",
		["ExceptionType","details","filename"]
	],
	[
		"COL_MAP_KEYPAIR",
		["COL_MAP_KEYPAIR",[ ["key1","value1"], ["key2","value2"], ["key3...","value3..."] ]]
	],
	[
		"COL_MAP_PARALLEL",
		["COL_MAP_PARALLEL",[ ["key1","key2","key3..."], ["value1","value2","value3..."] ]]
	],
	[
		"COL_HASHMAP_KEYPAIR",
		["COL_HASHMAP_KEYPAIR",
			[
				["un-hashed key1","value1"], // No binning
				nil,
				[  // binning, requires linear search
					["un-hashed key2","value2"],
					["un-hashed key4","value14"]
				],
				nil,
				nil,
				["un-hashed key3...","value3..."]
			],
			64 // max width // 64 bins max
		]
	],
	[
		"COL_HASHMAP_PARALLEL",
		["COL_HASHMAP_PARALLEL",
			[
				[  ], // like COL_HASHMAP_KEYPAIR mixed with COL_MAP_PARALLEL
				[  ]
			],
			64 // max width // 64 bins max
		]
	],
	[
		"COL_HASHTREE_KEYPAIR",
		["COL_HASHTREE_KEYPAIR",
			[ // Will be nested certain number of levels before collisions subside // WIP
				[ "un-hashed no-collision key1","value1" ], // No binning
				[  ],
				[  ],
				[  ],
				[  ],
				[  ],
				[
					[  ],
					[ "un-hashed 1-digit collision key2","value2" ], // Collision resolved  // No binning, linear search not required
					[  ],
					[ ["un-hashed 2-digit collision key4","value4"],["un-hashed 2-digit collision key5","value5"] ], // If max digits = 2   // binning, requires linear search
					[  ],
					[  ],
					[  ],
					[ "un-hashed 1-digit collision key3","value3" ], // Collision resolved  // No binning, linear search not required
					[  ],
					[  ]
				],
				[  ],
				[  ]
			],
			10, // max width
			2   // max depth // 10*2 = 20 bins max
		]
	],
	[
		"COL_HASHTREE_PARALLEL",
		["COL_HASHTREE_PARALLEL",
			[ // Will be nested certain number of levels before collisions subside // WIP
				[
					"un-hashed no-collision key1", // No binning
					nil,
					nil,
					nil,
					nil,
					nil,
					[
						nil,
						"un-hashed 1-digit collision key2", // Collision resolved  // No binning, linear search not required
						nil,
						[ "un-hashed 2-digit collision key4","un-hashed 2-digit collision key5" ], // If max digits = 2   // binning, requires linear search
						nil,
						nil,
						nil,
						"un-hashed 1-digit collision key3", // Collision resolved  // No binning, linear search not required
						nil,
						nil
					],
					nil,
					nil
				],
				[
					"value1",
					nil,
					nil,
					nil,
					nil,
					nil,
					[
						nil,
						"value2",
						nil,
						[ "value4","value5" ],
						nil,
						nil,
						nil,
						"value3",
						nil,
						nil
					],
					nil,
					nil
				],
				10, // max width
				2   // max depth // 10*2 = 20 bins max
			]
		]
	]
]