storm_eagleed:
    ldx.b 0x01
    jmp (.D861,X)

.D861: d16[.D869, .D8BE, .D9A1, .DDE0]

.D869:
    lda.b 0x02
    bne .D888

    inc.b 0x02
    jsl 0x84AACA
    beq .D879

    jml 0x828398

.D879:
    lda.b #0x3C
    sta.b 0x34
    lda.w 0x1F26
    beq .D888

    lda.b #0x2E
    jsl _80878B
.D888:
    dec.b 0x34
    beq .D88D

    rtl

.D88D:
    jsl 0x82827D
    lda.b 0x11
    ora.b #0x30
    sta.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x83
    sta.b 0x10
    lda.b #0x02
    sta.b 0x12
    stz.b 0x27
    stz.b 0x36
    stz.b 0x37
    lda.b #0x04
    sta.b 0x26
    rep #0x20
    lda.w #0xD40A
    sta.b 0x20
    lda.w #0xB32E
    sta.b 0x31
    sep #0x20
    stz.b 0x02
    rtl

.D8BE:
    ldx.b 0x02
    jsr (.D8C7,X)
    jml 0x8280B4

.D8C7: d16[.D8D1, .D902, .D93D, .D94A, .D992]

.D8D1:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x05
    sta.b 0x38
    jsl 0x848F07
    lda.b #0x01
    tsb.b 0x11
    rep #0x20
    lda.w 0x1E4D
    clc
    adc.w #0x00D0
    sta.b 0x05
    lda.w 0x1E50
    sta.b 0x08
    lda.w #0xFF00
    sta.b 0x1C
    lda.w #0xD40A
    sta.b 0x20
    sep #0x20
    lda.b #0xFF
    sta.b 0x2F
    rts

.D902:
    jsl 0x82825D
    jsl 0x848EEA
    lda.b 0x17
    bpl .D91C

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    bpl .D91C

    lda.b #0x58
    jsl _80888B
.D91C:
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .D93C

    lda.b #0x04
    sta.b 0x02
    stz.b 0x2F
    lda.b #0x0B
    sta.b 0x38
    jsl 0x848F07
    rep #0x20
    tdc
    sta.w 0x1F0E
    sep #0x20
.D93C:
    rts

.D93D:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .D949

    lda.b #0x06
    sta.b 0x02
.D949:
    rts

.D94A:
    inc.b 0x34
    lda.b 0x34
    lsr
    bcc .D98D

    lda.b #0x0C
    jsl _80888B.88B6
    lda.b 0x27
    and.b #0x7F
    inc
    sta.b 0x27
    cmp.b #0x20
    bcc .D98D

    lda.b #0x08
    sta.b 0x02
    lda.b #0x1E
    sta.b 0x34
    rep #0x20
    lda.w 0x1E4D
    and.w #0xFF00
    sec
    sbc.w #0x0100
    sta.w 0x1E5E
    clc
    adc.w #0x0200
    sta.w 0x1E60
    sep #0x20
    lda.w 0x1F26
    beq .D98D

    lda.b #0x1E
    jsl _80878B
.D98D:
    lda.b #0x80
    tsb.b 0x27
    rts

.D992:
    dec.b 0x34
    bne .D9A0

    jsl 0x849FFE
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
.D9A0:
    rts

.D9A1:
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x02
    jsr (.DA22,X)
    jsr .DE3F
    lda.b #0x07
    ldx.b 0x37
    beq .D9B5

    lda.b #0x05
.D9B5:
    sta.b 0x28
    jsl 0x849B43
    beq .DA00

    bpl .D9F2

    lda.b #0x01
    tsb.w 0x0BD8
    tsb.w 0x1F0C
    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    lda.b #0x89
    sta.b 0x16
    lda.b #0x01
    tsb.b 0x11
    lda.b #0x0A
    sta.b 0x38
    jsl 0x848F07
    jsl 0x84AC92
    lda.b #0x01
    tsb.w 0x1F42
    lda.b #0x13
    jsl _80888B
    jml 0x8280B4

.D9F2:
    lda.b 0x37
    bne .DA00

    lda.b #0x3C
    sta.b 0x37
    lda.b #0x13
    jsl _80888B
