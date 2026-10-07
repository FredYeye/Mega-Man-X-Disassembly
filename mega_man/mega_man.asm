mega_man:
    php
    phd
    sep #0x30
    pea 0x0BA8
    pld
    jsl 0x849ACD
    sta.b 0x65
    lda.b 0x2B
    ora.b 0x2C
    sta.b 0x5E
    lda.w 0x1F0C
    ora.b 0x30
    ora.b 0x89
    sta.b 0x8A
    jsr .9AC2
    jsr .9B23
    jsr _819FD7
    lda.b 0x02
    cmp.b #0x40
    bne .815C

    stz.b 0x37
.815C:
    lda.b 0x8C
    tsb.b 0x37
    ldx.b 0x01
    jsr (.819A,X)
    stz.b 0x2C
    lda.b 0x65
    sta.b 0x66
    sta.l 0x700800
    cmp.l 0x700800
    beq .817D

    dec.b 0x83
    bpl .817F

    stz.b 0x83
    bra .817F

.817D:
    inc.b 0x83
.817F:
    jsr .99C9
    jsr .9B71
    jsl 0x848FCA
    lda.b #0x08
    trb.b 0x7E
    stz.b 0x19
    lda.b 0x11
    and.b #0x3F
    ora.b 0x69
    sta.b 0x11
    pld
    plp
    rtl

.819A: d16[.819E, .8258]

.819E:
    lda.b #0xFF
    sta.b 0x10
    stz.b 0x18
    stz.b 0x73
    lda.b #0x40
    sta.b 0x69
    lda.w 0x1F7F
    beq .81B1

    stz.b 0x69
.81B1:
    lda.b #0xFF
    sta.b 0x10
    stz.b 0x64
    lda.b #0x04
    sta.b 0x78
    stz.b 0x04
    stz.b 0x07
    lda.b #0x22
    sta.b 0x6F
    lda.b #0x02
    sta.b 0x01
    lda.b #0x22
    sta.b 0x02
    lda.w 0x1F7F
    beq .81D4

    lda.b #0x44
    sta.b 0x02
.81D4:
    ldx.w 0x1F7A
    lda.b #0x02
    ora.w 0x86BAC5,X
    sta.b 0x11
    stz.b 0x5B
    stz.b 0x5A
    lda.b #0xFF
    sta.b 0x66
    stz.b 0x82
    lda.w 0x1F7A
    asl
    asl
    tax
    rep #0x20
    jsl _80E687
    stz.b 0x79
    lda.b 0x05
    sta.b 0x22
    lda.b 0x08
    sta.b 0x24
    lda.w #0xA555
    sta.b 0x20
    lda.w #0xFA80
    sta.b 0x5F
    lda.w #0x0060
    sta.w 0x1E70
    lda.w #0x0080
    sta.w 0x1E72
    lda.w #0x0080
    sta.w 0x1E74
    lda.w #0x0080
    sta.w 0x1E76
    lda.w #0xA597
    sta.b 0x31
    sep #0x20
    inc.b 0x0E
    stz.b 0x30
    stz.b 0x89
    stz.b 0x88
    stz.b 0x8A
    stz.b 0x7F
    stz.b 0x80
    lda.b #0x03
    sta.b 0x67
    lda.b #0x08
    sta.b 0x2F
    jsl get_rng
    tax
    lda.l 0x008000,X
    cmp.l 0x408000,X
    beq .824F

    stz.w 0x1F99
.824F:
    lda.b #0x47
    jsl _848EEA.8F07
    jmp 0x819D7E

.8258:
    lda.w 0x1F23
    beq .826C

    bmi .826C

    lda.b 0x02
    cmp.b #0x1A
    beq .826C

    lda.b 0x27
    beq .826C

    jmp .96DC

.826C:
    lda.b 0x6B
    beq .8287

    lda.w 0x0B9C
    and.b #0x01
    sta.b 0x0E
    lda.b 0x02
    cmp.b #0x18
    beq .8287

    dec.b 0x6B
    bne .8287

    lda.b #0x01
    sta.b 0x0E
    stz.b 0x30
.8287:
    lda.b 0x56
    beq .828D

    dec.b 0x56
.828D:
    jsr _81A058
    jsr .97C8
    jsr .9712
    jsr .9789
    jsr .9A66
    ldx.b 0x02
    jmp (.82A1,X)

.82A1: d16[
    .82E9, .8398, .8403, .8481, .851D, .85F6, .8A45, .8651,
    .870E, .8834, .8904, .8B31, .8B43, .8BA7, .8B44, .8B4D,
    .89A0, .89F0, .8D29, .8D69, .8DAB, .8DE1, .8E75, .8E86,
    .8F41, .917C, .91DD, .923F, .92E9, .930E, .8F29, .8F4E,
    .8FB4, .900D, .9051, .8B4D,
]

.82E9:
    ldx.b 0x03
    jmp (.82EE,X)

.82EE: d16[.82F2, .831B]

.82F2:
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    lda.w #0x0178
    sta.b 0x5C
    lda.w #0xA555
    sta.b 0x20
    lda.w #0xA597
    sta.b 0x31
    jsr .992A
    sep #0x20
    jsr .9588
    lda.b #0x00
    clc
    adc.b 0x6F
    clc
    adc.b 0x73
    jsl _848EEA.8F07
.831B:
    jsr _819E45
    lda.b 0x5E
    bit.b #0x04
    bne .8327

    jmp .9658

.8327:
    lda.b 0x59
    bne .8331

    lda.b 0x3B
    bit.b #0x40
    beq .8339

.8331:
    lda.b #0x00
    clc
    adc.b 0x73
    jsr .942B
.8339:
    lda.b 0x3B
    bit.b #0x80
    beq .8348

    jsl 0x849958
    bcs .8348

    jmp .95E2

.8348:
    lda.b 0x4F
    beq .834E

    dec.b 0x4F
.834E:
    jsr .9576
    beq .8368

    jsl 0x8499AF
    bcs .8368

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    lda.b 0x4F
    beq .8368

    lda.b #0x04
    sta.b 0x02
    rts

.8368:
    lda.b 0x37
    bit.b #0x04
    beq .837E

    stz.b 0x29
    lda.b #0x18
    sta.b 0x2A
    jsr _819D70
    cmp.b #0x13
    bne .837E

    jmp .96F7

.837E:
    lda.b 0x37
    bit.b #0x08
    beq .8390

    jsr _819FB1
    bne .8390

    lda.b #0x2A
    sta.b 0x4E
    jmp .96E5

.8390:
    lda.b #0x22
    clc
    adc.b 0x73
    jmp .9560

.8398:
    ldx.b 0x03
    jmp (.839D,X)

.839D: d16[.83A1, .83B5]

.83A1:
    lda.b #0x02
    sta.b 0x03
    jsr .992A
    lda.b #0x05
    sta.b 0x4E
    lda.b #0x1C
    clc
    adc.b 0x6F
    jsl _848EEA.8F07
.83B5:
    lda.b 0x59
    bne .83BF

    lda.b 0x3B
    bit.b #0x40
    beq .83C4

.83BF:
    lda.b #0x1C
    jsr .942B
.83C4:
    lda.b 0x3B
    bit.b #0x80
    beq .83D3

    jsl 0x849958
    bcs .83D3

    jmp .95E2

.83D3:
    lda.b 0x37
    and.b #0x03
    bit.b 0x5E
    beq .83DE

    jmp .95CC

.83DE:
    lda.b 0x5E
    bit.b #0x04
    bne .83E7

    jmp .9658

.83E7:
    jsr .9576
    bne .83EF

    jmp .95CC

.83EF:
    dec.b 0x4E
    bne .83FA

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rts

.83FA:
    jsl update_pos_x
    lda.b #0x3E
    jmp .9560

.8403:
    ldx.b 0x03
    jmp (.8408,X)

.8408: d16[.840C, .8425]

.840C:
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    lda.w #0x0178
    sta.b 0x5C
    sep #0x20
    jsr .992A
    lda.b #0x09
    clc
    adc.b 0x6F
    jsl _848EEA.8F07
.8425:
    lda.b 0x59
    bne .842F

    lda.b 0x3B
    bit.b #0x40
    beq .8434

.842F:
    lda.b #0x09
    jsr .93A8
.8434:
    lda.b 0x3B
    bit.b #0x80
    beq .8446

    jsl 0x849958
    bcs .8446

    jsr .95E2
    jmp .8481

.8446:
    lda.b 0x37
    and.b #0x03
    bit.b 0x5E
    beq .8453

    stz.b 0x4F
    jmp .95CC

.8453:
    lda.b 0x5E
    bit.b #0x04
    bne .845C

    jmp .9658

.845C:
    jsr .9576
    bne .8468

    lda.b #0x0A
    sta.b 0x4F
    jmp 0x8195CC

.8468:
    jsr .9960
    jsl update_pos_x
    lda.b 0x7E
    bit.b #0x08
    beq .847B

    lda.w 0x0B9C
    lsr
    bcc .8480

.847B:
    lda.b #0x2B
    jmp 0x819536

.8480:
    rts

.8481:
    ldx.b 0x03
    jmp (.8486,X)

.8486: d16[.848C, .84A2, .8514]

.848C:
    lda.b #0x02
    sta.b 0x03
    jsr .9978
    lda.b #0x06
    jsl _80888B.88B6
    lda.b #0x01
    clc
    adc.b 0x6F
    jsl _848EEA.8F07
.84A2:
    lda.w 0x1F9E
    bpl .84AD

    bit.b #0x01
    bne .84AD

    sta.b 0x1E
