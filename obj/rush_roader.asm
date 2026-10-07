rush_roader:
    ldx.b 0x01
    jsr (.8F3C,X)
    jsl 0x848FCA
    lda.b 0x11
    and.b #0x3F
    ora.b 0x37
    sta.b 0x11
    rtl

.8F3C: d16[.8F42, .8F91, .92D4]

.8F42:
    jsl 0x82827D
    lda.b #0x07
    sta.b 0x10
    lda.b #0x00
    ldx.b 0x0B
    beq .8F52

    lda.b #0x08
.8F52:
    sta.b 0x18
    sta.b 0x2F
    lda.b #0x04
    sta.b 0x12
    stz.b 0x33
    stz.b 0x2B
    stz.b 0x36
    lda.b #0x02
    sta.b 0x26
    lda.b #0x06
    sta.b 0x27
    rep #0x20
    ldx.b #0x00
    lda.w 0x0BAD
    cmp.b 0x05
    bmi .8F75

    ldx.b #0x40
.8F75:
    stx.b 0x37
    lda.w #0x01C0
    bit.b 0x36
    bvs .8F81

    lda.w #0xFE40
.8F81:
    sta.b 0x1A
    lda.w #0xAA2D
    sta.b 0x31
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.8F91:
    ldx.b 0x02
    jsr (.9011,X)
    jsl _82808F.80B4
    jsl 0x82806E
    bcc .8FA5

    jsl 0x828387
    rts

.8FA5:
    rep #0x10
    ldx.w #0xC8A6
    stx.b 0x20
    jsl _849B03
    lda.b 0x36
    bne .8FE9

    rep #0x10
    ldx.w #0xC8AA
    stx.b 0x20
    jsl 0x849B43
    beq .8FD6

    lda.b 0x27
    and.b #0x7F
    beq .9006

    lda.b #0x0E
    trb.b 0x11
    lda.b #0x02
    sta.b 0x01
    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
    rts

.8FD6:
    lda.b 0x2B
    bit.b #0x04
    beq .8FE9

    lda.b 0x2E
    cmp.b #0x3E
    beq .8FE6

    cmp.b #0x3F
    bne .8FE9

.8FE6:
    jmp .92F6

.8FE9:
    rep #0x10
    ldx.w #0xC8AE
    stx.b 0x20
    lda.l 0x7F8307
    sta.b 0x11
    jsl 0x849B43
    beq .900C

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    bne .900C

.9006:
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
.900C:
    jsl _8491AD.91BE
    rts

.9011: d16[.901D, .90FB, .918E, .91D0, .91FB, .927B]

.901D:
    ldx.b 0x03
    jmp (.9022,X)

.9022: d16[.9028, .904D, .90B2]

.9028:
    lda.b #0x02
    sta.b 0x03
    jsl 0x849ACD
    tax
    lda.w 0x00C8C4,X
    sta.b 0x1F
    stz.b 0x1E
    stz.b 0x1A
    stz.b 0x1B
    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0xFF
    sta.b 0x35
    jmp .9383

.904D:
    lda.b 0x2B
    bit.b #0x04
    bne .9056

    jmp .92EF

.9056:
    bit.b #0x03
    beq .905D

    jmp .92FD

.905D:
    bit.b 0x37
    bvs .9067

    jsl update_pos_xy.neg_ay_ax
    bra .906B

.9067:
    jsl update_pos_xy.neg_ay_pos_ax
.906B:
    lda.b 0x33
    beq .907A

    jsl 0x849AAB
    cmp.b #0x04
    bne .907A

    jmp .92E8

.907A:
    jsr .9383
    jsl 0x849ACD
    asl
    tax
    rep #0x20
    lda.w 0x00C8B8,X
    bit.b 0x36
    bvs .9096

    eor.w #0xFFFF
    inc
    cmp.b 0x1A
    bmi .90A3

    bra .909A

.9096:
    cmp.b 0x1A
    bpl .90A3

.909A:
    sta.b 0x1A
    sep #0x20
    lda.b #0x04
    sta.b 0x03
    rts

.90A3:
    sep #0x20
    jsr .930B
    bne .90AD

    jmp .92FD

.90AD:
    jsl _848EEA
    rts

