gulpfer:
    lda.b 0x3C
    tsb.b 0x11
    ldx.b 0x01
    jsr (.A3A1,X)
    jsl 0x82806E
    bcc .A34D

    jml 0x828387

.A34D:
    lda.b 0x3D
    beq .A35C

    lda.w 0x1F0D
    beq .A35C

    jsl 0x849DC8
    bra .A362

.A35C:
    jsl 0x849B43
    beq .A39D

.A362:
    lda.b 0x27
    and.b #0x7F
    bne .A399

    lda.b #0x0A
    sta.b 0x01
    stz.b 0x03
    lda.b #0x07
    jsl 0x848F07
    lda.b #0x23
    jsl _80888B
    lda.b 0x3E
    beq .A384

    jsl 0x849FAD
    stz.b 0x3E
.A384:
    lda.b 0x3B
    beq .A38B

    stz.w 0x0BD8
.A38B:
    lda.b 0x3D
    beq .A399

    lda.b #0x01
    sta.w 0x0BB6
    stz.b 0x3D
    stz.w 0x0BE5
.A399:
    lda.b #0x0E
    trb.b 0x11
.A39D:
    jml 0x8280B4

.A3A1: d16[.A3AD, .A3E3, .A422, .A538, .A5C4, .A68B]

.A3AD:
    jsl 0x82827D
    lda.b #0x02
    sta.b 0x12
    stz.b 0x03
    stz.b 0x3B
    stz.b 0x3D
    stz.b 0x3E
    lda.b #0x00
    jsl 0x848F07
    lda.b #0xFF
    sta.b 0x2F
    lda.b 0x11
    and.b #0x0E
    sta.b 0x3C
    lda.b #0x0A
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    rep #0x20
    lda.w #0xCB31
    sta.b 0x20
    lda.b 0x05
    sta.b 0x31
    sep #0x20
    rts

.A3E3:
    lda.b 0x02
    bne .A40E

    inc.b 0x02
    rep #0x20
    lda.w 0x0BAD
    cmp.b 0x05
    sep #0x20
    lda.b #0x00
    ror
    lsr
    tsb.b 0x11
    and.b #0x40
    rep #0x20
    beq .A403

    lda.w #0x0080
    bra .A406

.A403:
    lda.w #0xFF80
.A406:
    sta.b 0x1A
    sep #0x20
    lda.b #0x1E
    sta.b 0x33
.A40E:
    jsl 0x82823E
    jsl 0x848EEA
    dec.b 0x33
    bne .A41D

    jsr .A72B
.A41D:
    jsl 0x849B03
    rts

.A422:
    ldx.b 0x02
    jmp (.A427,X)

.A427: d16[.A42D, .A435, .A4FE]

.A42D:
    lda.b #0x02
    sta.b 0x02
    lda.b #0xB4
    sta.b 0x33
.A435:
    jsl 0x848EEA
    dec.b 0x33
    bne .A448

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    stz.b 0x34
    stz.b 0x03
    rts

.A448:
    lda.w 0x0BD8
    ora.w 0x1F0C
    bne .A45A

    lda.w 0x0BCF
    beq .A45A

    lda.w 0x0BB6
    bne .A45D

.A45A:
    jmp .A4F9

.A45D:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcc .A48E

    cmp.w #0x0060
    sep #0x20
    bcs .A481

    lda.b 0x11
    and.b #0x40
    bne .A477

    jmp .A4F9

.A477:
    jsl 0x84A07C
    cmp.b #0x06
    bcc .A4F9

    cmp.b #0x0B
.A481:
    bcs .A4F9

    sta.b 0x35
    lda.w 0x0BD3
    and.b #0x04
    beq .A4B5

    bra .A4B0

.A48E:
    cmp.w #0xFFA0
    sep #0x20
    bcc .A4F9

    lda.b 0x11
    and.b #0x40
    bne .A4F9

    jsl 0x84A07C
    cmp.b #0x16
    bcc .A4F9

    cmp.b #0x1B
    bcs .A4F9

    sta.b 0x35
    lda.w 0x0BD3
    and.b #0x04
    beq .A4B5

.A4B0:
    jsr .A6A1
    bra .A4B8

