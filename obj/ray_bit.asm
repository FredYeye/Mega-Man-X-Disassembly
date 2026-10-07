ray_bit:
    ldx.b 0x01
    jsr (.D649,X)
    lda.b 0x27
    beq .D636

    jsl 0x849B43
    beq .D630

    lda.b 0x27
    and.b #0x7F
    bne .D628

    jsl 0x84A4AB
    lda.b #0x01
    jsl 0x84A37F
    bra .D644

.D628:
    lda.b #0xF1
    and.b 0x11
    sta.b 0x11
    bra .D636

.D630:
    lda.b 0x34
    ora.b 0x11
    sta.b 0x11
.D636:
    jsl _849B03
    jsl _82808F.80B4
    jsl 0x82806E
    bcc .D648

.D644:
    jsl 0x828387
.D648:
    rtl

.D649: d16[.D651, .D698, .D6F6, .D748]

.D651:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x34
    lda.b #0x04
    sta.b 0x27
    lda.b #0x01
    sta.b 0x28
    lda.b #0x04
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0xFF
    sta.b 0x2F
    stz.b 0x35
    stz.b 0x36
    stz.b 0x37
    stz.b 0x38
    stz.b 0x3B
    rep #0x20
    lda.w #0xD3FB
    sta.b 0x20
    lda.b 0x05
    sta.b 0x39
    sep #0x20
    lda.b #0x01
    sta.b 0x33
    jsr .D76A
    lda.b #0x01
    sta.b 0x36
    lda.b #0x05
    jsl _848EEA.8F07
    rts

.D698:
    lda.b 0x0F
    cmp.b #0x01
    beq .D6E8

    lda.b 0x33
    cmp.b #0x10
    bne .D6B3

    jsr .D791
    lda.b 0x3B
    bne .D6B1

    jsr .D76A
    jmp .D6B3

.D6B1:
    stz.b 0x3B
.D6B3:
    dec.b 0x33
    bne .D6F5

    lda.b 0x36
    beq .D6CC

    cmp.b #0x01
    beq .D6CF

    lda.b #0x02
    jsl _848EEA.8F07
    lda.b #0x06
    sta.b 0x01
    jmp .D6F5

.D6CC:
    jsr .D7D3
.D6CF:
    inc.b 0x33
    lda.b 0x35
    bne .D6E4

    lda.b #0x00
    sta.b 0x0B
    jsl _848EEA.8F07
    lda.b #0x01
    sta.b 0x35
    jmp .D6F5

.D6E4:
    lda.b 0x0F
    bne .D6EF

.D6E8:
    jsl _848EEA
    jmp .D6F5

.D6EF:
    lda.b #0x04
    sta.b 0x01
    stz.b 0x35
.D6F5:
    rts

.D6F6:
    jsl update_pos_xy.neg_ay
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x01
    beq .D709

    stz.b 0x1A
    jmp .D711

.D709:
    lda.b 0x2B
    and.b #0x02
    beq .D711

    stz.b 0x1A
.D711:
    lda.b 0x2B
    and.b #0x04
    beq .D72A

    lda.b #0x02
    sta.b 0x01
    stz.b 0x36
    lda.b #0x1E
    sta.b 0x33
    lda.b #0x05
    jsl _848EEA.8F07
    jmp .D747

.D72A:
    rep #0x20
    lda.b 0x1C
    bpl .D741

    sep #0x20
    lda.b 0x0B
    bne .D747

    lda.b #0x01
    sta.b 0x0B
    jsl _848EEA.8F07
    jmp .D747

.D741:
    sep #0x20
    jsl _848EEA
.D747:
    rts

.D748:
    lda.b 0x37
    bne .D759

    lda.b 0x0F
    cmp.b #0x01
    bne .D759

    jsr .D7F7
    lda.b #0x01
    sta.b 0x37
.D759:
    lda.b 0x0F
    bmi .D764

    jsl _848EEA
    jmp .D769

.D764:
    jsr .D849
    stz.b 0x37
.D769:
    rts

;-----

.D76A:
    jsl _879ED4
.D76E:
    lda.b 0x11
    and.b #0x40
    beq .D77E

    rep #0x20
    lda.w #0x0180
    sta.b 0x1A
    jmp .D785

.D77E:
    rep #0x20
    lda.w #0xFE80
    sta.b 0x1A
.D785:
    lda.w #0x0400
    sta.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    rts

;-----

.D791:
    rep #0x20
    lda.b 0x39
    sta.w 0x0002
    lda.w #0x0080
    sta.w 0x0000
    lda.b 0x05
    sec
    sbc.w 0x0002
    bcc .D7B6

    cmp.w 0x0000
    bcc .D7D0

    sep #0x20
    lda.b 0x11
    and.b #0xBF
    sta.b 0x11
    jmp .D7C9

.D7B6:
    rep #0x20
    eor.w #0xFFFF
    inc
    cmp.w 0x0000
    bcc .D7D0

    sep #0x20
    lda.b 0x11
    ora.b #0x40
    sta.b 0x11
.D7C9:
    lda.b #0x01
    sta.b 0x3B
    jsr .D76E
.D7D0:
    sep #0x20
    rts

;-----

.D7D3:
    jsl get_rng
    and.b #0x03
    bne .D7E4

    lda.b #0x02
    sta.b 0x36
    stz.b 0x38
    jmp .D7F6

.D7E4:
    lda.b #0x01
    sta.b 0x36
    inc.b 0x38
    lda.b #0x03
    cmp.b 0x38
    bpl .D7F6

    lda.b #0x02
    sta.b 0x36
    stz.b 0x38
.D7F6:
    rts

;-----

.D7F7:
    rep #0x10
    jsl 0x828358
    bne .D846

    inc.w 0x0000,X
    lda.b #0x22
    sta.w 0x000A,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x34
    ora.b 0x11
    sta.w 0x0011,X
    lda.b #0x03
    sta.w 0x000B,X
    lda.b #0x85
    sta.w 0x0016,X
    lda.b 0x11
    and.b #0x40
    beq .D82E

    rep #0x20
    lda.w #0x0240
    sta.w 0x001A,X
    jmp .D836

.D82E:
    rep #0x20
    lda.w #0xFDC0
    sta.w 0x001A,X
.D836:
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    lda.w #0xD405
    sta.w 0x0020,X
.D846:
    sep #0x30
    rts

;-----

.D849:
    lda.b #0x05
    jsl _848EEA.8F07
    lda.b #0x1E
    sta.b 0x33
    lda.b #0x02
    sta.b 0x01
    stz.b 0x36
    stz.b 0x35
    rts
