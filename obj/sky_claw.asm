sky_claw:
    ldx.b 0x01
    jmp (.C38C,X)

.C38C: d16[.C392, .C3C5, .C5D9]

.C392:
    jsl 0x84A1D0
    cpy.b #0x04
    bcc .C39E

    jml .C6FE

.C39E:
    jsl 0x82827D
    lda.b #0x02
    sta.b 0x12
    lda.b #0x02
    sta.b 0x26
    lda.b #0x02
    sta.b 0x27
    lda.b #0x03
    sta.b 0x28
    stz.b 0x2F
    lda.b 0x05
    sta.b 0x37
    lda.b 0x06
    sta.b 0x38
    lda.b 0x0B
    bpl .C3C4

    lda.b #0x06
    sta.b 0x02
.C3C4:
    rtl

.C3C5:
    jsl 0x82806E
    bcc .C3CF

    jml .C6FE

.C3CF:
    lda.l 0x7F8378
    sta.b 0x11
    ldx.b 0x02
    jsr (.C404,X)
    lda.b #0xF4
    sta.b 0x20
    lda.b #0xD2
    sta.b 0x21
    jsl 0x849B43
    beq .C3F4

    bpl .C3F0

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
.C3F0:
    lda.b #0x0E
    trb.b 0x11
.C3F4:
    lda.b #0xEB
    sta.b 0x20
    lda.b #0xD2
    sta.b 0x21
    jsl 0x849B03
    jml 0x8280B4

.C404: d16[.C40C, .C462, .C4D1, .C5B0]

.C40C:
    ldx.b 0x03
    jmp (.C411,X)

.C411: d16[.C417, .C435, .C454]

.C417:
    lda.b #0x02
    sta.b 0x03
    rep #0x30
    ldx.w #0x0180
    lda.w 0x0BAD
    cmp.b 0x05
    bcs .C42A

    ldx.w #0xFE80
.C42A:
    stx.b 0x1A
    sep #0x30
    lda.b #0x00
    jsl 0x848F07
    rts

.C435:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    clc
    adc.w #0x0004
    cmp.w #0x0008
    sep #0x20
    bcs .C44E

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.C44E:
    jsr .C5FF
    jmp .C6DD

.C454:
    dec.b 0x33
    bne .C45F

    lda.b #0x02
    sta.b 0x03
    jmp .C5F2

.C45F:
    jmp .C5FF

.C462:
    ldx.b 0x03
    jmp (.C467,X)

.C467: d16[.C46F, .C486, .C4A4, .C4C0]

.C46F:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x00
    sta.b 0x1C
    lda.b #0xFE
    sta.b 0x1D
    lda.b #0x15
    sta.b 0x33
    lda.b #0x01
    jsl 0x848F07
    rts

.C486:
    dec.b 0x33
    bne .C499

    lda.b #0x04
    sta.b 0x03
    lda.b #0x02
    jsl 0x848F07
    lda.b #0x1E
    sta.b 0x33
    rts

.C499:
    jsl 0x82825D
    jsl 0x848EEA
    jmp .C608

.C4A4:
    dec.b 0x33
    bne .C4B9

    lda.b #0x06
    sta.b 0x03
    lda.b #0x15
    sta.b 0x33
    lda.b #0x00
    sta.b 0x1C
    lda.b #0x02
    sta.b 0x1D
    rts

.C4B9:
    jsl 0x848EEA
    jmp .C608

.C4C0:
    dec.b 0x33
    bne .C4C8

    stz.b 0x02
    stz.b 0x03
.C4C8:
    jsl 0x82825D
    jsl 0x848EEA
    rts

.C4D1:
    ldx.b 0x03
    jmp (.C4D6,X)

.C4D6: d16[.C4E0, .C501, .C533, .C588, .C59C]

.C4E0:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    ldx.b 0x0B
    bpl .C4EC

    lda.b #0x08
.C4EC:
    sta.b 0x33
    lda.b #0x00
    sta.b 0x1C
    lda.b #0x02
    sta.b 0x1D
    stz.b 0x26
    lda.b #0x02
    jsl 0x848F07
    jmp .C6B1

.C501:
    dec.b 0x33
    bne .C528

    lda.b #0x04
    sta.b 0x03
    rep #0x31
    ldx.w #0x0180
    lda.b 0x0B
    lsr
    bcc .C516

    ldx.w #0xFE80
.C516:
    stx.b 0x1A
    sep #0x30
    lda.b #0x3C
    sta.b 0x33
    lda.b #0x0F
    sta.b 0x36
    lda.b #0x08
    sta.b 0x34
    sta.b 0x35
.C528:
    jsl 0x82825D
    jsl 0x848EEA
    jmp .C6B1

