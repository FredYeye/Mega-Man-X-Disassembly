horming_torpedo_charge:
    ldx.b 0x01
    jmp (.9962,X)

.9962: d16[.996C, .9A62, .9B4F, .9B3F, .9B3F]

.996C:
    lda.b #0x02
    sta.b 0x01
    jsl _83917D
    ldx.w ram.current_stage
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    stz.b 0x30
    lda.b #0x01
    sta.b 0x38
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x93
    sta.b 0x16
    ldx.b 0x3C
    lda.w 0x00BE3C,X
    sta.w 0x0000
    stz.w 0x0001
    stz.w 0x0003
    lda.w 0x00BE3D,X
    sta.w 0x0002
    bpl .99A7

    dec.w 0x0003
.99A7:
    rep #0x20
    lda.w 0x0000
    bit.b 0x10
    bvs .99B4

    eor.w #0xFFFF
    inc
.99B4:
    clc
    adc.w ram.obj.mega_man.pos_x+1
    sta.b 0x05
    lda.w ram.obj.mega_man.pos_y+1
    clc
    adc.w 0x0002
    sta.b 0x08
    lda.w #0x0400
    bit.b 0x10
    bvs .99CD

    lda.w #0xFC00
.99CD:
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0xBFA7
    sta.b 0x20
    lda.w #0xACA5
    sta.b 0x31
    stz.b 0x0C
    lda.w #0xFFFF
    sta.b 0x39
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b 0x11
    asl
    asl
    bcc .99FC

    lda.b #0x01
    sta.b 0x1B
    lda.b #0x08
    sta.b 0x37
    sta.b 0x3B
    lda.b #0x0C
    bra .9A08

.99FC:
    lda.b #0xFF
    sta.b 0x1B
    lda.b #0x18
    sta.b 0x37
    sta.b 0x3B
    lda.b #0x04
.9A08:
    sta.b 0x3D
    jsl _848EEA.8F07
    lda.b #0x40
    trb.b 0x11
    jsr _839047
    lda.b #0x10
    sta.b 0x38
    lda.b #0x05
    sta.b 0x3E
    stz.b 0x1F
    stz.b 0x1E
    lda.b 0x0B
    beq .9A5B

    asl
    asl
    clc
    adc.b 0x3B
    sta.b 0x3B
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    sta.b 0x1A
    lda.w 0x00EE3C,X
    sta.b 0x1C
    sep #0x20
    lda.b 0x0B
    clc
    adc.b 0x3E
    sta.b 0x3E
    lda.b 0x0B
    clc
    adc.b 0x37
    sta.b 0x37
    tax
    lda.w 0x00BF87,X
    sta.b 0x3D
    jsl _848EEA.8F07
    jsl 0x848FCA
    bra .9A62

.9A5B:
    jsl 0x848FCA
    jsr .9B56
.9A62:
    dec.b 0x3E
    bne .9A6D

    lda.b #0x03
    sta.b 0x3E
    jsr _839133
.9A6D:
    dec.b 0x38
    bne .9A85

    lda.b #0x01
    sta.b 0x38
    lda.b 0x0D
    beq .9A82

    jsr _8390AF
    lda.b 0x37
    sta.b 0x3B
    bra .9A85

.9A82:
    jsr _839047
.9A85:
    lda.b 0x3B
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    asl
    asl
    asl
    asl
    asl
    bpl .9A9A

    eor.w #0xFFFF
    inc
.9A9A:
    sep #0x20
    xba
    sta.b 0x1F
    rep #0x20
    lda.w 0x00EE3C,X
    asl
    asl
    asl
    asl
    asl
    bpl .9AAF

    eor.w #0xFFFF
    inc
.9AAF:
    sep #0x20
    xba
    sta.b 0x1E
    lda.b 0x37
    bit.b #0x10
    beq .9AF8

    bit.b #0x08
    beq .9ADB

    jsl update_pos_xy.pos_ay_neg_ax
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bmi .9AD0

    sta.b 0x1A
.9AD0:
    lda.w 0x0002
    cmp.b 0x1C
    bpl .9B34

    sta.b 0x1C
    bra .9B34

.9ADB:
    jsl update_pos_xy.neg_ay_ax
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bmi .9AED

    sta.b 0x1A
.9AED:
    lda.w 0x0002
    cmp.b 0x1C
    bmi .9B34

    sta.b 0x1C
    bra .9B34

.9AF8:
    bit.b #0x08
    beq .9B19

    jsl update_pos_xy.neg_ay_pos_ax
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bpl .9B0E

    sta.b 0x1A
.9B0E:
    lda.w 0x0002
    cmp.b 0x1C
    bmi .9B34

    sta.b 0x1C
    bra .9B34

.9B19:
    jsl update_pos_xy.pos_ay_ax
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bpl .9B2B

    sta.b 0x1A
.9B2B:
    lda.w 0x0002
    cmp.b 0x1C
    bpl .9B34

    sta.b 0x1C
.9B34:
    sep #0x20
    jsl _82808F.80B4
    lda.b 0x0E
    beq .9B4F

    rtl

.9B3F:
    rep #0x20
    lda.b 0x33
    sta.b 0x05
    lda.b 0x35
    sta.b 0x08
    sep #0x20
    jsl 0x84A4AB
.9B4F:
    dec.w 0x0BDD
    jml 0x8283A3

//-----

.9B56:
    ldy.b #0x04
.9B58:
    jsl _82833E
    bne .9B7A

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    tya
    lsr
    bcc .9B6C

    eor.b #0xFF
.9B6C:
    sta.w 0x000B,X
    inc.w 0x0BDD
    lda.b 0x3C
    sta.w 0x003C,X
    dey
    bne .9B58

.9B7A:
    sep #0x30
    rts
