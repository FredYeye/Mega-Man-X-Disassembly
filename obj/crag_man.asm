crag_man:
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x01
    jsr (.D8AF,X)
    jsl _849B03
    jsl 0x849B43
    beq .D8A1

    bpl .D89D

    jsl 0x84A4AB
    lda.b #0x01
    jsl 0x84A37F
    lda.b #0x03
    sta.b 0x34
    sta.b 0x3A
    jsr .DA90
    lda.b #0x01
    sta.b 0x34
    lda.b #0x04
    sta.b 0x3A
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    jsr .DA90
    lda.b #0x08
    sta.b 0x34
    jsr .DAFE
    jml 0x828387

.D89D:
    lda.b #0x0E
    trb.b 0x11
.D8A1:
    jsl 0x82806E
    bcs .D8AB

    jml 0x8280B4

.D8AB:
    jml 0x828387

.D8AF: d16[.D8BF, .D8E3, .D90B, .D94C, .D987, .D9AC, .DA0A, .DA2B]

.D8BF:
    jsl 0x82827D
    stz.b 0x28
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x7F
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x00
    jsl _848EEA.8F07
    rep #0x20
    lda.w #0xD027
    sta.b 0x20
    sep #0x20
    rts

.D8E3:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .D8F1

    eor.w #0xFFFF
    inc
.D8F1:
    cmp.w #0x0050
    sep #0x20
    bcs .D906

    lda.b #0x04
    sta.b 0x01
    stz.b 0x34
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
.D906:
    lda.b #0x7F
    sta.b 0x27
    rts

.D90B:
    jsl update_pos_xy.neg_ay
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x04
    beq .D947

    lda.b #0x06
    jsl _848EEA.8F07
    lda.b #0x06
    sta.b 0x01
    lda.b #0x20
    jsl _80888B
    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    lsr
    lsr
    sta.b 0x1C
    sep #0x20
    stz.b 0x3A
    lda.b #0x03
    sta.b 0x34
    jsr .DA90
    lda.b #0x05
    sta.b 0x34
    jsr .DAFE
.D947:
    lda.b #0x7F
    sta.b 0x27
    rts

.D94C:
    jsl _848EEA
    lda.b 0x02
    bne .D966

    jsl update_pos_xy.neg_ay
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x04
    beq .D982

    inc.b 0x02
    stz.b 0x03
.D966:
    jsr .DB64
    lda.b 0x0F
    bpl .D982

    lda.b #0x08
    sta.b 0x01
    stz.b 0x02
    lda.b #0x05
    jsl _848EEA.8F07
    rep #0x20
    lda.w #0xD031
    sta.b 0x20
    sep #0x20
.D982:
    lda.b #0x7F
    sta.b 0x27
    rts

.D987:
    lda.b #0x7F
    sta.b 0x27
    jsl _848EEA
    lda.b 0x0F
    bpl .D9A9

    lda.b #0x0A
    sta.b 0x01
    lda.b #0x1E
    sta.b 0x35
    lda.b #0x10
    jsl _848EEA.8F07
    lda.b #0x08
    sta.b 0x27
    lda.b #0x03
    sta.b 0x28
.D9A9:
    jmp .DB64

.D9AC:
    jsl 0x84AC92
    dec.b 0x35
    bne .DA07

    jsl get_rng
    and.b #0x0F
    cmp.b #0x0A
    bcc .DA03

    jsl 0x828358
    bne .DA01

    inc.w 0x0000,X
    lda.b #0x17
    sta.w 0x000A,X
    stz.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x16
    sta.w 0x0016,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    lda.b 0x05
    sta.w 0x0005,X
    lda.w 0x1E50
    clc
    adc.w #0x0008
    sta.w 0x0008,X
    sep #0x20
    lda.b #0x0C
    sta.b 0x01
    lda.b #0x07
    jsl _848EEA.8F07
    stz.b 0x0B
.DA01:
    sep #0x10
.DA03:
    lda.b #0x1E
    sta.b 0x35
.DA07:
    jmp .DB64

.DA0A:
    jsl 0x84AC92
    jsr .DB64
    lda.b 0x0B
    beq .DA1F

    bmi .DA20

    lda.b #0x0E
    sta.b 0x01
    jsl _848EEA
.DA1F:
    rts

.DA20:
    lda.b #0x10
    jsl _848EEA.8F07
    lda.b #0x0A
    sta.b 0x01
    rts

.DA2B:
    jsl 0x84AC92
    jsr .DB64
    jsl _848EEA
    lda.b 0x02
    bne .DA7F

    lda.b 0x0F
    and.b #0x0F
    beq .DA8F

    inc.b 0x02
    jsl 0x828358
    bne .DA7D

    inc.w 0x0000,X
    lda.b #0x17
    sta.w 0x000A,X
    sta.w 0x000B,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x16
    sta.w 0x0016,X
    lda.b 0x11
    sta.w 0x0011,X
    asl
    asl
    rep #0x20
    lda.w #0x0016
    bcs .DA6E

    lda.w #0xFFEA
.DA6E:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0008
    sta.w 0x0008,X
.DA7D:
    sep #0x30
.DA7F:
    lda.b 0x0F
    bpl .DA8F

    lda.b #0x10
    jsl _848EEA.8F07
    lda.b #0x0A
    sta.b 0x01
    stz.b 0x02
.DA8F:
    rts

;-----

.DA90:
    jsl 0x8282D3
    bne .DAFB

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    stz.w 0x001F,X
    lda.b #0x40
    sta.w 0x001E,X
    lda.b #0x00
    xba
    lda.b 0x3A
    clc
    adc.b 0x34
    dec
    tay
    lda 0x00D06B,Y
    sta.w 0x000B,X
    tya
    asl
    tay
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda 0x00D03B,Y
    bcc .DACD

    eor.w #0xFFFF
    inc
.DACD:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda 0x00D047,Y
    clc
    adc.b 0x08
    sta.w 0x0008,X
    lda.b 0x10
    asl
    asl
    lda 0x00D053,Y
    bcc .DAE9

    eor.w #0xFFFF
    inc
.DAE9:
    sta.w 0x001A,X
    lda 0x00D05F,Y
    sta.w 0x001C,X
    stz.w 0x000C,X
    sep #0x20
    dec.b 0x34
    bne .DA90

.DAFB:
    sep #0x30
    rts

;-----

.DAFE:
    jsl 0x8282D3
    bne .DB61

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    jsl get_rng
    lda.b #0x00
    xba
    and.b #0x0F
    tay
    lda 0x00D0B1,Y
    sta.w 0x000B,X
    rep #0x20
    jsl get_rng
    lsr
    and.w #0x001E
    tay
    lda 0x00D071,Y
    bcc .DB35

    eor.w #0xFFFF
    inc
.DB35:
    sta.w 0x001A,X
    jsl get_rng
    and.w #0x001E
    tay
    lda 0x00D091,Y
    sta.w 0x001C,X
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    stz.w 0x000C,X
    sep #0x20
    stz.w 0x001F,X
    lda.b #0x40
    sta.w 0x001E,X
    dec.b 0x34
    bne .DAFE

.DB61:
    sep #0x30
    rts

;-----

.DB64:
    lda.b 0x03
    bne .DB85

    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x04
    bne .DB97

    inc.b 0x03
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
    rts

.DB85:
    jsl update_pos_xy.neg_ay
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x04
    beq .DB97

    stz.b 0x03
    stz.b 0x2F
.DB97:
    rts
