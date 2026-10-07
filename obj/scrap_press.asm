scrap_press:
    ldx.b 0x01
    jsr (.E202,X)
    rep #0x20
    lda.w #0xD163
    sta.b 0x20
    sep #0x20
    jsl 0x849B43
    rep #0x20
    lda.w #0xD159
    sta.b 0x20
    sep #0x20
    jsl 0x849B43
    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x0030
    sta.b 0x08
    sep #0x20
    jsl _82808F.80B4
    jsl 0x82806E
    bcc .E1F5

    jsl 0x828387
    jmp .E201

.E1F5:
    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x0030
    sta.b 0x08
    sep #0x20
.E201:
    rtl

.E202: d16[.E20C, .E248, .E2C8, .E2F6, .E3A5]

.E20C:
    jsl 0x82827D
    lda.b #0x01
    sta.b 0x27
    stz.b 0x28
    lda.b #0x04
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0x01
    sta.b 0x35
    lda.b #0x14
    sta.b 0x38
    rep #0x20
    lda.w #0xFE00
    sta.b 0x1C
    lda.b 0x08
    sec
    sbc.w #0x0011
    sta.b 0x33
    sta.b 0x08
    lda.b 0x05
    sta.b 0x36
    sep #0x20
    lda.b #0x50
    sta.b 0x1E
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.E248:
    rep #0x20
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0004
    tdc
    sta.w 0x0002
    lda.w #0x0E68
.E25B:
    tcd
    sep #0x20
    lda.b 0x00
    beq .E290

    lda.b 0x0A
    cmp.b #0x2A
    bne .E290

    lda.b 0x0F
    and.b #0x02
    cmp.b #0x02
    beq .E290

    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0000
    bcs .E27E

    eor.w #0xFFFF
    inc
.E27E:
    cmp.w #0x0028
    bcs .E290

    lda.w 0x0002
    tcd
    sep #0x20
    lda.b #0x04
    sta.b 0x01
    jmp .E2C2

.E290:
    rep #0x21
    tdc
    adc.w #0x0040
    cmp.w #0x1228
    bcc .E25B

    rep #0x20
    lda.w 0x0002
    tcd
    lda.w 0x0BAD
    sec
    sbc.w 0x0000
    bcs .E2AE

    eor.w #0xFFFF
    inc
.E2AE:
    cmp.w #0x0020
    bcs .E2C2

    lda.w 0x0BB0
    sec
    sbc.w 0x0004
    bcc .E2C2

    sep #0x20
    lda.b #0x04
    sta.b 0x01
.E2C2:
    sep #0x20
    jsr .E3DE
    rts

.E2C8:
    dec.b 0x38
    beq .E2EA

    lda.b 0x38
    and.b #0x01
    beq .E2DA

    lda.b #0x02
    sta.w 0x0000
    jmp .E2DF

.E2DA:
    lda.b #0xFE
    sta.w 0x0000
.E2DF:
    lda.b 0x05
    sec
    sbc.w 0x0000
    sta.b 0x05
    jmp .E2F2

.E2EA:
    lda.b #0x06
    sta.b 0x01
    lda.b #0x14
    sta.b 0x38
.E2F2:
    jsr .E3DE
    rts

.E2F6:
    jsr .E3DE
    rep #0x20
    lda.w 0x0006
    cmp.w #0x0008
    bcs .E33C

    lda.w 0x0002
    bmi .E33C

    lda.w 0x0006
    cmp.w #0x0004
    lda.w #0xD159
    bcc .E319

    lda.w #0x0003
    sta.w 0x0006
.E319:
    rep #0x20
    lda.w 0x0BB0
    sec
    sbc.w 0x0006
    sta.w 0x0BB0
    sep #0x20
    lda.w 0x0C06
    and.b #0x04
    bne .E335

    lda.w 0x0BD3
    and.b #0x04
    beq .E33C

.E335:
    jsl _849B03
    jmp .E33C

.E33C:
    sep #0x20
    dec.b 0x35
    bne .E398

    lda.b #0x01
    sta.b 0x35
    jsl update_pos_xy.neg_ay
    lda.b 0x2C
    and.b #0x7F
    beq .E354

    jsl 0x82C70E
.E354:
    jsl _8491AD.91BE
    lda.b 0x2E
    cmp.b #0x00
    beq .E398

    lda.b #0x10
    jsl 0x84A333
    lda.b #0x3D
    jsl _80888B
    lda.b #0x08
    sta.b 0x01
    lda.b #0x2C
    sta.b 0x35
    lda.b #0x01
    jsl _848EEA.8F07
    jsl 0x849B7E
    beq .E38C

    cmp.b #0x2A
    bne .E38C

    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x0006
    sta.b 0x08
.E38C:
    rep #0x20
    lda.w #0x0180
    sta.b 0x1C
    sep #0x20
    jmp .E398

.E398:
    rep #0x20
    lda.b 0x36
    sta.b 0x05
    sep #0x20
    jsl _848EEA
    rts

.E3A5:
    jsr .E3DE
    dec.b 0x35
    bne .E3D1

    lda.b #0x01
    sta.b 0x35
    lda.b #0x00
    jsl _848EEA.8F07
    jsl update_pos_y
    rep #0x20
    lda.b 0x08
    cmp.b 0x33
    bpl .E3D1

    lda.w #0xFE00
    sta.b 0x1C
    sep #0x20
    lda.b #0x02
    sta.b 0x01
    lda.b #0x20
    sta.b 0x35
.E3D1:
    rep #0x20
    lda.b 0x36
    sta.b 0x05
    sep #0x20
    jsl _848EEA
    rts

;-----

.E3DE:
    rep #0x20
    lda.w #0xD163
    sta.b 0x20
    sep #0x20
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    rep #0x20
    lda.w #0xD159
    sta.b 0x20
    sep #0x20
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    rts
