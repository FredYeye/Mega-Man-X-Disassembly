ride_armor:
    ldx.b 0x01
    jmp (.C5AD,X)

.C5AD: d16[.C5B3, .C652, .CAA8]

.C5B3:
    lda.b 0x0B
    cmp.b #0x01
    beq .C5C4

    jsl 0x84A1D0
    tya
    beq .C5C4

    jml 0x828387

.C5C4:
    jsl 0x82827D
    lda.b #0x04
    sta.b 0x12
    stz.b 0x33
    stz.b 0x2F
    lda.b #0x02
    sta.b 0x26
    lda.b #0x03
    sta.b 0x27
    sta.b 0x3B
    lda.b #0x03
    sta.b 0x28
    stz.b 0x35
    stz.b 0x10
    stz.b 0x32
    rep #0x20
    lda.w #0xCF34
    sta.b 0x20
    stz.b 0x36
    stz.b 0x38
    lda.w #0x0040
    sta.b 0x1E
    sep #0x20
    lda.b 0x0B
    bmi .C638

    lda.w 0x0E18
    bne .C638

    inc.w 0x0E18
    stz.w 0x0E4B
    rep #0x31
    lda.w #0x0020
    ldx.w 0x0BAD
    cpx.b 0x05
    bcc .C61A

    lda.w #0x0040
    tsb.w 0x0E4B
    lda.w #0xFFE0
.C61A:
    adc.b 0x05
    sta.w 0x0E1D
    lda.b 0x08
    clc
    adc.w #0xFFF0
    sta.w 0x0E20
    stz.w 0x0E19
    stz.w 0x0E1B
    sep #0x30
    lda.b 0x0B
    beq .C651

.C634:
    jml 0x828387

.C638:
    lda.b 0x0B
    bmi .C63E

    bne .C634

.C63E:
    lda.b #0x06
    sta.b 0x02
    lda.b #0x10
    sta.b 0x27
    rep #0x21
    lda.b 0x08
    adc.w #0xFFF0
    sta.b 0x08
    sep #0x20
.C651:
    rtl

.C652:
    jsl 0x82806E
    bcc .C65C

    jml 0x828387

.C65C:
    lda.l 0x7F8349
    ora.b 0x33
    sta.b 0x11
    ldx.b 0x02
    jsr (.C6CD,X)
    jsl 0x8280B4
    lda.b 0x27
    and.b #0x7F
    sta.b 0x3B
    jsl 0x849B43
    beq .C6B7

    bpl .C682

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    rtl

.C682:
    lda.b #0x0E
    trb.b 0x11
    bit.b 0x10
    bvc .C6B7

    lda.w 0x1F1B
    sta.b 0x3A
    sta.b 0x33
    lda.b #0x0D
    jsr _83CD15
    lda.w 0x1F1D
    cmp.b #0x19
    beq .C6A1

    cmp.b #0x1A
    bne .C6A5

.C6A1:
    lda.b #0x3C
    bra .C6A7

.C6A5:
    lda.b #0x09
.C6A7:
    jsl _80888B
    lda.b #0x06
    sta.b 0x35
    lda.b #0x05
    sta.b 0x28
    lda.b #0x02
    sta.b 0x32
.C6B7:
    jsr _83CBA2
    jsr _83CBAF
    lda.b 0x11
    and.b #0x3F
    ora.b 0x33
    sta.b 0x11
    jsl 0x849B03
    jml 0x8491BE

.C6CD: d16[
    .C6E9, .C743, .C7AD, .C7D3, .C80D, .C82A, .C88F,
    .C8F1, .C92D, .C995, .C9E3, .CA49, .CA76, .C9C9,
]

.C6E9:
    ldx.b 0x03
    jsr (.C6F1,X)
    jmp .CAF5

.C6F1: d16[.C6F7, .C701, .C724]

.C6F7:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x18
    jsl 0x848F07
.C701:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    clc
    adc.w #0x0060
    cmp.w #0x00C0
    sep #0x20
    bcs .C71C

    lda.b #0x04
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x34
.C71C:
    jsr .C735
    jsl 0x848EEA
    rts

.C724:
    jsr .C735
    dec.b 0x34
    bne .C730

    lda.b #0x02
    jmp _8386F1

.C730:
    jsl 0x848EEA
    rts

.C735:
    lda.b 0x27
    and.b #0x7F
    cmp.b #0x03
    beq .C742

    lda.b #0x02
    jmp _8386F1

.C742:
    rts

.C743:
    ldx.b 0x03
    bne .C774

    inc.b 0x03
    lda.b #0x40
    sta.b 0x33
    rep #0x30
    lda.w #0x0100
    ldx.w 0x0E1D
    cpx.b 0x05
    bcs .C761

    lda.w #0x0040
    trb.b 0x33
    lda.w #0xFF00
.C761:
    sta.b 0x1A
    lda.w #0x0500
    sta.b 0x1C
    sep #0x30
    lda.b #0x04
    trb.b 0x2B
    lda.b #0x1A
    jsl 0x848F07