.90B2:
    lda.b 0x2B
    bit.b #0x04
    bne .90BB

    jmp .92EF

.90BB:
    bit.b #0x03
    beq .90C2

    jmp .9304

.90C2:
    lda.b 0x33
    beq .90D1

    jsl 0x849AAB
    cmp.b #0x04
    bne .90D1

    jmp .92E8

.90D1:
    jsr .9338
    rep #0x20
    ldx.b #0x00
    lda.w 0x0BAD
    cmp.b 0x05
    bpl .90E1

    ldx.b #0x40
.90E1:
    cpx.b 0x37
    sep #0x20
    bne .90EA

    jmp .92FD

.90EA:
    jsr .930B
    bne .90F2

    jmp .92FD

.90F2:
    jsl update_pos_x
    jsl _848EEA
    rts

.90FB:
    ldx.b 0x03
    jmp (.9100,X)

.9100: d16[.9106, .9138, .9176]

.9106:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x33
    rep #0x30
    ldx.w #0x01C0
    bit.b 0x36
    bvs .9118

    ldx.w #0xFE40
.9118:
    lda.b 0x1A
    bpl .9120

    eor.w #0xFFFF
    inc
.9120:
    cmp.w #0x01C0
    bmi .9127

    stx.b 0x1A
.9127:
    stz.b 0x1C
    sep #0x30
    lda.b #0x08
    sta.b 0x1F
    stz.b 0x1E
    lda.b #0x01
    jsl _848EEA.8F07
    rts

.9138:
    lda.b 0x2B
    bit.b #0x04
    bne .9141

    jmp .92EF

.9141:
    bit.b #0x03
    bne .9164

    bit.b 0x37
    bvc .914F

    jsl update_pos_xy.neg_ay_ax
    bra .9153

.914F:
    jsl update_pos_xy.neg_ay_pos_ax
.9153:
    rep #0x20
    lda.b 0x1A
    bpl .915D

    eor.w #0xFFFF
    inc
.915D:
    cmp.w #0x0040
    sep #0x20
    bpl .916D

.9164:
    lda.b #0x04
    sta.b 0x03
    stz.b 0x1A
    stz.b 0x1B
    rts

.916D:
    lda.b 0x0F
    bne .9175

    jsl _848EEA
.9175:
    rts

.9176:
    lda.b 0x0F
    bpl .9189

    lda.b 0x37
    eor.b #0x40
    sta.b 0x37
    lda.b #0x00
    jsl _848EEA.8F07
    jmp .92E3

.9189:
    jsl _848EEA
    rts

.918E:
    ldx.b 0x03
    bne .91A8

    inc.b 0x03
    dec.b 0x2F
    stz.b 0x33
    rep #0x20
    lda.w #0x0300
    sta.b 0x1C
    sep #0x20
    stz.b 0x1F
    lda.b #0x40
    sta.b 0x1E
    rts

.91A8:
    lda.b 0x2B
    bit.b #0x04
    beq .91C7

    rep #0x20
    lda.b 0x1C
    bpl .91B8

    eor.w #0xFFFF
    inc
.91B8:
    lsr
    sta.b 0x1C
    cmp.w #0x0100
    sep #0x20
    bpl .91C7

    stz.b 0x2F
    jmp .92E3

.91C7:
    jsl update_pos_xy.neg_ay_ax
    jsl _848EEA
    rts

.91D0:
    ldx.b 0x03
    bne .91E7

    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    stz.b 0x1F
    lda.b #0x40
    sta.b 0x1E
    dec.b 0x2F
    inc.b 0x03
    rts

.91E7:
    lda.b 0x2B
    bit.b #0x04
    beq .91F2

    stz.b 0x2F
    jmp .92E3

.91F2:
    jsl update_pos_xy.neg_ay_ax
    jsl _848EEA
    rts

.91FB:
    ldx.b 0x03
    jmp (.9200,X)

.9200: d16[.9206, .922F, .9241]

.9206:
    lda.b #0x04
    sta.b 0x03
    stz.b 0x37
    inc.b 0x36
    lda.b 0x2B
    bit.b #0x04
    bne .9228

    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    stz.b 0x1F
    lda.b #0x40
    sta.b 0x1E
    lda.b #0x02
    sta.b 0x03
    sta.b 0x2F