.84AD:
    lda.b 0x59
    bne .84B7

    lda.b 0x3B
    bit.b #0x40
    beq .84BC

.84B7:
    lda.b #0x01
    jsr .93A8
.84BC:
    lda.b 0x5E
    bit.b #0x08
    beq .84D9

    jsr _819E97
    beq .84D6

    lda.b #0x04
    sta.b 0x03
    lda.b #0x02
    sta.b 0x84
    lda.b #0x0F
    jsl 0x84A333
    rts

.84D6:
    jmp 0x819658

.84D9:
    stz.b 0x1A
    stz.b 0x1B
    stz.b 0x1F
    jsr .9978
    lda.b 0x1D
    bpl .84EC

    jsr .9658
    jmp .851D

.84EC:
    lda.b 0x37
    bit.b #0x80
    bne .84F8

    jsr .9658
    jmp .851D

.84F8:
    bit.b #0x08
    beq .8508

    jsr _819FB1
    bne .8508

    lda.b #0x2A
    sta.b 0x4E
    jmp 0x8196E5

.8508:
    jsl update_pos_xy.neg_ay_ax
    jsr _819D00
    lda.b #0x23
    jmp 0x819536

.8514:
    dec.b 0x84
    bne .851C

    lda.b #0x02
    sta.b 0x03
.851C:
    rts

.851D:
    ldx.b 0x03
    jmp (.8522,X)

.8522: d16[.8526, .8552]

.8526:
    sta.l 0x700804
    cmp.l 0x700804
    beq .853A

    dec.w 0x1F9E
.8533:
    bpl .8542

    stz.w 0x1F9E
    bra .8542

.853A:
    inc.w 0x1F9E
    bne .8542

    dec.w 0x1F9E
.8542:
    lda.b #0x02
    sta.b 0x03
    jsr .992A
    lda.b #0x04
    clc
    adc.b 0x6F
    jsl _848EEA.8F07
.8552:
    lda.b 0x59
    bne .855C

    lda.b 0x3B
    bit.b #0x40
    beq .8561

.855C:
    lda.b #0x04
    jsr .93A8
.8561:
    lda.b 0x5E
    bit.b #0x04
    beq .856D

    jsr .9665
    jmp .85F6

.856D:
    lda.b 0x3B
    bit.b #0x80
    beq .85B4

    lda.b 0x2C
    bpl .8581

    and.b #0x40
    tay
    stz.b 0x81
    inc.b 0x81
    jmp .9687

.8581:
    jsl 0x849958
    bcs .85B4

    jsl 0x849A24
    bcc .85AD

    cmp.b #0x3E
    beq .859F

    cmp.b #0x3F
    beq .85A6

    bvc .859C

    phy
    jsr .98F2
    ply
.859C:
    jmp .9687

.859F:
    lda.b 0x8A
    bne .859C

    jmp 0x81967C

.85A6:
    lda.b 0x8A
    bne .859C

    jmp .96CB

.85AD:
    lda.b 0x3C
    beq .85B4

    jmp .95E2

.85B4:
    lda.b 0x37
    and.b #0x03
    bit.b 0x5E
    beq .85C5

    lda.b 0x2D
    cmp.b #0x36
    beq .85C5

    jsr .9699
.85C5:
    stz.b 0x1F
    rep #0x20
    stz.b 0x1A
    jsr .9978
    lda.b 0x5F
    cmp.b 0x1C
    bmi .85D6

    sta.b 0x1C
.85D6:
    jsl update_pos_xy.neg_ay_ax
    jsr _819D00
    sep #0x20
    lda.b 0x37
    bit.b #0x08
    beq .85F1

    jsr _819FB1
    bne .85F1

    lda.b #0x2A
    sta.b 0x4E
    jmp .96E5

.85F1:
    lda.b #0x26
    jmp .9536

.85F6:
    ldx.b 0x03
    jmp (.85FB,X)

.85FB: d16[.85FF, .861F]

.85FF:
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    lda.w #0x0178
    sta.b 0x5C
    sep #0x20
    lda.b #0x04
    sta.b 0x4E
    lda.b #0x07
    jsl _80888B.88B6
    lda.b #0x07
    clc
    adc.b 0x6F
    jsl _848EEA.8F07
.861F:
    lda.b 0x59
    bne .8629

    lda.b 0x3B
    bit.b #0x40
    beq .862E

.8629:
    lda.b #0x07
    jsr .93A8
.862E:
    dec.b 0x4E
    bne .8637

    stz.b 0x4F
    jmp .95CC

.8637:
    lda.b 0x3B
    bit.b #0x80
    beq .8640

    jmp .95E2

.8640:
    lda.b 0x37
    bit.b #0x03
    beq .864C

    jsr .95D7
    jmp .8403

.864C:
    lda.b #0x29
    jmp .9536

.8651:
    ldx.b 0x03
    jmp (.8656,X)

.8656: d16[.865A, .8699]

.865A:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x09
    jsl _80888B.88B6
    lda.b #0x08
    sta.b 0x2F
    sta.b 0x30
    lda.b #0x80
    trb.b 0x87
    rep #0x20
    stz.b 0x79
    lda.w #0xA555
    sta.b 0x20
    sep #0x20
    stz.b 0x6E
    stz.b 0x64
    stz.b 0x50
    jsr .992A
    ldx.b #0x44
    lda.w 0x1F99
    bit.b #0x04
    beq .8693

    rep #0x20
    lsr.b 0x1C
    sep #0x20
    ldx.b #0x4D
.8693:
    txa
    jsl _848EEA.8F07
    rts

.8699:
    rep #0x20
    lda.w #0xFA80
    cmp.b 0x1C
    bmi .86A4

    sta.b 0x1C
.86A4:
    sep #0x20
    lda.b 0x0F
    bpl .86CB

    lda.b #0x3C
    sta.b 0x6B
    lda.b 0x5E
    bit.b #0x04
    beq .86BD

    lda.b #0x07
    jsl _80888B.88B6
    jmp 0x8195CC

.86BD:
    jsr .9658
    lda.b #0x02
    sta.b 0x03
    lda.b #0x26
    jsl _848EEA.8F07
    rts

.86CB:
    jsl _848EEA
    lda.b 0x37
    and.b #0x03
    bit.b 0x5E
    beq .86E3

    jsr .9576
    jsr .9699
    lda.b #0x3C
    sta.b 0x6B
    stz.b 0x0F
.86E3:
    lda.b 0x5E
    bit.b #0x04
    beq .86EF

    stz.b 0x2F
    stz.b 0x1C
    stz.b 0x1D
.86EF:
    jsl update_pos_xy.neg_ay_ax
    lda.b #0x02
    bit.b 0x0F
    bvc .86FB

    lda.b #0x02
.86FB:
    ldx.w 0x1F7A
    ora.w 0x86BAC5,X
    sta.b 0x11
    lda.b 0x0F
    lsr
    bcc .870D

    lda.b #0x00
    jmp 0x819C66

.870D:
    rts

.870E:
    ldx.b 0x03
    jmp (.8713,X)

.8713: d16[.871B, .8745, .8790, .8824]

.871B:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x04
    sta.b 0x4E
    lda.b #0x06
    jsl _80888B.88B6
    lda.b 0x4F
    sta.b 0x69
    stz.b 0x79
    stz.b 0x7A
    lda.b 0x11
    and.b #0x3F
    ora.b 0x69
    sta.b 0x11
    jsr _819DBE
    lda.b #0x1A
    clc
    adc.b 0x6F
    jsl _848EEA.8F07
.8745:
    dec.b 0x4E
    bmi .875D

    lda.b 0x59
    bne .8753

    lda.b 0x3B
    bit.b #0x40
    beq .8758

.8753:
    lda.b #0x1A
    jsr .942B
.8758:
    lda.b #0x3C
    jmp .9560

.875D:
    lda.b #0x04
    sta.b 0x03
    lda.b #0x08
    sta.b 0x4E
    jsr .882D
    jsr .992A
    rep #0x20
    lda.w #0x0178
    ldx.b 0x56
    beq .877F

    ldx.b 0x6C
    bne .877F

    ldx.b #0x10
    stx.b 0x55
    lda.w #0x0375
.877F:
    sta.b 0x5C
    bit.b 0x68
    bvs .8789

    eor.w #0xFFFF
    inc
.8789:
    sta.b 0x1A
    sep #0x20
    jmp 0x81882D

.8790:
    lda.b 0x59
    bne .879A

    lda.b 0x3B
    bit.b #0x40
    beq .879F

.879A:
    lda.b #0x1A
    jsr .93A8
.879F:
    lda.b 0x5E
    bit.b #0x08
    beq .87BC

    jsr _819E97
    beq .87B9

    lda.b #0x06
    sta.b 0x03
    lda.b #0x02
    sta.b 0x84
    lda.b #0x0F
    jsl 0x84A333
    rts

.87B9:
    jmp 0x819658

.87BC:
    lda.b 0x3B
    bit.b #0x80
    beq .87FC

    lda.b 0x2C
    bpl .87D0

    and.b #0x40
    tay
    stz.b 0x81
    inc.b 0x81
    jmp .9687

.87D0:
    jsl 0x849958
    bcs .87FC

    jsl 0x849A24
    bcc .87FC

    cmp.b #0x3E
    beq .87EE

    cmp.b #0x3F
    beq .87F5

    bvc .87EB

    phy
    jsr .98F2
    ply
.87EB:
    jmp .9687

.87EE:
    lda.b 0x8A
    bne .87EB

    jmp .967C