.DA00:
    lda.b 0x37
    beq .DA0F

    dec
    sta.b 0x37
    and.b #0x03
    bne .DA0F

    lda.b #0x0E
    trb.b 0x11
.DA0F:
    jsl 0x849B03
    lda.w 0x0BCF
    and.b #0x7F
    bne .DA1E

    lda.b #0x01
    sta.b 0x30
.DA1E:
    jml 0x8280B4

.DA22: d16[.DA2A, .DB33, .DC7C, .DD31]

.DA2A:
    ldx.b 0x03
    jmp (.DA2F,X)

.DA2F: d16[.DA37, .DA98, .DABD, .DB27]

.DA37:
    lda.b #0x04
    sta.b 0x03
    lda.b #0x03
    sta.b 0x39
    jsl 0x84AC92
    rep #0x20
    jsl 0x849086
    lsr
    bcc .DA51

    lda.w #0x00F0
    bra .DA5C

.DA51:
    lsr
    bcc .DA59

    lda.w #0x0168
    bra .DA5C

.DA59:
    lda.w #0x0078
.DA5C:
    sta.b 0x34
    sep #0x20
    lda.b 0x2F
    beq .DA8F

    lda.b #0x02
    sta.b 0x03
    rep #0x20
    lda.w #0xFF00
    sta.b 0x1C
    lda.w 0x1E60
    clc
    adc.w 0x1E5E
    clc
    adc.w #0x0100
    lsr
    sec
    sbc.b 0x05
    bcs .DA84

    eor.w #0xFFFF
    inc
.DA84:
    cmp.w #0x00F0
    sep #0x20
    bcc .DA8E

    jmp .DE1F

.DA8E:
    rts

.DA8F:
    lda.b #0x01
    sta.b 0x38
    jsl 0x848F07
    rts

.DA98:
    jsl 0x848EEA
    jsl 0x82825D
    jsl 0x84AC92
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .DABC

    lda.b #0x01
    sta.b 0x38
    jsl 0x848F07
    stz.b 0x2F
    lda.b #0x04
    sta.b 0x03
.DABC:
    rts

.DABD:
    jsl 0x848EEA
    jsr .DE63
    rep #0x20
    lda.w 0x0BB0
    sec
    sbc.b 0x08
    bcc .DAD3

    cmp.w #0x0010
    bcs .DB0E

.DAD3:
    lda.b 0x10
    asl
    asl
    lda.w 0x0BAD
    bcs .DAF6

    cmp.b 0x05
    bcs .DB0E

    lda.w 0x0BAC
    sec
    sbc.w #0x0200
    sta.w 0x0BAC
    sep #0x20
    lda.w 0x0BAE
    sbc.b #0x00
    sta.w 0x0BAE
    bra .DB0E

.DAF6:
    cmp.b 0x05
    bcc .DB0E

    lda.w 0x0BAC
    clc
    adc.w #0x0200
    sta.w 0x0BAC
    sep #0x20
    lda.w 0x0BAE
    adc.b #0x00
    sta.w 0x0BAE
.DB0E:
    rep #0x20
    dec.b 0x34
    sep #0x20
    bne .DB26

    lda.b #0x28
    sta.b 0x34
    lda.b #0x00
    sta.b 0x38
    jsl 0x848F07
    lda.b #0x06
    sta.b 0x03
.DB26:
    rts

.DB27:
    jsl 0x848EEA
    dec.b 0x34
    bne .DB32

    jsr .DE1F
.DB32:
    rts

.DB33:
    ldx.b 0x03
    jmp (.DB38,X)

.DB38: d16[.DB44, .DB7D, .DBEC, .DC10, .DC46, .DC6C]

.DB44:
    lda.b #0x02
    sta.b 0x03
    lda.b 0x2F
    bne .DB58

    lda.b #0x05
    sta.b 0x38
    jsl 0x848F07
    lda.b #0xFF
    sta.b 0x2F
