boomer_kuwanger:
    ldx.b 0x01
    jmp (.8A83,X)

.8A83: d16[.8A8B, .8AD2, .8C1A, .907E]

.8A8B:
    lda.b 0x02
    bne .8AAE

    jsl 0x84AACA
    beq .8A99

    jml 0x828398

.8A99:
    jsl 0x849FE6
    inc.b 0x02
    lda.b #0x3C
    sta.b 0x34
    lda.w 0x1F26
    beq .8AAE

    lda.b #0x2E
    jsl _80878B
.8AAE:
    dec.b 0x34
    beq .8AB3

    rtl

.8AB3:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x02
    sta.b 0x12
    lda.b #0x04
    sta.b 0x26
    stz.b 0x30
    stz.b 0x02
    stz.b 0x38
    stz.b 0x3C
    stz.b 0x32
    stz.b 0x39
    rtl

.8AD2:
    ldx.b 0x02
    jsr (.8ADB,X)
    jml 0x8280B4

.8ADB: d16[.8AE7, .8B1A, .8B59, .8B94, .8BCB, .8BF8]

.8AE7:
    rep #0x20
    lda.w 0x1E4D
    clc
    adc.w #0x0010
    sta.b 0x05
    sta.b 0x36
    lda.w #0x1000
    sta.b 0x1A
    lda.w #0xF000
    sta.b 0x1C
    lda.w #0xC590
    sta.b 0x20
    sep #0x20
    lda.b #0x07
    sta.b 0x34
    sta.b 0x35
    lda.b #0x40
    tsb.b 0x11
    lda.b #0x02
    sta.b 0x02
    lda.b #0x18
    jsl 0x848F07
    rts

.8B1A:
    jsl 0x82823E
    dec.b 0x34
    bne .8B58

    lda.b 0x35
    dec
    beq .8B3A

    sta.b 0x34
    sta.b 0x35
    rep #0x20
    lda.b 0x36
    clc
    adc.w #0x0010
    sta.b 0x05
    sta.b 0x36
    sep #0x20
    rts

.8B3A:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0010
    sta.b 0x05
    lda.b 0x08
    sta.b 0x36
    sep #0x20
    lda.b #0x09
    sta.b 0x34
    sta.b 0x35
    lda.b #0x40
    trb.b 0x11
    lda.b #0x04
    sta.b 0x02
.8B58:
    rts

.8B59:
    jsl 0x82825D
    dec.b 0x34
    bne .8B93

    lda.b 0x35
    dec
    beq .8B79

    sta.b 0x34
    sta.b 0x35
    rep #0x20
    lda.b 0x36
    clc
    adc.w #0x0010
    sta.b 0x36
    sta.b 0x08
    sep #0x20
    rts

.8B79:
    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x0010
    sta.b 0x08
    lda.b 0x05
    sta.b 0x36
    sep #0x20
    lda.b #0x07
    sta.b 0x34
    sta.b 0x35
    lda.b #0x06
    sta.b 0x02
.8B93:
    rts

.8B94:
    jsl 0x82823E
    dec.b 0x34
    bne .8BCA

    lda.b 0x35
    dec
    beq .8BB4

    sta.b 0x34
    sta.b 0x35
    rep #0x20
    lda.b 0x36
    clc
    adc.w #0x0010
    sta.b 0x36
    sta.b 0x05
    sep #0x20
    rts

.8BB4:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0010
    sta.b 0x05
    tdc
    sta.w 0x1F0E
    sep #0x20
    stz.b 0x27
    lda.b #0x08
    sta.b 0x02
.8BCA:
    rts

.8BCB:
    lda.b 0x0F
    bmi .8BD4

    jsl 0x848EEA
    rts

.8BD4:
    lda.w 0x0B9C
    lsr
    bcc .8BF3

    lda.b #0x0C
    jsl _80888B.88B6
    lda.b 0x27
    and.b #0x7F
    inc
    sta.b 0x27
    cmp.b #0x20
    bcc .8BF3

    lda.b #0x0A
    sta.b 0x02
    lda.b #0x1E
    sta.b 0x34
