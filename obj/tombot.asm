tombot:
    ldx.b 0x01
    jsr (.E441,X)
    lda.b 0x27
    beq .E430

    jsl 0x849B43
    beq .E42A

    lda.b 0x27
    and.b #0x7F
    bne .E422

    jsl 0x84A4AB
    lda.b #0x01
    jsl 0x84A37F
    bra .E43C

.E422:
    lda.b #0xF1
    and.b 0x11
    sta.b 0x11
    bra .E430

.E42A:
    lda.b 0x33
    ora.b 0x11
    sta.b 0x11
.E430:
    jsl 0x849B03
    jsl 0x8280B4
    lda.b 0x0E
    bne .E440

.E43C:
    jsl 0x828398
.E440:
    rtl

.E441: d16[.E44D, .E4ED, .E511, .E5FE, .E62E, .E660]

.E44D:
    jsl 0x82827D
    lda.b 0x0B
    cmp.b #0x80
    bne .E459

    stz.b 0x06
.E459:
    lda.b 0x0B
    and.b #0x02
    cmp.b #0x02
    beq .E46E

    lda.b 0x11
    ora.b #0x10
    sta.b 0x11
    and.b #0x0E
    sta.b 0x33
    jmp .E474

.E46E:
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
.E474:
    lda.b 0x0B
    and.b #0x10
    beq .E497

    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcc .E48F

    sep #0x20
    lda.b 0x0B
    ora.b #0x01
    sta.b 0x0B
    jmp .E497

.E48F:
    sep #0x20
    lda.b 0x0B
    ora.b #0x00
    sta.b 0x0B
.E497:
    lda.b 0x0B
    and.b #0x01
    beq .E4A3

    lda.b #0x40
    ora.b 0x11
    sta.b 0x11
.E4A3:
    lda.b #0x01
    sta.b 0x27
    lda.b #0x01
    sta.b 0x28
    lda.b #0x02
    sta.b 0x26
    lda.b #0x06
    sta.b 0x12
    stz.b 0x35
    stz.b 0x37
    stz.b 0x3B
    stz.b 0x39
    rep #0x20
    lda.w #0xD16D
    sta.b 0x20
    lda.w #0x0180
    sta.b 0x1C
    lda.b 0x05
    sta.b 0x3C
    sep #0x20
    lda.b 0x0B
    and.b #0x10
    beq .E4E2

    lda.b #0x02
    sta.b 0x34
    lda.b #0x04
    sta.b 0x01
    stz.b 0x1A
    stz.b 0x1C
    jmp .E4E6

.E4E2:
    lda.b #0x10
    sta.b 0x34
.E4E6:
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.E4ED:
    dec.b 0x34
    beq .E4F8

    jsl update_pos_y
    jmp .E50C

.E4F8:
    lda.b #0x04
    sta.b 0x01
    lda.b #0x00
    sta.b 0x02
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x02
    sta.b 0x34
.E50C:
    jsl _848EEA
    rts

.E511:
    ldx.b 0x02
    jsr (.E517,X)
    rts

.E517: d16[.E51D, .E538, .E5BD]

.E51D:
    dec.b 0x34
    bne .E537

    lda.b #0x02
    sta.b 0x02
    lda.b #0x10
    sta.b 0x34
    lda.b #0x10
    sta.b 0x1F
    lda.b #0x2C
    sta.b 0x35
    lda.b #0x01
    jsl _848EEA.8F07
.E537:
    rts

.E538:
    dec.b 0x35
    bne .E551

    sep #0x20
    lda.b #0x04
    sta.b 0x02
    lda.b #0x10
    sta.b 0x34
    lda.b #0x18
    sta.b 0x1F
    lda.b #0x10
    sta.b 0x1E
    jmp .E5B8

.E551:
    sep #0x20
    dec.b 0x34
    bne .E56C

    lda.b #0x01
    sta.b 0x34
    lda.b #0x08
    sta.b 0x1E
    rep #0x20
    lda.b 0x1C
    cmp.w #0xFF00
    bne .E56C

    sep #0x20
    stz.b 0x1E
.E56C:
    sep #0x20
    lda.b 0x34
    cmp.b #0x01
    beq .E57B

    and.b #0x05
    bne .E57B

    jsr .E772
.E57B:
    sep #0x20
    lda.b 0x0B
    and.b #0x01
    beq .E58E

    rep #0x20
    lda.w #0x0200
    sta.w 0x0000
    jmp .E596

.E58E:
    rep #0x20
    lda.w #0xFE00
    sta.w 0x0000
.E596:
    rep #0x20
    lda.b 0x1A
    cmp.w 0x0000
    bne .E5A3

    sep #0x20
    stz.b 0x1F
.E5A3:
    sep #0x20
    lda.b 0x0B
    and.b #0x01
    bne .E5B2

    jsl update_pos_xy.pos_ay_neg_ax
    jmp .E5B6

.E5B2:
    jsl update_pos_xy.pos_ay_ax
.E5B6:
    sep #0x20
.E5B8:
    jsl _848EEA
    rts

.E5BD:
    dec.b 0x34
    beq .E5D5

    lda.b 0x0B
    and.b #0x01
    bne .E5CE

    jsl update_pos_xy.neg_ay_pos_ax
    jmp .E5FD

.E5CE:
    jsl update_pos_xy.neg_ay_ax
    jmp .E5FD

