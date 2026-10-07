wolf_sigma_claw:
    ldx.b 0x01
    jmp (.E544,X)

.E544: d16[.E550, .E598, .E598, .E5F8, .E716, .E774]

.E550:
    lda.b #0x2D
    sta.b 0x11
    stz.b 0x18
    rep #0x20
    lda.b 0x0A
    asl
    lda.w #0x002A
    ldx.b #0x0C
    bcs .E567

    lda.w #0x00D6
    ldx.b #0x00
.E567:
    sta.b 0x05
    sta.b 0x35
    stx.b 0x33
    lda.w #0x0070
    sta.b 0x08
    sep #0x20
    stz.b 0x37
    stz.b 0x2C
    lda.b #0x3E
    sta.b 0x16
    lda.b #0x04
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.b 0x12
    stz.b 0x04
    lda.b #0x08
    sta.b 0x27
    sta.b 0x26
    sta.b 0x30
    jml 0x8280B4

.E598:
    lda.w 0x0B9C
    and.b #0x01
    bne .E5A9

    lda.b 0x0B
    bpl .E5A7

    dec.b 0x37
    bra .E5A9

.E5A7:
    inc.b 0x37
.E5A9:
    lda.b #0xE0
    trb.b 0x37
    jsr .E841
    rep #0x20
    lda.w 0x0004
    sta.b 0x05
    lda.w 0x0006
    sta.b 0x08
    sep #0x20
    lda.b 0x0B
    bpl .E5D0

    lda.w 0x1F41
    beq .E5DE

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    jmp .E807

.E5D0:
    lda.w 0x1F40
    beq .E5DE

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    jmp .E807

.E5DE:
    lda.w 0x1F43
    beq .E5F5

    jsl get_rng
    cmp.b #0x3A
    beq .E5EF

    cmp.b #0x7F
    bne .E5F5

.E5EF:
    lda.b #0x08
    sta.b 0x01
    stz.b 0x02
.E5F5:
    jmp .E807

.E5F8:
    ldx.b 0x02
    jmp (.E5FD,X)

.E5FD: d16[.E60B, .E618, .E663, .E676, .E681, .E6DA, .E6F2]

.E60B:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x04
    jsl _848EEA.8F07
    jmp .E807

.E618:
    jsl _848EEA
    lda.b 0x0F
    bpl .E660

    lda.b #0x04
    sta.b 0x02
    jsl 0x84A07C
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    asl
    sta.b 0x1A
    lda.w 0x00EE3C,X
    asl
    sta.b 0x1C
    lda.w 0x0BAD
    sta.b 0x39
    sta.w 0x0004
    lda.w 0x0BB0
    sta.b 0x3B
    sta.w 0x0006
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    jsl _80CEAE
    lda.w 0x0000
    lsr
    lsr
    sep #0x20
    sta.b 0x38
.E660:
    jmp .E807

.E663:
    jsl 0x82820A
    dec.b 0x38
    bne .E673

    lda.b #0x06
    sta.b 0x02
    lda.b #0x3C
    sta.b 0x38
.E673:
    jmp .E807

.E676:
    dec.b 0x38
    bne .E67E

    lda.b #0x08
    sta.b 0x02
.E67E:
    jmp .E807

.E681:
    jsr .E841
    rep #0x20
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    sep #0x20
    jsl 0x84A097
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    sta.b 0x1A
    lda.w 0x00EE3C,X
    sta.b 0x1C
    jsl 0x82820A
    lda.b 0x08
    sec
    sbc.w 0x0006
    bcs .E6B5

    eor.w #0xFFFF
    inc
.E6B5:
    cmp.w #0x0002
    bcs .E6D7

    lda.b 0x05
    sec
    sbc.w 0x0004
    bcs .E6C6

    eor.w #0xFFFF
    inc
.E6C6:
    cmp.w #0x0002
    sep #0x20
    bcs .E713

    lda.b #0x0A
    sta.b 0x02
    lda.b #0x05
    jsl _848EEA.8F07
.E6D7:
    jmp .E807