.87F5:
    lda.b 0x8A
    bne .87EB

    jmp .96CB

.87FC:
    dec.b 0x4E
    bne .881B

    lda.b 0x37
    bit.b #0x80
    beq .8818

    lda.b #0x06
    sta.b 0x02
    lda.b #0x02
    sta.b 0x03
    lda.b #0x03
    clc
    adc.b 0x6F
    jsl _848EEA.8F07
    rts

.8818:
    jmp 0x819658

.881B:
    jsl update_pos_xy.neg_ay_ax
    lda.b #0x3C
    jmp 0x819536

.8824:
    dec.b 0x84
    bne .882C

    lda.b #0x04
    sta.b 0x03
.882C:
    rts

.882D:
    lda.b 0x69
    eor.b #0x40
    sta.b 0x69
    rts

.8834:
    ldx.b 0x03
    jmp (.8839,X)

.8839: d16[.883D, .886A]

.883D:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x07
    jsl _80888B.88B6
    jsr .992A
    lda.b #0x08
    sta.b 0x77
    lda.b 0x69
    sta.b 0x4E
    rep #0x20
    lda.w #0x0178
    sta.b 0x5C
    lda.b 0x1C
    sta.b 0x61
    stz.b 0x79
    sep #0x20
    lda.b #0x17
    clc
    adc.b 0x6F
    jsl _848EEA.8F07
.886A:
    lda.b 0x59
    bne .8874

    lda.b 0x3B
    bit.b #0x40
    beq .8879

.8874:
    lda.b #0x17
    jsr .93A8
.8879:
    lda.b #0x39
    jsr .9536
    lda.b 0x0F
    and.b #0x40
    sta.w 0x0000
    lda.b 0x4E
    eor.w 0x0000
    sta.b 0x69
    lda.b 0x11
    and.b #0x3F
    ora.b 0x69
    sta.b 0x11
    lda.b 0x3B
    bit.b #0x80
    beq .88BC

    lda.b 0x4E
    sta.b 0x4F
    jsr _819CD3
    bne .88A6

    jsr .98F2
.88A6:
    jsl 0x849A24
    lda.b 0x2C
    bit.b #0x03
    beq .88B4

    lda.b #0x01
    sta.b 0x81
.88B4:
    lda.b 0x4E
    eor.b #0x40
    tay
    jmp .9687

.88BC:
    lda.b 0x5E
    bit.b #0x04
    beq .88C5

    jmp 0x8195CC

.88C5:
    lda.b 0x37
    and.b #0x03
    bit.b 0x5E
    beq .88D3

    lda.b 0x2D
    cmp.b #0x36
    bne .88D6

.88D3:
    jmp 0x819658

.88D6:
    lda.b 0x8A
    bne .88EB

    jsr _819CD3
    cmp.b #0x3E
    bne .88E4

    jmp 0x81967C

.88E4:
    cmp.b #0x3F
    bne .88EB

    jmp .96CB

.88EB:
    lda.b 0x61
    sta.b 0x1C
    lda.b 0x62
    sta.b 0x1D
    lda.b 0x77
    beq .88FD

    dec.b 0x77
    stz.b 0x1C
    stz.b 0x1D
.88FD:
    jsl update_pos_xy.no_accel
    jmp .9BB5

.8904:
    ldx.b 0x03
    jmp (.8909,X)

.8909: d16[.890D, .8943]

.890D:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x75
    jsr .992A
    lda.b #0x08
    jsl _80888B.88B6
    jsr .9588
    lda.b #0x13
    clc
    adc.b 0x6F
    jsl _848EEA.8F07
    lda.b #0x10
    sta.b 0x55
    rep #0x20
    lda.w #0x0375
    sta.b 0x5C
    lda.w #0xBB3B
    sta.b 0x20
    lda.w #0xA597
    sta.b 0x31
    sep #0x20
    lda.b #0x20
    sta.b 0x52
.8943:
    jsr _819C0B
    lda.b 0x59
    bne .8950

    lda.b 0x3B
    bit.b #0x40
    beq .8955

.8950:
    lda.b #0x13
    jsr .93A8
.8955:
    lda.b 0x3B
    bit.b #0x80
    beq .8967

    jsl 0x849958
    bcs .8967

    jsr _819E04
    jmp .95E2

.8967:
    lda.b 0x5E
    bit.b #0x04
    bne .8973

    jsr _819E04
    jmp .9658

.8973:
    lda.b #0x01
    bit.b 0x69
    bvs .897B

    lda.b #0x02
.897B:
    bit.b 0x5E
    bne .8984

    jsr _819D1A
    bne .8987

.8984:
    jmp .9709

.8987:
    jsl update_pos_x
    dec.b 0x52
    bpl .8992

    jmp .9709

.8992:
    bit.b 0x0F
    bvc .899B

    lda.b #0x01
    jsr _819C66
.899B:
    lda.b #0x35
    jmp .9536

.89A0:
    ldx.b 0x03
    bne .89C1

    inc.b 0x03
    rep #0x20
    lda.w #0x0178
    sta.b 0x5C
    lda.w #0xA555
    sta.b 0x20
    sep #0x20
    lda.b #0x08
    sta.b 0x4E
    lda.b #0x16
    clc
    adc.b 0x6F
    jsl _848EEA.8F07
.89C1:
    lda.b 0x59
    bne .89CB

    lda.b 0x3B
    bit.b #0x40
    beq .89D0

.89CB:
    lda.b #0x16
    jsr .942B
.89D0:
    dec.b 0x4E
    bne .89D9

    stz.b 0x4F
    jmp .95CC

.89D9:
    lda.b 0x3B
    bit.b #0x80
    beq .89E2

    jmp .95E2

.89E2:
    lda.b 0x37
    bit.b #0x03
    beq .89EB

    jmp .95D7

.89EB:
    lda.b #0x29
    jmp .9560

.89F0:
    ldx.b 0x03
    jmp (.89F5,X)

.89F5: d16[.89FB, .8A1B, .8A39]

.89FB:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x2B
    stz.b 0x2C
    rep #0x20
    stz.b 0x1A
    lda.w #0xF800
    sta.b 0x1C
    sep #0x20
    lda.b #0x0E
    jsl _80888B.88B6
    lda.b #0x47
    jsl _848EEA.8F07
    rts

.8A1B:
    lda.b 0x64
    beq .8A21

    dec.b 0x64
.8A21:
    lda.b 0x5E
    bit.b #0x04
    beq .8A34

    lda.b #0x04
    sta.b 0x03
    stz.b 0x64
    lda.b #0x48
    jsl _848EEA.8F07
    rts

.8A34:
    jsl update_pos_xy.no_accel
    rts

.8A39:
    lda.b 0x0F
    bpl .8A40

    jmp .95CC

.8A40:
    jsl _848EEA
    rts

.8A45:
    ldx.b 0x03
    jmp (.8A4A,X)

.8A4A: d16[.8A52, .8A88, .8B02, .8B30]

.8A52:
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    lda.w #0x0101
    sta.w 0x1F13
    sta.w 0x1F15
    sta.w 0x1F17
    lda.w #0xA597
    sta.b 0x31
    sep #0x20
    sta.w 0x1F19
    jsr _819E85
    stz.b 0x6B
    stz.b 0x58
    lda.b #0x1E
    sta.b 0x8B
    sta.b 0x64
    jsr _819E0E
    jsr .9588
    lda.b #0x44
    jsl _848EEA.8F07
.8A87:
    rts

.8A88:
    lda.b 0x8B
    cmp.b #0x02
    bne .8A92

    lda.b #0x0E
    trb.b 0x11
.8A92:
    dec.b 0x8B
    bne .8A87

    lda.b #0x04
    sta.b 0x03
    lda.b #0x0A
    jsl _80888B.88B6
    stz.b 0x19
    stz.b 0x0E
    stz.w 0x0C38
    stz.w 0x0C58
    stz.w 0x0C78
    stz.w 0x1F13
    stz.w 0x1F14
    stz.w 0x1F15
    stz.w 0x1F16
    stz.w 0x1F17
    stz.w 0x1F18
    stz.w 0x1F19
    lda.b #0x3C
    sta.b 0x4F
    lda.b #0xA0
    sta.b 0x8B
    ldy.b #0x04
    jsl _808A64
    stz.w 0x0000
.8AD3:
    rep #0x10
    ldy.w #0x0007
.8AD8:
    jsl 0x8282D3
    bne .8AFF

    inc.w 0x0000,X
    lda.b #0x0E
    sta.w 0x000A,X
    tya
    clc
    adc.w 0x0000
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    dey
    bpl .8AD8

.8AFF:
    sep #0x10
    rts

.8B02:
    dec.b 0x4F
    bne .8B0D

    lda.b #0x03
    sta.b 0x4F
    jsr _819C85
.8B0D:
    lda.b 0x8B
    cmp.b #0x01
    bcc .8B1F

    and.b #0x1F
    bne .8B1F

    lda.b #0x08
    sta.w 0x0000
    jsr .8AD3
.8B1F:
    dec.b 0x8B
    bne .8B30

    lda.b #0x06
    sta.b 0x03
    inc.w 0x1F0B
    stz.w 0x1F0E
    stz.w 0x1F0F
.8B30:
    rts

.8B31:
    ldx.b 0x03
    bne .8B3E

    inc.b 0x03
    lda.b #0x45
    jsl _848EEA.8F07
    rts

.8B3E:
    jsl _848EEA
    rts

.8B43:
    rts

.8B44:
    lda.b 0x2F
    bne .8B43

    jsl _848EEA
    rts

