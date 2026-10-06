utuboros_body:
    ldx.b 0x01
    jmp (.C391,X)

.C391: d16[.C397, .C3B7, .C402]

.C397:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.b 0x12
    lda.b #0x18
    sta.b 0x27
    sta.b 0x2F
    lda.l 0x7F822E
    sta.b 0x18
    stz.b 0x28
    lda.b #0x30
    sta.b 0x16
    lda.b #0x06
    jml 0x848F07

.C3B7:
    stz.b 0x2C
    lda.l 0x7F832E
    sta.b 0x11
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0027,X
    and.b #0x7F
    bne .C3CF

    lda.b #0x04
    sta.b 0x01
    rtl

.C3CF:
    lda.w 0x003C,X
    beq .C3D4

.C3D4:
    ldx.w #0xCCCF
    stx.b 0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .C3E7

    jsr _82C533
.C3E7:
    jsr _82C6B9
    lda.b 0x2C
    beq .C3F2

    jsl 0x82C70E
.C3F2:
    lda.b #0xC5
    sta.b 0x20
    lda.b #0xCC
    sta.b 0x21
    jsl 0x849B43
    jml 0x8280B4

.C402:
    ldx.b 0x02
    jsr (.C429,X)
    lda.w 0x0B9C
    lsr
    bcc .C415

    lda.b 0x00
    beq .C415

    jml 0x8280B4

.C415:
    dec.b 0x37
    bne .C428

    jsl 0x849086
    and.b #0x03
    tax
    lda.w 0x00CD08,X
    sta.b 0x37
    jsr _82C500
.C428:
    rtl

.C429: d16[.C431, .C440, .C49C, .C4A7]

.C431:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x3C
    sta.b 0x36
    lda.b #0x08
    sta.b 0x37
    jmp _82C6B9

.C440:
    dec.b 0x36
    bne .C46A

    lda.b #0x04
    sta.b 0x02
    lda.b 0x0B
    lsr
    tax
    lda.w 0x00CD01,X
    sta.b 0x36
    rep #0x20
    lda.w #0xCCC5
    sta.b 0x20
    lda.b 0x05
    sec
    sbc.b 0x22
    sta.b 0x1A
    stz.b 0x1C
    sep #0x20
    stz.b 0x1F
    lda.b #0x08
    sta.b 0x1E
    rts

.C46A:
    rep #0x20
    lda.b 0x08
    sec
    sbc.b 0x24
    bne .C474

    inc
.C474:
    sta.b 0x1C
    sep #0x20
    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x04
    beq .C499

    jsl 0x84A4AB
    lda.b #0x3C
    jsl 0x84A333
    lda.b 0x0A
    cmp.b #0x25
    bne .C495

    jsr .C4E5
.C495:
    jsl 0x828398
.C499:
    jmp _82C6B9

.C49C:
    dec.b 0x36
    bne .C4A4

    lda.b #0x06
    sta.b 0x02
.C4A4:
    jmp _82C6B9

.C4A7:
    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.w #0xFE00
    cmp.b 0x1C
    bmi .C4B6

    sta.b 0x1C
.C4B6:
    lda.w 0x1E5C
    clc
    adc.w #0x0140
    cmp.b 0x08
    sep #0x20
    bcc .C4CD

    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x04
    beq .C4E4

.C4CD:
    jsl 0x84A4AB
    lda.b #0x3C
    jsl 0x84A333
    lda.b 0x0A
    cmp.b #0x25
    bne .C4E0

    jsr .C4E5
.C4E0:
    jsl 0x828398
.C4E4:
    rts

;-----

.C4E5:
    php
    ldx.b #0x06
.C4E8:
    rep #0x21
    lda.b 0x05
    adc.w #0x0002
    sta.b 0x05
    sep #0x20
    lda.b #0x01
    phx
    jsl 0x84A37F
    plx
    dex
    bne .C4E8

    plp
    rts
