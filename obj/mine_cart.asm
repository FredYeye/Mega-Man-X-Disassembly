mine_cart:
    ldx.b 0x01
    jmp (.97BF,X)

.97BF: d16[.97C5, .97F7, .9A09]

.97C5:
    jsl 0x82827D
    lda.b #0x04
    sta.b 0x12
    lda.b #0x40
    sta.b 0x33
    sta.b 0x27
    sta.b 0x30
    stz.b 0x34
    stz.b 0x35
    stz.b 0x36
    stz.b 0x37
    stz.b 0x04
    stz.b 0x07
    stz.b 0x2F
    lda.b #0x02
    sta.b 0x26
    rep #0x20
    lda.w #0xCE46
    sta.b 0x20
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
    rtl

.97F7:
    jsl 0x82806E
    bcc .9801

    jml 0x828387

.9801:
    lda.b 0x2C
    sta.b 0x38
    lda.b #0x80
    sta.b 0x2C
    lda.b 0x11
    and.b #0x3F
    ora.b 0x33
    sta.b 0x11
    jsr .9A97
    jsl 0x82D7D0
    ldx.b 0x02
    jsr (.988B,X)
    jsl 0x8491BE
    lda.b #0x20
    trb.w 0x0C26
    lda.b 0x2C
    bit.b #0x01
    beq .9867

    cmp.b 0x38
    rep #0x20
    bne .9843

    lda.b 0x1A
    sta.w 0x0C21
    lda.b 0x05
    sec
    sbc.b 0x22
    clc
    adc.w 0x0BAD
    sta.w 0x0BAD
.9843:
    lda.b 0x08
    sec
    sbc.b 0x24
    clc
    adc.w 0x0BB0
    sta.w 0x0BB0
    sep #0x20
    lda.w 0x1F9D
    bpl .985B

    lda.b #0x0C
    tsb.w 0x0BD4
.985B:
    lda.b #0x20
    tsb.w 0x0C26
    lda.b 0x0F
    and.b #0x01
    sta.w 0x0BC1
.9867:
    lda.b #0x50
    sta.b 0x20
    lda.b #0xCE
    sta.b 0x21
    jsl 0x849B03
    lda.b #0x54
    sta.b 0x20
    lda.b #0xCE
    sta.b 0x21
    jsl 0x849B03
    lda.b #0x46
    sta.b 0x20
    lda.b #0xCE
    sta.b 0x21
    jml 0x8280B4

.988B: d16[.9895, .98B6, .99A8, .99BC, .9A08]

.9895:
    lda.b 0x2C
    lsr
    bcc .98B5

    lda.b #0x02
    sta.b 0x02
    rep #0x20
    lda.w #0x0100
    bit.b 0x32
    bvs .98AA

    lda.w #0xFF00
.98AA:
    sta.b 0x1A
    stz.b 0x1C
    stz.b 0x1E
    sep #0x20
    jsr .9BC5
.98B5:
    rts

.98B6:
    ldx.b 0x03
    bne .98C7

    inc.b 0x03
    stz.b 0x1E
    stz.b 0x34
    lda.b #0x00
    jsl 0x848F07
    rts

.98C7:
    lda.b 0x35
    sta.b 0x36
    jsr .9A67
    lda.w 0x0B9C
    and.b #0x03
    bne .98DB

    lda.b #0x37
    jsl _80888B
.98DB:
    lda.b 0x34
    beq .9917

    jsl 0x849AAB
    cmp.b #0x04
    bne .9917

    lda.b 0x37
    inc
    inc
    and.b #0x0F
    tax
    rep #0x20
    lda.l 0x7FD000,X
    sec
    sbc.b 0x08
    bpl .98FC

    lda.w #0x0000
.98FC:
    xba
    lsr
    lsr
    lsr
    sta.b 0x1C
    sep #0x20
    stz.b 0x1F
    lda.b #0x0D
    sta.b 0x1E
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    lda.b #0xFF
    sta.b 0x35
    sta.b 0x2F
    rts

.9917:
    lda.b 0x2B
    bit.b #0x04
    bne .9930

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    lda.b #0xFF
    sta.b 0x35
    stz.b 0x1F
    lda.b #0x0D
    sta.b 0x1E
    sta.b 0x2F
    rts

.9930:
    jsl 0x849ACD
    sta.b 0x35
    cmp.b 0x36
    beq .9946

    asl
    tax
    lda.w 0x00CE58,X
    sta.b 0x1F
    lda.w 0x00CE59,X
    sta.b 0x34
.9946:
    lda.b 0x33
    ora.b 0x34
    lsr
    lsr
    lsr
    lsr
    tax
    jsr (.998A,X)
    rep #0x20
    lda.b 0x1A
    bpl .995C

    eor.w #0xFFFF
    inc
.995C:
    cmp.w #0x0500
    bcc .996D

    lda.w #0x0500
    bit.b 0x1A
    bpl .996B

    lda.w #0xFB00
.996B:
    sta.b 0x1A
.996D:
    sep #0x20
    jsl 0x848EEA
    lda.b 0x2C
    lsr
    bcc .9989

    lda.w 0x0B9C
    and.b #0x0F
    bne .9989

    ldx.b #0x02
    ldy.b #0x02
    lda.b #0x0F
    jsl 0x84A33C
.9989:
    rts

.998A: d16[.9992, .9999, .9999, .9992]

.9992:
    jsl update_pos_xy.neg_ay_ax
    jmp .999D

.9999:
    jsl update_pos_xy.neg_ay_pos_ax