.8B4D:
    ldx.b 0x03
    jmp (.8B52,X)

.8B52: d16[.8B58, .8B7C, .8B94]

.8B58:
    lda.b #0x22
    sta.b 0x6F
    lda.b 0x5E
    bit.b #0x04
    bne .8B6F

    lda.b #0x02
    sta.b 0x03
    lda.b #0x28
    jsl _848EEA.8F07
    jmp .992A

.8B6F:
    lda.b #0x04
    sta.b 0x03
    stz.b 0x2F
    lda.b #0x22
    jsl _848EEA.8F07
    rts

.8B7C:
    lda.b 0x5E
    bit.b #0x04
    beq .8B8F

    lda.b #0x04
    sta.b 0x03
    stz.b 0x2F
    lda.b #0x22
    jsl _848EEA.8F07
    rts

.8B8F:
    jsl update_pos_xy.neg_ay_ax
    rts

.8B94:
    lda.b 0x02
    cmp.b #0x46
    beq .8BA2

    lda.b 0x5E
    bit.b #0x04
    bne .8BA2

    stz.b 0x03
.8BA2:
    jsl _848EEA
    rts

.8BA7:
    ldx.b 0x03
    jmp (.8BAC,X)

.8BAC: d16[.8BBC, .8C25, .8C35, .8C8B, .8CAA, .8CD1, .8CF1, .8D17]

.8BBC:
    rep #0x20
    lda.w #0xFFE0
    sta.w 0x1E70
    sta.w 0x1E74
    lda.w #0x0120
    sta.w 0x1E72
    sta.w 0x1E76
    sep #0x20
    inc.b 0x30
    jsr _819E85
    stz.b 0x5B
    lda.b 0x2B
    bit.b #0x04
    bne .8BF1

    lda.b #0x02
    sta.b 0x03
    rep #0x20
    jsr .992A
    sep #0x20
    lda.b #0x28
    jsl _848EEA.8F07
    rts

.8BF1:
    lda.b #0x04
    sta.b 0x03
    rep #0x20
    ldx.b #0x00
    lda.b 0x05
    sec
    sbc.w 0x1E4D
    cmp.w #0x0080
    bpl .8C06

    ldx.b #0x40
.8C06:
    stx.b 0x69
    lda.w #0x0178
    bit.b 0x68
    bvs .8C12

    lda.w #0xFE88
.8C12:
    sta.b 0x1A
    lda.w #0xA597
    sta.b 0x31
    sep #0x20
    jsr .9588
    lda.b #0x2B
    jsl _848EEA.8F07
    rts

.8C25:
    lda.b 0x2B
    bit.b #0x04
    beq .8C30

    stz.b 0x03
    stz.b 0x2F
    rts

.8C30:
    jsl update_pos_xy.neg_ay_ax
    rts

.8C35:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x1E4D
    sec
    sbc.w #0x0080
    bpl .8C47

    eor.w #0xFFFF
    inc
.8C47:
    cmp.w #0x0002
    sep #0x20
    bpl .8C82

    lda.b #0x06
    sta.b 0x03
    sta.b 0x64
    lda.l 0x001F26
    beq .8C6B

    lda.w 0x1F7A
    cmp.b #0x09
    bcs .8C73

    lda.w 0x1FA0
    bne .8C6B

    lda.w 0x1F7A
    bne .8C73

.8C6B:
    lda.b #0x20
    sta.b 0x8B
    stz.b 0x8C
    bra .8C7B

.8C73:
    lda.b #0x68
    sta.b 0x8B
    lda.b #0x01
    sta.b 0x8C
.8C7B:
    lda.b #0x22
    jsl _848EEA.8F07
    rts

.8C82:
    jsl update_pos_x
    jsl _848EEA
    rts

.8C8B:
    lda.b #0x08
    sta.b 0x03
    lda.l 0x001F26
    beq .8CA9

    lda.w 0x1F7A
    beq .8CA9

    cmp.b #0x09
    bcs .8CA3

    lda.w 0x1FA0
    bne .8CA9

.8CA3:
    lda.b #0x21
    jsl _80878B
.8CA9:
    rts

.8CAA:
    rep #0x20
    dec.b 0x8B
    sep #0x20
    bne .8CD0

    lda.l 0x001F26
    beq .8CD5

    lda.w 0x1F7A
    beq .8CD5

    cmp.b #0x09
    bcs .8CC6

    lda.w 0x1FA0
    bne .8CD5

.8CC6:
    lda.b #0x0A
    sta.b 0x03
    lda.b #0x4E
    jsl _848EEA.8F07
.8CD0:
    rts

.8CD1:
    lda.b 0x0F
    bpl .8CE0

.8CD5:
    lda.b #0x0C
    sta.b 0x03
    lda.b #0x49
    jsl _848EEA.8F07
    rts

.8CE0:
    lsr
    bcc .8CEC

    lda.b #0x2D
    jsl _80888B.88B6
    jsr .9A89
.8CEC:
    jsl _848EEA
    rts

.8CF1:
    lda.b 0x0F
    bpl .8D12

    lda.b #0x0E
    sta.b 0x03
    inc.b 0x64
    lda.b #0x0F
    jsl _80888B.88B6
    rep #0x20
    stz.b 0x1A
    lda.w #0x0AA6
    sta.b 0x1C
    sep #0x20
    lda.b #0x47
    jsl _848EEA.8F07
.8D12:
    jsl _848EEA
.8D16:
    rts

.8D17:
    jsl update_pos_xy.no_accel
    jsl 0x82806E
    bcc .8D16

    lda.b #0xFF
    sta.w 0x1F23
    jmp .96C2

.8D29:
    ldx.b 0x03
    bne .8D59

    inc.b 0x03
    rep #0x21
    lda.b 0x86
    and.w #0x00FF
    bit.w #0x0080
    beq .8D3E

    ora.w #0xFF00
.8D3E:
    adc.b 0x05
    sta.b 0x05
    lda.b 0x05
    and.w #0xFFF0
    clc
    adc.w #0x0008
    sta.b 0x05
    stz.b 0x79
    sep #0x20
    stz.b 0x50
    lda.b #0x40
    jsl _848EEA.8F07
.8D59:
    lda.b 0x0F
    bpl .8D64

    lda.b 0x4E
    sta.b 0x02
    stz.b 0x03
    rts

.8D64:
    lda.b #0x40
    jmp .9560

.8D69:
    ldx.b 0x03
    bne .8D8E

    inc.b 0x03
    rep #0x21
    lda.b 0x08
    and.w #0xFFF0
    adc.w #0xFFF9
    sta.b 0x08
    lda.w #0x0200
    sta.b 0x1C
    sep #0x20
    stz.b 0x50
    lda.b #0x04
    sta.b 0x4E
    lda.b #0x41
    jsl _848EEA.8F07
.8D8E:
    jsl update_pos_y
    lda.b 0x4E
    bne .8DA8

    stz.b 0x1C
    stz.b 0x1D
    lda.b 0x0F
    bpl .8DA3

    stz.b 0x64
    jmp .95CC

.8DA3:
    lda.b #0x41
    jmp .9560

.8DA8:
    dec.b 0x4E
    rts

.8DAB:
    ldx.b 0x03
    bne .8DC7

    inc.b 0x03
    rep #0x21
    lda.b 0x05
    and.w #0xFFF0
    adc.w #0x0008
    sta.b 0x05
    sep #0x20
    stz.b 0x50
    lda.b #0x42
    jsl _848EEA.8F07
.8DC7:
    lda.b 0x0F
    bpl .8DDC

    rep #0x21
    lda.b 0x08
    adc.w #0x0018
    sta.b 0x08
    sep #0x20
    jsr .9700
    jmp .8DE1

.8DDC:
    lda.b #0x42
    jmp .9560

.8DE1:
    ldx.b 0x03
    bne .8E04

    inc.b 0x03
    inc.b 0x64
    stz.b 0x5E
    stz.b 0x2B
    stz.b 0x2C
    jsr .992A
    rep #0x20
    lda.w #0x0178
    sta.b 0x5C
    sep #0x20
    lda.b #0x21
    clc
    adc.b 0x6F
    jsl _848EEA.8F07
.8E04:
    lda.b 0x59
    bne .8E0E

    lda.b 0x3B
    bit.b #0x40
    beq .8E16

.8E0E:
    jsr .9576
    lda.b #0x21
    jsr .942B
.8E16:
    rep #0x10
    stz.b 0x1C
    stz.b 0x1D
    ldx.w #0xFE88
    lda.b 0x37
    bit.b #0x0C
    beq .8E2E

    bit.b #0x04
    bne .8E2C

    ldx.w #0x0178
.8E2C:
    stx.b 0x1C
.8E2E:
    sep #0x10
    stz.b 0x29
    stz.b 0x2A
    jsr _819D70
    cmp.b #0x00
    beq .8E4E

    cmp.b #0x13
    bne .8E48

    lda.b 0x37
    bit.b #0x08
    beq .8E48

    jmp .96EE

.8E48:
    lda.b 0x3B
    bit.b #0x80
    beq .8E53

.8E4E:
    stz.b 0x64
    jmp .9658

.8E53:
    lda.b #0x10
    sta.b 0x2A
    jsr _819D70
    cmp.b #0x3B
    bne .8E63

    stz.b 0x64
    jmp .95CC

.8E63:
    lda.b 0x50
    bpl .8E6F

    lda.b 0x1D
    beq .8E74

    jsl update_pos_y
.8E6F:
    lda.b #0x43
    jmp .9560

.8E74:
    rts

