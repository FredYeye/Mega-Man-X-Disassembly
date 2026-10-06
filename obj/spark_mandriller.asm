spark_mandriller:
    ldx.b 0x01
    jmp (.9BE6,X)

.9BE6: d16[.9BEE, .9C5C, .9D6E, .A334]

.9BEE:
    lda.b 0x02
    bne .9C22

    jsl 0x84AACA
    beq .9BFC

    jml 0x828398

.9BFC:
    jsl 0x849FE6
    stz.w 0x00CB
    stz.w 0x00CC
    stz.w 0x00CD
    stz.w 0x00C9
    lda.b #0xAF
    sta.w 0x00CA
    inc.b 0x02
    lda.b #0x3C
    sta.b 0x34
    lda.w 0x1F26
    beq .9C22

    lda.b #0x2E
    jsl _80878B
.9C22:
    dec.b 0x34
    beq .9C38

    lda.w 0x00CB
    inc
    cmp.b #0x20
    bcs .9C37

    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
.9C37:
    rtl

.9C38:
    jsl 0x82827D
    rep #0x20
    lda.w #0xCFBB
    sta.b 0x20
    sep #0x20
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x04
    sta.b 0x12
    stz.b 0x02
    lda.b #0x06
    jsl _848EEA.8F07
    lda.b #0xFF
    sta.b 0x2F
    rtl

.9C5C:
    ldx.b 0x02
    jmp (.9C61,X)

.9C61: d16[.9C6F, .9C84, .9CB7, .9CE5, .9D05, .9D15, .9D3C]

.9C6F:
    jsl _848EEA
    lda.b 0x0F
    beq .9C80

    lda.b #0x02
    sta.b 0x02
    lda.b #0x9F
    sta.w 0x00CA
.9C80:
    jml 0x8280B4

.9C84:
    jsl _848EEA
    lda.b 0x0F
    bpl .9CA4

    lda.b #0x04
    sta.b 0x02
    stz.w 0x00CA
    stz.w 0x00CB
    stz.w 0x00CC
    stz.w 0x00CD
    lda.b #0x40
    sta.b 0x1E
    jml 0x8280B4

.9CA4:
    lda.w 0x00CB
    dec
    bmi .9CB3

    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
.9CB3:
    jml 0x8280B4

.9CB7:
    jsl update_pos_xy.neg_ay
    jsl _848EEA
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .9CE1

    lda.b #0x06
    sta.b 0x02
    lda.b #0x05
    jsl _848EEA.8F07
    stz.b 0x2F
    lda.b #0x4D
    jsl _80888B
    lda.b #0x1E
    jsl 0x84A333
.9CE1:
    jml 0x8280B4

.9CE5:
    jsl _848EEA
    lda.b 0x0F
    bpl .9D01

    lda.b #0x08
    sta.b 0x02
    lda.b #0x04
    jsl _848EEA.8F07
    rep #0x20
    tdc
    sta.w 0x1F0E
    sep #0x20
    stz.b 0x27
.9D01:
    jml 0x8280B4

.9D05:
    jsl _848EEA
    lda.b 0x0F
    bpl .9D11

    lda.b #0x0A
    sta.b 0x02
.9D11:
    jml 0x8280B4

.9D15:
    lda.w 0x0B9C
    lsr
    bcc .9D34

    lda.b #0x0C
    jsl _80888B.88B6
    lda.b 0x27
    and.b #0x7F
    inc
    sta.b 0x27
    cmp.b #0x20
    bcc .9D34

    lda.b #0x0C
    sta.b 0x02
    lda.b #0x1E
    sta.b 0x34
.9D34:
    lda.b #0x80
    tsb.b 0x27
    jml 0x8280B4

.9D3C:
    dec.b 0x34
    bne .9D6A

    jsl 0x849FFE
    lda.b #0x04
    sta.b 0x01
    stz.b 0x03
    jsl get_rng
    and.b #0x03
    asl
    sta.b 0x02
    stz.b 0x03
    lda.b #0x06
    sta.b 0x26
    stz.b 0x35
    stz.b 0x30
    stz.b 0x36
    lda.w 0x1F26
    beq .9D6A

    lda.b #0x1E
    jsl _80878B
.9D6A:
    jml 0x8280B4

.9D6E:
    lda.b #0x0E
    trb.b 0x11
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x02
    jsr (.9E2C,X)
    lda.w 0x0BCF
    and.b #0x7F
    bne .9D85

    jmp .9E11

.9D85:
    lda.b #0x0A
    ldx.b 0x35
    beq .9D8D

    lda.b #0x05
