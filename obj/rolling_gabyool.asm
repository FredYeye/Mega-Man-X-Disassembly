rolling_gabyool:
    ldx.b 0x01
    jsr (.D173,X)
    lda.b 0x0F
    and.b #0x10
    cmp.b #0x10
    beq .D131

    lda.b 0x0F
    and.b #0x22
    cmp.b #0x22
    beq .D13B

    jmp .D145

.D131:
    rep #0x20
    lda.w #0xD3DC
    sta.b 0x20
    jmp .D14C

.D13B:
    rep #0x20
    lda.w #0xD3E6
    sta.b 0x20
    jmp .D14C

.D145:
    rep #0x20
    lda.w #0xD3E1
    sta.b 0x20
.D14C:
    sep #0x20
    lda.b 0x0F
    and.b #0x30
    cmp.b #0x30
    beq .D15A

    jsl 0x849B43
.D15A:
    lda.b 0x0F
    and.b #0x20
    bne .D164

    jsl _849B03
.D164:
    jsl _82808F.80B4
    jsl 0x82806E
    bcc .D172

    jsl 0x828387
.D172:
    rtl

.D173: d16[.D179, .D1C0, .D1D9]

.D179:
    jsl 0x82827D
    lda.b #0x01
    sta.b 0x27
    stz.b 0x28
    lda.b #0x03
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    stz.b 0x29
    stz.b 0x2A
    rep #0x20
    lda.w #0xD3DC
    sta.b 0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcc .D1A6

    lda.w #0x00C0
    sta.b 0x1A
    jmp .D1AB

.D1A6:
    lda.w #0xFF40
    sta.b 0x1A
.D1AB:
    lda.b 0x05
    sta.b 0x34
    sep #0x20
    lda.b #0x28
    sta.b 0x33
    lda.b #0x03
    jsl _848EEA.8F07
    lda.b #0x01
    sta.b 0x0B
    rts

.D1C0:
    dec.b 0x33
    bne .D1D1

    stz.b 0x36
    jsr .D2EA
    cmp.b #0xFF
    bne .D1D8

    lda.b #0x28
    sta.b 0x33
.D1D1:
    jsl update_pos_x
    jsr .D368
.D1D8:
    rts

.D1D9:
    ldx.b 0x02
    jsr (.D1DF,X)
    rts

.D1DF: d16[.D1E9, .D258, .D277, .D296, .D2CD]

.D1E9:
    lda.b 0x36
    and.b #0x03
    cmp.b #0x01
    beq .D200

    lda.b #0x02
    jsl _848EEA.8F07
    stz.b 0x0B
    lda.b #0x02
    sta.b 0x02
    jmp .D20E

.D200:
    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x01
    sta.b 0x0B
    lda.b #0x04
    sta.b 0x02
.D20E:
    lda.b 0x36
    and.b #0x0C
    cmp.b #0x04
    beq .D220

    rep #0x20
    lda.w #0xFF40
    sta.b 0x1A
    jmp .D22A

.D220:
    rep #0x20
    lda.w #0x00C0
    sta.b 0x1A
    jmp .D22A

.D22A:
    sep #0x20
    lda.b 0x39
    beq .D257

    lda.b #0x06
    sta.b 0x02
    lda.b #0x80
    sta.b 0x33
    rep #0x20
    lda.b 0x1A
    bmi .D247

    lda.w #0x0020
    sta.w 0x0004
    jmp .D24D

.D247:
    lda.w #0xFFE0
    sta.w 0x0004
.D24D:
    lda.b 0x37
    clc
    adc.w 0x0004
    sta.b 0x37
    sep #0x20
.D257:
    rts

.D258:
    lda.b 0x0F
    bmi .D26A

    jsl update_pos_x
    jsr .D368
    jsl _848EEA
    jmp .D276

.D26A:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x00
    sta.b 0x02
    lda.b #0x28
    sta.b 0x33
.D276:
    rts

.D277:
    lda.b 0x0F
    bmi .D289

    jsl update_pos_x
    jsr .D368
    jsl _848EEA
    jmp .D295

.D289:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x00
    sta.b 0x02
    lda.b #0x28
    sta.b 0x33
.D295:
    rts

.D296:
    dec.b 0x33
    beq .D2C8

    lda.b 0x0F
    bpl .D2BA

    and.b #0x0F
    cmp.b #0x01
    bne .D2AF

    lda.b #0x02
    jsl _848EEA.8F07
    stz.b 0x0B
    jmp .D2BE

.D2AF:
    lda.b #0x01
    sta.b 0x0B
    jsl _848EEA.8F07
    jmp .D2BE

.D2BA:
    jsl _848EEA
.D2BE:
    jsl update_pos_x
    jsr .D368
    jmp .D2CC

.D2C8:
    lda.b #0x08
    sta.b 0x02
.D2CC:
    rts

.D2CD:
    lda.b 0x0F
    bmi .D2DF

    jsl _848EEA
    jsl update_pos_x
    jsr .D368
    jmp .D2E9

.D2DF:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
    lda.b #0x28
    sta.b 0x33
.D2E9:
    rts

;-----

.D2EA:
    jsr .D328
    bne .D327

    lda.b #0x04
    sta.b 0x01
    lda.b 0x0B
    beq .D302

    lda.b #0x02
    ora.b 0x36
    sta.b 0x36
    stz.b 0x0B
    jmp .D30A

.D302:
    lda.b #0x01
    sta.b 0x0B
    ora.b 0x36
    sta.b 0x36
.D30A:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcc .D31F

    sep #0x20
    lda.b #0x04
    ora.b 0x36
    sta.b 0x36
    jmp .D327

.D31F:
    sep #0x20
    lda.b #0x08
    ora.b 0x36
    sta.b 0x36
.D327:
    rts

;-----

.D328:
    lda.b 0x0B
    bne .D354

    jsl get_rng
    and.b #0x07
    lsr
    beq .D34B

    lsr
    beq .D33B

    lda.b #0xFF
    rts

.D33B:
    lda.b #0x01
    sta.b 0x39
    rep #0x20
    lda.w 0x0BAD
    sta.b 0x37
    sep #0x20
    jmp .D34D

.D34B:
    stz.b 0x39
.D34D:
    lda.b #0x00
    sta.b 0x02
    lda.b #0x00
    rts

.D354:
    jsl get_rng
    and.b #0x07
    beq .D363

    lsr
    lsr
    beq .D34B

    jmp .D33B

.D363:
    stz.b 0x39
    lda.b #0xFF
    rts

;-----

.D368:
    rep #0x20
    lda.b 0x05
    sec
    sbc.b 0x34
    sta.w 0x0000
    lda.w #0x0030
    sta.w 0x0002
    bcs .D38A

    lda.w 0x0000
    eor.w #0xFFFF
    inc
    sta.w 0x0000
    lda.w #0xFFD0
    sta.w 0x0002
.D38A:
    lda.w 0x0000
    cmp.w #0x0030
    bmi .D3AC

    rep #0x20
    lda.b 0x34
    clc
    adc.w 0x0002
    sta.b 0x05
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
.D3AC:
    sep #0x20
    rts