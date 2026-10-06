dig_labour:
    ldx.b 0x01
    jsr (.CE62,X)
    jsl 0x879ED4
    lda.b 0x27
    beq .CE53

    jsl 0x849B43
    beq .CE33

    lda.b 0x27
    and.b #0x7F
    bne .CE2B

    jsl 0x84A4AB
    jsl 0x828387
    sep #0x10
    lda.b #0x01
    jsl 0x84A37F
    bra .CE61

.CE2B:
    lda.b #0xF1
    and.b 0x11
    sta.b 0x11
    bra .CE39

.CE33:
    lda.b 0x34
    ora.b 0x11
    sta.b 0x11
.CE39:
    jsl 0x849B03
    lda.b 0x0B
    cmp.b #0xFF
    bne .CE53

    stz.b 0x0B
    lda.b #0x03
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x01
    lda.b #0x50
    sta.b 0x33
.CE53:
    jsl 0x8280B4
    jsl 0x82806E
    bcc .CE61

    jsl 0x828387
.CE61:
    rtl

.CE62: d16[.CE6A, .CE9A, .CEB4, .CECB]

.CE6A:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x34
    lda.b #0x08
    sta.b 0x27
    lda.b #0x01
    sta.b 0x28
    lda.b #0x03
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    stz.b 0x0B
    rep #0x20
    lda.w #0xCF74
    sta.b 0x20
    sep #0x20
    lda.b #0x01
    sta.b 0x33
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.CE9A:
    dec.b 0x33
    bne .CEAF

    lda.b #0x04
    sta.b 0x01
    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x40
    sta.b 0x35
    jmp .CEB3

.CEAF:
    jsl _848EEA

.CEB3:
    rts

.CEB4:
    dec.b 0x35
    bne .CEC6

    jsr .CEE1
    lda.b #0x12
    sta.b 0x35
    lda.b #0x06
    sta.b 0x01
    jmp .CECA

.CEC6:
    jsl _848EEA
.CECA:
    rts

.CECB:
    dec.b 0x35
    bne .CEDC

    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x01
    jmp .CEE0

.CEDC:
    jsl _848EEA
.CEE0:
    rts

;-----

.CEE1:
    rep #0x10
    jsl 0x828358
    bne .CF45

    inc.w 0x0000,X
    lda.b #0x14
    sta.w 0x000A,X
    lda.l 0x7F824E
    sta.w 0x0018,X
    lda.b 0x34
    ora.b 0x11
    sta.w 0x0011,X
    and.b #0x40
    bne .CF14

    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0014
    sta.w 0x0005,X
    sta.w 0x0004
    jmp .CF22

.CF14:
    rep #0x20
    lda.b 0x05
    clc
    adc.w #0x0014
    sta.w 0x0005,X
    sta.w 0x0004
.CF22:
    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x000C
    sta.w 0x0008,X
    sta.w 0x0006
    phx
    sep #0x30
    jsr .CF52
    rep #0x30
    plx
    lda.w 0x0000
    sta.w 0x001A,X
    lda.w 0x0002
    sta.w 0x001C,X
.CF45:
    rep #0x20
    tdc
    sta.w 0x000C,X
    sep #0x30
    lda.b #0x28
    sta.b 0x33
    rts

;-----

.CF52:
    rep #0x20
    lda.w 0x0BAD
    sta.w 0x0000
    lda.w 0x0BB0
    sta.w 0x0002
    lda.w #0x0600
    sta.w 0x0008
    sep #0x20
    jsl 0x84ACAB
    rts