.8E75:
    ldx.b 0x03
    bne .8E81

    inc.b 0x03
    lda.b 0x7B
    jsl _848EEA.8F07
.8E81:
    jsl _848EEA
    rts

.8E86:
    ldx.b 0x03
    jmp (.8E8B,X)

.8E8B: d16[.8E91, .8EBF, .8F28]

.8E91:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x08
    sta.b 0x2F
    lda.w 0x1F7A
    cmp.b #0x09
    bne .8EA4

    lda.b #0x40
    sta.b 0x69
.8EA4:
    stz.b 0x5B
    stz.b 0x58
    jsr _819E85
    lda.b #0x97
    sta.b 0x31
    lda.b #0xA5
    sta.b 0x32
    jsr .9588
    lda.b #0x44
    jsl _848EEA.8F07
    jmp .992A

.8EBF:
    lda.b 0x0F
    bpl .8EED

    lda.b 0x5E
    bit.b #0x04
    beq .8EED

    lda.b #0x07
    jsl _80888B.88B6
    lda.b #0x04
    sta.b 0x03
    lda.b #0x02
    tsb.b 0x11
    lda.b #0x80
    tsb.b 0x7E
    jsr .95AA
    lda.b #0x86
    sta.b 0x31
    lda.b #0xA8
    sta.b 0x32
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.8EED:
    jsl _848EEA
    lda.b 0x5E
    bit.b #0x04
    beq .8EFD

    stz.b 0x2F
    stz.b 0x1C
    stz.b 0x1D
.8EFD:
    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.w #0xFA80
    cmp.b 0x1C
    bmi .8F0C

    sta.b 0x1C
.8F0C:
    sep #0x20
    lda.b #0x02
    bit.b 0x0F
    bvc .8F16

    lda.b #0x00
.8F16:
    ldx.w 0x1F7A
    ora.w 0x86BAC5,X
    sta.b 0x11
    lda.b 0x0F
    lsr
    bcc .8F28

    lda.b #0x00
    jmp 0x819C66

.8F28:
    rts

.8F29:
    ldx.b 0x03
    bne .8F40

    inc.b 0x03
    jsr .95AA
    lda.b #0x86
    sta.b 0x31
    lda.b #0xA8
    sta.b 0x32
    lda.b #0x00
    jsl _848EEA.8F07
.8F40:
    rts

.8F41:
    ldx.b 0x03
    bne .8F4D

    inc.b 0x03
    lda.b #0x02
    jsl _848EEA.8F07
.8F4D:
    rts

.8F4E:
    ldx.b 0x03
    jmp (.8F53,X)

.8F53: d16[.8F5B, .8F78, .8F8D, .8FB3]

.8F5B:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x30
    rep #0x20
    lda.w #0xA597
    sta.b 0x31
    sep #0x20
    lda.b #0x05
    sta.b 0x8B
    jsr .9588
    lda.b #0x4E
    jsl _848EEA.8F07
    rts

.8F78:
    dec.b 0x8B
    bne .8F8C

    lda.b #0x04
    sta.b 0x03
    lda.b #0x02
    sta.b 0x8B
    jsl 0x84A28B
    jml 0x81A02D

.8F8C:
    rts

.8F8D:
    dec.b 0x8B
    bne .8FB2

    lda.b #0x02
    sta.b 0x8B
    lda.b #0x0C
    jsl _80888B.88B6
    inc.b 0x27
    lda.b 0x27
    cmp.w 0x1F9A
    bcc .8FAE

    lda.b #0x06
    sta.b 0x03
    lda.b #0x22
    jsl _848EEA.8F07
.8FAE:
    lda.b #0x80
    tsb.b 0x27
.8FB2:
    rts

.8FB3:
    rts

.8FB4:
    ldx.b 0x03
    jmp (.8FB9,X)

.8FB9: d16[.8FBF, .8FDE, .8FF2]

.8FBF:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x30
    stz.b 0x6E
    rep #0x20
    lda.w #0xA597
    sta.b 0x31
    sep #0x20
    lda.b #0xC8
    sta.b 0x8B
    jsr .9588
    lda.b #0x22
    jsl _848EEA.8F07
    rts

.8FDE:
    dec.b 0x8B
    bne .8FED

    lda.b #0x04
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x8B
    stz.b 0x8C
    rts

.8FED:
    lda.b #0x40
    tsb.b 0x8C
    rts

.8FF2:
    dec.b 0x8B
    bne .8FFF

    stz.w 0x1F31
    stz.w 0x1F3B
    jmp .95CC

.8FFF:
    lda.b 0x59
    beq .9008

    lda.b #0x00
    jsr .942B
.9008:
    lda.b #0x22
    jmp .9560

.900D:
    ldx.b 0x03
    jmp (.9012,X)

.9012: d16[.9018, .9025, .9045]

.9018:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x50
    lda.b #0x4F
    jsl _848EEA.8F07
    rts

.9025:
    lda.b 0x0F
    bpl .9040

    lda.b #0x04
    sta.b 0x03
    lda.b #0x50
    jsl _848EEA.8F07
    lda.b 0x33
    bne .9040

    lda.b #0xAF
    jsl _80888B.88B6
    jmp 0x81A10A

.9040:
    jsl _848EEA
    rts

.9045:
    lda.b 0x0F
    bpl .904C

    jmp .95CC

.904C:
    jsl _848EEA
    rts

.9051:
    ldx.b 0x03
    jmp (.9056,X)

.9056: d16[.9062, .9093, .90DE, .912B, .914B, .917B]

.9062:
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    stz.b 0x36
    stz.b 0x38
    stz.b 0x3A
    lda.w #0x00C0
    sta.w 0x1E74
    lda.w #0x00C0
    sta.w 0x1E76
    lda.w #0xFED0
    sta.b 0x1A
    sep #0x20
    lda.b #0x2B
    jsl _848EEA.8F07
    lda.b #0xDF
    jsl _80E9F6
    lda.b #0x01
    sta.w 0x1F34
    rts

.9093:
    lda.w 0x0060
    bne .90BE

    rep #0x20
    lda.w 0x1E4D
    sta.w 0x1E5E
    lda.w #0xFC8B
    sta.b 0x1A
    sep #0x20
    lda.b #0x04
    sta.b 0x03
    lda.b #0x40
    sta.b 0x8C
    stz.b 0x75
    lda.b #0x08
    jsl _80888B.88B6
    lda.b #0x35
    jsl _848EEA.8F07
    rts

.90BE:
    lda.w 0x1F3C
    cmp.b #0x0C
    bne .90CD

    ldy.b #0x01
    lda.b #0xF6
    jsl _808850.8868
.90CD:
    cmp.b #0x0D
    bne .90D5

    lda.b #0x40
    sta.b 0x8C
.90D5:
    jsl update_pos_x
    jsl _848EEA
    rts

.90DE:
    lda.b #0x40
    sta.b 0x8C
    rep #0x21
    lda.w 0x1E4D
    adc.w #0x0088
    cmp.b 0x05
    sep #0x20
    bcc .9116

    lda.b #0x06
    sta.b 0x03
    stz.b 0x8C
    stz.b 0x37
    lda.b #0x15
    jsl _848EEA.8F07
    lda.b #0x05
    jsl _80888B.88B6
    stz.w 0x00C9
    lda.b #0x2F
    sta.w 0x00CA
    stz.w 0x00CB
    stz.w 0x00CC
    stz.w 0x00CD
    rts

.9116:
    jsr _819C0B
    jsl update_pos_x
    bit.b 0x0F
    bvc .9126

    lda.b #0x01
    jsr _819C66
.9126:
    jsl _848EEA
    rts

.912B:
    lda.w 0x0B9C
    lsr
    bcc .914A

    inc.w 0x00CB
    inc.w 0x00CC
    inc.w 0x00CD
    lda.w 0x00CD
    cmp.b #0x1F
    bne .914A

    lda.b #0x08
    sta.b 0x03
    lda.b #0x04
    tsb.w 0x00A2
.914A:
    rts

.914B:
    lda.w 0x00CB
    bne .916C

    lda.b #0x0A
    sta.b 0x03
    lda.b #0x80
    sta.w 0x00C9
    lda.b #0xA0
    sta.w 0x00CA
    lda.b #0x1F
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    jmp 0x81A11D

.916C:
    lda.w 0x0B9C
    lsr
    bcc .917B

    dec.w 0x00CB
    dec.w 0x00CC
    dec.w 0x00CD
.917B:
    rts

.917C:
    ldx.b 0x03
    jmp (.9181,X)

.9181: d16[.918B, .919B, .91B1, .91C7, .91D8]

.918B:
    lda.w 0x1F3C
    beq .919A

    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    jsl _848EEA.8F07
.919A:
    rts

.919B:
    lda.w 0x1F3C
    cmp.b #0x02
    bne .91AC

    lda.b #0x04
    sta.b 0x03
    lda.b #0x01
    jsl _848EEA.8F07
.91AC:
    jsl _848EEA
    rts

.91B1:
    lda.w 0x1F3C
    cmp.b #0x03
    bne .91C2

    lda.b #0x06
    sta.b 0x03
    lda.b #0x03
    jsl _848EEA.8F07
.91C2:
    jsl _848EEA
    rts

.91C7:
    lda.w 0x1F3C
    cmp.b #0x05
    bne .91D8

    lda.b #0x08
    sta.b 0x03
    lda.b #0x04
    jsl _848EEA.8F07
.91D8:
    jsl _848EEA
    rts

.91DD:
    ldx.b 0x03
    jmp (.91E2,X)

.91E2: d16[.91E8, .91F3, .922D]

