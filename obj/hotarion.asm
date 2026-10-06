hotarion:
    ldx.b 0x01
    jsr (.A4CE,X)
    lda.b 0x1C
    beq .A46B

    jmp .A4CD

.A46B:
    lda.b 0x27
    beq .A485

    jsl 0x849B43
    beq .A4A3

    lda.b 0x27
    and.b #0x7F
    bne .A4A1

    jsl 0x84A4AB
    lda.b #0x01
    jsl 0x84A37F
.A485:
    lda.b #0x00
    sta.b 0x27
    jsr .A8DA
    jsl .A5AE
    lda.b 0x1F
    cmp.b #0xF0
    bne .A49F

    jsr .A94F
    jsl 0x828387
    sep #0x10
.A49F:
    bra .A4CD

.A4A1:
    bra .A4A3

.A4A3:
    jsl 0x849B03
    jsl .A5AE
    jsl 0x8280B4
    jsl 0x82806E
    bcc .A4CD

    lda.b #0x00
    sta.b 0x27
    jsr .A8DA
    jsl .A5AE
    lda.b 0x1F
    cmp.b #0xF0
    bne .A4CD

    jsr .A94F
    jsl 0x828387
.A4CD:
    rtl

.A4CE: d16[.A4D2, .A597]

.A4D2:
    jsl 0x82827D
    stz.b 0x1C
    jsl 0x84A1D0
    cpy.b #0x04
    bpl .A4E7

    lda.w 0x1F2C
    cmp.b #0xC0
    bne .A4F3

.A4E7:
    nop
    jsl 0x828387
    lda.b #0x01
    sta.b 0x1C
    jmp .A596

.A4F3:
    lda.w 0x1F2C
    cmp.b #0x40
    beq .A507

    lda.b #0x40
    sta.b 0x2D
    ora.w 0x1F2C
    sta.w 0x1F2C
    jmp .A511

.A507:
    lda.b #0x80
    sta.b 0x2D
    ora.w 0x1F2C
    sta.w 0x1F2C
.A511:
    lda.b #0x02
    sta.b 0x27
    lda.b #0x01
    sta.b 0x28
    lda.b #0x02
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0x03
    sta.b 0x2F
    stz.b 0x0B
    jsl _879ED4
    lda.b 0x11
    and.b #0x40
    bne .A54C

    rep #0x20
    lda.w #0xFA00
    sta.b 0x1A
    lda.w #0x0020
    sta.b 0x3C
    stz.b 0x36
    sep #0x20
    lda.b #0x18
    sta.b 0x1E
    lda.b #0x0C
    sta.b 0x3E
    jmp .A562

.A54C:
    rep #0x20
    lda.w #0x0600
    sta.b 0x1A
    lda.w #0xFFE0
    sta.b 0x3C
    sep #0x20
    lda.b #0xE8
    sta.b 0x1E
    lda.b #0x01
    sta.b 0x0B
.A562:
    rep #0x20
    lda.w #0xD0C9
    sta.b 0x20
    stz.b 0x2B
    sep #0x20
    lda.w 0x1F2C
    beq .A590

    cmp.b #0x40
    beq .A588

    cmp.b #0x80
    beq .A57D

    jmp .A590

.A57D:
    lda.b #0xFF
    sta.w 0x2126
    stz.w 0x2127
    jmp .A590

.A588:
    lda.b #0xFF
    sta.w 0x2128
    stz.w 0x2129
.A590:
    lda.b #0x00
    jsl 0x848F07
.A596:
    rts

.A597:
    jsl update_pos_x
    jsl 0x848EEA
    lda.b 0x2F
    dec
    sta.b 0x2F
    bne .A5AD

    jsr .A974
    lda.b #0x03
    sta.b 0x2F
.A5AD:
    rts

;-----

.A5AE:
    ldx.b 0x02
    bne .A5DD

    phb
    rep #0x30
    lda.b 0x2D
    and.w #0x00FF
    cmp.w #0x0040
    bne .A5CE

    ldx.w #0xD0CD
    ldy.w #0x0AA1
    lda.w #0x000D
    mvn 0x00,0x86
    jmp .A5DA