.A4B5:
    jsr .A6A1
.A4B8:
    rep #0x30
    lda.b 0x20
    pha
    lda.w #0xCB3B
    sta.b 0x20
    sep #0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    rep #0x20
    pla
    sta.b 0x20
    sep #0x30
    bcc .A4F9

    lda.b #0x01
    sta.w 0x0BD8
    sta.b 0x3B
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    lda.b #0x10
    sta.w 0x0000
    stz.w 0x0001
    jsr .A75E
    lda.b #0x01
    jsl 0x848F07
    inc.b 0x3E
    jsl 0x849F85
    rts

.A4F9:
    jsl 0x849B03
    rts

.A4FE:
    lda.b #0x03
    tsb.w 0x0BD4
    jsl 0x84A07C
    sta.b 0x35
    jsr .A6A1
    jsl 0x848EEA
    lda.b 0x0F
    bpl .A537

    lda.b #0x08
    sta.b 0x01
    stz.b 0x02
    jsl 0x849FAD
    stz.b 0x3E
    stz.w 0x0BB6
    inc.b 0x3D
    lda.b #0x01
    sta.w 0x0BE5
    lda.b #0xB4
    sta.b 0x33
    rep #0x20
    lda.w #0xCB3F
    sta.b 0x20
    sep #0x20
.A537:
    rts

.A538:
    lda.b 0x02
    bne .A58E

    inc.b 0x34
    lda.b 0x34
    cmp.b #0x08
    bcc .A54F

    jsl 0x849086
    lsr
    bcc .A54F

    jsr .A72B
    rts

.A54F:
    inc.b 0x34
    lda.b #0x1E
    sta.b 0x33
    jsl 0x84A07C
    asl
    asl
    tax
    bit.b #0x40
    beq .A566

    lda.b #0x40
    trb.b 0x11
    bra .A56A

.A566:
    lda.b #0x40
    tsb.b 0x11
.A56A:
    rep #0x20
    lda.w 0x00EE3A,X
    lsr
    lsr
    bit.w #0x2000
    beq .A579

    ora.w #0xC000
.A579:
    sta.b 0x1A
    lda.w 0x00EE3C,X
    lsr
    lsr
    bit.w #0x2000
    beq .A588

    ora.w #0xC000
.A588:
    sta.b 0x1C
    sep #0x20
    inc.b 0x02
.A58E:
    jsr .A799
    lda.b 0x1D
    bmi .A5A9

    lda.b #0xE8
    sta.b 0x2A
    stz.b 0x29
    jsl 0x8490A0
    cmp.b #0x0D
    beq .A5A9

    jsl 0x82823E
    bra .A5AD

.A5A9:
    jsl 0x82820A
.A5AD:
    jsl 0x8491BE
    lda.b 0x2B
    bne .A5B9

    dec.b 0x33
    bne .A5BB

.A5B9:
    stz.b 0x02
.A5BB:
    jsl 0x848EEA
    jsl 0x849B03
    rts

.A5C4:
    jsl 0x848EEA
    jsr .A799
    stz.w 0x0C19
    lda.b 0x11
    and.b #0x40
    rep #0x20
    bne .A5DB

    lda.w #0xFF80
    bra .A5DE

.A5DB:
    lda.w #0x0080
.A5DE:
    sta.b 0x1A
    sep #0x20
    jsl 0x82823E
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    bne .A5F4

    lda.b 0x06
    bpl .A5FA

.A5F4:
    lda.b #0x40
    eor.b 0x11
    sta.b 0x11
.A5FA:
    rep #0x20
    lda.b 0x05
    sta.w 0x0BAD
    lda.b 0x08
    sta.w 0x0BB0
    sep #0x30
    dec.b 0x33
    bne .A619

    lda.b #0x02
    sta.w 0x0BCE
    jsl 0x849F25
    lda.b #0xB4
    sta.b 0x33
.A619:
    ldx.b 0x02
    jmp (.A61E,X)

.A61E: d16[.A624, .A650, .A67E]

.A624:
    lda.b #0x07
    tsb.w 0x0BD4
    lda.w 0x0BE3
    bit.b #0x80
    beq .A63E

    lda.b #0x04
    sta.b 0x02
    lda.b #0x04
    jsl 0x848F07
    jsr .A6E4
    rts