.C774:
    lda.b 0x2B
    bit.b #0x04
    beq .C7A8

    jsr .CAF5
    bne .C7A8

    lda.b #0x40
    tsb.b 0x10
    lda.b #0x10
    sta.b 0x27
    stz.w 0x0E18
    stz.w 0x0E19
    stz.w 0x0E1A
    stz.w 0x0E1B
    rep #0x21
    lda.b 0x08
    adc.w #0xFFF8
    sta.b 0x08
    lda.w #0xCF3E
    sta.b 0x20
    sep #0x20
    lda.b #0x04
    jmp _8386F1

.C7A8:
    jsl 0x828174
    rts

.C7AD:
    ldx.b 0x03
    bne .C7BF

    inc.b 0x03
    lda.b 0x33
    eor.b #0x40
    sta.b 0x33
    lda.b #0x09
    jsl 0x848F07
.C7BF:
    lda.b 0x0F
    bpl .C7C8

    lda.b #0x06
    jmp _8386F1

.C7C8:
    lsr
    bcc .C7CE

    jsr _83CD3E
.C7CE:
    jsl 0x848EEA
    rts

.C7D3:
    ldx.b 0x03
    bne .C7F4

    inc.b 0x03
    lda.b #0x40
    tsb.b 0x10
    rep #0x20
    lda.w #0xCF3E
    sta.b 0x20
    sep #0x20
    jsl 0x849086
    and.b #0x3F
    sta.b 0x34
    lda.b #0x00
    jsl 0x848F07
.C7F4:
    dec.b 0x34
    bne .C7FD

    lda.b #0x0A
    jmp _8386F1

.C7FD:
    lda.b 0x2B
    bit.b #0x04
    bne .C80C

    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x16
    jmp _8386F1

.C80C:
    rts

.C80D:
    ldx.b 0x03
    bne .C819

    inc.b 0x03
    lda.b #0x02
    jsl 0x848F07
.C819:
    lda.b 0x0F
    bpl .C822

    lda.b #0x06
    jmp _8386F1

.C822:
    jsr _83CB69
    jsl 0x848EEA
    rts

.C82A:
    ldx.b 0x03
    bne .C836

    inc.b 0x03
    lda.b #0x01
    jsl 0x848F07
.C836:
    lda.b 0x2B
    bit.b #0x04
    bne .C845

    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x16
    jmp _8386F1

.C845:
    jsr _83CB14
    jsl 0x82823E
    lda.b #0x00
    xba
    lda.b #0x70
    jsr _83CB28
    bcc .C85B

    lda.b #0x10
    jmp _8386F1

.C85B:
    jsr _83CB3F
    bcs .C86A

    lda.b 0x2B
    bit.b #0x03
    beq .C86F

    lda.b #0x80
    tsb.b 0x10
.C86A:
    lda.b #0x0C
    jmp _8386F1

.C86F:
    lda.b #0x00
    xba
    lda.b #0x35
    jsr _83CB28
    bcs .C87E

    lda.b #0x08
    jmp _8386F1

.C87E:
    jsl 0x848EEA
    lda.b 0x0F
    and.b #0x03
    beq .C88E

    ora.b #0x38
    jsl _80888B
.C88E:
    rts

.C88F:
    ldx.b 0x03
    bne .C8CE

    inc.b 0x03
    lda.b 0x10
    bmi .C8AD

    jsl 0x849086
    and.b #0x01
    bne .C8AD

    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
.C8AD:
    lda.b #0x80
    trb.b 0x10
    lda.b #0x53
    sta.b 0x1C
    lda.b #0x05
    sta.b 0x1D
    lda.b #0x38
    jsl _80888B
    lda.b #0x08
    sta.b 0x2F
    lda.b #0x0C
    jsr _83CD15
    lda.b #0x03
    jsl 0x848F07
.C8CE:
    lda.b 0x1D
    bmi .C8D8

    lda.b 0x2B
    bit.b #0x08
    beq .C8DD

.C8D8:
    lda.b #0x16
    jmp _8386F1

.C8DD:
    lda.b #0x00
    xba
    lda.b #0x35
    jsr _83CB28
    bcs .C8EC

    lda.b #0x0E
    jmp _8386F1

.C8EC:
    jsl 0x828174
    rts

.C8F1:
    ldx.b 0x03
    bne .C8FD

    inc.b 0x03
    lda.b #0x05
    jsl 0x848F07
.C8FD:
    lda.b 0x2B
    bit.b #0x08
    beq .C907

    stz.b 0x1C
    stz.b 0x1D
.C907:
    bit.b #0x04
    beq .C910

    lda.b #0x18
    jmp _8386F1

.C910:
    lda.b 0x0F
    bpl .C921

    lda.b 0x1D
    bpl .C91C

    lda.b #0x0C
    bra .C91E

.C91C:
    lda.b #0x16
.C91E:
    sta.b 0x02
    rts

.C921:
    jsr _83CB69
    jsl 0x828174
    jsl 0x848EEA
    rts

.C92D:
    ldx.b 0x03
    bne .C955

    inc.b 0x03
    rep #0x20
    lda.w #0x0400
    bit.b 0x32
    bvs .C93F

    lda.w #0xFC00
