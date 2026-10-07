flamer:
    lda.b 0x3E
    tsb.b 0x11
    ldx.b 0x01
    jmp (.DF85,X)

.DF85: d16[.DF91, .E015, .E073, .E0E7, .E131, .E168]

.DF91:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x3E
    lda.b #0x04
    sta.b 0x12
    lda.b 0x0B
    and.b #0x7F
    bne .DFCA

    lda.b #0x03
    sta.b 0x3B
    rep #0x20
    lda.w #0xD151
    sta.b 0x20
    lda.b 0x08
    sta.b 0x33
    sta.b 0x35
    sta.b 0x37
    sta.b 0x39
    sep #0x20
    lda.b #0x03
    sta.b 0x26
    lda.b #0x06
    sta.b 0x27
    lda.b #0x00
    jml 0x848F07

.DFCA:
    lda (0x0C)
    beq .DFDC

    ldy.b #0x01
    lda (0x0C),Y
    beq .DFDC

    ldy.b #0x0B
    lda (0x0C),Y
    and.b #0x7F
    beq .DFE0

.DFDC:
    jml 0x828398

.DFE0:
    lda.b #0x01
    sta.b 0x27
    sta.b 0x30
    lda.b #0x02
    sta.b 0x26
    lda.b #0x10
    sta.b 0x3B
    lda.b #0x02
    jsl _848EEA.8F07
    lda.b #0x06
    sta.b 0x01
    ldy.b #0x11
    lda (0x0C),Y
    and.b #0x40
    tsb.b 0x11
    lda.b 0x0B
    dec
    bne .E00D

    lda.b #0x01
    sta.b 0x3B
    lda.b #0x0F
    sta.b 0x3C
.E00D:
    rep #0x20
    lda.w #0xD155
    sta.b 0x20
    rtl

.E015:
    jsl 0x84AC92
    lda.b 0x3B
    beq .E022

    dec.b 0x3B
    jmp .E085

.E022:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .E030

    eor.w #0xFFFF
    inc
.E030:
    cmp.w #0x0060
    bcs .E06F

    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bcs .E041

    eor.w #0xFFFF
    inc
.E041:
    cmp.w #0x0020
    bcs .E06F

    jsl 0x828321
    bne .E06F

    inc.w 0x0000,X
    lda.b #0x38
    sta.w 0x000A,X
    lda.b #0x01
    sta.w 0x000B,X
    lda.b #0x04
    sta.b 0x01
    lda.b #0x50
    sta.b 0x3B
    rep #0x20
    tdc
    sta.w 0x000C,X
    sep #0x20
    lda.b #0x01
    jsl _848EEA.8F07
.E06F:
    sep #0x30
    bra .E085

.E073:
    dec.b 0x3B
    bne .E085

    lda.b #0x02
    sta.b 0x01
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x3C
    sta.b 0x3B
.E085:
    lda.b 0x0B
    bpl .E09B

    rep #0x30
    ldx.b 0x0C
    lda.w 0x0005,X
    sta.b 0x05
    lda.w 0x0008,X
    sec
    sbc.w #0x0013
    sta.b 0x08
.E09B:
    rep #0x20
    lda.b 0x37
    sta.b 0x39
    lda.b 0x35
    sta.b 0x37
    lda.b 0x33
    sta.b 0x35
    lda.b 0x08
    sta.b 0x33
    sep #0x30
    jsl _849B03
    jsl 0x849B43
    beq .E0D9

    bpl .E0D5

    lda.b 0x0B
    bmi .E0C5

    lda.b #0x00
    jsl 0x84A37F
.E0C5:
    jsl 0x84A4AB
.E0C9:
    lda.b 0x0B
    bmi .E0D1

    jml 0x828387

.E0D1:
    jml 0x828398

.E0D5:
    lda.b #0x0E
    trb.b 0x11
.E0D9:
    jsl 0x82806E
    bcs .E0C9

    jsl _848EEA
    jml 0x8280B4

.E0E7:
    inc.b 0x3C
    jsr .E178
    dec.b 0x3B
    bne .E138

    lda.b 0x0B
    cmp.b #0x04
    beq .E119

    jsl 0x828321
    bne .E119

    inc.w 0x0000,X
    lda.b #0x38
    sta.w 0x000A,X
    lda.b 0x0B
    inc
    sta.w 0x000B,X
    lda.b 0x0C
    sta.w 0x000C,X
    lda.b 0x0D
    sta.w 0x000D,X
    lda.b 0x3C
    sta.w 0x003C,X
.E119:
    sep #0x30
    lda.b 0x3B
    lda.b #0x04
    sec
    sbc.b 0x0B
    asl
    asl
    asl
    asl
    clc
    adc.b #0x1E
    sta.b 0x3B
    lda.b #0x08
    sta.b 0x01
    bra .E138

.E131:
    jsr .E178
    dec.b 0x3B
    beq .E152

.E138:
    lda (0x0C)
    beq .E152

    ldy.b #0x0A
    lda (0x0C),Y
    cmp.b #0x38
    bne .E152

    ldy.b #0x01
    lda (0x0C),Y
    beq .E152

    ldy.b #0x0B
    lda (0x0C),Y
    and.b #0x7F
    beq .E15C

.E152:
    lda.b #0x0A
    sta.b 0x01
    lda.b #0x03
    jsl _848EEA.8F07
.E15C:
    jsl _849B03
    jsl _848EEA
    jml 0x8280B4

.E168:
    jsl _848EEA
    lda.b 0x0F
    bpl .E174

    jml 0x828398

.E174:
    jml 0x8280B4

;-----

.E178:
    php
    sep #0x30
    ldy.b #0x05
    lda.b 0x3C
    sta.w 0x0000
    stz.w 0x0001
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda (0x0C),Y
    bcc .E199

    clc
    adc.w 0x0000
    clc
    adc.w #0x0008
    bra .E1A1

.E199:
    sec
    sbc.w 0x0000
    sec
    sbc.w #0x0008
.E1A1:
    sta.b 0x05
    lda.b 0x0B
    and.w #0x000F
    dec
    asl
    clc
    adc.w #0x0033
    tay
    lda (0x0C),Y
    sec
    sbc.w #0x0003
    sta.b 0x08
    plp
    rts
