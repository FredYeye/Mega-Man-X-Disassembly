bee_blader:
    lda.b 0x33
    tsb.b 0x11
    jsl 0x82806E
    bcs .B89E

.B899:
    ldx.b 0x01
    jmp (.B8CC,X)

.B89E:
    lda.b 0x01
    cmp.b #0x0E
    beq .B899

    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcc .B8CB

    cmp.w #0x0200
    bcc .B8CB

    rep #0x30
    ldx.b 0x39
    stz.w 0x0000,X
    stz.w 0x0002,X
    lda.b 0x3B
    sta.w 0x1E5E
    lda.b 0x31
    sta.w 0x1E60
    jml 0x828387

.B8CB:
    rtl

.B8CC: d16[.B8DF, .B95D, .B972, .B9A5, .B9C1, .BA16, .BA48, .BA90]

.B8DC:
    stz.b 0x01
    rtl

.B8DF:
    jsl 0x82827D
    stz.b 0x3E
    rep #0x20
    lda.b 0x05
    cmp.w 0x0BAD
    sep #0x20
    bcs .B8F4

    jml 0x828387

.B8F4:
    jsl 0x8282D3
    bne .B8DC

    inc.w 0x0000,X
    lda.b #0x1F
    sta.w 0x000A,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    stx.b 0x39
    stz.w 0x0005,X
    stz.w 0x0008,X
    sep #0x30
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x04
    sta.b 0x12
    lda.b #0x20
    sta.b 0x27
    lda.b #0x04
    sta.b 0x26
    lda.b #0xFF
    sta.b 0x2F
    rep #0x20
    lda.w #0xCC1B
    sta.b 0x20
    lda.w #0xFA00
    sta.b 0x1C
    lda.w #0x00F0
    sta.b 0x08
    lda.w 0x1E5E
    sta.b 0x3B
    lda.w 0x1E60
    sta.b 0x31
    lda.b 0x05
    sec
    sbc.w #0x00F0
    sta.w 0x1E5E
    sta.w 0x1E60
    sep #0x20
    stz.b 0x07
    lda.b #0x18
    sta.b 0x1E
    lda.b #0x00
    jml 0x848F07

.B95D:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0080
    sec
    sbc.w 0x0BAD
    sep #0x20
    bcs .B971

    lda.b #0x04
    sta.b 0x01
.B971:
    rtl

.B972:
    jsl update_pos_xy.pos_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .B99B

    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x000C
    sta.b 0x35
    lda.w #0x0040
    sta.b 0x1C
    dec.b 0x08
    sep #0x20
    lda.b #0x06
    sta.b 0x01
    lda.b #0x01
    sta.b 0x34
.B99B:
    sep #0x20
    jsl 0x848EEA
    jml 0x82808F

.B9A5:
    dec.b 0x34
    bne .B9B7

    jsl 0x849086
    and.b #0x1F
    tax
    lda.w 0x86CBFB,X
    sta.b 0x01
    stz.b 0x02
.B9B7:
    jsr .BBD1
    jsl 0x848EEA
    jmp .BC4A

.B9C1:
    lda.b 0x02
    bne .B9CB

    lda.b #0xF1
    sta.b 0x34
    inc.b 0x02
.B9CB:
    dec.b 0x34
    lda.b 0x34
    and.b #0x03
    bne .BA0C

    lda.b #0x1D
    jsl _80888B
    jsl 0x828358
    bne .B9FE

    inc.w 0x0000,X
    lda.b #0x0D
    sta.w 0x000A,X
    stz.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0034
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x001C
    sta.w 0x0008,X
.B9FE:
    sep #0x30
    lda.b 0x34
    bne .BA0C

    lda.b #0x10
    sta.b 0x34
    lda.b #0x06
    sta.b 0x01
.BA0C:
    jsr .BBD1
    jsl 0x848EEA
    jmp .BC4A

.BA16:
    lda.b 0x02
    bne .BA29

    inc.b 0x02
    lda.b #0x3C
    sta.b 0x34
    jsr .BBF6
    lda.b #0x1E
    jsl _80888B