.A5CE:
    ldx.w #0xD0DB
    ldy.w #0x0AAF
    lda.w #0x000D
    mvn 0x00,0x86
.A5DA:
    sep #0x30
    plb
.A5DD:
    jmp .A5E6

.A5E0: d16[.A6A1, .A740, .A74D]

.A5E6:
    ldx.b 0x02
    jsr (.A5E0,X)
    phb
    lda.b 0x2D
    cmp.b #0x40
    bne .A647

    rep #0x30
    lda.b 0x2B
    bne .A61E

    ldx.w #0xD0E9
    ldy.w #0x0B22
    lda.w #0x0013
    mvn 0x00,0x86
    ldx.w #0xD000
    ldy.w #0xD1FE
    lda.w #0x00E0
    mvn 0x7F,0x7F
    ldx.w #0xD0FF
    ldy.w #0xD2FD
    lda.w #0x00E0
    mvn 0x7F,0x7F
    bra .A642

.A61E:
    ldx.w #0xD0FD
    ldy.w #0x0B22
    lda.w #0x0013
    mvn 0x00,0x86
    ldx.w #0xD000
    ldy.w #0xD3FC
    lda.w #0x00E0
    mvn 0x7F,0x7F
    ldx.w #0xD0FF
    ldy.w #0xD4FB
    lda.w #0x00E0
    mvn 0x7F,0x7F
.A642:
    sep #0x30
    jmp .A697

.A647:
    rep #0x30
    lda.b 0x2B
    bne .A673

    ldx.w #0xD111
    ldy.w #0x0B36
    lda.w #0x0013
    mvn 0x00,0x86
    ldx.w #0xD000
    ldy.w #0xD5FA
    lda.w #0x00E0
    mvn 0x7F,0x7F
    ldx.w #0xD0FF
    ldy.w #0xD6F9
    lda.w #0x00E0
    mvn 0x7F,0x7F
    bra .A697

.A673:
    ldx.w #0xD125
    ldy.w #0x0B36
    lda.w #0x0013
    mvn 0x00,0x86
    ldx.w #0xD000
    ldy.w #0xD7F8
    lda.w #0x00E0
    mvn 0x7F,0x7F
    ldx.w #0xD0FF
    ldy.w #0xD8F7
    lda.w #0x00E0
    mvn 0x7F,0x7F
.A697:
    sep #0x30
    lda.b 0x2B
    eor.b #0x01
    sta.b 0x2B
    plb
    rtl

.A6A1:
    lda.b #0x33
    jsl _80888B
    rep #0x20
    lda.b 0x05
    clc
    adc.b 0x3C
    sec
    sbc.w 0x1E4D
    cmp.w #0x0100
    bcc .A6BA

    sep #0x20
    rts

.A6BA:
    sep #0x20
    lda.b #0x02
    sta.b 0x02
    lda.b 0x2D
    cmp.b #0x40
    bne .A6CF

    inc.w 0x0AA1
    inc.w 0x0AA8
    jmp .A6D5

.A6CF:
    inc.w 0x0AAF
    inc.w 0x0AB6
.A6D5:
    stz.b 0x03
    stz.b 0x39
    rep #0x20
    lda.b 0x05
    sta.b 0x34
    lda.b 0x1E
    and.w #0x00FF
    clc
    adc.b 0x34
    sec
    sbc.w 0x1E4D
    sta.b 0x34
    lda.b 0x08
    sec
    sbc.w 0x1E50
    sec
    sbc.w #0x0018
    sta.b 0x36
    bpl .A725

    lda.w #0x0001
    sta.b 0x39
    lda.w 0x1E50
    sec
    sbc.w 0x1E6C
    bmi .A70F

    sta.w 0x0000
    jmp .A715

.A70F:
    lda.w #0x0001
    sta.w 0x0000
.A715:
    sep #0x20
    lda.b #0xFF
    sec
    sbc.b 0x36
    clc
    adc.w 0x0000
    sta.b 0x38
    jmp .A72B

