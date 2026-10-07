horming_torpedo:
    ldx.b 0x01
    jmp (.8EA2,X)

.8EA2: d16[.8EAC, .8F65, .9040, .903C, .903C]

.8EAC:
    lda.b #0x02
    sta.b 0x01
    jsl _83917D
    ldx.w 0x1F7A
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    stz.b 0x30
    lda.b #0x01
    sta.b 0x38
    lda.b #0x03
    sta.b 0x3E
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x10
    sta.b 0x16
    ldx.b 0x3C
    lda.w 0x00BE3C,X
    sta.w 0x0000
    stz.w 0x0001
    stz.w 0x0003
    lda.w 0x00BE3D,X
    sta.w 0x0002
    bpl .8EEB

    dec.w 0x0003
.8EEB:
    rep #0x20
    lda.w 0x0000
    bit.b 0x10
    bvs .8EF8

    eor.w #0xFFFF
    inc
.8EF8:
    clc
    adc.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    clc
    adc.w 0x0002
    sta.b 0x08
    lda.w #0x0400
    bit.b 0x10
    bvs .8F11

    lda.w #0xFC00
.8F11:
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0xBED3
    sta.b 0x20
    lda.w #0xABE5
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
    bcc .8F40

    lda.b #0x01
    sta.b 0x1B
    lda.b #0x08
    sta.b 0x37
    sta.b 0x3B
    lda.b #0x0C
    bra .8F4C

.8F40:
    lda.b #0xFF
    sta.b 0x1B
    lda.b #0x18
    sta.b 0x37
    sta.b 0x3B
    lda.b #0x04
.8F4C:
    sta.b 0x3D
    jsl _848EEA.8F07
    jsl 0x848FCA
    lda.b #0x40
    trb.b 0x11
    jsr _839047
    lda.b #0x08
    sta.b 0x38
    stz.b 0x1F
    stz.b 0x1E
.8F65:
    dec.b 0x3E
    bne .8F70

    lda.b #0x03
    sta.b 0x3E
    jsr _839133
.8F70:
    dec.b 0x38
    bne .8F84

    lda.b #0x01
    sta.b 0x38
    lda.b 0x0D
    beq .8F81

    jsr _8390AF
    bra .8F84

.8F81:
    jsr _839047
.8F84:
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
    bpl .8F98

    eor.w #0xFFFF
    inc
.8F98:
    sep #0x20
    xba
    sta.b 0x1F
    rep #0x20
    lda.w 0x00EE3C,X
    asl
    asl
    asl
    asl
    bpl .8FAC

    eor.w #0xFFFF
    inc
.8FAC:
    sep #0x20
    xba
    sta.b 0x1E
    lda.b 0x37
    bit.b #0x10
    beq .8FF5

    bit.b #0x08
    beq .8FD8

    jsl update_pos_xy.pos_ay_neg_ax
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bmi .8FCD

    sta.b 0x1A
.8FCD:
    lda.w 0x0002
    cmp.b 0x1C
    bpl .9031

    sta.b 0x1C
    bra .9031

.8FD8:
    jsl update_pos_xy.neg_ay_ax
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bmi .8FEA

    sta.b 0x1A
.8FEA:
    lda.w 0x0002
    cmp.b 0x1C
    bmi .9031

    sta.b 0x1C
    bra .9031

.8FF5:
    bit.b #0x08
    beq .9016

    jsl update_pos_xy.neg_ay_pos_ax
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bpl .900B

    sta.b 0x1A
.900B:
    lda.w 0x0002
    cmp.b 0x1C
    bmi .9031

    sta.b 0x1C
    bra .9031

.9016:
    jsl update_pos_xy.pos_ay_ax
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bpl .9028

    sta.b 0x1A
.9028:
    lda.w 0x0002
    cmp.b 0x1C
    bpl .9031

    sta.b 0x1C
.9031:
    sep #0x20
    jsl _82808F.80B4
    lda.b 0x0E
    beq .9040

    rtl

.903C:
    jsl 0x84A51A
.9040:
    dec.w 0x0BDD
    jml 0x8283A3
