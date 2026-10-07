batton_bone: ;also batton m-501
    ldx.b 0x01
    jsr (.A105,X)
    lda.b 0x27
    beq .A0F6

    jsl 0x849B43
    beq .A0B7

    lda.b 0x27
    and.b #0x7F
    bne .A0AF

    jsl 0x84A4AB
    jsl 0x828387
    sep #0x10
    lda.b 0x0B
    beq .A0A7

    lda.b #0x01
    jmp .A0A9

.A0A7:
    lda.b #0x06
.A0A9:
    jsl 0x84A37F
    bra .A104

.A0AF:
    lda.b #0xF1
    and.b 0x11
    sta.b 0x11
    bra .A0BD

.A0B7:
    lda.b 0x36
    ora.b 0x11
    sta.b 0x11
.A0BD:
    lda.b 0x35
    beq .A0F6

    lda.w 0x0BCF
    and.b #0x7F
    sta.b 0x35
    beq .A0D7

    jsl _849B03
    lda.w 0x0BCF
    and.b #0x7F
    cmp.b 0x35
    bpl .A0F6

.A0D7:
    lda.b 0x0F
    and.b #0x02
    beq .A0E3

    lda.b #0x02
    jsl _848EEA.8F07
.A0E3:
    lda.b #0x06
    sta.b 0x01
    lda.b #0x01
    sta.b 0x37
    stz.b 0x02
    rep #0x20
    lda.w #0x0280
    sta.b 0x1C
    sep #0x20
.A0F6:
    jsl _82808F.80B4
    jsl 0x82806E
    bcc .A104

    jsl 0x828387
.A104:
    rtl

.A105: d16[.A10D, .A189, .A1AD, .A2BE]

.A10D:
    lda.b 0x0B
    and.b #0x01
    bne .A11C

    jsl 0x82827D
    stz.b 0x28
    jmp .A136

.A11C:
    lda.b #0x4B
    sta.b 0x16
    lda.l 0x7F824A
    sta.b 0x18
    lda.l 0x7F834A
    sta.b 0x11
    stz.b 0x30
    lda.b #0x02
    sta.b 0x01
    lda.b #0x01
    sta.b 0x28
.A136:
    lda.b 0x11
    and.b #0x0E
    sta.b 0x36
    lda.b #0x02
    sta.b 0x27
    lda.b #0xFF
    sta.b 0x35
    lda.b #0x01
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    stz.b 0x3B
    lda.b #0x08
    sta.b 0x3A
    lda.b #0x01
    sta.b 0x2F
    lda.b #0x01
    sta.b 0x37
    jsr .A3AE
    rep #0x20
    lda.w #0x0001
    sta.b 0x33
    lda.b 0x05
    sta.b 0x3C
    lda.b 0x08
    sta.b 0x3E
    lda.b 0x0B
    and.w #0x000F
    bne .A17B

    lda.w #0xCEFE
    sta.b 0x20
    jmp .A180

.A17B:
    lda.w #0xCF12
    sta.b 0x20
.A180:
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.A189:
    ldx.b #0x02
    ldy.b #0x00
    jsl 0x82FC41
    bne .A1A8

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    lda.b 0x0B
    and.b #0x01
    bne .A1A8

    lda.b #0x01
    jsl _848EEA.8F07
    jmp .A1AC

.A1A8:
    jsl _848EEA
.A1AC:
    rts

.A1AD:
    ldx.b 0x02
    jsr (.A1B3,X)
    rts

.A1B3: d16[.A1B7, .A207]

.A1B7:
    lda.b 0x0F
    bpl .A202

    lda.b 0x3B
    bne .A1D0

    lda.b 0x0B
    and.b #0x01
    beq .A1D0

    lda.b #0x01
    sta.b 0x3B
    jsl _848EEA.8F07
    jmp .A202

.A1D0:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x01
    sta.b 0x28
    rep #0x20
    lda.w #0x0258
    sta.b 0x33
    lda.b 0x0B
    and.w #0x000F
    bne .A1EE

    lda.w #0xCF08
    sta.b 0x20
    jmp .A1F3

.A1EE:
    lda.w #0xCF1C
    sta.b 0x20
.A1F3:
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x02
    jsl _848EEA.8F07
    jmp .A206

.A202:
    jsl _848EEA
.A206:
    rts

.A207:
    lda.b 0x0B
    and.b #0x01
    bne .A210

    jsr .A452
.A210:
    rep #0x20
    lda.w #0x0128
    sta.w 0x0000
    lda.b 0x3C
    sta.w 0x0002
    lda.w #0x00C0
    sta.w 0x0004
    lda.b 0x3E
    sta.w 0x0008
    sep #0x20
    jsl .A3EC
    jsr .A438
    beq .A238

    rep #0x20
    jmp .A2BB

.A238:
    rep #0x20
    dec.b 0x33
    sep #0x20
    beq .A299

    dec.b 0x37
    bne .A28E

    lda.b 0x38
    sta.b 0x37
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    jsl 0x84A07C
    sta.b 0x39
    asl
    asl
    tax
    cmp.b #0x40
    bmi .A266

    lda.b 0x11
    and.b #0xBF
    sta.b 0x11
    jmp .A26C

