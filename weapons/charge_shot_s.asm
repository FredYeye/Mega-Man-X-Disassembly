charge_shot_s:
    ldx.b 0x01
    jsr (.A2D2,X)
    jsl 0x848FCA
    rtl

.A2D2: d16[.A2DC, .A324, .A38B, .A320, .A3C4]

.A2DC:
    jsr _81A54C
    inc.w 0x0C25
    lda.b #0xFF
    sta.b 0x10
    rep #0x21
    lda.w ram.obj.mega_man.pos_y+1
    adc.w 0x0002
    sta.b 0x08
    lda.w #0xBE24
    sta.b 0x20
    lda.w #0xAAF3
    sta.b 0x31
    lda.w #0x0600
    bit.b 0x10
    bvs .A304

    lda.w #0xFA00
.A304:
    sta.b 0x1A
    stz.b 0x1C
    ldx.w 0x1F9F
    bpl .A30F

    stz.b 0x1A
.A30F:
    sep #0x20
    jsl _82808F.80B4
    lda.b #0x0E
    sta.b 0x16
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.A320:
    lda.b #0x02
    sta.b 0x01
.A324:
    ldx.b 0x02
    jsr (.A33C,X)
    jsl _82808F.80B4
    lda.b 0x0E
    bne .A33B

    lda.b #0x08
    sta.b 0x01
    lda.b #0x04
    sta.b 0x02
    sta.b 0x30
.A33B:
    rts

.A33C: d16[.A340, .A36D]

.A340:
    ldx.b 0x03
    bne .A34C

    inc.b 0x03
    lda.b #0x00
    jsl _848EEA.8F07
.A34C:
    lda.b 0x0F
    bpl .A356

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.A356:
    jsl _848EEA
    jsr _81A54C.A56E
    rep #0x20
    lda.b 0x0F
    and.w #0x007F
    clc
    adc.w #0xBE24
    sta.b 0x20
    sep #0x20
    rts

.A36D:
    ldx.b 0x03
    bne .A382

    inc.b 0x03
    rep #0x20
    lda.w #0xBE34
    sta.b 0x20
    sep #0x20
    lda.b #0x01
    jsl _848EEA.8F07
.A382:
    jsl update_pos_xy.no_accel
    jsl _848EEA
    rts

.A38B:
    ldx.b 0x02
    jsr (.A395,X)
    jsl _82808F.80B4
    rts

.A395: d16[.A399, .A3B2]

.A399:
    rep #0x31
    lda.b 0x33
    sta.b 0x05
    lda.b 0x35
    sta.b 0x08
    sep #0x30
    lda.b #0x02
    sta.b 0x02
    inc.b 0x30
    lda.b #0x03
    jsl _848EEA.8F07
    rts

.A3B2:
    lda.b 0x0F
    bpl .A3BF

    lda.b #0x08
    sta.b 0x01
    lda.b #0x04
    sta.b 0x02
    rts

.A3BF:
    jsl _848EEA
    rts

.A3C4:
    ldx.b 0x02
    jmp (.A3C9,X)

.A3C9: d16[.A3CF, .A3EC, .A3FD]

.A3CF:
    rep #0x31
    lda.b 0x33
    sta.b 0x05
    lda.b 0x35
    sta.b 0x08
    sep #0x30
    inc.b 0x30
    lda.b #0x02
    sta.b 0x02
    jsl _82808F.80B4
    lda.b #0x02
    jsl _848EEA.8F07
    rts

.A3EC:
    lda.b 0x0F
    bpl .A3F4

    lda.b #0x04
    sta.b 0x02
.A3F4:
    jsl _82808F.80B4
    jsl _848EEA
    rts

.A3FD:
    dec.w 0x0BDD
    dec.w 0x0C25
    jsl _8283A3
    rts