struct ram {
    unk1:                    d08[0x000->0x0300],

    palette:                 d16[0x100],   // 0300
    dma_queue:               dma_data[32], // 0500
    dma_queue2:              dma_data2,    // 0600
    oam:                     oam,          // 0700

    unk2:                    d08[0x0920->0x0BA6],

    rng_state:               d16,          // 0BA6
    obj:                     object_list,  // 0BA8

    unk3:                    d08[0x1E08->0x1F7A],

    // 1E48 bg layer struct?

    current_stage:           d08,          // 1F7A

    unk4:                    d08[0x1F7B->0x1F80],

    lives:                   d08,          // 1F80
    checkpoint:              d08,          // 1F81

    unk5:                    d08[0x1F82->0x1F87],

    weapons:                 d16[8],       // 1F87

    unk6:                    d08[0x1F97->0x1F99],

    upgrades:                d08,          // 1F99
    max_hp:                  d08,          // 1F9A
    highway_stage_completed: d08,          // 1F9B

    // 1F9C collected power ups?
}

//-----

struct dma_data {
    vram_addr_mode: d08,
    vram_dst: d16,
    byte_count: d16,
    src: d24,
}

struct dma_data2 {
    vram_addr_mode: d08,
    vram_dst: d16,
    byte_count: d08, // transfer_data length
    transfer_data: d08[0xFC], // variable length, here set so it fills up the ram map
}

struct oam {
    low:  d08[0x200],
    high: d08[0x20],
}

//-----

struct object_list {
    mega_man:   mega_man,   // 0BA8
    obj1:       obj3[3],    // 0C38
    obj2:       obj3[12],   // 0C98
    ride_armor: ride_armor, // 0E18
    objects:    obj[15],    // 0E68
    weapons:    obj[8],     // 1228
    obj3:       obj[8],     // 1428
    obj4:       obj2[16],   // 1628
    obj5:       obj3[31],   // 1928
    obj6:       obj4[16],   // 1D08
}

struct mega_man {
    unk1:          d08[0x00->0x04],

    pos_x:         d24, // 04
    pos_y:         d24, // 07
    unk2:          d08[0x0A->0x1A],

    speed_x:        d16, // 1A
    speed_y:        d16, // 1C
    unk3:           d08[0x1E->0x33],

    current_weapon: d08, // 33
    unk4:           d08[0x34->0x90],
}

struct ride_armor {
    unk: d08[0x50],
}

struct obj {
    unk1:            d08,
    state:           d08[3], // 01
    pos_x:           d24,    // 04
    pos_y:           d24,    // 07
    type:            d08,    // 0A
    unk2:            d08[0x0B->0x13],
    anim_timer:      d08,    // 13
    unk3:            d08[0x14->0x1A],
    speed_x:         d16,    // 1A
    speed_y:         d16,    // 1C
    accel_y:         d08,    // 1E
    accel_x:         d08,    // 1F
    unk4:            d08[0x20->0x27],
    hp:              d08,    // 27
    damage_table_id: d08,    // 28
    unk5:       d08[0x28->0x40],
}

// todo: better names for other obj sizes

struct obj2 {
    unk: d08[0x30],
}

struct obj3 {
    unk1:    d08,
    state:   d08[3], // 01
    pos_x:   d24,    // 04
    pos_y:   d24,    // 07
    type:    d08,    // 0A
    unk2:    d08[0x0B->0x1A],
    speed_x: d16,    // 1A
    speed_y: d16,    // 1C
    unk3:    d08[0x1E->0x20],
}

struct obj4 {
    unk: d08[0x10],
}
