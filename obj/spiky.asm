spiky:
    ldx.b 0x01
    jsr (.9C63,X)
    lda.b 0x3D
    beq .9BD7

    jmp .9C62

.9BD7:
    lda.b obj.hp
    beq .9C3A

    jsl 0x849B43
    beq .9C22

    lda.b obj.hp
    and.b #0x7F
    bne .9C1A

    lda.b 0x01
    cmp.b #0x04
    beq .9BF1

    lda.b #0x01
    sta.b obj.hp
.9BF1:
    lda.b obj.hp
    cmp.b #0x80
    bne .9BFD

    lda.b #0x01
    sta.b 0x34
    inc.b 0x3B
.9BFD:
    rep #0x20
    lda.w #0xCA38
    sta.b 0x20
    sep #0x20
    lda.b 0x01
    cmp.b #0x04
    beq .9C14

    stz.b 0x02
    lda.b #0x02
    jsl 0x848F07
.9C14:
    lda.b #0x04
    sta.b 0x01
    bra .9C3A

.9C1A:
    lda.b #0xF1
    and.b 0x11
    sta.b 0x11
    bra .9C28

.9C22:
    lda.b 0x33
    ora.b 0x11
    sta.b 0x11
.9C28:
    jsl 0x849ACD
    sta.b 0x38
    cmp.b #0x04
    bpl .9C3A

    lda.b 0x03
    bne .9C3A

    lda.b #0x02
    sta.b 0x02
.9C3A:
    jsl 0x849B03
    jsl 0x8280B4
    jsl 0x82806E
    bcc .9C4C

    jml 0x828387

.9C4C:
    jsl 0x8490A0
    cmp.b #0x3F
    bne .9C62

    lda.b #0x04
    sta.b 0x01
    lda.b #0x01
    sta.b 0x3B
    lda.b #0x01
    sta.b 0x34
    sta.b 0x3E
.9C62:
    rtl

.9C63: d16[.9C69, .9CCB, .9EB6]

.9C69:
    stz.b 0x3D
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x02
    sta.b obj.hp
    lda.b #0x03
    sta.b 0x28
    lda.b #0x02
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0x06
    sta.b 0x39
    lda.b #0x01
    sta.b 0x35
    stz.b 0x3B
    stz.b 0x3E
    rep #0x20
    lda.w #0x0180
    sta.b 0x36
    sep #0x20
    jsr .9F32
    beq .9CA9

    rep #0x20
    lda.w #0x0180
    sta.b obj.speed_x
    jmp .9CB0

.9CA9:
    rep #0x20
    lda.w #0xFE80
    sta.b obj.speed_x
.9CB0:
    lda.w #0xFC00
    sta.b obj.speed_y
    lda.w #0xCA2E
    sta.b 0x20
    sep #0x20
    lda.b #0xFF
    sta.b 0x2F
    jsl 0x8491BE
    lda.b #0x00
    jsl 0x848F07
    rts

.9CCB:
    ldx.b 0x02
    jsr (.9CD5,X)
    jsl 0x848EEA
    rts

.9CD5: d16[.9CDB, .9D8A, .9E82]

.9CDB:
    lda.b 0x39
    bne .9CE1

    bra .9CFF

.9CE1:
    cmp.b #0x02
    beq .9CFF

    lda.b 0x11
    and.b #0x40
    bne .9CF5

    rep #0x20
    lda.w #0xFE80
    sta.b obj.speed_x
    jmp .9D3B

.9CF5:
    rep #0x20
    lda.w #0x0180
    sta.b obj.speed_x
    jmp .9D3B

.9CFF:
    lda.b 0x11
    and.b #0x40
    bne .9D22

    rep #0x20
    lda.b obj.speed_x
    clc
    adc.w #0x0004
    sta.b obj.speed_x
    cmp.w #0xFE80
    bmi .9D1E

    lda.w #0x0006
    sta.b 0x39
    lda.w #0xFE80
    sta.b obj.speed_x
.9D1E:
    sep #0x20
    bra .9D3D

.9D22:
    rep #0x20
    lda.b obj.speed_x
    sec
    sbc.w #0x0004
    sta.b obj.speed_x
    cmp.w #0x0180
    bpl .9D3B

    lda.w #0x0006
    sta.b 0x39
    lda.w #0x0180
    sta.b obj.speed_x
.9D3B:
    sep #0x20
.9D3D:
    jsl 0x82820A
    lda.b #0xFF
    sta.b 0x2F
    jsl 0x8491BE
    stz.b 0x03
    lda.b 0x2B
    and.b #0x03
    bne .9D52

    rts

.9D52:
    lda.b 0x2B
    and.b #0x04
    bne .9D6C

    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    rep #0x20
    lda.b 0x36
    eor.w #0xFFFF
    inc
    sta.b obj.speed_x
    sep #0x20
    bra .9D89

.9D6C:
    lda.b #0x04
    sta.b 0x02
    lda.b #0x01
    jsl 0x848F07
    rep #0x20
    lda.w #0x0600
    sta.b obj.speed_y
    lda.b obj.speed_x
    sta.b 0x36
    stz.b obj.speed_x
    sep #0x20
    lda.b #0xC0
    sta.b 0x1E
.9D89:
    rts