.A63E:
    lda.w 0x0BDF
    and.b #0x03
    beq .A64F

    lda.b #0x02
    sta.b 0x02
    lda.b #0x03
    jsl 0x848F07
.A64F:
    rts

.A650:
    lda.b #0x07
    tsb.w 0x0BD4
    lda.w 0x0BE3
    and.b #0x80
    beq .A66A

    lda.b #0x04
    sta.b 0x02
    lda.b #0x04
    jsl 0x848F07
    jsr .A6E4
    rts

.A66A:
    lda.b 0x0F
    bpl .A67D

    lda.w 0x0BDF
    and.b #0x03
    bne .A67D

    stz.b 0x02
    lda.b #0x02
    jsl 0x848F07
.A67D:
    rts

.A67E:
    lda.b 0x0F
    bpl .A685

    stz.b 0x02
    rts

.A685:
    lda.b #0x08
    tsb.w 0x0BD4
    rts

.A68B:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .A6A0

    jsl 0x828387
    stz.w 0x0000
    stz.w 0x0001
    jsr .A75E
.A6A0:
    rts

;-----

.A6A1:
    php
    sep #0x30
    lda.b 0x35
    asl
    asl
    tax
    rep #0x20
    lda.w 0x0BC2
    sta.b 0x37
    lda.w 0x0BC4
    sta.b 0x39
    lda.w 0x00EE3A,X
    eor.w #0xFFFF
    inc
    sta.w 0x0BC2
    lda.w 0x00EE3C,X
    eor.w #0xFFFF
    inc
    sta.w 0x0BC4
    phd
    pea 0x0BA8
    pld
    jsl 0x82820A
    pld
    lda.b 0x37
    sta.w 0x0BC2
    lda.b 0x39
    bpl .A6DF

    lda.w #0x0000
.A6DF:
    sta.w 0x0BC4
    plp
    rts

;-----

.A6E4:
    lda.b 0x27
    and.b #0x7F
    sec
    sbc.b #0x02
    sta.b 0x27
    beq .A6F1

    bpl .A726

.A6F1:
    lda.b #0x80
    sta.b 0x27
    lda.b #0x0A
    sta.b 0x01
    lda.b #0x06
    jsl 0x848F07
    lda.b #0x23
    jsl _80888B
    lda.b 0x3E
    beq .A70F

    jsl 0x849FAD
    stz.b 0x3E
.A70F:
    lda.b 0x3B
    beq .A718

    stz.w 0x0BD8
    stz.b 0x3B
.A718:
    lda.b 0x3D
    beq .A726

    lda.b #0x01
    sta.w 0x0BB6
    stz.w 0x0BE5
    stz.b 0x3D
.A726:
    lda.b #0x0E
    trb.b 0x11
    rts

;-----

.A72B:
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    inc.b 0x03
    jsl 0x8282D3
    bne .A75B

    inc.w 0x0000,X
    stz.w 0x000B,X
    lda.b #0x17
    sta.w 0x000A,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
.A75B:
    sep #0x30
    rts

;-----

.A75E:
    jsl 0x8282D3
    bne .A796

    inc.w 0x0000,X
    lda.b #0x17
    sta.w 0x000A,X
    lda.b #0x01
    sta.w 0x000B,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    rep #0x20
    bne .A784

    lda.b 0x05
    sec
    sbc.w 0x0000
    bra .A78A

.A784:
    lda.b 0x05
    clc
    adc.w 0x0000
.A78A:
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
.A796:
    sep #0x30
    rts

;-----

.A799:
    rep #0x20
    lda.b 0x05
    sec
    sbc.b 0x31
    bcc .A7B0

    cmp.w #0x0080
    bcc .A7D1

    sep #0x20
    lda.b 0x11
    and.b #0x40
    bne .A7C1

    rts

.A7B0:
    eor.w #0xFFFF
    inc
    cmp.w #0x0080
    bcc .A7D1

    sep #0x20
    lda.b 0x11
    and.b #0x40
    bne .A7D1

.A7C1:
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
.A7D1:
    sep #0x20
    rts