.DB58:
    rep #0x20
    lda.w #0x0180
    sta.b 0x1C
    sep #0x20
    lda.b 0x36
    bne .DB7A

    jsl 0x849086
    and.b #0x0F
    cmp.b #0x04
    bcc .DB7C

    jsl 0x849086
    and.b #0x03
    clc
    adc.b #0x06
    sta.b 0x36
.DB7A:
    dec.b 0x36
.DB7C:
    rts

.DB7D:
    jsl 0x848EEA
    jsl 0x82825D
    rep #0x20
    lda.w 0x1E50
    sec
    sbc.b 0x08
    bmi .DBE5

    cmp.w #0x0030
    bcc .DBE5

    lda.w 0x0BB0
    sec
    sbc.b 0x08
    sta.w 0x0000
    jsl 0x849086
    lsr
    bcc .DBB2

    lda.w 0x0BAD
    sec
    sbc.w 0x0000
    sta.b 0x05
    lda.w #0x0400
    bra .DBBE

.DBB2:
    lda.w 0x0BAD
    clc
    adc.w 0x0000
    sta.b 0x05
    lda.w #0xFC00
.DBBE:
    sta.b 0x1A
    lda.w #0xFC00
    sta.b 0x1C
    sep #0x20
    lda.b #0x04
    sta.b 0x03
    lda.b #0x8A
    sta.b 0x16
    lda.b #0x01
    trb.b 0x11
    lda.b #0x02
    sta.b 0x38
    jsl 0x848F07
    jsl 0x848FCA
    lda.b #0x0E
    jsl _80888B
.DBE5:
    sep #0x20
    jsl 0x84AC92
    rts

.DBEC:
    jsl 0x848EEA
    jsl 0x82820A
    rep #0x20
    lda.b 0x08
    sec
    sbc.w 0x1E50
    bmi .DC0D

    cmp.w #0x0110
    bcc .DC0D

    sep #0x20
    lda.b #0x06
    sta.b 0x03
    lda.b #0x28
    sta.b 0x34
.DC0D:
    sep #0x20
    rts

.DC10:
    dec.b 0x34
    bne .DC45

    rep #0x20
    lda.w 0x1E50
    sec
    sbc.w #0x0030
    sta.b 0x08
    sep #0x20
    lda.b #0x01
    tsb.b 0x11
    lda.b #0x89
    sta.b 0x16
    lda.b #0x05
    sta.b 0x38
    jsl 0x848F07
    lda.b 0x36
    beq .DC38

    stz.b 0x03
    rts

.DC38:
    rep #0x20
    lda.w #0xFF00
    sta.b 0x1C
    sep #0x20
    lda.b #0x08
    sta.b 0x03
.DC45:
    rts

.DC46:
    jsl 0x82825D
    jsl 0x848EEA
    jsl 0x84AC92
    rep #0x20
    lda.b 0x08
    sec
    sbc.w 0x1E50
    bmi .DC69

    cmp.w #0x0040
    bcc .DC69

    ldx.b #0x0A
    stx.b 0x03
    ldx.b #0x18
    stx.b 0x34
.DC69:
    sep #0x20
    rts

.DC6C:
    jsl 0x848EEA
    jsl 0x84AC92
    dec.b 0x34
    bne .DC7B

    jsr .DE1F
.DC7B:
    rts

.DC7C:
    ldx.b 0x03
    jmp (.DC81,X)

.DC81: d16[.DC89, .DCCD, .DCE4, .DD25]

.DC89:
    jsl 0x84AC92
    lda.b 0x2F
    beq .DCBE

    lda.b #0x02
    sta.b 0x03
    rep #0x20
    lda.w 0x1E5E
    clc
    adc.w 0x1E60
    clc
    adc.w #0x0100
    lsr
    sec
    sbc.b 0x05
    bcs .DCAC

    eor.w #0xFFFF
    inc
.DCAC:
    cmp.w #0x00F0
    bcc .DCB6

    sep #0x20
    jmp .DE1F

.DCB6:
    lda.w #0xFF00
    sta.b 0x1C
    sep #0x20
    rts

.DCBE:
    lda.b #0x04
    sta.b 0x03
    stz.b 0x2F
    lda.b #0x03
    sta.b 0x38
    jsl 0x848F07
    rts