.999D:
    ldx.b #0x40
    bit.b 0x1B
    bpl .99A5

    ldx.b #0x00
.99A5:
    stx.b 0x33
    rts

.99A8:
    jsr .9A67
    jsl 0x848EEA
    jsl update_pos_xy.neg_ay_ax
    lda.b 0x1D
    bpl .99BB

    lda.b #0x06
    sta.b 0x02
.99BB:
    rts

.99BC:
    jsr .9A67
    jsl 0x848EEA
    lda.b 0x2B
    bit.b #0x04
    beq .99F6

    jsr .9AE7
    lda.b #0x08
    jsl 0x84A333
    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    lsr
    lsr
    cmp.w #0x00C0
    sep #0x20
    bcs .99EC

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    stz.b 0x2F
    rts

.99EC:
    sta.b 0x1C
    xba
    sta.b 0x1D
    lda.b #0x04
    sta.b 0x02
    rts

.99F6:
    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.w #0xFD00
    cmp.b 0x1C
    bmi .9A05

    sta.b 0x1C
.9A05:
    sep #0x20
    rts

.9A08:
    rts

.9A09:
    jsl 0x82806E
    bcc .9A13

    jml 0x828387

.9A13:
    ldx.b 0x02
    jsr (.9A23,X)
    lda.w 0x0B9C
    lsr
    bcc .9A22

    jsl 0x8280B4
.9A22:
    rtl

.9A23: d16[.9A29, .9A52, .9A62]

.9A29:
    lda.b #0x02
    sta.b 0x02
    jsl 0x84A4AB
    rep #0x20
    lda.w #0x0100
    bit.b 0x1A
    bpl .9A3D

    lda.w #0xFF00
.9A3D:
    sta.b 0x1A
    lda.w #0x0400
    sta.b 0x1C
    lda.w #0x0040
    sta.b 0x1E
    sep #0x20
    lda.b #0x03
    jsl 0x848F07
    rts

.9A52:
    lda.b 0x0F
    bpl .9A5D

    jsr .9B12
    lda.b #0x04
    sta.b 0x02
.9A5D:
    jsl 0x848EEA
    rts

.9A62:
    jsl update_pos_xy.neg_ay_ax
    rts

;-----

.9A67:
    lda.b 0x2B
    bit.b #0x03
    beq .9A96

    lda.b 0x2D
    cmp.b #0x3C
    bne .9A76

    jmp .9AAD

.9A76:
    cmp.b #0x34
    bne .9A84

    jsr .9B70
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    rts

.9A84:
    lda.b 0x33
    eor.b #0x40
    sta.b 0x33
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
.9A96:
    rts

;-----

.9A97:
    ldx.b 0x37
    lda.b 0x08
    sta.l 0x7FD000,X
    lda.b 0x09
    sta.l 0x7FD001,X
    txa
    inc
    inc
    and.b #0x0F
    sta.b 0x37
    rts

;-----

.9AAD:
    rep #0x20
    lda.w #0x0010
    sta.b 0x39
.9AB4:
    lda.w #0x001B
    bit.b 0x1A
    bpl .9ABE

    lda.w #0xFFE5
.9ABE:
    clc
    adc.b 0x05
    sta.w 0x0000
    lda.b 0x39
    clc
    adc.b 0x08
    sta.w 0x0002
    stz.w 0x0008
    jsl 0x849111
    jsl _80B8D5
    lda.b 0x39
    clc
    adc.w #0xFFF0
    sta.b 0x39
    cmp.w #0xFFE0
    bne .9AB4

    sep #0x20
    rts
;-----

.9AE7:
    jsl 0x8282D3
    bne .9B0F

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x0A
    sta.w 0x000B,X
    lda.b 0x33
    ora.b #0x30
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x08
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
    sep #0x20
.9B0F:
    sep #0x10
    rts

;-----

.9B12:
    rep #0x10
    ldy.w #0x0007
.9B17:
    jsl 0x8282D3
    bne .9B6D

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda 0x00CE64,Y
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    stz.w 0x001F,X
    lda.b #0x40
    sta.w 0x001E,X
    rep #0x20
    lda.w #0x0C80
    sta.w 0x000C,X
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    phy
    jsl 0x849086
    and.w #0x0006
    tay
    lda 0x00CE6C,Y
    sta.w 0x001A,X
    jsl 0x849086
    and.w #0x0006
    tay
    lda 0x00CE74,Y
    sta.w 0x001C,X
    ply
    sep #0x20
    dey
    bpl .9B17

.9B6D:
    sep #0x10
    rts

;-----

.9B70:
    rep #0x10
    ldy.w #0x0007
.9B75:
    jsl 0x8282D3
    bne .9BBF

    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    stz.w 0x000B,X
    rep #0x20
    jsl 0x849086
    and.w #0x0007
    sta.w 0x0000
    lda.w #0x0016
    bit.b 0x1A
    bpl .9B9C

    lda.w #0xFFEA
.9B9C:
    clc
    adc.b 0x05
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    jsl 0x849086
    and.w #0x001F
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0xFFF8
    clc
    adc.w 0x0000
    sta.w 0x0008,X
    sep #0x20
.9BBF:
    dey
    bpl .9B75

    sep #0x10
    rts

;-----

.9BC5:
    jsl 0x82833E
    beq .9BD0

    txa
    sec
    sbc.b #0x40
    tax
.9BD0:
    inc.w 0x0000,X
    lda.b #0x1B
    sta.w 0x000A,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    sep #0x30
    rts
