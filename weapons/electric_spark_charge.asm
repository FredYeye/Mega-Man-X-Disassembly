electric_spark_charge:
    ldx.b 0x01
    jsr (.A0E0,X)
    rtl

.A0E0: d16[.A0EC, .A129, .A11B, .A11B, .A11B, .A191]

.A0EC:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x30
    inc.w 0x0C25
    stz.b 0x18
    stz.b 0x12
    stz.b 0x38
    stz.b 0x39
    lda.b 0x0B
    bne .A10E

    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    jsl _839518
.A10E:
    lda.b 0x0B
    beq .A116

    lda.b #0x02
    sta.b 0x02
.A116:
    lda.b #0x47
    sta.b 0x16
    rts

.A11B:
    lda.b #0x02
    sta.b 0x01
    lda.b 0x38
    sta.b 0x02
    lda.b 0x39
    sta.b 0x03
    stz.b 0x30
.A129:
    ldx.b 0x02
    jsr (.A145,X)
    jsl _82808F.80B4
    lda.b 0x02
    sta.b 0x38
    lda.b 0x03
    sta.b 0x39
    lda.b 0x0E
    bne .A142

    lda.b #0x0A
    sta.b 0x01
.A142:
    jmp .A19E

.A145: d16[.A149, .A169]

.A149:
    ldx.b 0x03
    bne .A157

    inc.b 0x03
    stz.b 0x30
    lda.b #0x02
    jsl _848EEA.8F07
.A157:
    lda.b 0x0F
    bpl .A164

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    jmp .A1AF

.A164:
    jsl _848EEA
    rts

.A169:
    ldx.b 0x03
    bne .A188

    inc.b 0x03
    stz.b 0x30
    rep #0x21
    lda.w #0x0800
    bit.b 0x10
    bvs .A17D

    lda.w #0xF800
.A17D:
    sta.b 0x1A
    sep #0x20
    lda.b #0x03
    jsl _848EEA.8F07
    rts

.A188:
    jsl update_pos_x
    jsl _848EEA
    rts

.A191:
    inc.b 0x30
    dec.w 0x0BDD
    dec.w 0x0C25
    jsl _8283A3
    rts

.A19E:
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    asl
    asl
    adc.w #0xC003
    sta.b 0x20
    sep #0x20
    rts

.A1AF:
    jsl _82833E
    bne .A1D8

    inc.w 0x0000,X
    inc.w 0x0BDD
    lda.b #0x15
    sta.w 0x000A,X
    lda.b 0x11
    eor.b #0x40
    sta.w 0x0011,X
    lda.b #0x01
    sta.w 0x000B,X
    rep #0x21
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.A1D8:
    sep #0x30
    rts