.A266:
    lda.b 0x11
    ora.b #0x40
    sta.b 0x11
.A26C:
    rep #0x20
    lda.w 0x86EE3A,X
    bpl .A27A

    lsr
    ora.w #0xF000
    jmp .A27B

.A27A:
    lsr
.A27B:
    sta.b 0x1A
    lda.w 0x86EE3C,X
    bpl .A289

    lsr
    ora.w #0xF000
    jmp .A28A

.A289:
    lsr
.A28A:
    sta.b 0x1C
    sep #0x20
.A28E:
    jsl 0x82820A
    jsl _848EEA
    jmp .A2AA

.A299:
    rep #0x20
    stz.b 0x1A
    lda.w #0x0280
    sta.b 0x1C
    sep #0x20
    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
.A2AA:
    lda.b 0x0B
    and.b #0x01
    beq .A2BB

    dec.b 0x3A
    bne .A2BB

    lda.b #0x08
    sta.b 0x3A
    jsr .A3C8
.A2BB:
    sep #0x20
    rts

.A2BE:
    ldx.b 0x02
    jsr (.A2C4,X)
    rts

.A2C4: d16[.A2CA, .A359, .A38B]

.A2CA:
    lda.b 0x0B
    and.b #0x01
    bne .A2D3

    jsr .A452
.A2D3:
    jsl update_pos_y
    lda.b 0x0B
    and.b #0x01
    beq .A2E8

    dec.b 0x3A
    bne .A2E8

    lda.b #0x08
    sta.b 0x3A
    jsr .A3C8
.A2E8:
    lda.b 0x3B
    bmi .A354

    lda.b 0x03
    bne .A328

    lda.b #0xF0
    sta.b 0x2A
    stz.b 0x29
    jsl _8490A0
    cmp.b #0x00
    bne .A354

    lda.b #0x10
    sta.b 0x2A
    jsl _8490A0
    cmp.b #0x00
    bne .A354

    lda.b #0x10
    sta.b 0x29
    stz.b 0x2A
    jsl _8490A0
    cmp.b #0x00
    bne .A354

    lda.b #0xF0
    sta.b 0x29
    jsl _8490A0
    cmp.b #0x00
    bne .A354

    lda.b #0x01
    sta.b 0x03
.A328:
    jsl _8491AD.91BE
    lda.b 0x2B
    cmp.b #0x08
    bne .A354

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    lda.b 0x0B
    and.b #0x01
    bne .A349

    lda.b #0x03
    jsl _848EEA.8F07
    stz.b 0x28
    jmp .A358

.A349:
    lda.b #0x01
    sta.b 0x28
    jsl _848EEA.8F07
    jmp .A358

.A354:
    jsl _848EEA
.A358:
    rts

.A359:
    lda.b 0x0F
    bpl .A386

    lda.b #0x04
    sta.b 0x02
    rep #0x20
    lda.w #0x003C
    sta.b 0x33
    lda.b 0x0B
    and.w #0x000F
    bne .A377

    lda.w #0xCEFE
    sta.b 0x20
    jmp .A384

.A377:
    lda.w #0xCF12
    sta.b 0x20
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
.A384:
    sep #0x20
.A386:
    jsl _848EEA
    rts

.A38B:
    rep #0x20
    dec.b 0x33
    sep #0x20
    bne .A3A9

    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x01
    sta.b 0x37
    jsr .A3AE
    jmp .A3AD

.A3A9:
    jsl _848EEA
.A3AD:
    rts

;-----

.A3AE:
    rep #0x20
    tdc
    lsr
    lsr
    lsr
    lsr
    lsr
    clc
    adc.w 0x0B9C
    and.w #0x0003
    clc
    adc.w #0x0014
    sep #0x20
    sta.b 0x38
    stz.b 0x39
    rts

;-----

.A3C8:
    rep #0x10
    jsl 0x8282D3
    bne .A3E9

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x0C
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.A3E9:
    sep #0x30
    rts

;-----

.A3EC:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0002
    bcc .A3FE

    cmp.w 0x0000
    bcs .A433

    jmp .A409

.A3FE:
    rep #0x20
    eor.w #0xFFFF
    inc
    cmp.w 0x0000
    bcs .A433

.A409:
    sep #0x20
    lda.b 0x0B
    and.b #0x80
    beq .A42E

    rep #0x20
    lda.b 0x08
    sec
    sbc.w 0x0008
    bcc .A423

    cmp.w 0x0004
    bcs .A433

    jmp .A42E

.A423:
    rep #0x20
    eor.w #0xFFFF
    inc
    cmp.w 0x0004
    bcs .A433

.A42E:
    sep #0x20
    lda.b #0x00
    rtl

.A433:
    sep #0x20
    lda.b #0x01
    rtl

;-----

.A438:
    beq .A451

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    lda.b #0x80
    sta.b 0x3B
    rep #0x20
    stz.b 0x1A
    lda.w #0x0280
    sta.b 0x1C
    sep #0x20
    lda.b #0x01
.A451:
    rts

;-----

.A452:
    lda.b 0x0F
    cmp.b #0x01
    bne .A45E

    lda.b #0x43
    jsl _80888B
.A45E:
    rts