.BA29:
    dec.b 0x34
    bne .BA3E

    jsr .BBF6
    lda.b #0x1E
    jsl _80888B
    lda.b #0x3C
    sta.b 0x34
    lda.b #0x06
    sta.b 0x01
.BA3E:
    jsr .BBD1
    jsl 0x848EEA
    jmp .BC4A

.BA48:
    lda.b 0x02
    bne .BA65

    inc.b 0x02
    lda.b #0x78
    sta.b 0x34
    lda.b #0x27
    sta.b 0x0A
    jsl 0x84A1D0
    lda.b #0x22
    sta.b 0x0A
    cpy.b #0x03
    bcs .BA65

    jsr .BC22
.BA65:
    dec.b 0x34
    bne .BA86

    lda.b #0x27
    sta.b 0x0A
    jsl 0x84A1D0
    lda.b #0x22
    sta.b 0x0A
    cpy.b #0x03
    bcs .BA7C

    jsr .BC22
.BA7C:
    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    lda.b #0x3C
    sta.b 0x34
.BA86:
    jsr .BBD1
    jsl 0x848EEA
    jmp .BC4A

.BA90:
    jsr .BD51
    ldx.b 0x02
    jmp (.BA98,X)

.BA98: d16[.BAA0, .BAC3, .BB24, .BB4A]

.BAA0:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x21
    jsl _80888B
    rep #0x20
    lda.w #0xCC25
    sta.b 0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x20
    sta.b 0x1E
    jsl 0x84AB6E
    jml 0x82808F

.BAC3:
    lda.b #0x03
    jsr .BD3B
    beq .BB20

    lda.b #0x22
    jsl _80888B.88B6
    lda.b #0x20
    ldx.b #0x03
    ldy.b #0x01
    jsl 0x84A33C
    lda.w 0x1F7A
    beq .BAF3

    jsl 0x84A4AB
    rep #0x20
    lda.b 0x3B
    sta.w 0x1E5E
    lda.b 0x31
    sta.w 0x1E60
    jml 0x828398

.BAF3:
    lda.b #0x04
    sta.b 0x02
    rep #0x20
    lda.w #0x0100
    sta.b 0x1C
    sep #0x20
    lda.b #0x30
    sta.b 0x1E
    lda.b #0x0A
    jsl 0x848F07
    jsl 0x8282B9
    bne .BB20

    inc.w 0x0000,X
    lda.b #0x08
    sta.w 0x000A,X
    lda.b 0x0B
    asl
    sta.w 0x000B,X
    stx.b 0x37
.BB20:
    jml 0x82808F

.BB24:
    lda.b #0x07
    jsr .BD3B
    beq .BB46

    rep #0x20
    lda.w #0x0220
    sta.b 0x1C
    sep #0x20
    lda.b #0x06
    sta.b 0x02
    lda.b #0x01
    jsl 0x848F07
    stz.w 0x0000
    ldy.b #0x05
    jsr .BD0A
.BB46:
    jml 0x82808F

.BB4A:
    lda.b #0x07
    jsr .BD3B
    beq .BBB4

    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0044
    sta.w 0x002C
    lda.b 0x08
    sec
    sbc.w #0x0020
    sta.w 0x002E
    sep #0x20
    lda.b #0x02
    sta.w 0x0001
    stz.w 0x0000
    jsl 0x83FE72
    jsl 0x8282D3
    bne .BBA4

    inc.w 0x0000,X
    lda.b #0x22
    sta.w 0x000A,X
    lda.b #0x04
    sta.w 0x000B,X
    stz.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x0010
    sta.w 0x0008,X
    sep #0x20
    ldy.w #0x0006
    sty.w 0x0000
    jsr .BD0A
.BBA4:
    rep #0x20
    lda.b 0x3B
    sta.w 0x1E5E
    lda.b 0x31
    sta.w 0x1E60
    jml 0x828398

.BBB4:
    jsl 0x82808F
    jml 0x84AB6E

;-----