.9228:
    lda.b #0x02
    jsl _848EEA.8F07
    rts

.922F:
    lda.b 0x2B
    bit.b #0x04
    beq .923C

    lda.b #0x04
    sta.b 0x03
    stz.b 0x2F
    rts

.923C:
    jsl update_pos_xy.neg_ay_ax
    rts

.9241:
    lda.b 0x2B
    bit.b #0x04
    bne .925C

    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    stz.b 0x1F
    lda.b #0x40
    sta.b 0x1E
    lda.b #0x02
    sta.b 0x03
    sta.b 0x2F
    rts

.925C:
    lda.b 0x0F
    and.b #0x40
    sta.b 0x37
    rep #0x20
    lda.w #0x0155
    bit.b 0x36
    bvs .926E

    lda.w #0xFEAB
.926E:
    sta.b 0x1A
    sep #0x20
    jsl update_pos_x
    jsl _848EEA
    rts

.927B:
    ldx.b 0x03
    bne .929F

    inc.b 0x03
    dec.b 0x2F
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    bpl .928E

    sec
.928E:
    ror
    sta.b 0x1A
    lda.w #0x0300
    sta.b 0x1C
    sep #0x20
    stz.b 0x1F
    lda.b #0x40
    sta.b 0x1E
    rts

.929F:
    lda.b 0x2B
    bit.b #0x04
    beq .92CB

    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    cmp.w #0x0100
    bpl .92C3

    stz.b 0x1C
    stz.b 0x1A
    sep #0x20
    stz.b 0x1E
    lda.b #0x04
    sta.b 0x1F
    stz.b 0x2F
    jmp .92E3

.92C3:
    sec
    sbc.w #0x0080
    sta.b 0x1C
    sep #0x20
.92CB:
    jsl update_pos_xy.neg_ay_ax
    jsl _848EEA
    rts

.92D4:
    lda.b #0x00
    jsl 0x84A37F
    jsl 0x84A4AB
    jsl 0x828387
    rts

.92E3:
    stz.b 0x02
    stz.b 0x03
    rts

.92E8:
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rts

.92EF:
    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    rts

.92F6:
    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
    rts

.92FD:
    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    rts

.9304:
    lda.b #0x0A
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.930B:
    lda.b #0x20
    bit.b 0x37
    bvs .9313

    lda.b #0xE0
.9313:
    sta.b 0x29
    lda.b #0x10
    sta.b 0x2A
    jsl _8490A0
    cmp.b #0x00
    bne .9337

    lda.b #0x20
    sta.b 0x2A
    jsl _8490A0
    cmp.b #0x00
    bne .9337

    lda.b #0x30
    sta.b 0x2A
    jsl _8490A0
    cmp.b #0x00
.9337:
    rts

;-----

.9338:
    jsl 0x849ACD
    tax
    sta.b 0x34
    cpx.b 0x35
    beq .937E

    rep #0x20
    cpx.b #0x04
    bpl .936E

    and.w #0x00FF
    asl
    tax
    lda.w 0x00C8B8,X
    bit.b 0x36
    bvs .9359

    eor.w #0xFFFF
    inc
.9359:
    ldx.b 0x34
    ldy.w 0x00C8CA,X
    bmi .937A

    sta.b 0x1A
    sep #0x20
    lda.b #0x03
    sta.b 0x33
    jsl _848EEA.8F07
    bra .937E

.936E:
    stz.b 0x33
    lda.w #0x01C0
    bit.b 0x36
    bvs .937A

    lda.w #0xFE40
.937A:
    sta.b 0x1A
    sep #0x20
.937E:
    lda.b 0x34
    sta.b 0x35
    rts

;-----

.9383:
    jsl 0x849ACD
    sta.b 0x34
    cmp.b 0x35
    beq .939F

    stz.b 0x33
    cmp.b #0x04
    bpl .939F

    bit.b #0x01
    beq .939F

    lda.b #0x03
    sta.b 0x33
    jsl _848EEA.8F07
.939F:
    lda.b 0x34
    sta.b 0x35
    rts