.9D8D:
    sta.b 0x28
    lda.b 0x17
    and.b #0x7F
    tax
    lda.w 0x00CF78,X
    asl
    asl
    rep #0x20
    and.w #0x00FF
    adc.w #0xCF97
    sta.b 0x20
    sep #0x20
    jsl 0x849B43
    beq .9E11

    bpl .9DCD

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    lda.b #0x11
    jsl _848EEA.8F07
    lda.b #0x13
    jsl _80888B
    lda.b #0x29
    sta.b 0x11
    jsl 0x84AC92
    jml 0x8280B4

.9DCD:
    lda.b #0x3C
    sta.b 0x35
    lda.b #0x13
    jsl _80888B
    lda.b 0x02
    cmp.b #0x04
    bne .9DFA

    lda.b 0x03
    cmp.b #0x02
    bne .9DFA

    lda.w 0x1F1D
    cmp.b #0x01
    beq .9DF2

    cmp.b #0x02
    beq .9DF2

    cmp.b #0x03
    bne .9DFA

.9DF2:
    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
    bra .9E11

.9DFA:
    lda.w 0x1F1D
    cmp.b #0x0E
    beq .9E05

    cmp.b #0x17
    bne .9E11

.9E05:
    lda.b 0x02
    cmp.b #0x0A
    beq .9E11

    lda.b #0x0A
    sta.b 0x02
    stz.b 0x03
.9E11:
    lda.b 0x35
    beq .9E24

    dec
    sta.b 0x35
    and.b #0x03
    bne .9E24

    lda.b 0x36
    bne .9E24

    lda.b #0x0E
    trb.b 0x11
.9E24:
    jsl 0x849B03
    jml 0x8280B4

.9E2C: d16[.9E38, .9F24, .A059, .A16E, .A20B, .A25E]

.9E38:
    ldx.b 0x03
    jmp (.9E3D,X)

.9E3D: d16[.9E45, .9E72, .9EF6, .9F14]

.9E45:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x09
    jsl _848EEA.8F07
    jsl 0x84AC92
    lda.b #0x16
    sta.b 0x2A
    lda.b 0x11
    asl
    asl
    lda.b #0x16
    bcs .9E61

    lda.b #0xEA
.9E61:
    sta.b 0x2A
    jsl _8490A0
    cmp.b #0x34
    bcc .9E71

    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
.9E71:
    rts

.9E72:
    jsl _848EEA
    lda.b 0x0F
    beq .9EF5

    lda.b #0x04
    sta.b 0x03
    lda.b #0x06
    tsb.b 0x11
    lda.b #0x0A
    jsl 0x84A333
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x001A
    bcs .9E96

    lda.w #0xFFE6
.9E96:
    clc
    adc.b 0x05
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0x0018
    sta.w 0x0002
    jsl 0x828358
    bne .9EF3

    inc.w 0x0000,X
    lda.b #0x28
    sta.w 0x000A,X
    stz.w 0x000B,X
    rep #0x20
    lda.w 0x0000
    sta.w 0x0005,X
    lda.w 0x0002
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
    sep #0x30
    lda.b #0x44
    jsl _80888B
    jsl 0x828358
    bne .9EF3

    inc.w 0x0000,X
    lda.b #0x28
    sta.w 0x000A,X
    sta.w 0x000B,X
    rep #0x20
    lda.w 0x0000
    sta.w 0x0005,X
    lda.w 0x0002
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
.9EF3:
    sep #0x30
.9EF5:
    rts

.9EF6:
    jsl _848EEA
    lda.b 0x0F
    beq .9F13

    bpl .9F0F

    lda.b #0x06
    sta.b 0x03
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x20
    sta.b 0x34
    rts

.9F0F:
    lda.b #0x06
    tsb.b 0x11
.9F13:
    rts

.9F14:
    jsl 0x84AC92
    jsl _848EEA
    dec.b 0x34
    bne .9F23

    jmp .A362

.9F23:
    rts

.9F24:
    ldx.b 0x03
    jmp (.9F29,X)

.9F29: d16[.9F37, .9F59, .9F7A, .9F8D, .A002, .A032, .A049]

.9F37:
    jsl 0x84AC92
    lda.b #0x02
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    lda.w #0x06C3
    sta.b 0x1C
    stz.b 0x1A
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
    rts

.9F59:
    jsl _848EEA
    lda.b 0x0F
    bpl .9F79

    jsl update_pos_xy.neg_ay
    lda.b 0x1D
    bpl .9F79

    lda.b #0x07
    jsl _848EEA.8F07
    lda.b #0x04
    sta.b 0x03
    lda.b #0x0A
    jsl 0x84A333
.9F79:
    rts

.9F7A:
    jsl _848EEA
    lda.b 0x0F
    bpl .9F8C

    lda.b #0x08
    jsl _848EEA.8F07
    lda.b #0x06
    sta.b 0x03
.9F8C:
    rts

.9F8D:
    lda.b 0x0F
    bpl .9FA6

    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x001C
    bcs .9F9F

    lda.w #0xFFE4