.8BF3:
    lda.b #0x80
    tsb.b 0x27
    rts

.8BF8:
    dec.b 0x34
    bne .8C19

    jsl 0x849FFE
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    stz.b 0x35
    stz.b 0x37
    stz.b 0x36
    lda.w 0x1F26
    beq .8C19

    lda.b #0x1E
    jsl _80878B
.8C19:
    rts

.8C1A:
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x02
    jsr (.8CF2,X)
    lda.b 0x37
    beq .8C39

    stz.b 0x37
    stz.b 0x35
    lda.b 0x13
    pha
    lda.b 0x0F
    and.b #0x7F
    jsl 0x848F07
    pla
    sta.b 0x13
.8C39:
    lda.b #0x0D
    ldx.b 0x3D
    beq .8C41

    lda.b #0x05
.8C41:
    sta.b 0x28
    lda.w 0x0BDB
    cmp.b #0x02
    beq .8C4E

    lda.b 0x38
    bne .8C9B

.8C4E:
    jsl 0x849B43
    beq .8C9B

    lda.b 0x3D
    bne .8C9B

    lda.b #0x3C
    sta.b 0x3D
    lda.b 0x02
    sta.b 0x3E
    lda.b #0x08
    sta.b 0x02
    lda.b #0x40
    trb.b 0x11
    lda.w 0x1F1B
    tsb.b 0x11
    lda.b #0x10
    sta.b 0x34
    stz.b 0x38
    stz.b 0x36
    lda.b 0x3C
    beq .8C7F

    bmi .8C7F

    jsl 0x849F79
.8C7F:
    lda.b #0x03
    ldx.w 0x1F1D
    cpx.b #0x07
    beq .8C8C

    cpx.b #0x10
    bne .8C92

.8C8C:
    lda.b #0x18
    sta.b 0x34
    lda.b #0x04
.8C92:
    jsr .90B1
    lda.b #0x13
    jsl _80888B
.8C9B:
    lda.b 0x3D
    beq .8CAA

    dec
    sta.b 0x3D
    and.b #0x03
    bne .8CAA

    lda.b #0x0E
    trb.b 0x11
.8CAA:
    lda.b 0x27
    and.b #0x7F
    bne .8CC9

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    lda.b #0x01
    sta.w 0x1F0C
    sta.w 0x0BD8
    lda.b #0x04
    jsr .90B1
    jml 0x8280B4

.8CC9:
    lda.b 0x38
    bne .8CE0

    lda.b 0x39
    bne .8CE0

    jsl 0x849B03
    lda.w 0x0BCF
    and.b #0x7F
    bne .8CE0

    lda.b #0x01
    sta.b 0x30
.8CE0:
    jsr .9170
    lda.b 0x39
    beq .8CEE

    dec
    sta.b 0x39
    lsr
    bcc .8CEE

    rtl

.8CEE:
    jml 0x8280B4

.8CF2: d16[.8CFC, .8DE6, .8E5A, .8F46, .8FF4]

.8CFC:
    ldx.b 0x03
    jmp (.8D01,X)

.8D01: d16[.8D09, .8D6D, .8D94, .8DBA]

.8D09:
    jsl 0x84AC92
    lda.b #0x02
    sta.b 0x03
    lda.b #0x53
    jsl _80888B
    stz.b 0x31
    lda.b #0x01
    jsr .90B1
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0400
    bcs .8D2C

    lda.w #0xFC00
.8D2C:
    sta.b 0x1A
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .8D3A

    eor.w #0xFFFF
    inc
.8D3A:
    lsr
    lsr
    tax
    inx
    stx.b 0x34
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .8D4C

    eor.w #0xFFFF
    inc
