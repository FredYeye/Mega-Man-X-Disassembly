scrap_robo:
    ldx.b 0x01
    jsr (.9BDF,X)
    lda.b 0x3B
    bne .9B89

    lda.b 0x27
    beq .9BD0

    jsl 0x849B43
    beq .9BBB

    lda.b 0x27
    and.b #0x7F
    bne .9BB3

.9B89:
    lda.b 0x11
    and.b #0x40
    bne .9B99

    lda.b #0x09
    sta.w 0x0000
    ldy.b #0x03
    jmp .9BA0

.9B99:
    lda.b #0x0D
    sta.w 0x0000
    ldy.b #0x03
.9BA0:
    jsr _879EF2
    jsl 0x84A4AB
    lda.b 0x3B
    bne .9BB1

    lda.b #0x01
    jsl 0x84A37F
.9BB1:
    bra .9BDA

.9BB3:
    lda.b #0xF1
    and.b 0x11
    sta.b 0x11
    bra .9BC1

.9BBB:
    lda.b 0x34
    ora.b 0x11
    sta.b 0x11
.9BC1:
    lda.b 0x0B
    beq .9BC8

    jmp .9BD0

.9BC8:
    lda.b 0x39
    bne .9BD0

    jsl 0x849B03
.9BD0:
    jsl 0x8280B4
    jsl 0x82806E
    bcc .9BDE

.9BDA:
    jsl 0x828398
.9BDE:
    rtl

.9BDF: d16[.9BEB, .9C67, .9D0A, .9D75, .9E4E, .9E96]

.9BEB:
    stz.b 0x3B
    lda.b 0x0B
    beq .9BF7

    jsr _879FAA
    jmp .9BFB

.9BF7:
    jsl 0x82827D
.9BFB:
    lda.b #0x2A
    sta.b 0x0A
    lda.b 0x11
    and.b #0xF1
    ora.b #0x08
    sta.b 0x11
    and.b #0x0E
    sta.b 0x34
    lda.b 0x0B
    bne .9C16

    lda.b #0x08
    sta.b 0x27
    jmp .9C1A

.9C16:
    lda.b #0x0C
    sta.b 0x27
.9C1A:
    lda.b #0x01
    sta.b 0x28
    lda.b #0x03
    sta.b 0x26
    lda.b #0x06
    sta.b 0x12
    lda.b #0x01
    sta.b 0x33
    stz.b 0x35
    stz.b 0x36
    stz.b 0x2F
    stz.b 0x37
    stz.b 0x2C
    stz.b 0x39
    stz.b 0x38
    lda.b #0x04
    sta.b 0x3A
    lda.b 0x0B
    bne .9C4E

    jsl _879ED4
    rep #0x20
    lda.w #0xCE19
    sta.b 0x20
    jmp .9C55

.9C4E:
    rep #0x20
    lda.w #0xCE2D
    sta.b 0x20
.9C55:
    lda.w #0xFE80
    sta.b 0x1C
    sep #0x20
    lda.b #0x30
    sta.b 0x1E
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.9C67:
    lda.b 0x0B
    bne .9C73

    lda.b #0x80
    sta.b 0x2C
    lda.b 0x39
    beq .9CB6

.9C73:
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    rep #0x20
    lda.w 0x0006
    cmp.w #0x0008
    bcs .9CB4

    lda.w 0x0002
    bmi .9CB4

    lda.w 0x0006
    cmp.w #0x0004
    lda.w #0xCE19
    bcc .9C9B

    lda.w #0x0003
    sta.w 0x0006
.9C9B:
    rep #0x20
    lda.w 0x0BB0
    sec
    sbc.w 0x0006
    sta.w 0x0BB0
    sep #0x20
    lda.w 0x0BD3
    and.b #0x04
    beq .9CB4

    jsl 0x849B03
.9CB4:
    sep #0x20
.9CB6:
    jsl update_pos_xy.neg_ay
    lda.b 0x2C
    and.b #0x7F
    beq .9CC4

    jsl 0x82C70E
.9CC4:
    jsl 0x8491BE
    lda.b 0x2E
    cmp.b #0x00
    beq .9D05

    lda.b #0x08
    sta.b 0x01
    lda.b 0x0B
    bne .9CE0

    lda.b 0x39
    bne .9CE0

    lda.b #0x01
    jsl _848EEA.8F07
.9CE0:
    jsr _879F49
    lda.b 0x38
    bne .9D09

    rep #0x20
    lda.w #0x0300
    sta.b 0x1C
    sep #0x20
    lda.b #0xC0
    sta.b 0x1E
    jsl get_rng
    and.b #0x07
    sta.w 0x0000
    ldy.b #0x03
    jsr _879EF2
    jmp .9D09

.9D05:
    jsl _848EEA
.9D09:
    rts

.9D0A:
    lda.b 0x0B
    bne .9D16

    lda.b #0x80
    sta.b 0x2C
    lda.b 0x39
    beq .9D1E

