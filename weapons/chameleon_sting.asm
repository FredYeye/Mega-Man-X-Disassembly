chameleon_sting:
    ldx.b 0x01
    jsr (.91D8,X)
    rtl

.91D8: d16[.91E4, .920C, .929A, .9296, .9296, .929A]

.91E4:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x18
    sta.b 0x30
    stz.b 0x12
    lda.b 0x0B
    bne .91FF

    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    jsl _839518
.91FF:
    lda.b 0x0B
    beq .9207

    lda.b #0x02
    sta.b 0x02
.9207:
    lda.b #0x0F
    sta.b 0x16
    rts

.920C:
    ldx.b 0x02
    jsr (.921E,X)
    jsl _82808F.80B4
    lda.b 0x0E
    bne .921D

    lda.b #0x0A
    sta.b 0x01
.921D:
    rts

.921E: d16[.9222, .9261]

.9222:
    ldx.b 0x03
    bne .9230

    inc.b 0x03
    stz.b 0x30
    lda.b #0x00
    jsl _848EEA.8F07
.9230:
    jsl _848EEA
    lda.b 0x0F
    bpl .923D

    lda.b #0x0A
    sta.b 0x01
    rts

.923D:
    bit.b #0x20
    beq .924A

    lda.b #0x67
    jsl _80888B.88B6
    jsr .92A4
.924A:
    bit.b #0x40
    beq .9250

    sta.b 0x30
.9250:
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    asl
    asl
    adc.w #0xBEDF
    sta.b 0x20
    sep #0x20
    rts

.9261:
    ldx.b 0x03
    bne .9291

    inc.b 0x03
    stz.b 0x30
    rep #0x21
    lda.b 0x0B
    and.w #0x00FF
    asl
    tax
    lda.w 0x00BEF1,X
    sta.b 0x1C
    lda.w #0x0600
    bit.b 0x10
    bvs .9281

    lda.w #0xFA00
.9281:
    sta.b 0x1A
    lda.w #0xBEEF
    sta.b 0x20
    sep #0x20
    lda.b 0x0B
    jsl _848EEA.8F07
    rts

.9291:
    jsl update_pos_xy.no_accel
    rts

.9296:
    jsl 0x84A51A
.929A:
    inc.b 0x30
    dec.w 0x0BDD
    jsl _8283A3
    rts

//-----

.92A4:
    rep #0x10
    ldy.w #0x0003
.92A9:
    jsl _82833E
    bne .92E9

    inc.w 0x0000,X
    inc.w 0x0BDD
    lda.b #0x08
    sta.w 0x000A,X
    tya
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    phy
    rep #0x21
    tya
    asl
    asl
    tay
    lda 0x00BEF5,Y
    bit.b 0x10
    bvc .92D5

    eor.w #0xFFFF
    inc
.92D5:
    adc.b 0x05
    sta.w 0x0005,X
    lda 0x00BEF7,Y
    clc
    adc.b 0x08
    sta.w 0x0008,X
    sep #0x20
    ply
    dey
    bne .92A9

.92E9:
    sep #0x10
    rts