.9F9F:
    clc
    adc.b 0x05
    sta.b 0x05
    sep #0x20
.9FA6:
    jsl _848EEA
    lda.b 0x0F
    and.b #0x0F
    sta.w 0x0000
    asl
    asl
    adc.w 0x0000
    rep #0x20
    and.w #0x00FF
    clc
    adc.w #0xCFC0
    sta.b 0x20
    lda.b 0x10
    asl
    asl
    bcs .9FCB

    inc.b 0x22
    bra .9FCD

.9FCB:
    dec.b 0x22
.9FCD:
    sep #0x20
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    bne .9FEB

    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    sep #0x20
    ror
    lsr
    eor.b 0x11
    and.b #0x40
    beq .A001

.9FEB:
    lda.b #0x07
    jsl _848EEA.8F07
    lda.b #0x08
    sta.b 0x03
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
.A001:
    rts

.A002:
    jsl update_pos_xy.neg_ay
    rep #0x20
    lda.w #0xCFBB
    sta.b 0x20
    sep #0x20
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .A031

    lda.b #0x05
    jsl _848EEA.8F07
    stz.b 0x2F
    lda.b #0x0A
    sta.b 0x03
    lda.b #0x4D
    jsl _80888B
    lda.b #0x1E
    jsl 0x84A333
.A031:
    rts

.A032:
    jsl _848EEA
    lda.b 0x0F
    bpl .A048

    lda.b #0x0C
    sta.b 0x03
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x20
    sta.b 0x34
.A048:
    rts

.A049:
    jsl 0x84AC92
    jsl _848EEA
    dec.b 0x34
    bne .A058

    jmp .A362

.A058:
    rts

.A059:
    ldx.b 0x03
    jmp (.A05E,X)

.A05E: d16[.A068, .A0CE, .A10D, .A122, .A15E]

.A068:
    jsl 0x84AC92
    stz.b 0x2A
    lda.b 0x11
    asl
    asl
    lda.b #0x22
    bcs .A078

    lda.b #0xDE
.A078:
    sta.b 0x29
    jsl _8490A0
    cmp.b #0x34
    bcs .A0C3

    lda.b #0x32
    ldx.b 0x29
    bpl .A08A

    lda.b #0xCE
.A08A:
    sta.b 0x29
    jsl _8490A0
    cmp.b #0x34
    bcs .A0C3

    lda.b #0x38
    ldx.b 0x29
    bpl .A09C

    lda.b #0xC8
.A09C:
    sta.b 0x29
    jsl _8490A0
    cmp.b #0x34
    bcs .A0C3

    lda.b #0x0A
    jsl _848EEA.8F07
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0400
    bcs .A0BA

    lda.w #0xFC00
.A0BA:
    sta.b 0x1A
    sep #0x20
    lda.b #0x02
    sta.b 0x03
    rts

.A0C3:
    lda.b #0x04
    sta.b 0x03
    lda.b #0x10
    jsl _848EEA.8F07
    rts

.A0CE:
    jsl _848EEA
    lda.b 0x0F
    bpl .A0FF

    jsl update_pos_x
    rep #0x20
    lda.w #0xCFD4
    sta.b 0x20
    sep #0x20
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    beq .A0FF

    lda.b #0x0B
    jsl _848EEA.8F07
    lda.b #0x06
    sta.b 0x03
    lda.b #0x1E
    sta.b 0x34
    jsl 0x84A311
.A0FF:
    rep #0x20
    lda.w #0xCFD9
    sta.b 0x20
    sep #0x20
    jsl 0x849B03
    rts

.A10D:
    jsl _848EEA
    lda.b 0x0F
    beq .A121

    lda.b #0x06
    sta.b 0x03
    lda.b #0x1E
    sta.b 0x34
    jsl 0x84A311
.A121:
    rts

.A122:
    rep #0x20
    lda.w #0xCFD9
    sta.b 0x20
    sep #0x20
    jsl 0x849B03
    jsl _848EEA
    dec.b 0x34
    bne .A146

    lda.b #0x08
    sta.b 0x03
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x20
    sta.b 0x34
    rts

.A146:
    lda.w 0x0C32
    bne .A15D

    lda.w 0x0C06
    and.b #0x03
    beq .A15D

    lda.w 0x0C2F
    bmi .A15D

    lda.b #0x20
    jsl 0x84A008
.A15D:
    rts

.A15E:
    jsl 0x84AC92
    jsl _848EEA
    dec.b 0x34
    bne .A16D

    jmp .A362

.A16D:
    rts

.A16E:
    ldx.b 0x03
    jmp (.A173,X)

.A173: d16[.A17D, .A1A3, .A1B4, .A1E4, .A1FB]