.A725:
    rep #0x20
    stz.b 0x38
    stz.b 0x39
.A72B:
    sep #0x20
    lda.b #0x02
    sta.w 0x0004
    stz.b 0x3E
    stz.b 0x1F
    lda.b #0x31
    sta.b 0x3B
    sta.w 0x0002
    jmp .A7F6

.A740:
    lda.b #0x04
    sta.b 0x02
    lda.b #0x20
    sta.w 0x00C9
    sta.w 0x2130
    rts

.A74D:
    rep #0x20
    lda.b 0x05
    sta.b 0x34
    lda.b 0x1E
    and.w #0x00FF
    clc
    adc.b 0x34
    sec
    sbc.w 0x1E4D
    sta.b 0x34
    lda.b 0x0B
    and.w #0x00FF
    cmp.w #0x0001
    bne .A77A

    lda.b 0x34
    cmp.w #0x0200
    bmi .A786

    lda.w #0x00FF
    sta.b 0x34
    jmp .A786

.A77A:
    lda.b 0x34
    cmp.w #0x0001
    bpl .A786

    lda.w #0x0000
    sta.b 0x34
.A786:
    jmp .A792

    sep #0x20
    lda.b #0x06
    sta.b 0x02
    jmp .A7F2

.A792:
    sep #0x20
    lda.b 0x03
    bne .A79C

    lda.b #0x0C
    sta.b 0x3E
.A79C:
    lda.b 0x3B
    sta.b 0x3B
    sta.w 0x0002
    lda.b #0x02
    sta.w 0x0004
    lda.b 0x03
    bne .A7ED

    rep #0x20
    lda.b 0x08
    sec
    sbc.w 0x1E50
    sec
    sbc.w #0x0018
    sta.b 0x36
    bpl .A7E7

    lda.w #0x0001
    sta.b 0x39
    lda.w 0x1E50
    sec
    sbc.w 0x1E6C
    bmi .A7D1

    inc
    sta.w 0x0000
    jmp .A7D7

.A7D1:
    lda.w #0x0001
    sta.w 0x0000
.A7D7:
    sep #0x20
    lda.b #0xFF
    sec
    sbc.b 0x36
    clc
    adc.w 0x0000
    sta.b 0x38
    jmp .A7ED

.A7E7:
    rep #0x20
    stz.b 0x38
    stz.b 0x39
.A7ED:
    sep #0x20
    jsr .A7F6
.A7F2:
    rts

.A7F3:
    sep #0x30
    rts

;-----

.A7F6:
    ldy.b #0x00
    lda 0x00D139,Y
    sta.b 0x3F
    rep #0x30
    ldx.w #0x0000
.A802:
    lda.b 0x39
    bne .A822

    lda.w #0xFFFF
    sta.l 0x7FD000,X
    lda.w #0x0000
    sta.l 0x7FD0FF,X
    inx
    inx
    cpx.b 0x36
    bcc .A802

    cpx.w #0x00E8
    bpl .A7F3

    jmp .A835

.A822:
    rep #0x20
    lda.b 0x39
    beq .A835

    sep #0x20
    lda.b 0x38
    beq .A835

    dec.b 0x38
    bne .A835

    ldx.w #0x0000
.A835:
    sep #0x20
    lda.b 0x0B
    cmp.b #0x01
    bne .A878

    lda.b 0x34
    sec
    sbc.b 0x3E
    sta.l 0x7FD0FF,X
    lda.b #0x00
    clc
    adc.b 0x1F
    sta.l 0x7FD000,X
    lda.b 0x03
    bne .A86A

    lda.b 0x3F
    bne .A873

    lda 0x00D139,Y
    sta.b 0x3F
    cmp.b #0x05
    bmi .A86D

    lda.b 0x3F
    sec
    sbc.b #0x05
    sta.b 0x3F
    inc.b 0x3E
    iny
.A86A:
    jmp .A8B0

.A86D:
    dec.b 0x3E
    iny
    jmp .A8B0

.A873:
    dec.b 0x3F
    jmp .A8B0