.91E8:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x49
    jsl _848EEA.8F07
    rts

.91F3:
    lda.b 0x0F
    bpl .9228

    lda.b #0x04
    sta.b 0x03
    sta.b 0x64
    sta.b 0x30
    lda.b #0x0F
    jsl _80888B.88B6
    rep #0x20
    stz.b 0x1A
    lda.w #0x0AA6
    sta.b 0x1C
    lda.w 0x1E4D
    sta.w 0x1E5E
    sta.w 0x1E60
    lda.w 0x1E50
    sta.w 0x1E68
    sta.w 0x1E6E
    sep #0x20
    lda.b #0x47
    jsl _848EEA.8F07
.9228:
    jsl _848EEA
.922C:
    rts

.922D:
    jsl update_pos_y
    jsl 0x82806E
    bcc .922C

    lda.b #0xFF
    sta.w 0x1F23
    jmp .96C2

.923F:
    ldx.b 0x03
    jmp (.9244,X)

.9244: d16[.924E, .9271, .929D, .92BE, .92CE]

.924E:
    lda.b #0x09
    jsl _80888B.88B6
    lda.b #0x4A
    jsl _848EEA.8F07
    lda.b #0x80
    tsb.b 0x87
    jsr .992A
    lda.b 0x5E
    bit.b #0x04
    beq .926C

    lda.b #0x08
    sta.b 0x03
    rts

.926C:
    lda.b #0x02
    sta.b 0x03
    rts

.9271:
    lda.b 0x5E
    bit.b #0x04
    beq .9294

    lda.b #0x04
    sta.b 0x03
    lda.b #0x4B
    jsl _848EEA.8F07
    lda.b #0x07
    jsl _80888B.88B6
    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    lsr
    sta.b 0x1C
    sep #0x20
.9294:
    jsl update_pos_xy.neg_ay_ax
    jsl _848EEA
    rts

.929D:
    lda.b 0x5E
    bit.b #0x04
    beq .92B5

    lda.b #0x06
    sta.b 0x03
    lda.b #0x07
    jsl _80888B.88B6
    stz.b 0x2F
    lda.b #0x4C
    jsl _848EEA.8F07
.92B5:
    jsl update_pos_xy.neg_ay_ax
    jsl _848EEA
    rts

.92BE:
    dec.b 0x85
    bne .92C9

    lda.b #0x80
    trb.b 0x87
    jmp .95CC

.92C9:
    jsl _848EEA
    rts

.92CE:
    lda.b 0x0F
    bpl .92E4

    lda.b #0x04
    sta.b 0x03
    lda.b #0x4B
    jsl _848EEA.8F07
    lda.b #0x60
    sta.b 0x1C
    lda.b #0x03
    sta.b 0x1D
.92E4:
    jsl _848EEA
    rts

.92E9:
    ldx.b 0x03
    bne .92F6

    inc.b 0x03
    lda.b #0x4E
    jsl _848EEA.8F07
    rts

.92F6:
    lda.b 0x0F
    bpl .92FD

    jmp .95CC

.92FD:
    lsr
    bcc .9309

    lda.b #0x2D
    jsl _80888B.88B6
    jsr .9A89
.9309:
    jsl _848EEA
    rts

.930E:
    ldx.b 0x03
    jmp (.9313,X)

.9313: d16[.931D, .9339, .9349, .9377, .93A7]

.931D:
    lda.b #0x22
    sta.b 0x6F
    lda.b 0x5E
    bit.b #0x04
    bne .9334

    lda.b #0x02
    sta.b 0x03
    lda.b #0x28
    jsl _848EEA.8F07
    jmp 0x81992A

.9334:
    lda.b #0x04
    sta.b 0x03
    rts

.9339:
    lda.b 0x5E
    bit.b #0x04
    beq .9344

    lda.b #0x04
    sta.b 0x03
    rts

.9344:
    jsl update_pos_xy.neg_ay_ax
    rts

.9349:
    lda.b #0x06
    sta.b 0x03
    stz.b 0x2F
    lda.b #0x2B
    jsl _848EEA.8F07
    rep #0x30
    ldx.w #0x0178
    lda.b 0x05
    sec
    sbc.w 0x1E4D
    cmp.w #0x0030
    bcc .9368

    ldx.w #0xFE88
.9368:
    stx.b 0x1A
    sep #0x30
    lda.b #0x00
    bit.b 0x1B
    bmi .9374

    lda.b #0x40
.9374:
    sta.b 0x69
    rts

.9377:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x1E4D
    sec
    sbc.w #0x0030
    bpl .9389

    eor.w #0xFFFF
    inc
.9389:
    cmp.w #0x0002
    sep #0x20
    bcs .939F

    lda.b #0x08
    sta.b 0x03
    lda.b #0x22
    jsl _848EEA.8F07
    lda.b #0x40
    sta.b 0x69
    rts

.939F:
    jsl update_pos_x
    jsl _848EEA
.93A7:
    rts

;-----

.93A8:
    sta.w 0x0000
    lda.b 0x35
    cmp.b 0x67
    bcs .9426

    lda.w 0x1F0D
    bne .9426

    lda.b 0x33
    cmp.b #0x08
    bne .93C0

    lda.b 0x7D
    bne .9426

.93C0:
    jsl 0x82833E
    bne .9426

    jsr .94A5
    beq .9426

    inc
    sta.w 0x1F0D
    jsr _819FFA
    bit.b 0x87
    bvc .93E0

    lda.b #0x40
    trb.b 0x87
    lda.b #0x17
    jsl _80888B.88B6
.93E0:
    stz.b 0x59
    lda.b 0x3D
    bne .9426

    inc.b 0x35
    inc.w 0x0000,X
    stz.w 0x000B,X
    jsr _819D3D
    lda.w 0x1F0D
    and.b #0xFF
    tay
    lda 0x86BB22,Y
    beq .9426

    lda.b #0x10
    sta.b 0x50
    stz.b 0x6F
    lda.b 0x13
    sta.w 0x0001
    phx
    lda.b 0x0F
    and.b #0x0F
    clc
    adc.w 0x0000
    jsl _848EEA.8F07
    plx
    lda.b 0x0F
    and.b #0x0F
    clc
    adc.w 0x0000
    asl
    sta.w 0x003C,X
    lda.w 0x0001
    sta.b 0x13
.9426:
    sep #0x10
    stz.b 0x59
    rts

;-----

.942B:
    sta.w 0x0000
    lda.l _809D9D.9E5E ;could this be a copy protection check?
    cmp.l .853A
    beq .943D

    lda.b #0x80
    tsb.w 0x1F9E
.943D:
    lda.b 0x35
    cmp.b 0x67
    bcs .94A0

    lda.w 0x1F0D
    bne .94A0

    lda.b 0x33
    cmp.b #0x08
    bne .9452

    lda.b 0x7D
    bne .94A0

.9452:
    jsl 0x82833E
    bne .94A0

    jsr .94A5
    beq .94A0

    inc
    sta.w 0x1F0D
    jsr _819FFA
    bit.b 0x87
    bvc .9472

    lda.b #0x40
    trb.b 0x87
    lda.b #0x17
    jsl _80888B.88B6
.9472:
    lda.b 0x3D
    bne .94A0

    inc.b 0x35
    inc.w 0x0000,X
    stz.w 0x000B,X
    jsr _819D3D
    lda.w 0x1F0D
    and.b #0xFF
    tay
    lda 0x86BB22,Y
    beq .94A0

    lda.b #0x10
    sta.b 0x50
    stz.b 0x6F
    lda.w 0x0000
    asl
    sta.w 0x003C,X
    lda.w 0x0000
    jsl _848EEA.8F07
.94A0:
    sep #0x10
    stz.b 0x59
    rts

;-----

.94A5:
    lda.b 0x59
    beq .94B4

    cmp.b #0x01
    beq .94B4

    lda.b 0x7D
    beq .94B4

    lda.b #0x00
    rts

.94B4:
    txy
    lda.b 0x59
    lsr
    tax
    lda.w 0x86BA79,X
    sta 0x000A,Y
    bne .94CE

    lda.b 0x55
    beq .94CE

    lda.b 0x63
    bne .94CE

    lda.b #0x06
    sta 0x000A,Y
.94CE:
    lda.b 0x33
    beq .952F

    rep #0x20
    ldx.b 0x33
    lda.w 0x1F85,X
    bit.w #0x3F00
    beq .9533

    and.w #0x3FFF
    sec
    sbc.w 0x86BA95,X
    bpl .94EA

    lda.w #0x0000
.94EA:
    ora.w #0xC000
    sta.w 0x1F85,X
    stz.w 0x0004
    lda.b 0x59
    and.w #0x00FF
    cmp.w #0x0004
    bne .9518

    lda.w 0x1F85,X
    and.w #0x3FFF
    sec
    sbc.w 0x86BAA7,X
    bpl .950C

    lda.w #0x0000
.950C:
    ora.w #0xC000
    sta.w 0x1F85,X
    lda.w #0x0009
    sta.w 0x0004
.9518:
    sep #0x20
    lda.b 0x33
    cmp.b #0x02
    bne .9524

    tyx
    stz.w 0x000B,X
.9524:
    lsr
    clc
    adc.b #0x06
    clc
    adc.w 0x0004
    sta 0x000A,Y
.952F:
    lda 0x000A,Y
    tyx
.9533:
    sep #0x20
    rts

;-----