.BBBC:
    jsl update_pos_xy.neg_ay
    rep #0x20
    lda.b 0x1C
    cmp.w #0xFB00
    bpl .BBCE

    lda.w #0xFB00
    sta.b 0x1C
.BBCE:
    sep #0x20
    rts

;-----

.BBD1:
    jsl update_pos_y
    rep #0x20
    lda.b 0x08
    sec
    sbc.b 0x35
    bcs .BBE2

    eor.w #0xFFFF
    inc
.BBE2:
    cmp.w #0x000C
    bcc .BBF3

    lda.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    jsl update_pos_y
.BBF3:
    sep #0x20
    rts

;-----

.BBF6:
    jsl 0x828358
    bne .BC1F

    inc.w 0x0000,X
    lda.b #0x0D
    sta.w 0x000A,X
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0018
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x000B
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
.BC1F:
    sep #0x30
    rts

;-----

.BC22:
    jsl 0x828321
    bne .BC47

    inc.w 0x0000,X
    lda.b #0x27
    sta.w 0x000A,X
    stz.w 0x000B,X
    rep #0x20
    lda.b 0x05
    clc
    adc.w #0x001D
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x001B
    sta.w 0x0008,X
.BC47:
    sep #0x20
    rts

;-----

.BC4A:
    jsr .BD51
    lda.b 0x27
    sta.b 0x3D
    jsl 0x849B03
    jsl 0x849B43
    beq .BC83

    lda.b #0x80
    trb.b 0x27
    lda.b #0x01
    sta.w 0x1F30
    lda.b 0x3D
    sec
    sbc.b 0x27
    sta.w 0x0000
    asl
    adc.w 0x0000
    clc
    adc.b 0x3E
    sta.b 0x3E
    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    bne .BC83

    lda.b #0x0E
    sta.b 0x01
    stz.b 0x02
.BC83:
    jsl 0x82808F
    lda.w 0x1F7A
    beq .BCA8

    jsl 0x82806E
    bcc .BCA8

    lda.b 0x01
    cmp.b #0x0E
    beq .BCA8

    rep #0x20
    lda.b 0x3B
    sta.w 0x1E5E
    lda.b 0x31
    sta.w 0x1E60
    jml 0x828387

.BCA8:
    rtl

;-----

.BCA9:
    sta.w 0x0008
    rep #0x20
    lda.w #0xFFE0
    sta.w 0x0000
    lda.w #0xFFF0
    sta.w 0x0002
    lda.w #0x003F
    sta.w 0x0004
    lda.w #0x001F
    sta.w 0x0006
    sep #0x20
    jsl 0x84A4C6
    rts

;-----

.BCCD:
    lda.w 0x0BD3
    ora.w 0x0BD4
    and.b #0x04
    beq .BD07

    rep #0x30
    lda.b 0x1C
    bpl .BD07

    lda.b 0x20
    pha
    lda.w #0xCC2F
    sta.b 0x20
    sep #0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    rep #0x20
    pla
    sta.b 0x20
    bcc .BD07

    sep #0x20
    lda.w 0x0BCF
    and.b #0x7F
    beq .BD07

    lda.b #0x1F
    sta.w 0x0BCE
    jsl 0x849F2A
.BD07:
    sep #0x30
    rts

;-----

.BD0A:
    sep #0x20
    jsl 0x8282D3
    bne .BD38

    inc.w 0x0000,X
    lda.b #0x25
    sta.w 0x000A,X
    tya
    clc
    adc.w 0x0000
    sta.w 0x000B,X
    lda.b 0x11
    and.b #0xFE
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    dey
    bpl .BD0A

.BD38:
    sep #0x30
    rts

;-----

.BD3B:
    jsr .BCA9
    jsr .BBBC
    jsl 0x8491BE
    jsl 0x84AB6E
    jsr .BCCD
    lda.b 0x2B
    and.b #0x04
    rts

;-----

.BD51:
    lda.w 0x0B9C
    lsr
    bcc .BD63

    lda.b 0x3E
    beq .BD63

    dec.b 0x3E
    rep #0x20
    dec.b 0x05
    sep #0x20
.BD63:
    rts