.E5D5:
    lda.b #0x03
    jsl _848EEA.8F07
    lda.b #0x06
    sta.b 0x01
    lda.b #0x00
    sta.b 0x12
    lda.b #0x10
    ora.b 0x11
    sta.b 0x11
    lda.b #0x01
    sta.b 0x39
    jsr .E6C1
    jsr .E68C
    jsr .E669
    jsr .E7C6
    lda.b #0x07
    sta.b 0x2C
.E5FD:
    rts

.E5FE:
    lda.b 0x37
    beq .E611

    lda.b #0x08
    sta.b 0x01
    lda.b #0x02
    jsl _848EEA.8F07
    stz.b 0x37
    jmp .E62D

.E611:
    dec.b 0x34
    bne .E622

    jsr .E68C
    lda.b 0x37
    bne .E61F

    jsr .E669
.E61F:
    jsr .E7C6
.E622:
    jsl 0x82820A
    jsr .E7A1
    jsl _848EEA
.E62D:
    rts

.E62E:
    jsl _848EEA
    lda.b 0x0F
    cmp.b #0x81
    bne .E65B

    lda.b 0x11
    and.b #0x40
    beq .E647

    lda.b 0x11
    and.b #0xBF
    sta.b 0x11
    jmp .E64D

.E647:
    lda.b 0x11
    ora.b #0x40
    sta.b 0x11
.E64D:
    lda.b #0x03
    jsl _848EEA.8F07
    lda.b #0x06
    sta.b 0x01
    lda.b #0x01
    sta.b 0x34
.E65B:
    jsl 0x82820A
    rts

.E660:
    jsl update_pos_y
    jsl _848EEA
    rts

;-----

.E669:
    rep #0x20
    lda.w 0x86EE3A,X
    bpl .E677

    lsr
    ora.w #0xF000
    jmp .E678

.E677:
    lsr
.E678:
    sta.b 0x1A
    lda.w 0x86EE3C,X
    bpl .E686

    lsr
    ora.w #0xF000
    jmp .E687

.E686:
    lsr
.E687:
    sta.b 0x1C
    sep #0x20
    rts

;-----

.E68C:
    jsl 0x84A07C
    sta.b 0x36
    lda.b 0x36
    sta.b 0x38
    asl
    asl
    tax
    cmp.b #0x40
    bmi .E6B0

    lda.b 0x11
    and.b #0x40
    beq .E6C0

    lda.b #0x02
    jsl _848EEA.8F07
    lda.b #0x01
    sta.b 0x37
    jmp .E6C0

.E6B0:
    lda.b 0x11
    and.b #0x40
    bne .E6C0

    lda.b #0x02
    jsl _848EEA.8F07
    lda.b #0x01
    sta.b 0x37
.E6C0:
    rts

;-----

.E6C1:
    rep #0x10
.E6C3:
    jsl 0x8282D3
    beq .E6CC

    jmp .E76D

.E6CC:
    inc.w 0x0000,X
    lda.b #0x30
    sta.w 0x000A,X
    lda.b 0x33
    ora.b 0x11
    sta.w 0x0011,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x16
    sta.w 0x0016,X
    stz.w 0x0002,X
    lda.b 0x11
    and.b #0x40
    beq .E705

    rep #0x20
    lda.w #0xFFF7
    sta.w 0x0000
    lda.w #0xFFFF
    sta.w 0x0002
    lda.w #0x0080
    sta.w 0x001A,X
    jmp .E719

.E705:
    rep #0x20
    lda.w #0x0009
    sta.w 0x0000
    lda.w #0x0001
    sta.w 0x0002
    lda.w #0xFF80
    sta.w 0x001A,X
.E719:
    sep #0x20
    lda.b 0x39
    bne .E72D

    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0000
    sta.w 0x0005,X
    jmp .E738

.E72D:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0002
    sta.w 0x0005,X
.E738:
    lda.b 0x08
    clc
    adc.w #0x0009
    sta.w 0x0008,X
    stz.w 0x001C,X
    sep #0x20
    lda.b #0x30
    sta.w 0x001E,X
    lda.b 0x39
    beq .E75C

    lda.b #0x06
    sta.w 0x000B,X
    lda.b #0x06
    sta.w 0x0012,X
    jmp .E766

.E75C:
    lda.b #0x05
    sta.w 0x000B,X
    lda.b #0x04
    sta.w 0x0012,X
.E766:
    dec.b 0x39
    bmi .E76D

    jmp .E6C3

.E76D:
    stz.b 0x39
    sep #0x10
    rts

;-----

.E772:
    rep #0x10
    jsl 0x8282D3
    bne .E79E

    inc.w 0x0000,X
    lda.b #0x31
    sta.w 0x000A,X
    lda.b 0x33
    ora.b 0x11
    sta.w 0x0011,X
    stz.w 0x000B,X
    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x000B
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
    sep #0x20
.E79E:
    sep #0x10
    rts

;-----

.E7A1:
    rep #0x20
    lda.w #0x0128
    sta.w 0x0000
    lda.b 0x3C
    sta.w 0x0002
    sep #0x20
    jsl 0x87A3EC
    beq .E7C5

    rep #0x20
    stz.b 0x1A
    lda.w #0x0100
    sta.b 0x1C
    sep #0x20
    lda.b #0x0A
    sta.b 0x01
.E7C5:
    rts

;-----

.E7C6:
    rep #0x20
    tdc
    lsr
    lsr
    lsr
    lsr
    lsr
    clc
    adc.w 0x0B9C
    and.w #0x0007
    clc
    adc.w #0x0020
    sep #0x20
    sta.b 0x34
    rts
