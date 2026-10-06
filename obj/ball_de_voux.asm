ball_de_voux:
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x01
    jsr (.D223,X)
    jsl 0x849B03
    jsl 0x849B43
    beq .D20D

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    bne .D20D

    lda.b #0x01
    jsl 0x84A37F
.D201:
    jsl 0x84A4AB
    lda.b 0x0B
    bne .D21F

.D209:
    jml 0x828398

.D20D:
    lda.b 0x34
    bne .D201

    jsl 0x82806E
    bcs .D21B

    jml 0x8280B4

.D21B:
    lda.b 0x0B
    beq .D209

.D21F:
    jml 0x828387

.D223: d16[.D22B, .D28C, .D34B, .D441]

.D22B:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x06
    sta.b 0x12
    stz.b 0x34
    lda.b #0x01
    sta.b 0x26
    lda.b #0x04
    sta.b 0x27
    lda.b #0x02
    jsl 0x848F07
    lda.b #0xFF
    sta.b 0x2F
    rep #0x20
    lda.w #0xCD4B
    sta.b 0x20
    sep #0x20
    lda.b #0x30
    sta.b 0x1E
    lda.b 0x0B
    beq .D28B

    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    sep #0x20
    lda.b #0x00
    ror
    ror
    tsb.b 0x11
    lda.b 0x0B
    bpl .D28B

    lda.b #0x00
    jsl 0x848F07
    lda.b #0x06
    sta.b 0x01
    stz.b 0x2F
    lda.b #0x01
    sta.b 0x28
    rep #0x20
    lda.w #0xCD55
    sta.b 0x20
    sep #0x20
.D28B:
    rts

.D28C:
    ldx.b 0x02
    jmp (.D291,X)

.D291: d16[.D295, .D2F1]

.D295:
    jsl 0x848EEA
    jsl update_pos_xy.neg_ay
    rep #0x20
    lda.w #0x001C
    cmp.w #0xFB00
    bpl .D2AC

    lda.w #0xFB00
    sta.b 0x1C
.D2AC:
    sep #0x20
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .D2F0

    jsr .D508
    lda.b #0x02
    sta.b 0x02
    rep #0x20
    lda.b 0x1C
    cmp.w #0xFD80
    bpl .D2D2

    lda.w #0x0200
    sta.b 0x1C
    sep #0x20
    stz.b 0x02
    rts

.D2D2:
    sep #0x20
    stz.b 0x2F
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0180
    bcs .D2E4

    lda.w #0xFE80
.D2E4:
    sta.b 0x1A
    stz.b 0x1C
    sep #0x20
    stz.b 0x1E
    lda.b #0x06
    sta.b 0x1F
.D2F0:
    rts

.D2F1:
    lda.b 0x11
    and.b #0x40
    beq .D2FD

    jsl update_pos_xy.neg_ay_ax
    bra .D301

.D2FD:
    jsl update_pos_xy.neg_ay_pos_ax
.D301:
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    beq .D31D

    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
.D31D:
    lda.b 0x2B
    and.b #0x04
    beq .D340

    rep #0x20
    lda.b 0x1A
    sep #0x20
    bne .D33B

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    lda.b #0x01
    jsl 0x848F07
    lda.b #0x80
    trb.b 0x17
.D33B:
    jsl 0x848EEA
    rts

.D340:
    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x30
    sta.b 0x1E
    stz.b 0x02
    rts

.D34B:
    lda.b 0x02
    bne .D38D

    inc.b 0x02
    lda.b 0x11
    asl
    asl
    lda.w 0x86CD6F
    bcs .D35D

    eor.b #0xFF
    inc
.D35D:
    sta.b 0x29
    lda.w 0x86CD76
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcc .D387

    lda.b 0x11
    asl
    asl
    lda.w 0x86CD70
    bcs .D378

    eor.b #0xFF
    inc
.D378:
    sta.b 0x29
    lda.w 0x86CD77
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcs .D38D

.D387:
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
.D38D:
    jsl 0x848EEA
    lda.b 0x17
    bpl .D400

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    and.b #0x0F
    beq .D3C2

    tax
    lda.b 0x11
    asl
    asl
    lda.w 0x86CD62,X
    bcs .D3AC

    eor.b #0xFF
    inc
.D3AC:
    sta.b 0x1B
    lda.w 0x86CD68,X
    sta.b 0x1D
    stz.b 0x1A
    stz.b 0x1C
    jsl 0x82820A
    jsl 0x8491BE
    jsr .D508
.D3C2:
    lda.b 0x0F
    bit.b #0x40
    beq .D3DE

    rep #0x20
    lda.w #0xCD5F
    sta.b 0x20
    sep #0x20
    jsl 0x849B03
    rep #0x20
    lda.w #0xCD4B
    sta.b 0x20
    sep #0x20
.D3DE:
    lda.b 0x0F
    bpl .D400

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    rep #0x20
    lda.w #0xCD55
    sta.b 0x20
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x80
    trb.b 0x17
    lda.b #0x01
    sta.b 0x28
    rts

.D400:
    lda.b 0x0F
    and.b #0x0F
    tax
    lda.b 0x11
    asl
    asl
    lda.w 0x86CD6F,X
    bcs .D411

    eor.b #0xFF
    inc
.D411:
    sta.b 0x29
    lda.w 0x86CD76,X
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x00
    beq .D428

    cmp.b #0x34
    bcs .D440

    cmp.b #0x0D
    bcc .D440

.D428:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x30
    sta.b 0x1E
    lda.b #0x02
    jsl 0x848F07
.D440:
    rts

.D441:
    ldx.b 0x02
    jmp (.D446,X)

.D446: d16[.D44C, .D4E2, .D4ED]

.D44C:
    jsl 0x848EEA
    lda.b 0x17
    bpl .D46D

    lda.b #0x80
    trb.b 0x17
    lda.b 0x11
    asl
    asl
    lda.b 0x0F
    and.b #0x7F
    bcs .D465

    eor.b #0xFF
    inc
.D465:
    sta.b 0x1B
    stz.b 0x1A
    jsl update_pos_x
.D46D:
    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x04
    beq .D4BC

    and.b #0x03
    bne .D498

    lda.b #0x38
    sta.b 0x2A
    lda.b 0x11
    asl
    asl
    lda.b #0x10
    bcs .D489

    lda.b #0xF0
.D489:
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x00
    beq .D498

    cmp.b #0x0E
    beq .D498

    rts

.D498:
    stz.b 0x29
    lda.b #0x10
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcs .D4B2

    lda.b #0x20
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcc .D4B7

.D4B2:
    lda.b #0x01
    sta.b 0x34
    rts

.D4B7:
    lda.b #0x02
    sta.b 0x02
    rts

.D4BC:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
    lda.b #0x03
    sta.b 0x28
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    lda.w #0xCD4B
    sta.b 0x20
    sep #0x20
    lda.b #0x30
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x04
    jsl 0x848F07
    rts

.D4E2:
    lda.b #0x03
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x02
    rts

.D4ED:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .D507

    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    stz.b 0x02
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x80
    trb.b 0x17
.D507:
    rts

;-----

.D508:
    stz.b 0x29
    stz.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcc .D518

    lda.b #0x01
    sta.b 0x34
.D518:
    rts