.A17D:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x02
    jsl _848EEA.8F07
    jsl 0x84AC92
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    asl
    asl
    sta.b 0x1A
    lda.w #0x070D
    sta.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    rts

.A1A3:
    jsl _848EEA
    lda.b 0x0F
    bpl .A1B3

    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x04
    sta.b 0x03
.A1B3:
    rts

.A1B4:
    jsl update_pos_xy.neg_ay
    rep #0x20
    lda.w #0xCFBB
    sta.b 0x20
    sep #0x20
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .A1E3

    lda.b #0x05
    jsl _848EEA.8F07
    stz.b 0x2F
    lda.b #0x06
    sta.b 0x03
    lda.b #0x4D
    jsl _80888B
    lda.b #0x1E
    jsl 0x84A333
.A1E3:
    rts

.A1E4:
    jsl _848EEA
    lda.b 0x0F
    bpl .A1FA

    lda.b #0x08
    sta.b 0x03
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x20
    sta.b 0x34
.A1FA:
    rts

.A1FB:
    jsl 0x84AC92
    jsl _848EEA
    dec.b 0x34
    bne .A20A

    jmp .A362

.A20A:
    rts

.A20B:
    lda.b 0x03
    bne .A235

    inc.b 0x03
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0400
    bcc .A21F

    lda.w #0xFC00
.A21F:
    sta.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x20
    sta.b 0x1F
    stz.b 0x1E
    lda.b #0x20
    sta.b 0x34
    lda.b #0x01
    jsl _848EEA.8F07
.A235:
    jsl _848EEA
    lda.b 0x11
    asl
    asl
    bcs .A245

    jsl update_pos_xy.neg_ay_ax
    bra .A249

.A245:
    jsl update_pos_xy.neg_ay_pos_ax
.A249:
    rep #0x20
    lda.w #0xCFBB
    sta.b 0x20
    sep #0x20
    jsl 0x8491BE
    dec.b 0x34
    bne .A25D

    jmp .A362

.A25D:
    rts

.A25E:
    lda.b 0x11
    and.b #0xF1
    ora.b #0x0A
    sta.b 0x11
    ldx.b 0x03
    jmp (.A26B,X)

.A26B: d16[.A275, .A29D, .A2CD, .A2DF, .A322]

.A275:
    lda.b #0x01
    sta.b 0x36
    lda.b #0x3C
    sta.b 0x34
    lda.b 0x2F
    beq .A298

    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0x12
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x03
    rts

.A298:
    lda.b #0x04
    sta.b 0x03
    rts

.A29D:
    jsl update_pos_xy.neg_ay
    rep #0x20
    lda.w #0xCFBB
    sta.b 0x20
    sep #0x20
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .A2C6

    lda.b #0x04
    sta.b 0x03
    stz.b 0x2F
    lda.b #0x4D
    jsl _80888B
    lda.b #0x1E
    jsl 0x84A333
.A2C6:
    lda.b 0x34
    beq .A2CC

    dec.b 0x34
.A2CC:
    rts

.A2CD:
    lda.b 0x34
    bne .A2DC

    lda.b #0x06
    sta.b 0x03
    lda.b #0x12
    jsl _848EEA.8F07
    rts

.A2DC:
    dec.b 0x34
    rts

.A2DF:
    jsl _848EEA
    lda.b 0x0F
    bpl .A321

    lda.b #0x08
    sta.b 0x03
    lda.b #0x1E
    sta.b 0x34
    ldy.b #0x0F
.A2F1:
    jsl 0x8282D3
    bne .A319

    inc.w 0x0000,X
    lda.b #0x06
    sta.w 0x000A,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    tya
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    dey
    bpl .A2F1

.A319:
    sep #0x30
    lda.b #0x4C
    jsl _80888B
.A321:
    rts

.A322:
    lda.b 0x11
    and.b #0xF1
    ora.b #0x08
    sta.b 0x11
    dec.b 0x34
    bne .A333

    stz.b 0x36
    jmp .A362

.A333:
    rts

.A334:
    jsl 0x84A66D
    bpl .A353

    lda.w 0x1F7A
    cmp.b #0x09
    bcc .A34F

    lda.b #0x1C
    jsl _80878B
    lda.b #0xF5
    ldy.b #0x03
    jsl _808850.8868
.A34F:
    jml 0x828398

.A353:
    jsl _848EEA
    lda.b 0x03
    cmp.b #0x14
    bcs .A361

    jml 0x8280B4

.A361:
    rtl

.A362:
    lda.b 0x02
    asl
    clc
    adc.b #0x03
    tax
    ldy.b #0x03
    jsl get_rng
    and.b #0x1F
.A371:
    sec
    sbc.w 0x00CFDE,X
    bcc .A37B

    dex
    dey
    bne .A371

.A37B:
    tya
    asl
    sta.b 0x02
    stz.b 0x03
    rts
