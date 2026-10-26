boomerang_cutter_charge:
    ldx.b 0x01
    jmp (.A1E0,X)

.A1E0: d16[.A1EA, .A2C1, .A387, .A2BB, .A387]

.A1EA:
    lda.b #0x02
    sta.b 0x01
    inc.w 0x0C25
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    stz.b 0x30
    stz.b 0x12
    lda.b #0x08
    sta.b 0x18
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x97
    sta.b 0x16
    lda.b #0x0A
    sta.b 0x37
    lda.b 0x11
    asl
    asl
    lda.b #0x08
    bcs .A218

    lda.b #0x18
.A218:
    clc
    adc.b 0x0B
    and.b #0x1F
    sta.b 0x38
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    asl
    asl
    sta.b 0x1A
    lda.w 0x00EE3C,X
    asl
    asl
    sta.b 0x1C
    lda.w #0xC01F
    sta.b 0x20
    lda.w #0xADA7
    sta.b 0x31
    lda.w ram.obj.mega_man.pos_x+1
    sta.b 0x05
    sta.b 0x28
    sta.b 0x2A
    sta.b 0x2D
    lda.w ram.obj.mega_man.pos_y+1
    sta.b 0x08
    sta.b 0x3A
    sta.b 0x3C
    sta.b 0x3E
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b 0x0B
    bne .A29C

    jsl 0x848FCA
    lda.b #0x0C
    sta.b 0x18
    lda.b 0x17
    pha
    clc
    adc.b #0x08
    ora.b #0x80
    sta.b 0x17
    jsl 0x848FCA
    lda.b #0x08
    sta.b 0x18
    pla
    sta.b 0x17
    lda.b #0x18
    sta.b 0x39
.A27F:
    jsl _82833E
    bne .A29C

    inc.w 0x0BDD
    inc.w 0x0000,X
    lda.b #0x16
    sta.w 0x000A,X
    lda.b 0x39
    sta.w 0x000B,X
    sec
    sbc.b #0x08
    sta.b 0x39
    bne .A27F

.A29C:
    jsl _8282AC.82ED
    bne .A2B5

    inc.w 0x0000,X
    lda.b #0x03
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    rep #0x20
    tdc
    sta.w 0x000C,X
.A2B5:
    sep #0x30
    jml _82808F.80B4

.A2BB:
    stz.b 0x30
    lda.b #0x02
    sta.b 0x01
.A2C1:
    ldx.b 0x02
    jsr (.A347,X)
    rep #0x20
    lda.b 0x2A
    sta.b 0x2D
    lda.b 0x28
    sta.b 0x2A
    lda.b 0x22
    sta.b 0x28
    lda.b 0x3C
    sta.b 0x3E
    lda.b 0x3A
    sta.b 0x3C
    lda.b 0x24
    sta.b 0x3A
    sep #0x20
    jsl _82806E
    bcc .A2F2

    dec.w 0x0BDD
    dec.w 0x0C25
    jml 0x8283A3

.A2F2:
    lda.b 0x0B
    beq .A31E

    rep #0x10
    ldx.w #0x1228
.A2FB:
    lda.w 0x0000,X
    beq .A30B

    lda.w 0x000A,X
    cmp.b #0x16
    bne .A30B

    lda.b 0x0B
    beq .A31C

.A30B:
    rep #0x20
    txa
    clc
    adc.w #0x0040
    tax
    sep #0x20
    cpx.w #0x1428
    bcc .A2FB

    stz.b 0x0B
.A31C:
    sep #0x30
.A31E:
    jsl _848EEA
    lda.b 0x0B
    bne .A343

    jsl 0x848FCA
    lda.b #0x0C
    sta.b 0x18
    lda.b 0x17
    pha
    clc
    adc.b #0x08
    ora.b #0x80
    sta.b 0x17
    jsl 0x848FCA
    lda.b #0x08
    sta.b 0x18
    pla
    sta.b 0x17
.A343:
    jml _82808F.80B4

.A347: d16[.A34D, .A35E, .A359]

.A34D:
    dec.b 0x37
    bne .A359

    lda.b #0x02
    sta.b 0x02
    lda.b #0x1C
    sta.b 0x37
.A359:
    jsl update_pos_xy.no_accel
    rts

.A35E:
    lda.b 0x38
    inc
    and.b #0x1F
    sta.b 0x38
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    asl
    asl
    sta.b 0x1A
    lda.w 0x00EE3C,X
    asl
    asl
    sta.b 0x1C
    sep #0x20
    dec.b 0x37
    bne .A382

    lda.b #0x04
    sta.b 0x02
.A382:
    jsl update_pos_xy.no_accel
    rts

.A387:
    dec.w 0x0BDD
    dec.w 0x0C25
    jml 0x8283A3
