storm_tornado:
    ldx.b 0x01
    jsr (.9559,X)
    jml 0x848FCA

.9559: d16[.9563, .95C0, .95B2, .95B2, .95B2]

.9563:
    lda.b #0x02
    sta.b 0x01
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x02
    sta.b 0x18
    sta.b 0x30
    stz.b 0x12
    stz.b 0x38
    stz.b 0x39
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    rep #0x21
    lda.w #0x0010
    bit.b 0x10
    bvs .958C

    lda.w #0xFFF0
.958C:
    adc.w ram.obj.mega_man.pos_x+1
    sta.b 0x05
    lda.w #0x0800
    bit.b 0x10
    bvs .959B

    lda.w #0xF800
.959B:
    sta.b 0x1A
    lda.w ram.obj.mega_man.pos_y+1
    sta.b 0x08
    lda.w #0xAE67
    sta.b 0x31
    sep #0x20
    lda.b #0x87
    sta.b 0x16
    lda.b #0x80
    sta.b 0x17
.95B1:
    rts

.95B2:
    lda.b #0x02
    sta.b 0x01
    lda.b 0x38
    sta.b 0x02
    lda.b 0x39
    sta.b 0x03
    stz.b 0x30
.95C0:
    ldx.b 0x02
    jsr (.95E7,X)
    lda.b 0x00
    beq .95B1

    lda.w 0x0B9C
    lsr
    bcs .95D3

    jsl _82808F
.95D3:
    jsr .963A
    bcc .95DC

    lda.b #0x04
    sta.b 0x02
.95DC:
    lda.b 0x02
    sta.b 0x38
    lda.b 0x03
    sta.b 0x39
    jmp .9629

.95E7: d16[.95ED, .960A, .961F]

.95ED:
    ldx.b 0x03
    bne .95FB

    inc.b 0x03
    stz.b 0x30
    lda.b #0x00
    jsl _848EEA.8F07
.95FB:
    lda.b 0x0F
    bpl .9605

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.9605:
    jsl _848EEA
    rts

.960A:
    ldx.b 0x03
    bne .9616

    inc.b 0x03
    lda.b #0x01
    jsl _848EEA.8F07
.9616:
    jsl update_pos_x
    jsl _848EEA
    rts

.961F:
    inc.b 0x30
    dec.w 0x0BDD
    jsl _8283A3
    rts

.9629:
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    asl
    asl
    adc.w #0xBF17
    sta.b 0x20
    sep #0x20
    rts

//-----

.963A:
    rep #0x20
    sec
    lda.b 0x05
    sbc.w 0x1E4D
    clc
    adc.w #0x0020
    cmp.w #0x0140
    bcs .9658

    sec
    lda.b 0x08
    sbc.w 0x1E50
    clc
    adc.w #0x0080
    cmp.w #0x01E0
.9658:
    sep #0x20
    rts
