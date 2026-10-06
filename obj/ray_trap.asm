ray_trap:
    ldx.b 0x01
    jsr (.BAA4,X)
    lda.b 0x27
    beq .BA8D

    jsl 0x849B43
    beq .BA8D

    lda.b 0x27
    and.b #0x7F
    bne .BA8D

    jsl 0x84A4AB
    bra .BA9F

.BA8D:
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    jsl 0x8280B4
    jsl 0x82806E
    bcc .BAA3

.BA9F:
    jsl 0x828387
.BAA3:
    rtl

.BAA4: d16[.BAAC, .BACE, .BAE8, .BB6F]

.BAAC:
    jsl 0x82827D
    lda.b #0x01
    sta.b 0x27
    sta.b 0x26
    stz.b 0x28
    lda.b #0x06
    sta.b 0x12
    stz.b 0x36
    rep #0x20
    lda.w #0xD224
    sta.b 0x20
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
    rts

.BACE:
    lda.b 0x36
    bne .BAD9

    jsl 0x848EEA
    jmp .BAE7

.BAD9:
    lda.b #0x04
    sta.b 0x01
    lda.b #0x01
    jsl 0x848F07
    lda.b #0x20
    sta.b 0x33
.BAE7:
    rts

.BAE8:
    dec.b 0x33
    lda.b 0x33
    cmp.b #0x04
    bne .BAF3

    jsr .BB09
.BAF3:
    lda.b 0x33
    beq .BAFE

    jsl 0x848EEA
    jmp .BB08

.BAFE:
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x06
    sta.b 0x01
.BB08:
    rts

.BB09:
    jsl 0x84A07C
    sta.b 0x34
    and.b #0x01
    beq .BB15

    dec.b 0x34
.BB15:
    lda.b 0x34
    cmp.b #0x10
    bpl .BB20

    lsr
    tax
    jmp .BB27

.BB20:
    lda.b #0x20
    sec
    sbc.b 0x34
    lsr
    tax
.BB27:
    lda.w 0x00D229,X
    sta.b 0x0B
    lda.b 0x34
    asl
    asl
    tax
    cmp.b #0x40
    bmi .BB3E

    lda.b 0x11
    and.b #0xBF
    sta.b 0x35
    jmp .BB44

.BB3E:
    lda.b 0x11
    ora.b #0x40
    sta.b 0x35
.BB44:
    rep #0x20
    lda.w 0x00EE3A,X
    bpl .BB54

    asl
    asl
    asl
    ora.w #0xF000
    jmp .BB57

.BB54:
    asl
    asl
    asl
.BB57:
    sta.b 0x1A
    lda.w 0x00EE3C,X
    bpl .BB67

    asl
    asl
    asl
    ora.w #0xF000
    jmp .BB6A

.BB67:
    asl
    asl
    asl
.BB6A:
    sta.b 0x1C
    sep #0x20
    rts

.BB6F:
    rep #0x10
    jsl 0x828358
    bne .BBB7

    stz.b 0x36
    inc.w 0x0000,X
    lda.b #0x1C
    sta.w 0x000A,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x35
    sta.w 0x0011,X
    lda.b 0x16
    sta.w 0x0016,X
    lda.b 0x0B
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    lda.b 0x1A
    sta.w 0x001A,X
    lda.b 0x1C
    sta.w 0x001C,X
    lda.w #0xFE00
    sta.b 0x1C
    lda.w #0x0055
    jsl _80888B
.BBB7:
    sep #0x30
    lda.b #0x02
    sta.b 0x01
    rts
