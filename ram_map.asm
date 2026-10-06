struct ram {
    unk1:        d08[0x000->0x0700],
    oam:         oam,        ;0700
    unk2:        d08[0x0920->0x0BA6],
    rng_state:   d16,        ;0BA6
    mega_man:    mega_man,   ;0BA8
    obj1:        obj3[3],    ;0C38
    obj2:        obj3[12],   ;0C98
    ride_armor:  ride_armor, ;0E18
    objects:     obj[15],    ;0E68
    weapons:     obj[8],     ;1228
    obj4:        obj[8],     ;1428
    obj5:        obj2[16],   ;1628
    obj6:        obj3[15],   ;1928
    obj7:        obj4[16],   ;1D08
    unk5:        d08[0x1E08->0x1F80]
    lives:       d08,        ;1F80
}

struct oam {
    low: d08[0x200],
    high: d08[0x20],
}

struct mega_man {
    unk: d08[0x90],
}

struct ride_armor {
    unk: d08[0x50],
}

struct obj {
    unk1: d08,
    state: d08[3], ;01
    pos_x: d24,    ;04
    pos_y: d24,    ;07
    type: d08,     ;0A
    unk2: d08[0x0B->0x1A],
    speed_x: d16,  ;1A
    speed_y: d16,  ;1C
    accel_y: d08,  ;1E
    accel_x: d08,  ;1F
    unk3: d08[0x20->0x27],
    hp: d08,       ;27
    unk4: d08[0x28->0x40],
}

struct obj2 {
    unk: d08[0x30],
}

struct obj3 {
    unk: d08[0x20],
}

struct obj4 {
    unk: d08[0x10],
}