.9D8A:
    ldx.b 0x03
    jsr (.9D94,X)
    jsl 0x848EEA
    rts

.9D94: d16[.9D98, .9E25]

.9D98:
    stz.b 0x1E
    lda.b 0x38
    sta.b 0x39
    sta.b 0x3C
    bne .9DC1

    lda.b #0x04
    sta.b 0x1F
    lda.b #0x02
    sta.b 0x03
    lda.b 0x11
    and.b #0x40
    bne .9DB4

    stz.b 0x3A
    bra .9DB8

.9DB4:
    lda.b #0x01
    sta.b 0x3A
.9DB8:
    lda.b #0x03
    jsl 0x848F07
    jmp .9E24

.9DC1:
    dec
    bne .9DE3

    lda.b #0x04
    sta.b 0x1F
    lda.b #0x02
    sta.b 0x03
    lda.b 0x11
    and.b #0x40
    bne .9DD8

    lda.b #0x01
    sta.b 0x3A
    bra .9DDA

.9DD8:
    stz.b 0x3A
.9DDA:
    lda.b #0x06
    jsl 0x848F07
    jmp .9E24

.9DE3:
    dec
    bne .9E05

    lda.b #0x03
    sta.b 0x1F
    lda.b #0x02
    sta.b 0x03
    lda.b 0x11
    and.b #0x40
    bne .9DF8

    stz.b 0x3A
    bra .9DFC

.9DF8:
    lda.b #0x01
    sta.b 0x3A
.9DFC:
    lda.b #0x03
    jsl 0x848F07
    jmp .9E24

.9E05:
    dec
    bne .9E24

    lda.b #0x03
    sta.b 0x1F
    lda.b #0x02
    sta.b 0x03
    lda.b 0x11
    and.b #0x40
    bne .9E1C

    lda.b #0x01
    sta.b 0x3A
    bra .9E1E

.9E1C:
    stz.b 0x3A
.9E1E:
    lda.b #0x06
    jsl 0x848F07
.9E24:
    rts

.9E25:
    lda.b 0x1B
    cmp.b #0x04
    beq .9E51

    rep #0x20
    lda.b obj.speed_x
    bne .9E3F

    sep #0x20
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    lda.b #0x03
    jsl 0x848F07
.9E3F:
    sep #0x20
    lda.b 0x3A
    bne .9E4B

    jsl update_pos_xy.neg_ay_ax
    bra .9E55

.9E4B:
    jsl update_pos_xy.neg_ay_pos_ax
    bra .9E55

.9E51:
    jsl 0x82820A
.9E55:
    jsl 0x849ACD
    cmp.b #0x04
    bpl .9E5F

    bra .9E69

.9E5F:
    lda.b #0x00
    sta.b 0x02
    jsl 0x848F07
    bra .9E70

.9E69:
    sec
    sbc.b 0x3C
    beq .9E70

    stz.b 0x03
.9E70:
    lda.b #0xFF
    sta.b 0x2F
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    beq .9E81

    jsr .9D52
.9E81:
    rts

.9E82:
    jsl update_pos_xy.neg_ay
    lda.b #0xFF
    sta.b 0x2F
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .9EB5

    lda.b #0x00
    sta.b 0x02
    stz.b 0x03
    jsl 0x848F07
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    rep #0x20
    lda.b 0x36
    eor.w #0xFFFF
    inc
    sta.b obj.speed_x
    lda.w #0xFC00
    sta.b obj.speed_y
    sep #0x20
.9EB5:
    rts

.9EB6:
    lda.b 0x3B
    bne .9F15

    lda.b 0x2B
    beq .9F0C

    lda.b 0x0F
    cmp.b #0x80
    beq .9F0C

    cmp.b #0x01
    bne .9F06

    lda.b 0x2B
    and.b #0x04
    cmp.b #0x04
    beq .9EDB

    lda.b #0xC0
    sta.b 0x1E
    jsl update_pos_xy.neg_ay
    jmp .9EDD

.9EDB:
    stz.b 0x1E
.9EDD:
    lda.b 0x11
    and.b #0x40
    beq .9EF6

    lda.b #0x05
    sta.b 0x1F
    jsl update_pos_xy.pos_ay_neg_ax
    lda.b #0x01
    sta.b 0x2F
    jsl 0x8491BE
    jmp .9F06

.9EF6:
    lda.b #0x05
    sta.b 0x1F
    jsl update_pos_xy.neg_ay_pos_ax
    lda.b #0x01
    sta.b 0x2F
    jsl 0x8491BE
.9F06:
    jsl 0x848EEA
    bra .9F14

.9F0C:
    inc.b 0x3B
    lda.b #0x03
    sta.b 0x34
    sep #0x10
.9F14:
    rts

.9F15:
    dec.b 0x34
    bne .9F31

    lda.b #0x01
    sta.b 0x3D
    jsl 0x84A4AB
    jsl 0x828387
    sep #0x10
    lda.b 0x3E
    bne .9F31

    lda.b #0x01
    jsl 0x84A37F
.9F31:
    rts

;-----

.9F32:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .9F41

    lda.w #0x0000
    bra .9F48

.9F41:
    lda.b 0x11
    ora.w #0x0040
    sta.b 0x11
.9F48:
    sep #0x20
    rts