.C533:
    dec.b 0x34
    bne .C549

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x35
    sta.b 0x34
    dec.b 0x35
    lda.b 0x35
    cmp.b #0x01
    bne .C549

    inc.b 0x35
.C549:
    dec.b 0x33
    bne .C55A

.C54D:
    lda.b #0x06
    sta.b 0x03
    lda.b #0x04
    sta.b 0x33
    jsl 0x84A445
    rts

.C55A:
    lda.w 0x0BE2
    ora.w 0x0BE3
    beq .C578

    dec.b 0x36
    bne .C578

    lda.b #0x08
    sta.b 0x03
    lda.b #0x1E
    sta.b 0x33
    lda.b #0x02
    sta.b 0x26
    lda.b #0x01
    jsl 0x848F07
.C578:
    lda.w 0x0BD3
    bit.b #0x03
    bne .C54D

    jsr .C5FF
    jsr .C6DD
    jmp .C6B1

.C588:
    dec.b 0x33
    bne .C599

    lda.b #0x01
    trb.w 0x0C26
    trb.b 0x37
    lda.b #0x04
    sta.b 0x01
    sta.b 0x02
.C599:
    jmp .C6B1

.C59C:
    dec.b 0x33
    bne .C5AB

    lda.b #0x01
    trb.w 0x0C26
    trb.b 0x37
    stz.b 0x02
    stz.b 0x03
.C5AB:
    jsl 0x848EEA
    rts

.C5B0:
    ldx.b 0x03
    bne .C5C8

    inc.b 0x03
    lda.b #0x80
    sta.b 0x1C
    lda.b #0x01
    sta.b 0x1D
    lda.b #0x20
    sta.b 0x33
    lda.b #0x00
    jsl 0x848F07
.C5C8:
    dec.b 0x33
    bne .C5D0

    stz.b 0x02
    stz.b 0x03
.C5D0:
    jsl 0x82825D
    jsl 0x848EEA
    rts

.C5D9:
    ldx.b 0x02
    bne .C5E1

    jsl 0x84A4AB
.C5E1:
    jsr .C646
    lda.b 0x37
    lsr
    bcc .C5EE

    lda.b #0x01
    trb.w 0x0C26
.C5EE:
    jml .C6FE

.C5F2:
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
    rts

.C5FF:
    jsl 0x82823E
    jsl 0x848EEA
    rts

.C608:
    rep #0x21
    lda.b 0x08
    adc.w #0x0010
    cmp.w 0x0BB0
    sep #0x20
    bcs .C645

    stz.b 0x26
    lda.b #0xF0
    sta.b 0x20
    lda.b #0xD2
    sta.b 0x21
    jsl 0x849B03
    beq .C639

    lda.w 0x0C26
    lsr
    bcs .C639

    lda.b #0x01
    tsb.w 0x0C26
    tsb.b 0x37
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
.C639:
    lda.b #0x02
    sta.b 0x26
    lda.b #0xEB
    sta.b 0x20
    lda.b #0xD2
    sta.b 0x21
.C645:
    rts

.C646:
    rep #0x10
    ldy.w #0x0001
.C64B:
    jsl 0x8282D3
    bne .C69C

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda.b #0xBB
    sta.w 0x000B,X
    lda.b #0x30
    cpy.w #0x0000
    beq .C667

    lda.b #0x70
.C667:
    ora.b 0x11
    sta.w 0x0011,X
    jsr .C69F
    dey
    bpl .C64B

    ldy.w #0x0005
.C675:
    jsl 0x8282D3
    bne .C69C

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda.b #0x30
    sta.w 0x0011,X
    jsl 0x849086
    and.b #0x01
    clc
    adc.b #0x39
    ora.b #0x80
    sta.w 0x000B,X
    jsr .C69F
    dey
    bpl .C675

.C69C:
    sep #0x10
    rts

.C69F:
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    stz.w 0x000C,X
    sep #0x20
    rts

.C6B1:
    lda.w 0x0BCF
    and.b #0x7F
    beq .C6DC

    rep #0x21
    lda.b 0x08
    adc.w #0x0010
    sta.w 0x0BB0
    lda.w #0x0006
    bit.w 0x0BB8
    bvc .C6CD

    lda.w #0xFFFA
.C6CD:
    clc
    adc.b 0x05
    sta.w 0x0BAD
    sep #0x20
    lda.b 0x0F
    and.b #0x01
    sta.w 0x0BC1
.C6DC:
    rts

;-----

.C6DD:
    rep #0x20
    lda.b 0x05
    sec
    sbc.b 0x37
    bpl .C6EA

    eor.w #0xFFFF
    inc
.C6EA:
    cmp.w #0x0040
    bcc .C6FB

    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    jsl 0x82823E
.C6FB:
    sep #0x20
    rts

;-----

.C6FE:
    lda.b 0x0B
    bpl .C706

    jml 0x828398

.C706:
    jml 0x828387