.9536:
    sta.w 0x0000
    lda.b 0x50
    bmi .955B

    dec.b 0x50
    bpl .955B

    lda.b #0x22
    sta.b 0x6F
    lda.b 0x13
    sta.w 0x0001
    lda.b 0x0F
    and.b #0x0F
    clc
    adc.w 0x0000
    jsl _848EEA.8F07
    lda.w 0x0001
    sta.b 0x13
.955B:
    jsl _848EEA
    rts

;-----

.9560:
    ldx.b 0x50
    bmi .9571

    dec.b 0x50
    bpl .9571

    jsl _848EEA.8F07
    lda.b #0x22
    sta.b 0x6F
    rts

.9571:
    jsl _848EEA
    rts

;-----

.9576:
    lda.b 0x37
    bit.b #0x02
    beq .957F

    stz.b 0x69
    rts

.957F:
    bit.b #0x01
    beq .9587

    lda.b #0x40
    sta.b 0x69
.9587:
    rts

;-----

.9588:
    ldx.b #0x00
    lda.w 0x1F99
    bit.b #0x01
    beq .9593

    ldx.b #0x18
.9593:
    stx.b 0x16
    lda.b #0x5D
    sta.w 0x0C48
    sta.w 0x0C68
    sta.w 0x0C88
    stz.w 0x0C39
    stz.w 0x0C59
    stz.w 0x0C79
    rts

;-----

.95AA:
    ldx.b #0x66
    lda.w 0x1F99
    bit.b #0x01
    beq .95B5

    ldx.b #0xA4
.95B5:
    stx.b 0x16
    lda.b #0xA5
    sta.w 0x0C48
    sta.w 0x0C68
    sta.w 0x0C88
    stz.w 0x0C39
    stz.w 0x0C59
    stz.w 0x0C79
    rts

;-----

.95CC:
    sep #0x30
    stz.b 0x55
    stz.b 0x2F
    stz.b 0x02
    stz.b 0x03
    rts

;-----

.95D7:
    sep #0x30
    stz.b 0x55
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.95E2:
    sep #0x30
    lda.b #0x08
    sta.b 0x2F
    lda.b 0x02
    cmp.b #0x04
    beq .9614

    lda.b 0x55
    bne .9646

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    jsr .992A
    rep #0x20
    lda.w #0x0178
    sta.b 0x5C
    lda.l 0x81853B
    cmp.w #0x1F9E
    beq .9611

    lda.w #0x0080
    tsb.w 0x1F9E
.9611:
    sep #0x20
    rts

.9614:
    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    rep #0x20
    lda.b 0x1A
    bpl .9624

    eor.w #0xFFFF
    inc
.9624:
    sta.b 0x5C
    cmp.w #0x01C8
    beq .9635

    cmp.w #0x0198
    beq .963A

    sep #0x20
    jmp 0x81992A

.9635:
    lda.w #0x0621
    bra .963D

.963A:
    lda.w #0x05C9
.963D:
    sta.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    rts

.9646:
    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    rep #0x20
    lda.w #0x0375
    sta.b 0x5C
    sep #0x20
    jmp 0x81992A

;-----

.9658:
    sep #0x30
    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
    lda.b #0x08
    sta.b 0x2F
    rts

;-----

.9665:
    sep #0x30
    lda.w 0x1F9E
.966A:
    bpl .966F

    stz.w 0x1F81
.966F:
    stz.b 0x55
    stz.b 0x6C
    lda.b #0x0A
    sta.b 0x02
    stz.b 0x03
    stz.b 0x2F
    rts

;-----

.967C:
    sep #0x30
    stz.b 0x6C
    lda.b #0x0E
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.9687:
    sep #0x30
    stz.b 0x55
    stz.b 0x6C
    tya
    eor.b #0x40
    sta.b 0x4F
    lda.b #0x10
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.9699:
    sep #0x30
    lda.w 0x1F9E
    bpl .96AC

    lda.b 0x27
    cmp.b #0x01
    beq .96AC

    dec.b 0x27
    lda.b #0x80
    tsb.b 0x27
.96AC:
    stz.b 0x55
    stz.b 0x2F
    stz.b 0x6C
    lda.b #0x12
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.96B9:
    sep #0x30
    lda.b #0x14
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.96C2:
    sep #0x30
    lda.b #0x18
    sta.b 0x02
    stz.b 0x03
.96CA:
    rts

;-----

.96CB:
    sep #0x30
    lda.b #0x80
    sta.b 0x27
    stz.b 0x6C
    lda.b #0x0C
    sta.b 0x02
    stz.b 0x03
    sta.b 0x30
    rts

;-----

.96DC:
    sep #0x30
    lda.b #0x1A
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.96E5:
    sep #0x30
    lda.b #0x24
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.96EE:
    sep #0x30
    lda.b #0x26
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.96F7:
    sep #0x30
    lda.b #0x28
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.9700:
    sep #0x30
    lda.b #0x2A
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.9709:
    sep #0x30
    lda.b #0x20
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.9712:
    lda.w 0x1F99
    bit.b #0x08
    beq .96CA

    lda.w 0x1F23
    bne .96CA

    ldx.b 0x54
    jmp (.9723,X)

.9723: d16[.9727, .9738]

.9727:
    lda.b 0x3B
    and.b #0x03
    beq .9737

    sta.b 0x53
    lda.b #0x02
    sta.b 0x54
    lda.b #0x0C
    sta.b 0x51
.9737:
    rts

.9738:
    lda.b 0x53
    bit.b 0x3B
    beq .9766

    lda.b 0x02
    cmp.b #0x02
    beq .9748

    cmp.b #0x08
    bne .9757

.9748:
    lda.b 0x2C
    bmi .9752

    jsl 0x849A24
    bcc .9757

.9752:
    lda.b #0x0A
    sta.b 0x56
    rts

.9757:
    jsr .976D
    bne .9766

    jsr .9576
    lda.b #0x40
    trb.b 0x7E
    jmp .96B9

.9766:
    dec.b 0x51
    bne .976C

    stz.b 0x54
.976C:
    rts

;-----

.976D:
    lda.b 0x02
    beq .9780

    cmp.b #0x02
    beq .9780

    cmp.b #0x04
    beq .9780

    cmp.b #0x0A
    beq .9780

.977D:
    lda.b #0x01
    rts

.9780:
    jsl 0x8499AF
    bcs .977D

    lda.b #0x00
.9788:
    rts

;-----

.9789:
    lda.w 0x1F99
    bit.b #0x08
    beq .9788

    lda.w 0x1F23
    bne .9788

    lda.b 0x3A
    bit.b #0x80
    beq .9788

    lda.b 0x02
    cmp.b #0x02
    beq .97AD

    cmp.b #0x08
    beq .97AD

    cmp.b #0x10
    beq .97AD

    cmp.b #0x12
    bne .97BC

.97AD:
    lda.b 0x2C
    bmi .97B7

    jsl 0x849A24
    bcc .97BC

.97B7:
    lda.b #0x0A
    sta.b 0x56
    rts

.97BC:
    jsr .976D
    bne .9788

    lda.b #0x40
    tsb.b 0x7E
    jmp .96B9

;-----

.97C8:
    lda.b 0x7D
    bne .97F8

    lda.b 0x27
    beq .97F8

    lda.w 0x1F99
    bit.b #0x02
    bne .97DB

    lda.b 0x33
    bne .97E4

.97DB:
    lda.b 0x7C
    bne .97E4

    lda.w 0x1F23
    beq .97F9

.97E4:
    bit.b 0x87
    bvc .97F2

    lda.b #0x40
    trb.b 0x87
    lda.b #0x17
    jsl _80888B.88B6
.97F2:
    stz.b 0x58
    stz.b 0x5B
    stz.b 0x5A
.97F8:
    rts

.97F9:
    lda.b 0x5B
    beq .9831

    lda.b 0x0E
    beq .9831

    dec.b 0x5A
    bne .9831

    lda.b #0x02
    sta.b 0x5A
    ldx.b 0x82
    rep #0x30
    ldy.w 0x86BAD5,X
    beq .981B

    ldx.w #0x0010
    jsl 0x828000
    bra .9829

.981B:
    lda.b 0x33
    and.w #0x00FF
    clc
    adc.w #0x0100
    tay
    jsl 0x828011
.9829:
    sep #0x30
    lda.b 0x82
    eor.b #0x02
    sta.b 0x82
.9831:
    lda.b 0x6E
    bne .97F8
    ldx.b 0x58
    jmp (.983A,X)

.983A: d16[.9840, .984F, .9880]

.9840:
    lda.b 0x37
    bit.b #0x40
    beq .984E

    lda.b #0x02
    sta.b 0x58
    lda.b #0xB4
    sta.b 0x57
.984E:
    rts

.984F:
    lda.b 0x37
    bit.b #0x40
    bne .985F

    stz.b 0x58
    jsr _819E85
    stz.b 0x5B
    stz.b 0x5A
    rts

.985F:
    dec.b 0x57
    lda.b 0x57
    cmp.b #0x96
    bne .984E

    lda.b #0x04
    sta.b 0x58
    lda.b #0x40
    tsb.b 0x87
    lda.b #0x03
    jsl _80888B.88B6
    lda.b #0x03
    sta.b 0x5B
    sta.b 0x5A
    stz.b 0x82
    jsr _819E34
.9880:
    lda.b 0x37
    bit.b #0x40
    bne .98AE

    lda.b #0x40
    trb.b 0x87
    lda.b #0x17
    jsl _80888B.88B6
    jsr .98D5
    beq .98A4

    lda.b 0x7D
    beq .989D

    lda.b #0x04
    sta.b 0x5B
.989D:
    ldx.b 0x5B
    lda.w 0x86BA74,X
    sta.b 0x59