.C93F:
    sta.b 0x1A
    sep #0x20
    stz.b 0x31
    lda.b #0x3B
    jsl _80888B
    lda.b #0x40
    sta.b 0x34
    lda.b #0x06
    jsl 0x848F07
.C955:
    jsr _83CDB0
    dec.b 0x34
    bne .C961

    lda.b #0x1A
    jmp _8386F1

.C961:
    lda.b 0x2B
    bit.b #0x04
    bne .C970

    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x16
    jmp _8386F1

.C970:
    bit.b #0x03
    beq .C97D

    lda.b #0x80
    tsb.b 0x10
    lda.b #0x0C
    jmp _8386F1

.C97D:
    lda.b #0x00
    xba
    lda.b #0x50
    jsr _83CB28
    bcs .C98C

    lda.b #0x12
    jmp _8386F1

.C98C:
    jsl 0x82823E
    jsl 0x848EEA
    rts

.C995:
    ldx.b 0x03
    bne .C9A1

    inc.b 0x03
    lda.b #0x08
    jsl 0x848F07
.C9A1:
    dec.b 0x34
    beq .C9B8

    lda.b 0x2B
    bit.b #0x04
    bne .C9B4

    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x16
    jmp _8386F1

.C9B4:
    bit.b #0x03
    beq .C9BD

.C9B8:
    lda.b #0x1A
    jmp _8386F1

.C9BD:
    jsr _83CB69
    jsl 0x82823E
    jsl 0x848EEA
    rts

.C9C9:
    ldx.b 0x03
    bne .C9D5

    inc.b 0x03
    lda.b #0x07
    jsl 0x848F07
.C9D5:
    lda.b 0x0F
    bpl .C9DE

    lda.b #0x0A
    jmp _8386F1

.C9DE:
    jsl 0x848EEA
.C9E2:
    rts

.C9E3:
    ldx.b 0x03
    jmp (.C9E8,X)

.C9E8: d16[.C9F2, .C9FF, .C9EE]

.C9EE:
    dec.b 0x34
    bne .C9E2

.C9F2:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x1B
    jsl 0x848F07
    jsr _83CB02
.C9FF:
    bit.b 0x0F
    bvc .CA32

    jsl 0x828358
    bne .CA32

    inc.w 0x0000,X
    lda.b #0x15
    sta.w 0x000A,X
    lda.b 0x33
    sta.w 0x0011,X
    rep #0x21
    lda.b 0x08
    adc.w #0xFFF9
    sta.w 0x0008,X
    lda.w #0x0013
    bit.b 0x32
    bvs .CA2A

    lda.w #0xFFED
.CA2A:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    sep #0x20
.CA32:
    lda.b 0x0F
    bpl .CA44

    lda.b #0x3C
    sta.b 0x34
    lda.b #0x18
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x03
.CA44:
    jsl 0x848EEA
    rts

.CA49:
    ldx.b 0x03
    bne .CA59

    inc.b 0x03
    lda.b #0x08
    sta.b 0x2F
    lda.b #0x03
    jsl 0x848F07
.CA59:
    lda.b 0x2B
    bit.b #0x04
    beq .CA64

    lda.b #0x18
    jmp _8386F1

.CA64:
    rep #0x20
    lda.w #0xFA80
    cmp.b 0x1C
    bmi .CA6F

    sta.b 0x1C
.CA6F:
    sep #0x20
    jsl 0x828174
    rts

.CA76:
    ldx.b 0x03
    bne .CA9A

    inc.b 0x03
    ldx.b #0x02
    ldy.b #0x01
    lda.b #0x0A
    jsl 0x84A33C
    lda.b #0x39
    jsl _80888B
    stz.b 0x2F
    jsr _83CD3E
    jsr _83CD69
    lda.b #0x04
    jsl 0x848F07
.CA9A:
    lda.b 0x0F
    bpl .CAA3

    lda.b #0x0A
    jmp _8386F1

.CAA3:
    jsl 0x848EEA
    rts

.CAA8:
    ldx.b 0x02
    bne .CAC4

    inc.b 0x02
    lda.b #0x01
    sta.b 0x34
    bit.b 0x10
    bvc .CAC3

    lda.b #0x1E
    sta.b 0x34
    jsr _83CC43.CC4F
    jsr _83CC43
    jsr _83CCBA
.CAC3:
    rtl

.CAC4:
    dec.b 0x34
    bne .CAD0

    jsl 0x84A4AB
    jml 0x828387

.CAD0:
    rep #0x20
    lda.w #0xFFF0
    sta.w 0x0000
    lda.w #0xFFE0
    sta.w 0x0002
    lda.w #0x001F
    sta.w 0x0004
    lda.w #0x003F
    sta.w 0x0006
    sep #0x20
    lda.b #0x07
    sta.w 0x0008
    jml 0x84A4C6

.CAF5:
    bit.w 0x0E22
    bvc .CAFF

    lda.b #0x14
    jmp _8386F1

.CAFF:
    lda.b #0x00
    rts