.A878:
    lda.b 0x34
    clc
    adc.b 0x3E
    sta.l 0x7FD000,X
    lda.b #0xFF
    sec
    sbc.b 0x1F
    sta.l 0x7FD0FF,X
    lda.b 0x03
    bne .A8B0

    lda.b 0x3F
    bne .A8AE

    lda 0x00D139,Y
    sta.b 0x3F
    cmp.b #0x05
    bmi .A8A8

    lda.b 0x3F
    sec
    sbc.b #0x05
    sta.b 0x3F
    inc.b 0x3E
    iny
    jmp .A8B0

.A8A8:
    dec.b 0x3E
    iny
    jmp .A8B0

.A8AE:
    dec.b 0x3F
.A8B0:
    inx
    dec.w 0x0002
    beq .A8B9

    jmp .A822

.A8B9:
    lda.b 0x38
    beq .A8C0

    jmp .A822

.A8C0:
    rep #0x20
    lda.w #0xFFFF
    sta.l 0x7FD000,X
    lda.w #0x0000
    sta.l 0x7FD0FF,X
    inx
    inx
    cpx.w #0x00E8
    bcc .A8C0

    sep #0x30
    rts

;-----

.A8DA:
    lda.b 0x3B
    cmp.b #0x01
    beq .A916

    rep #0x20
    lda.b 0x36
    clc
    adc.w #0x0003
    sta.b 0x36
    bpl .A916

    lda.w 0x1E50
    sec
    sbc.w 0x1E6C
    bmi .A8FC

    inc
    sta.w 0x0000
    jmp .A902

.A8FC:
    lda.w #0x0001
    sta.w 0x0000
.A902:
    sep #0x20
    lda.b #0xFF
    sec
    sbc.b 0x36
    clc
    adc.w 0x0000
    sta.b 0x38
    lda.b #0x01
    sta.b 0x39
    jmp .A91C

.A916:
    sep #0x20
    stz.b 0x38
    stz.b 0x39
.A91C:
    lda.b #0x01
    sta.b 0x03
    stz.b 0x3E
    lda.b 0x3B
    sec
    sbc.b #0x06
    sta.b 0x3B
    sta.w 0x0002
    cmp.b #0x01
    bpl .A94B

    lda.b #0x01
    sta.b 0x3B
    sta.w 0x0002
    lda.b 0x1F
    clc
    adc.b #0x18
    sta.b 0x1F
    cmp.b #0xF0
    bne .A94B

    rep #0x20
    lda.w #0x00E8
    sta.b 0x36
    sep #0x20
.A94B:
    jsr .A7F6
    rts

;-----

.A94F:
    lda.b 0x2D
    cmp.b #0x40
    bne .A95E

    stz.w 0x0AA1
    stz.w 0x0AA8
    jmp .A964

.A95E:
    stz.w 0x0AAF
    stz.w 0x0AB6
.A964:
    lda.b 0x2D
    trb.w 0x1F2C
    lda.w 0x1F2C
    bne .A973

    lda.b #0x00
    sta.w 0x00C9
.A973:
    rts

;-----

.A974:
    rep #0x10
    jsl 0x8282D3
    bne .A9DC

    inc.w 0x0000,X
    lda.b #0x30
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.l 0x7F8255
    sta.w 0x0018,X
    lda.b 0x16
    sta.w 0x0016,X
    lda.b #0x01
    sta.w 0x000B,X
    lda.b 0x11
    and.b #0x40
    bne .A9AE

    rep #0x20
    lda.b 0x05
    clc
    adc.w #0x0010
    sta.w 0x0005,X
    jmp .A9B9

.A9AE:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0010
    sta.w 0x0005,X
.A9B9:
    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x000D
    sta.w 0x0008,X
    lda.w #0x0000
    sta.w 0x001A,X
    lda.w #0x0100
    sta.w 0x001C,X
    sep #0x20
    lda.b #0x1E
    sta.w 0x0002,X
    lda.b #0x10
    sta.w 0x001E,X
.A9DC:
    sep #0x30
    rts
