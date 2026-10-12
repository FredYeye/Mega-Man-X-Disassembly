boomerang_cutter:
    ldx.b 0x01
    jmp (.83B5,X)

.83B5: d16[.83BF, .8429, .84E0, .8421, .84E0]

.83BF:
    lda.b #0x02
    sta.b 0x01
    ldx.w 0x1F7A
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    stz.b 0x30
    stz.b 0x39
    stz.b 0x3A
    stz.b 0x18
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x05
    sta.b 0x16
    lda.b #0x11
    sta.b 0x37
    lda.b 0x11
    asl
    asl
    lda.b #0x08
    bcs .83ED

    lda.b #0x18
.83ED:
    sta.b 0x38
    rep #0x20
    lda.w #0xBF6B
    sta.b 0x20
    lda.w #0xAD8A
    sta.b 0x31
    lda.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    sta.b 0x08
    lda.b 0x10
    asl
    asl
    lda.w #0x0480
    bcs .8411

    lda.w #0xFB80
.8411:
    sta.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x01
    jsl _848EEA.8F07
    jml 0x8280B4

.8421:
    stz.b 0x30
    lda.b #0x02
    sta.b 0x01
    inc.b 0x39
.8429:
    ldx.b 0x02
    jsr (.8452,X)
    jsr .8538
    jsl _848EEA
    jsl _82808F.80B4
    jsl 0x82806E
    bcc .8451

    lda.b 0x3A
    beq .844A

    rep #0x10
    ldx.b 0x0C
    stz.w 0x0028,X
.844A:
    dec.w 0x0BDD
    jml 0x8283A3

.8451:
    rtl

.8452: d16[.8456, .8479]

.8456:
    jsl 0x82820A
    dec.b 0x37
    bne .8478

    lda.b #0x02
    sta.b 0x02
    lda.b #0x02
    sta.b 0x37
    lda.b 0x38
    cmp.b #0x10
    bcs .846F

    dec
    bra .8470

.846F:
    inc
.8470:
    and.b #0x1F
    sta.b 0x38
    jsl .84F2
.8478:
    rts

.8479:
    dec.b 0x37
    bne .84AC

    lda.b #0x02
    sta.b 0x37
    jsl 0x84A07C
    sec
    sbc.b 0x38
    and.b #0x1F
    cmp.b #0x10
    bcc .8492

    dec.b 0x38
    bra .8494

.8492:
    inc.b 0x38
.8494:
    lda.b 0x38
    and.b #0x1F
    sta.b 0x38
    jsl .84F2
    rep #0x20
    lda.w 0x0000
    sta.b 0x1A
    lda.w 0x0002
    sta.b 0x1C
    sep #0x20
.84AC:
    jsl 0x82820A
    lda.w 0x0BCF
    and.b #0x7F
    beq .84DF

    lda.b 0x3A
    bne .84DF

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .84DF

    rep #0x20
    lda.b 0x08
    adc.w #0x2000
    sta.b 0x08
    sep #0x20
    lda.b 0x39
    bne .84DF

    inc.w 0x1F94
    lda.b #0x80
    tsb.w 0x1F94
.84DF:
    rts

.84E0:
    rep #0x10
    lda.b 0x3A
    beq .84EB

    ldx.b 0x0C
    stz.w 0x0028,X
.84EB:
    dec.w 0x0BDD
    jml 0x8283A3

;-----

.84F2:
    asl
    asl
    tax
    phd
    pea 0x0000
    pld
    rep #0x20
    lda.w 0x00EE3A,X
    and.w #0x8000
    sta.b 0x00
    lda.w 0x00EE3C,X
    and.w #0x8000
    sta.b 0x02
    lda.w 0x00EE3A,X
    asl
    sta.b 0x04
    lda.w 0x00EE3A,X
    lsr
    ora.b 0x00
    lsr
    ora.b 0x00
    clc
    adc.b 0x04
    sta.b 0x00
    lda.w 0x00EE3C,X
    asl
    sta.b 0x06
    lda.w 0x00EE3C,X
    lsr
    ora.b 0x02
    lsr
    ora.b 0x02
    clc
    adc.b 0x06
    sta.b 0x02
    pld
    sep #0x20
    rtl

;-----

.8538:
    lda.b 0x3A
    bne .8581

    jsl 0x84AC5A
    cpy.b #0x00
    beq .8580

    phy
    rep #0x30
    ldx.w #0x0000
    ldy.w #0xB700
    lda.w #0x001F
    phb
    mvn 0x7F,0x00
    plb
    sep #0x30
    ply
    dey
    dey
.855A:
    phy
    tyx
    rep #0x30
    lda.l 0x7FB700,X
    tax
    jsl 0x849C0E
    bcs .8572

    sep #0x30
    ply
    dey
    dey
    bmi .8580

    bra .855A

.8572:
    stx.b 0x0C
    inc.w 0x0028,X
    sep #0x30
    inc.b 0x3A
    lda.b #0x02
    sta.b 0x12
    ply
.8580:
    rts

.8581:
    rep #0x30
    ldx.b 0x0C
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    lda.w 0x0000,X
    bne .8598

    stz.b 0x3A
.8598:
    sep #0x10
    rts