.DCCD:
    jsl 0x848EEA
    jsl 0x82825D
    jsl 0x84AC92
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    bne .DCBE

    rts

.DCE4:
    jsl 0x848EEA
    lda.b 0x0F
    beq .DD24

    rep #0x10
    jsl 0x828358
    bne .DD1E

    inc.w 0x0000,X
    lda.b #0x24
    sta.w 0x000A,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    asl
    asl
    rep #0x20
    lda.w #0x0027
    bcs .DD0F

    lda.w #0xFFD9
.DD0F:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x000A
    sta.w 0x0008,X
.DD1E:
    sep #0x30
    lda.b #0x06
    sta.b 0x03
.DD24:
    rts

.DD25:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .DD30

    jsr .DE1F
.DD30:
    rts

.DD31:
    ldx.b 0x03
    jmp (.DD36,X)

.DD36: d16[.DD3E, .DD71, .DD82, .DDD0]

.DD3E:
    jsl 0x84AC92
    lda.b 0x2F
    bne .DD64

    rep #0x20
    lda.w #0x0100
    sta.b 0x1C
    sep #0x20
    lda.b #0x05
    sta.b 0x38
    jsl 0x848F07
    lda.b #0x5A
    sta.b 0x34
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x02
    sta.b 0x03
    rts

.DD64:
    lda.b #0x06
    sta.b 0x38
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x03
    rts

.DD71:
    jsl 0x848EEA
    jsl 0x82825D
    jsl 0x84AC92
    dec.b 0x34
    beq .DD64

    rts

.DD82:
    jsl 0x848EEA
    lda.b 0x0F
    beq .DDCF

    bpl .DD9D

    lda.b #0x06
    sta.b 0x03
    lda.b #0x05
    sta.b 0x38
    jsl 0x848F07
    lda.b #0x14
    sta.b 0x34
    rts

.DD9D:
    jsl 0x828321
    bne .DDCD

    inc.w 0x0000,X
    lda.b #0x55
    sta.w 0x000A,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    asl
    asl
    rep #0x20
    lda.w #0x0012
    bcs .DDBE

    lda.w #0xFFEE
.DDBE:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0006
    sta.w 0x0008,X
.DDCD:
    sep #0x30
.DDCF:
    rts

.DDD0:
    jsl 0x848EEA
    jsl 0x84AC92
    dec.b 0x34
    bne .DDDF

    jsr .DE1F
.DDDF:
    rts

.DDE0:
    jsl 0x84A66D
    bpl .DE14

    lda.w 0x1F7A
    cmp.b #0x09
    bcc .DE10

    lda.b #0x1B
    jsl _80878B
    lda.b #0xF5
    ldy.b #0x03
    jsl _808850.8868
    rep #0x20
    lda.w #0x1200
    sta.w 0x1E60
    lda.w #0x0D00
    sta.w 0x1E5E
    sep #0x20
    lda.b #0x02
    sta.w 0x1F81
.DE10:
    jml 0x828398

.DE14:
    lda.b 0x03
    cmp.b #0x14
    bcs .DE1E

    jml 0x8280B4

.DE1E:
    rtl

;-----

.DE1F:
    lda.b 0x02
    asl
    clc
    adc.b #0x03
    tax
    ldy.b #0x03
    jsl 0x849086
    and.b #0x1F
.DE2E:
    sec
    sbc.w 0x00D41E,X
    bcc .DE38

    dex
    dey
    bne .DE2E

.DE38:
    tya
    asl
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.DE3F:
    lda.b 0x17
    bpl .DE62

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    bpl .DE62

    lda.b 0x38
    cmp.b #0x05
    bne .DE58

    lda.b #0x58
    jsl _80888B
    rts

.DE58:
    cmp.b #0x01
    bne .DE62

    lda.b #0x59
    jsl _80888B
.DE62:
    rts

;-----

.DE63:
    dec.b 0x39
    bne .DE92

    lda.b #0x03
    sta.b 0x39
    jsl 0x8282D3
    bne .DE90

    inc.w 0x0000,X
    lda.b #0x29
    sta.w 0x000A,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x001A
    sta.w 0x0008,X
.DE90:
    sep #0x30
.DE92:
    rts
