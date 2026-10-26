chameleon_sting_charge:
    ldx.b 0x01
    jmp (.9B82,X)

.9B82: d16[.9B88, .9BAF, .9BB9]

.9B88:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x30
    sta.w 0x0C31
    sta.w 0x0C32
    inc.w 0x0C25
    inc.w 0x0C0F
    lda.b #0xE0
    sta.b 0x37
    lda.b #0x01
    sta.b 0x38
    stz.b 0x39
    lda.b #0x06
    sta.b 0x3A
    stz.b 0x3B
    lda.b #0x02
    sta.b 0x3C
    rtl

.9BAF:
    jsr .9BDE
    jsr .9C02
    jsr .9C22
    rtl

.9BB9:
    stz.w 0x0C31
    dec.w 0x0BDD
    dec.w 0x0C25
    dec.w 0x0C0F
    lda.w 0x0BCF
    and.b #0x7F
    beq .9BD1

    lda.b #0x01
    sta.w 0x0BB6
.9BD1:
    rep #0x10
    ldy.w #0x0104
    jsl _828000.8011
    jml 0x8283A3

//-----

.9BDE:
    rep #0x20
    dec.b 0x37
    bne .9BEB

    sep #0x20
    lda.b #0x04
    sta.b 0x01
    rts

.9BEB:
    lda.b 0x37
    cmp.w #0x0168
    bne .9BF6

    inc.b 0x3B
    inc.b 0x3B
.9BF6:
    cmp.w #0x0078
    bne .9BFF

    inc.b 0x3B
    inc.b 0x3B
.9BFF:
    sep #0x20
    rts

//-----

.9C02:
    lda.w 0x0BCF
    and.b #0x7F
    beq .9C21

    dec.b 0x3C
    bne .9C21

    lda.b 0x3B
    eor.b #0x01
    sta.b 0x3B
    tax
    lda.w 0x00BFAB,X
    sta.b 0x3C
    lda.w 0x0BB6
    eor.b #0x01
    sta.w 0x0BB6
.9C21:
    rts

//-----

.9C22:
    dec.b 0x3A
    bne .9C46

    lda.b #0x06
    sta.b 0x3A
    lda.w 0x1F1A
    bne .9C47

    lda.b 0x39
    inc
    inc
    and.b #0x0E
    sta.b 0x39
    rep #0x31
    and.w #0x00FF
    adc.w #0x01A0
    tay
    jsl _828000.8011
    sep #0x30
.9C46:
    rts

.9C47:
    rep #0x10
    ldy.w #0x0104
    jsl _828000.8011
    sep #0x10
    rts