.8D4C:
    cmp.w #0x0080
    sep #0x20
    bcs .8D62

    jsl 0x849086
    and.b #0x0F
    cmp.b #0x06
    bcc .8D6C

.8D5D:
    lda.b #0x08
    sta.b 0x34
    rts

.8D62:
    jsl 0x849086
    and.b #0x0F
    cmp.b #0x06
    bcc .8D5D

.8D6C:
    rts

.8D6D:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .8D91

    lda.b #0x04
    sta.b 0x03
    jsl 0x8282D3
    bne .8D8F

    inc.w 0x0000,X
    lda.b #0x34
    sta.w 0x000A,X
    inc.b 0x36
    rep #0x20
    tdc
    sta.w 0x000C,X
.8D8F:
    sep #0x30
.8D91:
    jmp .9113

.8D94:
    inc.b 0x31
    jsl 0x82823E
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    bne .8DA8

    dec.b 0x34
    bne .8DB7

.8DA8:
    lda.b #0x06
    sta.b 0x03
    lda.b #0x14
    sta.b 0x34
    lda.b #0x00
    jsr .90B1
    stz.b 0x36
.8DB7:
    jmp .9113

.8DBA:
    jsl 0x84AC92
    jsl 0x848EEA
    dec.b 0x34
    bne .8DE3

    lda.b 0x35
    bne .8DE1

    jsl 0x849086
    and.b #0x0F
    tax
    lda.b 0x31
    cmp.b #0x09
    bcs .8DDC

    lda.w 0x00C5A6,X
    bra .8DDF

.8DDC:
    lda.w 0x00C5B6,X
.8DDF:
    sta.b 0x02
.8DE1:
    stz.b 0x03
.8DE3:
    jmp .9113

.8DE6:
    ldx.b 0x03
    jmp (.8DEB,X)

.8DEB: d16[.8DF1, .8DFF, .8E4D]

.8DF1:
    jsl 0x84AC92
    lda.b #0x05
    jsr .90B1
    lda.b #0x02
    sta.b 0x03
    rts

.8DFF:
    jsl 0x84AC92
    jsl 0x848EEA
    lda.b 0x17
    bpl .8E4C

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    and.b #0x7F
    beq .8E3B

    jsl 0x828358
    bne .8E39

    inc.b 0x35
    inc.w 0x0000,X
    lda.b #0x1B
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0018
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
.8E39:
    sep #0x30
.8E3B:
    lda.b 0x0F
    bpl .8E4C

    lda.b #0x04
    sta.b 0x03
    lda.b #0x00
    jsr .90B1
    lda.b #0x08
    sta.b 0x34
.8E4C:
    rts

.8E4D:
    jsl 0x848EEA
    dec.b 0x34
    bne .8E59

    stz.b 0x03
    stz.b 0x02
.8E59:
    rts

.8E5A:
    ldx.b 0x03
    jmp (.8E5F,X)

.8E5F: d16[.8E69, .8E8F, .8EB1, .8EEC, .8F05]

.8E69:
    lda.b #0x02
    sta.b 0x03
    jsr .90C1
    rep #0x20
    lda.b 0x3A
    sec
    sbc.b 0x05
    lda.w #0x0800
    bcs .8E7F

    lda.w #0xF800
.8E7F:
    sta.b 0x1A
    sep #0x20
    lda.b #0x02
    jsr .90B1
    lda.b #0x50
    jsl _80888B
    rts

.8E8F:
    lda.b 0x0F
    bpl .8EA0

    lda.b 0x39
    bne .8E9F

    lda.b #0x04
    sta.b 0x03
    lda.b #0x02
    sta.b 0x39
.8E9F:
    rts

.8EA0:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .8EB0

    lda.b #0x14
    sta.b 0x39
    lda.b #0x01
    sta.b 0x38
.8EB0:
    rts

.8EB1:
    lda.b #0x02
    sta.b 0x39
    jsl 0x82823E
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    bne .8ED9

    rep #0x20
    lda.b 0x05
    sec
    sbc.b 0x3A
    bcs .8ED0

    eor.w #0xFFFF
    inc
