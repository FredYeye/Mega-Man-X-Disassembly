hadouken:
    ldx.b 0x01
    jsr (.8DB5,X)
    rtl

.8DB5: d16[.8DBF, .8E0B, .8E51, .8E05, .8E51]

.8DBF:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x30
    inc.w 0x0C35
    lda.b #0xFF
    sta.b 0x10
    stz.b 0x18
    stz.b 0x12
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    rep #0x20
    lda.w #0x0019
    bit.b 0x10
    bvs .8DE5

    lda.w #0xFFE7
.8DE5:
    clc
    adc.w ram.obj.mega_man.pos_x+1
    sta.b 0x05
    lda.w ram.obj.mega_man.pos_y+1
    clc
    adc.w #0xFFFD
    sta.b 0x08
    lda.w #0xA957
    sta.b 0x31
    lda.w #0xBEAF
    sta.b 0x20
    sep #0x20
    lda.b #0xAB
    sta.b 0x16
    rts

.8E05:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x30
.8E0B:
    ldx.b 0x02
    jsr (.8E27,X)
    jsl 0x848FCA
    jsl _82808F.80B4
    lda.b 0x0E
    bne .8E26

    lda.b #0x08
    sta.b 0x01
    lda.b #0x04
    sta.b 0x02
    sta.b 0x30
.8E26:
    rts

.8E27: d16[.8E29]

.8E29:
    ldx.b 0x03
    bne .8E48

    inc.b 0x03
    stz.b 0x30
    rep #0x21
    lda.w #0x0400
    bit.b 0x10
    bvs .8E3D

    lda.w #0xFC00
.8E3D:
    sta.b 0x1A
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.8E48:
    jsl update_pos_x
    jsl _848EEA
    rts

.8E51:
    ldx.b 0x02
    jmp (.8E56,X)

.8E56: d16[.8E5C, .8E7D, .8E92]

.8E5C:
    rep #0x30
    lda.b 0x33
    sta.b 0x05
    lda.b 0x35
    sta.b 0x08
    sep #0x30
    inc.b 0x30
    lda.b #0x02
    sta.b 0x02
    jsl _82808F.80B4
    lda.b #0x01
    jsl _848EEA.8F07
    jsl 0x848FCA
    rts

.8E7D:
    lda.b 0x0F
    bpl .8E85

    lda.b #0x04
    sta.b 0x02
.8E85:
    jsl _82808F.80B4
    jsl 0x848FCA
    jsl _848EEA
    rts

.8E92:
    dec.w 0x0C35
    dec.w 0x0BDD
    jsl _8283A3
    rts
