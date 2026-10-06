bomb_been:
    ldx.b 0x01
    jsr (.9F7A,X)
    lda.b 0x33
    tsb.b 0x11
    jsl 0x82806E
    bcs .9F76

    jsl 0x849B03
    jsl 0x849B43
    beq .9F6E

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    beq .9F72

.9F6E:
    jml 0x8280B4

.9F72:
    jsl 0x84A4AB
.9F76:
    jml 0x828387

.9F7A: d16[.9F86, .9FDD, .A007, .A039, .A08A, .A0AC]

.9F86:
    jsl 0x82827D
    lda.b #0x02
    sta.b 0x12
    lda.b #0x02
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x5A
    sta.b 0x38
    stz.b 0x37
    rep #0x20
    lda.w #0xCAFD
    sta.b 0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .9FBE

    lda.w #0x0140
    sta.b 0x1A
    sep #0x20
    lda.b #0x40
    tsb.b 0x11
    bra .9FC9

.9FBE:
    lda.w #0xFEC0
    sta.b 0x1A
    sep #0x20
    lda.b #0x40
    trb.b 0x11
.9FC9:
    lda.b #0x00
    sta.b 0x34
    jsl 0x848F07
    stz.b 0x3A
    lda.w 0x1F7A
    beq .9FDC

    lda.b #0x02
    sta.b 0x3A
.9FDC:
    rts

.9FDD:
    jsl update_pos_x
    jsl 0x848EEA
    dec.b 0x38
    bne .9FF9

    lda.b #0x5A
    sta.b 0x38
    lda.b 0x37
    ldy.b #0x03
    jsl 0x84AC22
    sta.b 0x37
    bmi .9FFC

.9FF9:
    jmp .A0B5

.9FFC:
    lda.b #0x04
    sta.b 0x01
    lda.b #0x08
    sta.b 0x35
    jmp .A0B5

.A007:
    jsl 0x848EEA
    dec.b 0x35
    bne .A038

    lda.b 0x34
    cmp.b #0x02
    bcc .A02D

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    inc.b 0x35
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    sep #0x20
    xba
    and.b #0x80
    sta.b 0x39
    rts

.A02D:
    inc
    sta.b 0x34
    jsl 0x848F07
    lda.b #0x08
    sta.b 0x35
.A038:
    rts

.A039:
    dec.b 0x35
    bne .A085

    jsl 0x828358
    bne .A07D

    inc.w 0x0000,X
    lda.b 0x39
    ora.b 0x02
    sta.w 0x000B,X
    lda.b #0x0B
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x000A
    sta.w 0x0008,X
    sep #0x30
    lda.b 0x02
    asl
    tax
    jmp (.A06B,X)

.A06B: d16[.A071, .A075, .A07D]

.A071:
    lda.b #0x18
    bra .A077

.A075:
    lda.b #0x30
.A077:
    sta.b 0x35
    inc.b 0x02
    bra .A085

.A07D:
    lda.b #0x08
    sta.b 0x01
    lda.b #0x08
    sta.b 0x38
.A085:
    jsl 0x848EEA
    rts

.A08A:
    dec.b 0x38
    bne .A0A7

    lda.b 0x34
    dec
    sta.b 0x34
    jsl 0x848F07
    lda.b #0x08
    sta.b 0x38
    lda.b 0x34
    bne .A0A7

    lda.b #0x02
    sta.b 0x01
    lda.b #0x5A
    sta.b 0x38
.A0A7:
    jsl 0x848EEA
    rts

.A0AC:
    jsl update_pos_y
    jsl 0x848EEA
    rts

.A0B5:
    ldx.b 0x3A
    rep #0x20
    lda.w 0x86CB01,X
    cmp.b 0x05
    bcc .A0CA

    lda.w 0x86CB05,X
    cmp.b 0x05
    bcs .A0CA

    sep #0x20
    rts

.A0CA:
    lda.w #0x0100
    sta.b 0x1C
    stz.b 0x1A
    sep #0x20
    lda.b #0x0A
    sta.b 0x01
    lda.b #0x00
    jsl 0x848F07
    rts