.8ED0:
    cmp.w #0x0005
    bcs .8EE9

    lda.b 0x3A
    sta.b 0x05
.8ED9:
    sep #0x20
    lda.b #0x06
    sta.b 0x03
    lda.b #0x50
    jsl _80888B
    lda.b #0x14
    sta.b 0x39
.8EE9:
    sep #0x20
    rts

.8EEC:
    jsl 0x84AC92
    lda.b 0x39
    bne .8F04

    lda.b #0x00
    jsl 0x848F07
    lda.b #0x08
    sta.b 0x03
    lda.b #0x08
    sta.b 0x34
    stz.b 0x38
.8F04:
    rts

.8F05:
    jsl 0x84AC92
    jsl 0x848EEA
    dec.b 0x34
    bne .8F42

    lda.b 0x32
    beq .8F1A

    dec.b 0x32
    stz.b 0x03
    rts

.8F1A:
    jsl 0x849086
    and.b #0x0F
    tax
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .8F2F

    eor.w #0xFFFF
    inc
.8F2F:
    cmp.w #0x0080
    sep #0x20
    bcc .8F3B

    lda.w 0x00C5C6,X
    bra .8F3E

.8F3B:
    lda.w 0x00C5D6,X
.8F3E:
    sta.b 0x02
    stz.b 0x03
.8F42:
    jsr .9113
    rts

.8F46:
    ldx.b 0x03
    jmp (.8F4B,X)

.8F4B: d16[.8F55, .8F63, .8FA2, .8FD0, .8FE7]

.8F55:
    lda.b #0x06
    jsr .90B1
    lda.b #0x02
    sta.b 0x03
    jsl 0x84AC92
    rts

.8F63:
    jsl 0x848EEA
    lda.b 0x0F
    beq .8FA1

    jsr .9129
    beq .8F9D

    lda.b #0x04
    sta.b 0x03
    jsl 0x849F14
    lda.b #0x01
    sta.b 0x3C
    lda.b #0x52
    jsl _80888B.88B6
    lda.b #0x14
    sta.b 0x34
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0020
    bcs .8F94

    lda.w #0xFFE0
.8F94:
    clc
    adc.b 0x05
    sta.w 0x0BAD
    sep #0x20
    rts

.8F9D:
    lda.b #0x06
    sta.b 0x03
.8FA1:
    rts

.8FA2:
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0020
    bcs .8FB0

    lda.w #0xFFE0
.8FB0:
    clc
    adc.b 0x05
    sta.w 0x0BAD
    sep #0x20
    lda.b 0x34
    bne .8FCD

    jsl 0x848EEA
    lda.b 0x0F
    beq .8FCC

    lda.b #0x06
    sta.b 0x03
    lda.b #0x80
    sta.b 0x3C
.8FCC:
    rts

.8FCD:
    dec.b 0x34
    rts

.8FD0:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .8FE6

    lda.b #0x08
    sta.b 0x03
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x1E
    sta.b 0x34
.8FE6:
    rts

.8FE7:
    jsl 0x848EEA
    dec.b 0x34
    bne .8FF3

    stz.b 0x02
    stz.b 0x03
.8FF3:
    rts

.8FF4:
    jsl 0x848EEA
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.b 0x05
    bcc .9006

    dec
    dec
    bra .9008

.9006:
    inc
    inc
.9008:
    sta.b 0x05
    sep #0x20
    jsl 0x8491BE
    dec.b 0x34
    beq .9015

    rts

.9015:
    lda.b 0x35
    bne .9041

    lda.b 0x32
    bne .903A

    lda.b 0x27
    and.b #0x7F
    cmp.b #0x11
    bcs .9041

    jsl 0x849086
    and.b #0x0F
    cmp.b #0x06
    bcs .9041

    jsl 0x849086
    and.b #0x07
    clc
    adc.b #0x06
    sta.b 0x32