.E6DA:
    jsl _848EEA
    lda.b 0x0F
    bpl .E6EF

    lda.b #0x0A
    jsl _848EEA.8F07
    lda.b #0x0C
    sta.b 0x02
    jsr .E880
.E6EF:
    jmp .E807

.E6F2:
    jsl _848EEA
    lda.b 0x0F
    bpl .E713

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    lda.b #0x04
    jsl _848EEA.8F07
    lda.b 0x0B
    bpl .E710

    stz.w 0x1F41
    jmp .E807

.E710:
    stz.w 0x1F40
.E713:
    jmp .E807

.E716:
    ldx.b 0x02
    jmp (.E71B,X)

.E71B: d16[.E723, .E730, .E745, .E75D]

.E723:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x04
    jsl _848EEA.8F07
    jmp .E807

.E730:
    jsl _848EEA
    lda.b 0x0F
    bpl .E742

    lda.b #0x04
    sta.b 0x02
    lda.b #0x05
    jsl _848EEA.8F07
.E742:
    jmp .E807

.E745:
    jsl _848EEA
    lda.b 0x0F
    bpl .E75A

    lda.b #0x06
    sta.b 0x02
    lda.b #0x0A
    jsl _848EEA.8F07
    jsr .E880
.E75A:
    jmp .E807

.E75D:
    jsl _848EEA
    lda.b 0x0F
    bpl .E771

    lda.b #0x04
    jsl _848EEA.8F07
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
.E771:
    jmp .E807

.E774:
    ldx.b 0x02
    jmp (.E779,X)

.E779: d16[.E781, .E79E, .E7C2, .E7DC]

.E781:
    lda.b #0x02
    sta.b 0x02
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    lda.w #0xD85C
    sta.b 0x20
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
    jml 0x8280B4

.E79E:
    jsl update_pos_xy.neg_ay
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x04
    beq .E7BE

    lda.b #0x04
    sta.b 0x02
    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    lsr
    lsr
    sta.b 0x1C
    sep #0x20
.E7BE:
    jml 0x8280B4

.E7C2:
    jsl update_pos_xy.neg_ay
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x04
    beq .E7D8

    lda.b #0x06
    sta.b 0x02
    lda.b #0x78
    sta.b 0x38
.E7D8:
    jml 0x8280B4

.E7DC:
    dec.b 0x38
    beq .E803

    rep #0x20
    lda.w #0xFFF0
    sta.w 0x0000
    sta.w 0x0002
    lda.w #0x001F
    sta.w 0x0004
    sta.w 0x0006
    sep #0x20
    lda.b #0x07
    sta.w 0x0008
    jsl 0x84A4C6
    jml 0x8280B4

.E803:
    jml 0x828398

.E807:
    rep #0x20
    lda.w #0xD85C
    sta.b 0x20
    jsl 0x84AB6E
    lda.w #0xD86A
    sta.b 0x20
    jsl 0x84AB43
    lda.w #0xD866
    sta.b 0x20
    sep #0x20
    lda.w 0x1F3F
    bmi .E82F

    jsl _849B03
    jml 0x8280B4

.E82F:
    lda.b #0x0A
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    lda.b #0x04
    jsl _848EEA.8F07
    jml 0x8280B4

;-----

.E841:
    lda.b 0x37
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EEBA,X
    asl
    asl
    asl
    xba
    bit.w #0x0080
    beq .E859

    ora.w #0xFF00
    bra .E85C

.E859:
    and.w #0x00FF
.E85C:
    clc
    adc.b 0x35
    sta.w 0x0004
    lda.w 0x00EEBC,X
    asl
    asl
    asl
    xba
    bit.w #0x0080
    beq .E873

    ora.w #0xFF00
    bra .E876

.E873:
    and.w #0x00FF
.E876:
    clc
    adc.w #0x0070
    sta.w 0x0006
    sep #0x20
    rts

;-----

.E880:
    jsl 0x828358
    bne .E89B

    inc.w 0x0000,X
    lda.b #0x30
    sta.w 0x000A,X
    rep #0x20
    lda.w #0x0070
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
.E89B:
    sep #0x30
    rts
