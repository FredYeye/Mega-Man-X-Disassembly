dodge_blaster:
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x01
    jsr (.99D0,X)
    jsl _849B03
    jsl 0x849B43
    beq .99C6

    bpl .99C2

    jsl 0x84A4AB
    lda.b #0x01
    jsl 0x84A37F
.99BE:
    jml 0x828387

.99C2:
    lda.b #0x0E
    trb.b 0x11
.99C6:
    jsl 0x82806E
    bcs .99BE

    jml 0x8280B4

.99D0: d16[.99D8, .9A37, .9A48, .9AED]

.99D8:
    jsl 0x82827D
    rep #0x20
    lda.w #0xC93E
    sta.b 0x20
    lda.w #0x0080
    sta.b 0x1C
    sep #0x20
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0xFF
    sta.b 0x2F
    lda.b 0x0B
    and.b #0x40
    tsb.b 0x11
    lda.b 0x0B
    asl
    asl
    rep #0x20
    lda.w #0x0800
    bcc .9A08

    lda.w #0xF800
.9A08:
    sta.b 0x1A
    sep #0x20
    lda.b #0x08
    sta.b 0x34
.9A10:
    jsl update_pos_x
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x03
    bne .9A28

    dec.b 0x34
    bne .9A10

    pla
    pla
    jml 0x828387

.9A28:
    lda.b #0x03
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.9A37:
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcc .9A43

    cmp.b #0x80
    bpl .9A47

.9A43:
    lda.b #0x04
    sta.b 0x01
.9A47:
    rts

.9A48:
    ldx.b 0x02
    jmp (.9A4D,X)

.9A4D: d16[.9A51, .9ABB]

.9A51:
    lda.w 0x1F0D
    beq .9A92

    stz.b 0x36
    rep #0x20
    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bcs .9A68

    eor.w #0xFFFF
    inc
    inc.b 0x36
.9A68:
    cmp.w #0x0020
    sep #0x20
    bcs .9A92

    lda.b #0x02
    sta.b 0x02
    lda.b 0x36
    clc
    adc.b #0x02
    jsl _848EEA.8F07
    lda.b #0x10
    sta.b 0x35
    lda.b 0x36
    lsr
    rep #0x20
    lda.w #0x0200
    bcs .9A8D

    lda.w #0xFE00
.9A8D:
    sta.b 0x1C
    sep #0x20
    rts

.9A92:
    jsr .9B3B
    rep #0x20
    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bcs .9AA3

    eor.w #0xFFFF
    inc
.9AA3:
    cmp.w #0x0004
    sep #0x20
    bcs .9ABA

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x30
    sta.b 0x35
.9ABA:
    rts

.9ABB:
    jsr .9B5F
    cmp.b #0x34
    bcs .9AD4

    lda.b 0x36
    eor.b #0x01
    sta.b 0x36
    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sep #0x20
.9AD4:
    jsl update_pos_y
    jsl _8491AD.91BE
    jsl _848EEA
    dec.b 0x35
    bne .9AEC

    stz.b 0x02
    lda.b #0x00
    jsl _848EEA.8F07
.9AEC:
    rts

.9AED:
    jsr .9B3B
    jsl _848EEA
    dec.b 0x35
    bne .9B3A

    jsl 0x828358
    bne .9B2E

    inc.w 0x0000,X
    lda.b #0x02
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b #0x03
    sta.w 0x0016,X
    rep #0x20
    lda.b 0x08
    sta.w 0x0008,X
    lda.b 0x10
    asl
    asl
    lda.w #0x000C
    bcs .9B28

    lda.w #0xFFF4
.9B28:
    clc
    adc.b 0x05
    sta.w 0x0005,X
.9B2E:
    sep #0x30
    lda.b #0x04
    sta.b 0x01
    lda.b #0x00
    jsl _848EEA.8F07
.9B3A:
    rts

;-----

.9B3B:
    rep #0x20
    lda.w 0x0BB0
    sec
    sbc.b 0x08
    lda.w #0x0080
    bcc .9B4B

    lda.w #0xFF80
.9B4B:
    sta.b 0x1C
    sep #0x20
    jsr .9B5F
    cmp.b #0x34
    bcc .9B5E

    jsl update_pos_y
    jsl _8491AD.91BE
.9B5E:
    rts

;-----

.9B5F:
    lda.b 0x11
    asl
    asl
    lda.b #0x10
    bcc .9B69

    lda.b #0xF0
.9B69:
    sta.b 0x29
    lda.b 0x1D
    asl
    lda.b #0x10
    bcs .9B74

    lda.b #0xF0
.9B74:
    sta.b 0x2A
    jsl _8490A0
    rts
