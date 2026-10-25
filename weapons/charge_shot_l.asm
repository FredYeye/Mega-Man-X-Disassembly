charge_shot_l:
    ldx.b 0x01
    jsr (.8C44,X)
    rtl

.8C44: d16[.8C4E, .8C7F, .8D34, .8C79, .8CE8]

.8C4E:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x30
    inc.w 0x0C25
    lda.b #0xFF
    sta.b 0x10
    stz.b 0x18
    stz.b 0x12
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    jsl _839518
    lda.b #0x9A
    sta.b 0x31
    lda.b #0xAB
    sta.b 0x32
    lda.b #0x9E
    sta.b 0x16
    rts

.8C79:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x30
.8C7F:
    ldx.b 0x02
    jsr (.8C9D,X)
    jsl 0x848FCA
    jsl _82808F.80B4
    lda.b 0x0E
    bne .8C9A

    lda.b #0x08
    sta.b 0x01
    lda.b #0x04
    sta.b 0x02
    sta.b 0x30
.8C9A:
    jmp .8D71

.8C9D: d16[.8CA1, .8CC0]

.8CA1:
    ldx.b 0x03
    bne .8CAF

    inc.b 0x03
    stz.b 0x30
    lda.b #0x00
    jsl _848EEA.8F07
.8CAF:
    lda.b 0x0F
    bpl .8CB9

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.8CB9:
    jsl _848EEA
    jmp .8D82

.8CC0:
    ldx.b 0x03
    bne .8CDF

    inc.b 0x03
    stz.b 0x30
    rep #0x21
    lda.w #0x0800
    bit.b 0x10
    bvs .8CD4

    lda.w #0xF800
.8CD4:
    sta.b 0x1A
    sep #0x20
    lda.b #0x01
    jsl _848EEA.8F07
    rts

.8CDF:
    jsl update_pos_x
    jsl _848EEA
    rts

.8CE8:
    ldx.b 0x02
    jmp (.8CED,X)

.8CED: d16[.8CF3, .8D14, .8D29]

.8CF3:
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
    lda.b #0x02
    jsl _848EEA.8F07
    jsl 0x848FCA
    rts

.8D14:
    lda.b 0x0F
    bpl .8D1C

    lda.b #0x04
    sta.b 0x02
.8D1C:
    jsl _82808F.80B4
    jsl 0x848FCA
    jsl _848EEA
    rts

.8D29:
    dec.w 0x0BDD
    dec.w 0x0C25
    jsl _8283A3
    rts

.8D34:
    ldx.b 0x02
    jsr (.8D42,X)
    jsl 0x848FCA
    jsl _82808F.80B4
    rts

.8D42: d16[.8D46, .8D5F]

.8D46:
    rep #0x30
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

.8D5F:
    lda.b 0x0F
    bpl .8D6C

    lda.b #0x08
    sta.b 0x01
    lda.b #0x04
    sta.b 0x02
    rts

.8D6C:
    jsl _848EEA
    rts

//-----

.8D71:
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    asl
    asl
    adc.w #0xBE9F
    sta.b 0x20
    sep #0x20
    rts

//-----

.8D82:
    ldx.b 0x3C
    lda.w 0x86BE3C,X
    sta.w 0x0000
    stz.w 0x0001
    stz.w 0x0003
    lda.w 0x86BE3D,X
    sta.w 0x0002
    bpl .8D9B

    dec.w 0x0003
.8D9B:
    rep #0x20
    lda.w 0x0000
    bit.b 0x10
    bvs .8DA8

    eor.w #0xFFFF
    inc
.8DA8:
    clc
    adc.w ram.obj.mega_man.pos_x+1
    sta.b 0x05
    rts
