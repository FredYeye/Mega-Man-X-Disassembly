highway_cars:
    ldx.b 0x01
    bne .F5A2

    rep #0x20
    lda.w ram.obj.mega_man.pos_x+1
    cmp.b obj3.pos_x+1
    sep #0x20
    bcc .F560

    jml 0x828398

.F560:
    inc.b 0x01
    lda.b 0x0B
    and.b #0x07
    tax
    lda.w 0x86DEA1,X
    sta.b 0x12
    txa
    asl
    tax
    rep #0x20
    lda.w 0x86DEA9,X
    sta.b 0x1A
    sep #0x20
    lda.b 0x0B
    and.b #0x30
    lsr
    lsr
    lsr
    lsr
    sta.w 0x0000
    tax
    lda.w 0x86DE9E,X
    tax
    lda.l 0x7F8200,X
    sta.b 0x18
    lda.l 0x7F8300,X
    sta.b 0x11
    lda.b #0x3A
    clc
    adc.w 0x0000
    sta.b 0x16
    lda.b #0x00
    jsl _848EEA.8F07
.F5A2:
    lda.b 0x16
    and.b #0x7F
    cmp.b #0x3C
    bne .F5AD

    jsr .F5C1
.F5AD:
    jsl update_pos_x
    jsl 0x82808F
    lda.b 0x0E
    bne .F5BD

    jml 0x828398

.F5BD:
    jml 0x848EEA

//-----

.F5C1:
    lda.w 0x0B9C
    and.b #0x07
    bne .F610

    jsl _8282AC.82D3
    bne .F60E

    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    lda.b #0x80
    sta.w 0x000B,X
    stz.w 0x000C,X
    rep #0x20
    jsl get_rng
    and.w #0x000F
    sta.w 0x0000
    jsl get_rng
    and.w #0x000F
    sta.w 0x0002
    lda.b obj3.pos_x+1
    clc
    adc.w #0x0011
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0xFFED
    clc
    adc.w 0x0002
    sta.w 0x0008,X
.F60E:
    sep #0x30
.F610:
    rts
