shotgun_ice:
    ldx.b 0x01
    jmp (.980C,X)

.980C: d16[.9816, .98BA, .98E3, .98DF, .98DF]

.9816:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x02
    sta.b 0x18
    ldx.w ram.current_stage
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    stz.b 0x30
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x44
    sta.b 0x16
    lda.b #0x01
    sta.b 0x37
    lda.b 0x0B
    bne .9890

    ldx.b 0x3C
    lda.w 0x00BE3C,X
    sta.w 0x0000
    stz.w 0x0001
    stz.w 0x0003
    lda.w 0x00BE3D,X
    sta.w 0x0002
    bpl .9855

    dec.w 0x0003
.9855:
    rep #0x20
    lda.w 0x0000
    bit.b 0x10
    bvs .9862

    eor.w #0xFFFF
    inc
.9862:
    clc
    adc.w ram.obj.mega_man.pos_x+1
    sta.b 0x05
    lda.w ram.obj.mega_man.pos_y+1
    clc
    adc.w 0x0002
    sta.b 0x08
    lda.w #0x0800
    bit.b 0x10
    bvs .987B

    lda.w #0xF800
.987B:
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0xBF6F
    sta.b 0x20
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
    jml 0x8280B4

.9890:
    sep #0x30
    ldx.b 0x0B
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
    lda.w #0xBF79
    sta.b 0x20
    sep #0x20
    lda.b #0x03
    jsl _848EEA.8F07
    inc.b 0x02
    jml 0x8280B4

.98BA:
    lda.b 0x02
    bne .98D2

    jsl update_pos_x
    jsr .98F7
    jsl _8491AD.91BE
    lda.b 0x2B
    beq .98D6

    jsr .9924
    bra .98F0

.98D2:
    jsl update_pos_xy.no_accel
.98D6:
    jsl _82808F.80B4
    lda.b 0x0E
    beq .98F0

    rtl

.98DF:
    jsl 0x84A51A
.98E3:
    lda.b 0x0B
    bne .98F0

    jsr .9924
    lda.b #0x78
    jsl _80888B
.98F0:
    dec.w 0x0BDD
    jml 0x8283A3

//-----

.98F7:
    dec.b 0x37
    bne .9923

    lda.b #0x04
    sta.b 0x37
    jsl _8282AC.82ED
    bne .9921

    inc.w 0x0000,X
    lda.b #0x02
    sta.w 0x000A,X
    stz.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.9921:
    sep #0x30
.9923:
    rts

//-----

.9924:
    lda.b #0x05
    sta.b 0x38
    ldy.b #0x04
    lda.b 0x1B
    bpl .9930

    ldy.b #0x09
.9930:
    jsl _82833E
    bne .995A

    inc.w 0x0000,X
    lda.b #0x0E
    sta.w 0x000A,X
    lda 0x00BF7D,Y
    sta.w 0x000B,X
    rep #0x30
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    inc.w 0x0BDD
    dey
    dec.b 0x38
    bne .9930

.995A:
    sep #0x30
    rts
