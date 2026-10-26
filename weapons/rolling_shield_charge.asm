rolling_shield_charge:
    ldx.b 0x01
    jsr (.9C5C,X)
    jml 0x848FCA

.9C5C: d16[.9C66, .9CA8, .9D4A, .9C9A, .9D4A]

.9C66:
    lda.b #0x02
    sta.b 0x01
    lda.b #0xFF
    sta.b 0x10
    sta.w 0x0C30
    lda.b #0x08
    sta.b 0x18
    sta.b 0x30
    stz.b 0x12
    stz.b 0x38
    stz.b 0x39
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    lda.b #0xB9
    sta.b 0x31
    lda.b #0xAF
    sta.b 0x32
    lda.b #0x8E
    sta.b 0x16
    lda.b #0x80
    sta.b 0x17
    inc.w 0x0C25
    rts

.9C9A:
    lda.b #0x02
    sta.b 0x01
    lda.b 0x38
    sta.b 0x02
    lda.b 0x39
    sta.b 0x03
    stz.b 0x30
.9CA8:
    ldx.b 0x02
    jsr (.9CFC,X)
    lda.b #0xB5
    sta.b 0x20
    lda.b #0xBF
    sta.b 0x21
    lda.w 0x0BAA
    cmp.b #0x2C
    beq .9CD5

    lda.w 0x1F23
    bne .9CD5

    lda.w 0x1F7B
    cmp.b #0x04
    beq .9CD5

    lda.w 0x0BCF
    and.b #0x7F
    beq .9CD5

    jsl 0x849BC8
    bpl .9CDB

.9CD5:
    lda.b #0x08
    sta.b 0x01
    stz.b 0x02
.9CDB:
    lda.b #0xB1
    sta.b 0x20
    lda.b #0xBF
    sta.b 0x21
    lda.b 0x02
    sta.b 0x38
    lda.b 0x03
    sta.b 0x39
    lda.b 0x37
    beq .9CF5

    lda.w 0x0B9C
    lsr
    bcs .9CF9

.9CF5:
    jsl _82808F.80B4
.9CF9:
    jmp .9DC5

.9CFC: d16[.9D00, .9D20]

.9D00:
    ldx.b 0x03
    bne .9D11

    inc.b 0x03
    stz.b 0x37
    stz.b 0x30
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.9D11:
    lda.b 0x0F
    bpl .9D1B

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.9D1B:
    jsl _848EEA
    rts

.9D20:
    ldx.b 0x03
    bne .9D3A

    inc.b 0x03
    lda.b #0x02
    sta.b 0x3C
    inc.b 0x37
    lda.b #0x86
    sta.b 0x3A
    lda.b #0x01
    sta.b 0x3B
    lda.b #0x01
    jsl _848EEA.8F07
.9D3A:
    lda.w 0x0B9C
    and.b #0x0F
    bne .9D47

    lda.b #0x64
    jsl _80888B.88B6
.9D47:
    jmp .9DA2

.9D4A:
    ldx.b 0x02
    jsr (.9D5A,X)
    lda.b 0x00
    beq .9D57

    jsl _82808F.80B4
.9D57:
    jmp .9DC5

.9D5A: d16[.9D5E, .9D75]

.9D5E:
    lda.b #0x02
    sta.b 0x02
    inc.b 0x30
    stz.b 0x37
    ldx.b #0x30
    ldy.b #0x46
    jsl _828000
    lda.b #0x02
    jsl _848EEA.8F07
    rts

.9D75:
    lda.b 0x0F
    bpl .9D89

    inc.b 0x30
    dec.w 0x0BDD
    dec.w 0x0C25
    stz.w 0x0C30
    jsl _8283A3
    rts

.9D89:
    jsl _848EEA
    rts

    jsl _82833E
    bne .9D9F

    inc.w 0x0000,X
    lda.b #0x14
    sta.w 0x000A,X
    sta.w 0x000B,X
.9D9F:
    sep #0x10
    rts

.9DA2:
    dec.b 0x3C
    bne .9DC4

    lda.b #0x02
    sta.b 0x3C
    rep #0x30
    ldy.b 0x3A
    jsl _828000.8011
    lda.b 0x3A
    inc
    inc
    cmp.w #0x018E
    sta.b 0x3A
    bcc .9DC2

    lda.w #0x0184
    sta.b 0x3A
.9DC2:
    sep #0x30
.9DC4:
    rts

.9DC5:
    rep #0x20
    lda.w ram.obj.mega_man.pos_x+1
    sta.b 0x05
    lda.w ram.obj.mega_man.pos_y+1
    sta.b 0x08
    sep #0x20
    rts
