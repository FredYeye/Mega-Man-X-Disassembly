mettool_c_15:
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x01
    jsr (.C3C4,X)
    rep #0x20
    lda.b 0x0F
    and.w #0x000F
    clc
    adc.w #0xCF26
    sta.b 0x20
    sep #0x20
    jsl 0x849B03
    jsl 0x849B43
    beq .C3BA

    bpl .C3B6

    jsl 0x84A4AB
    lda.b #0x01
    jsl 0x84A37F
.C3B2:
    jml 0x828387

.C3B6:
    lda.b #0x0E
    trb.b 0x11
.C3BA:
    jsl 0x82806E
    bcs .C3B2

    jml 0x8280B4

.C3C4: d16[.C3CC, .C3EB, .C43E, .C4AE]

.C3CC:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x02
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    stz.b 0x2F
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x78
    sta.b 0x34
    rts

.C3EB:
    lda.b 0x02
    bne .C3F9

    inc.b 0x02
    lda.b #0x00
    jsl 0x848F07
    stz.b 0x28
.C3F9:
    jsl 0x84AC92
    jsr .C558
    bne .C409

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    rts

.C409:
    dec.b 0x34
    bne .C43B

    inc.b 0x34
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .C41D

    eor.w #0xFFFF
    inc
.C41D:
    cmp.w #0x0050
    bcs .C43B

    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bcs .C42E

    eor.w #0xFFFF
    inc
.C42E:
    cmp.w #0x0020
    bcs .C43B

    sep #0x20
    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
.C43B:
    sep #0x20
    rts

.C43E:
    jsl 0x84AC92
    ldx.b 0x02
    jmp (.C447,X)

.C447: d16[.C44F, .C45D, .C470, .C49F]

.C44F:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x01
    jsl 0x848F07
    lda.b #0x03
    sta.b 0x28
.C45D:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .C46F

    lda.b #0x04
    sta.b 0x02
    lda.b #0x02
    jsl 0x848F07
.C46F:
    rts

.C470:
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x01C0
    bcs .C47E

    lda.w #0xFE40
.C47E:
    sta.b 0x1A
    sep #0x20
    jsr .C558
    beq .C492

    lda.b #0x03
    jsl 0x848F07
    lda.b #0x06
    sta.b 0x02
    rts

.C492:
    jsl 0x82823E
    jsl 0x848EEA
    jsl 0x8491BE
    rts

.C49F:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .C4AD

    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
.C4AD:
    rts

.C4AE:
    jsl 0x84AC92
    ldx.b 0x02
    jmp (.C4B7,X)

.C4B7: d16[.C4BD, .C4CB, .C545]

.C4BD:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x01
    jsl 0x848F07
    lda.b #0x03
    sta.b 0x28
.C4CB:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .C544

    lda.b #0x04
    sta.b 0x02
    lda.b #0x03
    jsl 0x848F07
    jsl 0x84A07C
    tay
    lda.b 0x11
    bit.b #0x40
    bne .C4F8

    cpy.b #0x1B
    bcc .C4F0

    ldy.b #0x1A
    bra .C506

.C4F0:
    cpy.b #0x16
    bcs .C506

    ldy.b #0x16
    bra .C506

.C4F8:
    cpy.b #0x0B
    bcc .C500

    ldy.b #0x0A
    bra .C506

.C500:
    cpy.b #0x06
    bcs .C506

    ldy.b #0x06
.C506:
    jsl 0x828358
    bne .C542

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x16
    sta.w 0x0016,X
    tya
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    asl
    asl
    rep #0x20
    lda.w #0x0003
    bcs .C533

    lda.w #0xFFFD
.C533:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.w #0x0001
    clc
    adc.b 0x08
    sta.w 0x0008,X
.C542:
    sep #0x30
.C544:
    rts

.C545:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .C557

    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
    lda.b #0x78
    sta.b 0x34
.C557:
    rts

;-----

.C558:
    rep #0x20
    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bcs .C566

    eor.w #0xFFFF
    inc
.C566:
    cmp.w #0x0030
    bcs .C5A3

    sep #0x20
    lda.b 0x11
    asl
    asl
    lda.b #0x0B
    bcs .C577

    lda.b #0xF5
.C577:
    sta.b 0x29
    stz.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcs .C5A3

    lda.b #0x0B
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcs .C59B

    cmp.b #0x13
    beq .C59B

    cmp.b #0x0D
    bcs .C5A3

    cmp.b #0x01
    bcc .C5A3

.C59B:
    lda.b 0x11
    eor.w 0x0BB9
    and.b #0x40
    rts

.C5A3:
    sep #0x20
    lda.b #0x01
    rts
