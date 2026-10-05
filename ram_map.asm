struct ram {
    unk0000_06FF: d08[0x700],
    oam:          oam,
    unk0920_0BA5: d08[0x920->0xBA6],
    rng_state:    d16,
    unk0BA8_0E67: d08[0xBA8->0xE68],
    obj1:         obj[15],  ;0E68
    obj2:         obj[8],   ;1228
    obj3:         obj[8],   ;1428
    obj4:         obj2[16], ;1628
    obj5:         obj3[15], ;1928
    obj6:         obj4[16], ;1D08
    ;1E08
}

struct oam {
    low: d08[0x200],
    high: d08[0x20],
}

struct obj {
    unk1: d08[0x00->0x04],
    pos_x: d24,
    pos_y: d24,
    unk2: d08[0x0A->0x1A],
    speed_x: d16,
    speed_y: d16,
    unk3: d08[0x1E->0x40]
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
