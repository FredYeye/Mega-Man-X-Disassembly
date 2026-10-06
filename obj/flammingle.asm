flammingle:
    ldx.b 0x01
    jsr (.C030,X)
    rtl

.C030: d16[.C036, .C063, .C1A4]

.C036:
    jsl 0x82827D
    lda.b #0x08
    sta.b 0x27
    lda.b #0x03
    sta.b 0x26
    lda.b #0x02
    sta.b 0x12
    stz.b 0x2F
    stz.b 0x35
    lda.l 0x7F8302
    sta.b 0x11
    rep #0x20
    ldx.b #0x00
    stx.b 0x33
    jsl 0x8280B4
    sep #0x20
    lda.b #0x01
    jsl _848EEA.8F07
    rts

.C063:
    ldx.b 0x02
    jsr (.C0C8,X)
    jsl 0x8280B4
    lda.l 0x7F8302
    sta.b 0x11
    lda.b 0x11
    and.b #0x3F
    ora.b 0x33
    sta.b 0x11
    rep #0x20
    lda.b 0x0F
    and.w #0x003F
    asl
    clc
    adc.w #0xC55C
    sta.b 0x20
    sep #0x20
    jsl 0x849B03
    stz.b 0x30
    jsl 0x849B43
    beq .C0A6

    lda.b #0x0E
    trb.b 0x11
    sta.b 0x30
    lda.b 0x27
    and.b #0x7F
    bne .C0A6

    lda.b #0x04
    sta.b 0x01
.C0A6:
    rep #0x20
    lda.w #0xC558
    sta.b 0x20
    sep #0x20
    jsl 0x849B43
    beq .C0C3

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    bne .C0C3

    lda.b #0x04
    sta.b 0x01
.C0C3:
    jsl 0x849B03
    rts

.C0C8: d16[.C0D0, .C12F, .C150, .C170]

.C0D0:
    ldx.b 0x03
    bne .C0E1

    inc.b 0x03
    lda.b #0x78
    sta.b 0x34
    lda.b #0x01
    jsl _848EEA.8F07
    rts

.C0E1:
    rep #0x10
    lda.b #0x00
    ldx.w 0x0BAD
    cpx.b 0x05
    bcc .C0EE

    lda.b #0x40
.C0EE:
    cmp.b 0x33
    bra .C0F9

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rts

.C0F9:
    lda.b 0x34
    beq .C10E

    lda.b 0x35
    beq .C10A

    stz.b 0x35
    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    rts

.C10A:
    dec.b 0x34
    bra .C12A

.C10E:
    ldx.b 0x20
    phx
    ldx.w #0xC554
    stx.b 0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcc .C125

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.C125:
    plx
    stx.b 0x20
    sep #0x10
.C12A:
    jsl _848EEA
    rts

.C12F:
    ldx.b 0x03
    bne .C13C

    inc.b 0x03
    lda.b #0x02
    jsl _848EEA.8F07
    rts

.C13C:
    bit.b 0x0F
    bvc .C143

    jsr .C200
.C143:
    lda.b 0x0F
    bpl .C14B

    stz.b 0x02
    stz.b 0x03
.C14B:
    jsl _848EEA
    rts

.C150:
    ldx.b 0x03
    bne .C15D

    inc.b 0x03
    lda.b #0x03
    jsl _848EEA.8F07
    rts

.C15D:
    lda.b 0x0F
    bpl .C16B

    lda.b 0x33
    eor.b #0x40
    sta.b 0x33
    stz.b 0x02
    stz.b 0x03
.C16B:
    jsl _848EEA
    rts

.C170:
    ldx.b 0x03
    jmp (.C175,X)

.C175: d16[.C17B, .C184, .C197]

.C17B:
    lda.b #0x02
    sta.b 0x03
    jsl _848EEA.8F07
    rts

.C184:
    lda.b 0x0F
    bpl .C192

    lda.b #0x04
    sta.b 0x03
    lda.b #0x02
    jsl _848EEA.8F07
.C192:
    jsl _848EEA
    rts

.C197:
    lda.b 0x0F
    bpl .C19F

    stz.b 0x02
    stz.b 0x03
.C19F:
    jsl _848EEA
    rts

.C1A4:
    lda.b #0x00
    jsl 0x84A37F
    jsl 0x84A4AB
    rep #0x21
    jsl get_rng
    and.w #0x0003
    asl
    tax
    jsl get_rng
    and.w #0x0003
    asl
    tay
    lda.b 0x05
    adc.w 0x86C580,X
    sta.w 0x0000
    lda.b 0x08
    sec
    sbc 0x86C588,Y
    sta.w 0x0002
    lda.w #0x0508
    sta.w 0x0004
    phx
    phy
    jsl 0x84A462
    plx
    ply
    lda.b 0x05
    clc
    adc.w 0x86C580,X
    sta.w 0x0000
    lda.b 0x08
    clc
    adc 0x86C588,Y
    sta.w 0x0002
    jsl 0x84A462
    sep #0x20
    jsl 0x828387
    stz.b 0x30
    rts

;-----

.C200:
    jsl 0x828358
    bne .C23E

    inc.w 0x0000,X
    lda.b #0x03
    sta.w 0x000A,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x11
    and.b #0xF0
    ora.l 0x7F8302
    sta.w 0x0011,X
    rep #0x21
    lda.w #0x0010
    bit.b 0x10
    bvs .C22A

    lda.w #0xFFF0
.C22A:
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0010
    sta.w 0x0008,X
    tdc
    sta.w 0x003A,X
    sep #0x20
.C23E:
    sep #0x10
    rts