.9D16:
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
.9D1E:
    jsr _879F49
    bne .9D26

    jmp .9D6A

.9D26:
    jsr _879FCB
    lda.b 0x39
    beq .9D30

    jmp .9D6A

.9D30:
    lda.b 0x0F
    cmp.b #0x80
    bne .9D45

    lda.b #0x06
    sta.b 0x01
    lda.b #0x01
    jsl _848EEA.8F07
    inc.b 0x37
    jmp .9D6A

.9D45:
    lda.b 0x0F
    beq .9D66

    lda.b 0x11
    and.b #0x40
    beq .9D59

    rep #0x20
    lda.w #0x0040
    sta.b 0x1A
    jmp .9D60

.9D59:
    rep #0x20
    lda.w #0xFFC0
    sta.b 0x1A
.9D60:
    sep #0x20
    jsl update_pos_x
.9D66:
    jsl _848EEA
.9D6A:
    lda.b 0x2C
    and.b #0x7F
    beq .9D74

    jsl 0x82C70E
.9D74:
    rts

.9D75:
    lda.b 0x0B
    bne .9D81

    lda.b #0x80
    sta.b 0x2C
    lda.b 0x39
    beq .9D89

.9D81:
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
.9D89:
    jsr _879F49
    bne .9D91

    jmp .9E43

.9D91:
    lda.b 0x35
    beq .9D98

    jmp .9E3F

.9D98:
    jsr _879FCB
    lda.b 0x39
    beq .9DA2

    jmp .9E43

.9DA2:
    lda.b 0x0B
    beq .9DA9

    jmp .9E3F

.9DA9:
    lda.b 0x36
    bne .9DC2

    dec.b 0x33
    beq .9DB4

    jmp .9E3F

.9DB4:
    jsl _879ED4
    lda.b #0x03
    jsl _848EEA.8F07
    lda.b #0x01
    sta.b 0x36
.9DC2:
    lda.b 0x0F
    cmp.b #0x80
    bne .9E3F

    lda.b #0x01
    jsl _848EEA.8F07
    stz.b 0x36
    lda.b #0x50
    sta.b 0x33
    jsl 0x828358
    bne .9E3D

    inc.w 0x0000,X
    lda.b #0x13
    sta.w 0x000A,X
    lda.l 0x7F8245
    sta.w 0x0018,X
    lda.l 0x7F8345
    and.b #0xF9
    sta.w 0x0011,X
    lda.b #0x09
    sta.w 0x000B,X
    lda.b #0x42
    sta.w 0x0016,X
    lda.b #0x01
    sta.w 0x0028,X
    lda.b 0x11
    and.b #0x40
    beq .9E15

    rep #0x20
    lda.w #0x0400
    sta.w 0x001A,X
    lda.w #0x0019
    jmp .9E20

.9E15:
    rep #0x20
    lda.w #0xFC00
    sta.w 0x001A,X
    lda.w #0xFFE7
.9E20:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0004
    sta.w 0x0008,X
    lda.w #0xCE41
    sta.w 0x0020,X
    sep #0x30
    lda.b #0x55
    jsl _80888B
.9E3D:
    sep #0x30
.9E3F:
    jsl _848EEA
.9E43:
    lda.b 0x2C
    and.b #0x7F
    beq .9E4D

    jsl 0x82C70E
.9E4D:
    rts

.9E4E:
    jsl update_pos_xy.neg_ay
    lda.b #0xFF
    sta.b 0x2F
    jsl 0x8491BE
    lda.b 0x2E
    cmp.b #0x00
    beq .9E91

    lda.b 0x37
    beq .9E79

    lda.b #0x06
    sta.b 0x01
    lda.b 0x0B
    bne .9E76

    lda.b 0x39
    bne .9E76

    lda.b #0x01
    jsl _848EEA.8F07
.9E76:
    jmp .9E95

.9E79:
    lda.b #0x04
    sta.b 0x01
    lda.b 0x0B
    beq .9E88

    lda.b #0x06
    sta.b 0x01
    jmp .9E8E

.9E88:
    lda.b #0x02
    jsl _848EEA.8F07
.9E8E:
    jmp .9E95

.9E91:
    jsl _848EEA
.9E95:
    rts

.9E96:
    bit.w 0x1F96
    bvs .9ECF

    dec.b 0x33
    bne .9EB6

    inc.b 0x33
    lda.b 0x11
    and.b #0xF1
    ora.b #0x0A
    sta.b 0x11
    rep #0x20
    lda.w #0xFFE8
    sta.w 0x0000
    sep #0x20
    jsr _87A027
.9EB6:
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    jsl update_pos_xy.neg_ay
    lda.b 0x2C
    and.b #0x7F
    beq .9ED3

    jsl 0x82C70E
    jmp .9ED3

.9ECF:
    lda.b #0x01
    sta.b 0x3B
.9ED3:
    rts