.903A:
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rts

.9041:
    ldx.b 0x3E
    jmp (.9046,X)

.9046: d16[.9050, .9059, .906A, .9077, .9050]

.9050:
    stz.b 0x02
    stz.b 0x03
    lda.b #0x00
    jmp .90B1

.9059:
    lda.b 0x35
    bne .9050

    lda.b 0x03
    cmp.b #0x04
    beq .9050

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    rts

.906A:
    lda.b 0x03
    cmp.b #0x04
    bcs .9050

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rts

.9077:
    stz.b 0x02
    stz.b 0x03
    jmp .9113

.907E:
    jsl 0x84A66D
    bpl .909D

    lda.w 0x1F7A
    cmp.b #0x09
    bcc .9099

    lda.b #0x1A
    jsl _80878B
    lda.b #0xF5
    ldy.b #0x03
    jsl _808850.8868
.9099:
    jml 0x828398

.909D:
    lda.w 0x1F15
    bne .90A6

    jsl 0x848EEA
.90A6:
    lda.b 0x03
    cmp.b #0x14
    bcs .90B0

    jml 0x8280B4

.90B0:
    rtl

;-----

.90B1:
    ldx.b 0x35
    beq .90B8

    clc
    adc.b #0x07
.90B8:
    tax
    lda.w 0x00C59A,X
    jsl 0x848F07
    rts

;-----

.90C1:
    jsl 0x849086
    and.b #0x03
    asl
    tax
    rep #0x20
    jmp (.90CE,X)

.90CE: d16[.90D6, .90DB, .90E0, .90FE]

.90D6:
    lda.w #0x001C
    bra .90E3

.90DB:
    lda.w #0x0030
    bra .90E3

.90E0:
    lda.w #0x0050
.90E3:
    sta.b 0x3A
    lda.w 0x0BAD
    sec
    sbc.w #0x0080
    sec
    sbc.w 0x1E4D
    lda.w 0x0BAD
    bcs .90F9

    adc.b 0x3A
    bra .90FB

.90F9:
    sbc.b 0x3A
.90FB:
    sta.b 0x3A
    rts

.90FE:
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    lda.w #0x0020
    bcs .910C

    lda.w #0x00E0
.910C:
    clc
    adc.w 0x1E4D
    sta.b 0x3A
    rts

;-----

.9113:
    lda.b #0x20
    sta.w 0x0000
    stz.w 0x0001
    jsr .9131
    beq .9128

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    stz.b 0x36
.9128:
    rts

;-----

.9129:
    lda.b #0x28
    sta.w 0x0000
    stz.w 0x0001
.9131:
    lda.b 0x35
    ora.b 0x3C
    ora.w 0x0C32
    ora.w 0x1F0C
    bne .916D

    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .915A

    eor.w #0xFFFF
    inc
    cmp.w 0x0000
    sep #0x20
    bcs .916D

    lda.b 0x11
    asl
    asl
    bcs .916D

    bra .9167

.915A:
    cmp.w 0x0000
    sep #0x20
    bcs .916D

    lda.b 0x11
    asl
    asl
    bcc .916D

.9167:
    lda.w 0x0BD3
    and.b #0x04
    rts

.916D:
    lda.b #0x00
    rts

;-----

.9170:
    lda.b 0x3C
    bpl .91A6

    lda.w 0x0BD3
    and.b #0x08
    beq .9198

    stz.b 0x3C
    lda.b #0x04
    sta.w 0x0BCE
    jsl 0x849F2A
    lda.w 0x0BCF
    and.b #0x7F
    bne .9191

    lda.b #0x01
    sta.b 0x30
.9191:
    lda.b #0x20
    jsl 0x84A333
    rts

.9198:
    rep #0x20
    lda.w 0x0BB0
    sec
    sbc.w #0x0008
    sta.w 0x0BB0
    sep #0x20
.91A6:
    rts