.98A4:
    stz.b 0x58
    jsr _819E85
    stz.b 0x5B
    stz.b 0x5A
    rts

.98AE:
    lda.b 0x57
    beq .98D4

    dec.b 0x57
    ldy.b #0x00
    ldx.b #0x02
    cmp.b #0x50
    beq .98CE

    lda.w 0x1F99
    bit.b #0x02
    beq .98D4

    ldy.b #0x04
    ldx.b #0x01
    lda.b 0x57
    cmp.b #0x01
    beq .98CE

    rts

.98CE:
    stx.b 0x5B
    stx.b 0x5A
    sty.b 0x82
.98D4:
    rts

;-----

.98D5:
    lda.b 0x02
    cmp.b #0x0E
    beq .98F1

    cmp.b #0x16
    beq .98F1

    cmp.b #0x18
    beq .98F1

    cmp.b #0x22
    beq .98F1

    cmp.b #0x2E
    beq .98F1

    cmp.b #0x36
    beq .98F1

    cmp.b #0x42
.98F1:
    rts

;-----

.98F2:
    lda.w 0x1F99
    bit.b #0x08
    beq .9929

    rep #0x31
    lda.b 0x29
    and.w #0x00FF
    bit.w #0x0080
    beq .9908

    ora.w #0xFF00
.9908:
    adc.b 0x05
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0x0008
    sta.w 0x0002
    jsl 0x849129
    jsl _80B8D5
    sep #0x30
    jsr _819F08
    lda.b #0x23
    jsl _80888B.88B6
.9929:
    rts

;-----

.992A:
    lda.b 0x02
    sta.w 0x0000
    asl
    clc
    adc.w 0x0000
    tax
    rep #0x20
    lda.w 0x86B9B4,X
    bit.b 0x68
    bvs .9942

    eor.w #0xFFFF
    inc
.9942:
    sta.b 0x1A
    lda.w 0x86B9B6,X
    sta.b 0x1C
    sep #0x20
    lda.w 0x86B9B8,X
    sta.b 0x1E
    lda.l .8533 ;copy protection?
    cmp.l .966A
    beq .995F

    lda.b #0x80
    tsb.w 0x1F9E
.995F:
    rts

;-----

.9960:
    jsl 0x849ACD
    asl
    tax
    rep #0x20
    lda.w 0x86BA68,X
    bit.b 0x68
    bvs .9973

    eor.w #0xFFFF
    inc
.9973:
    sta.b 0x1A
    sep #0x20
    rts

;-----

.9978:
    php
    sep #0x30
    jsr .9576
    beq .998E

    rep #0x20
    lda.b 0x5C
    bit.b 0x68
    bvs .998C

    eor.w #0xFFFF
    inc
.998C:
    sta.b 0x1A
.998E:
    plp
    rts

;-----

.9990:
    jsr .local
    rtl

.local:
    lda.w 0x1F21
    cmp.b #0x01
    bne .99C6

    lda.b 0x2F
    bne .99C5

    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x1E4D
    lsr
    lsr
    and.w #0xFFFE
    dec
    dec
    and.w #0x003F
    tax
    lda.l 0x7EFE04,X
    and.w #0x0FFF
    sec
    sbc.w 0x1E50
    eor.w #0xFFFF
    inc
    sep #0x20
    sta.b 0x19
.99C5:
    rts

.99C6:
    stz.b 0x19
.99C8:
    rts

;-----

.99C9:
    lda.w 0x1F23
    bne .99C8

    lda.b 0x35
    bne .99C8

    lda.w 0x1F31
    bne .99C8

    lda.b 0x02
    cmp.b #0x18
    beq .99C8

    cmp.b #0x42
    beq .99C8

    lda.b 0x36
    and.b #0x30
    cmp.b #0x30
    beq .9A0A

    lda.b 0x3A
    bit.b #0x20
    beq .9A13

.99EF:
    lda.b 0x33
    beq .9A04

    cmp.b #0x02
    beq .9A0A

    dec.b 0x33
    dec.b 0x33
.99FB:
    ldx.b 0x33
    bit.w 0x1F86,X
    bvs .9A28

    bra .99EF

.9A04:
    lda.b #0x10
    sta.b 0x33
    bra .99FB

.9A0A:
    stz.b 0x33
    lda.b #0x04
    sta.w 0x1F12
    bra .9A3F

.9A13:
    bit.b #0x10
    beq .9A65

.9A17:
    lda.b 0x33
    cmp.b #0x10
    beq .9A0A

    inc.b 0x33
    inc.b 0x33
    ldx.b 0x33
    bit.w 0x1F86,X
    bvc .9A17

.9A28:
    ldx.w 0x1F7A
    lda.b #0x02
    ora.w 0x86BAC5,X
    sta.b 0x11
    stz.w 0x1F12
    lda.b 0x33
    clc
    adc.b #0x3E
    tay
    jsl _808A64
.9A3F:
    lda.b 0x33
    lsr
    tax
    lda.w 0x86BABB,X
    sta.b 0x67
    ldx.b #0x30
    lda.b 0x33
    clc
    adc.b #0x40
    tay
    jsl 0x828000
    rep #0x31
    lda.b 0x33
    and.w #0x00FF
    adc.w #0x0100
    tay
    jsl 0x828011
    sep #0x30
.9A65:
    rts

;-----

.9A66:
    lda.w 0x1F9A
    lsr
    lsr
    cmp.b 0x27
    bcc .9A74

    lda.b #0x1D
    sta.b 0x73
    rts

.9A74:
    lda.b 0x73
    beq .9A88

    lda.b 0x02
    beq .9A84

    cmp.b #0x18
    bne .9A86

    lda.b 0x6A
    bne .9A86

.9A84:
    stz.b 0x03
.9A86:
    stz.b 0x73
.9A88:
    rts

;-----

.9A89:
    ldy.b #0x16
    jsl _808A64
    jsl 0x8282D3
    bne .9ABF

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x2D
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b #0x30
    sta.l 0x7F839B
    lda.b #0x08
    sta.l 0x7F829B
    rep #0x21
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.9ABF:
    sep #0x30
    rts

;-----

.9AC2:
    asl.b 0x72
    stz.b 0x29
    lda.b #0x08
    sta.b 0x2A
    jsr _819D70
    cmp.b #0x0E
    bne .9B20

    lda.b 0x27
    beq .9B20

    lda.b #0x01
    tsb.b 0x72
    lda.b #0x02
    bit.b 0x72
    bne .9B20

    jsl 0x8282D3
    bne .9B20

    lda.b #0x2E
    jsl _80888B.88B6
    inc.w 0x0000,X
    lda.b #0x0C
    sta.w 0x000A,X
    ldy.w #0x0001
    rep #0x20
    lda.b 0x08
    sec
    sbc.b 0x24
    sep #0x20
    beq .9B03

    bmi .9B08

.9B03:
    lda.b #0x20
    sta.b 0x74
    dey
.9B08:
    tya
    sta.w 0x000B,X
    rep #0x21
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x2A
    and.w #0x00FF
    adc.b 0x08
    and.w #0xFFF0
    sta.w 0x0008,X
.9B20:
    sep #0x30
    rts

;-----

.9B23:
    rep #0x10
    lda.b 0x74
    beq .9B6E

    dec
    sta.b 0x74
    and.b #0x03
    bne .9B6E

    ldy.w #0x0003
.9B33:
    jsl 0x8282D3
    bne .9B6E

    inc.w 0x0000,X
    lda.b #0x0C
    sta.w 0x000A,X
    lda.b #0x02
    sta.w 0x000B,X
    rep #0x21
    jsl get_rng
    and.w #0x000F
    adc.b 0x05
    sec
    sbc.w #0x0008
    sta.w 0x0005,X
    jsl get_rng
    and.w #0x0007
    clc
    adc.b 0x08
    clc
    adc.w #0x0008
    sta.w 0x0008,X
    sep #0x20
    dey
    bne .9B33

.9B6E:
    sep #0x30
    rts

;-----

.9B71:
    lda.b 0x70
    beq .9BB2

    lda.b 0x27
    beq .9BB2

    inc.b 0x71
    lda.b 0x71
    cmp.b #0x3C
    bcc .9BB2

    jsl 0x8282D3
    bne .9BAE

    inc.w 0x0000,X
    lda.b #0x0C
    sta.w 0x000A,X
    lda.b #0x03
    sta.w 0x000B,X
    rep #0x21
    lda.w #0x0007
    bit.b 0x68
    bvs .9BA0

    lda.w #0xFFF9
.9BA0:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    adc.w #0xFFFA
    sta.w 0x0008,X
.9BAE:
    sep #0x20
    stz.b 0x71
.9BB2:
    sep #0x30
    rts

;-----

.9BB5:
    lda.b 0x70
    bit.b #0x01
    bne .9C08

    lda.b 0x77
    bne .9C08

    lda.w 0x0B9C
    bit.b #0x03
    bne .9C08

    jsl 0x8282D3
    bne .9C08

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x0D
    sta.w 0x000B,X
    lda.b 0x11
    eor.b #0x40
    sta.w 0x0011,X
    rep #0x21
    lda.b 0x08
    adc.w #0x000C
    sta.w 0x0008,X
    jsl get_rng
    and.w #0x0003
    sta.w 0x0000
    lda.w #0x000C
    bit.b 0x4D
    bvs .9BFE

    lda.w #0xFFF4
.9BFE:
    clc
    adc.w 0x0000
    clc
    adc.b 0x05
    sta.w 0x0005,X
.9C08:
    sep #0x30
    rts
