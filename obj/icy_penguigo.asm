icy_penguigo:
    ldx.b 0x01
    jmp (.B511,X)

.B511: d16[.B519, .B577, .B61F, .BB4D]

.B519:
    lda.b 0x02
    bne .B53C

    jsl 0x84AACA
    beq .B527

    jml 0x828398

.B527:
    jsl 0x849FE6
    inc.b 0x02
    lda.b #0x3C
    sta.b 0x34
    lda.w 0x1F26
    beq .B53C

    lda.b #0x2E
    jsl _80878B
.B53C:
    dec.b 0x34
    beq .B541

    rtl

.B541:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x04
    sta.b 0x12
    stz.b 0x35
    stz.b 0x30
    stz.b 0x39
    lda.b #0x06
    sta.b 0x26
    rep #0x20
    lda.w #0xC430
    sta.b 0x20
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x07
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
    rtl

.B577:
    ldx.b 0x02
    jsr (.B580,X)
    jml 0x8280B4

.B580: d16[.B58A, .B5A3, .B5C0, .B5E5, .B614]

.B58A:
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .B5A2

    lda.b #0x02
    sta.b 0x02
    lda.b #0x08
    jsl _848EEA.8F07
.B5A2:
    rts

.B5A3:
    jsl _848EEA
    lda.b 0x0F
    bpl .B5BF

    lda.b #0x04
    sta.b 0x02
    lda.b #0x10
    jsl _848EEA.8F07
    rep #0x20
    tdc
    sta.w 0x1F0E
    sep #0x20
    stz.b 0x27
.B5BF:
    rts

.B5C0:
    jsl _848EEA
    lda.b 0x0F
    bpl .B5E4

    lda.b #0x06
    sta.b 0x02
    jsl 0x8282B9
    bne .B5E2

    inc.w 0x0000,X
    lda.b #0x12
    sta.w 0x000A,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    stx.b 0x0C
.B5E2:
    sep #0x30
.B5E4:
    rts

.B5E5:
    lda.w 0x0B9C
    lsr
    bcc .B613

    lda.b #0x0C
    jsl _80888B.88B6
    lda.b 0x27
    inc
    ora.b #0x80
    sta.b 0x27
    and.b #0x7F
    cmp.b #0x20
    bcc .B613

    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x08
    sta.b 0x02
    lda.w 0x1F26
    beq .B613

    lda.b #0x1E
    jsl _80878B
.B613:
    rts

.B614:
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    jsl 0x849FFE
    rts

.B61F:
    lda.b 0x33
    tsb.b 0x11
    rep #0x20
    lda.w #0xC430
    sta.b 0x20
    sep #0x20
    ldx.b 0x02
    jsr (.B6E9,X)
    lda.b #0x09
    ldx.b 0x35
    beq .B639

    lda.b #0x05
.B639:
    sta.b 0x28
    lda.b 0x39
    beq .B641

    stz.b 0x28
.B641:
    lda.b 0x17
    and.b #0x7F
    tax
    lda.w 0xC4AE,X
    asl
    asl
    rep #0x20
    and.w #0x00FF
    clc
    adc.w #0xC43A
    sta.b 0x20
    sep #0x20
    jsl 0x849B43
    beq .B6BA

    lda.b 0x35
    bne .B6BA

    lda.b #0x46
    sta.b 0x35
    lda.b 0x38
    beq .B679

    lda.b #0x40
    trb.b 0x11
    lda.w 0x1F1B
    tsb.b 0x11
    lda.b #0x0A
    sta.b 0x02
    stz.b 0x03
.B679:
    lda.w 0x1F1D
    cmp.b #0x0A
    beq .B684

    cmp.b #0x13
    bne .B694

.B684:
    lda.b #0x0A
    sta.b 0x02
    lda.b #0x02
    sta.b 0x03
    lda.b #0x4A
    jsl _80888B
    bra .B69A

.B694:
    lda.b #0x13
    jsl _80888B
.B69A:
    lda.b 0x27
    and.b #0x7F
    bne .B6BA

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    lda.b #0x01
    sta.w 0x0BD8
    sta.w 0x1F0C
    lda.b #0x04
    jsl _848EEA.8F07
    jml 0x8280B4

.B6BA:
    lda.b 0x35
    beq .B6D6

    dec.b 0x35
    lda.b 0x02
    cmp.b #0x0A
    bne .B6CC

    lda.b 0x03
    cmp.b #0x08
    bcs .B6D6

.B6CC:
    lda.b 0x35
    lsr
    lsr
    bcc .B6D6

    lda.b #0x0E
    trb.b 0x11
.B6D6:
    jsl 0x849B03
    lda.w 0x0BCF
    and.b #0x7F
    bne .B6E5

    lda.b #0x01
    sta.b 0x30
.B6E5:
    jml 0x8280B4

.B6E9: d16[.B6F5, .B78C, .B884, .B931, .B9F2, .BAB5]

.B6F5:
    ldx.b 0x03
    jmp (.B6FA,X)

.B6FA: d16[.B700, .B717, .B77C]

.B700:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x04
    sta.b 0x36
    jsl 0x84AC92
    lda.b #0x01
    sta.b 0x38
    rts

.B717:
    jsl _848EEA
    lda.b 0x17
    bpl .B761

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    and.b #0x7F
    beq .B761

    jsl 0x828358
    bne .B75D

    inc.w 0x0000,X
    lda.b #0x06
    sta.w 0x000A,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    asl
    asl
    rep #0x20
    lda.w #0x001A
    bcs .B74A

    lda.w #0xFFE6
.B74A:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0002
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
.B75D:
    sep #0x30
    dec.b 0x36
.B761:
    lda.b 0x0F
    bpl .B77B

    jsl 0x84AC92
    lda.b 0x36
    bne .B77B

    lda.b #0x04
    sta.b 0x03
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x78
    sta.b 0x34
.B77B:
    rts

.B77C:
    jsl _848EEA
    jsl 0x84AC92
    dec.b 0x34
    bne .B78B

    jsr _81C00F
.B78B:
    rts

.B78C:
    ldx.b 0x03
    jmp (.B791,X)

.B791: d16[.B79D, .B7E1, .B81C, .B842, .B861, .B878]

.B79D:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x05
    jsl _848EEA.8F07
    lda.b #0x40
    sta.b 0x1E
    rep #0x20
    lda.w #0x07DE
    sta.b 0x1C
    lda.w 0x1E60
    clc
    adc.w #0x0080
    cmp.b 0x05
    bcc .B7C5

    ldx.b #0x40
    sec
    sbc.w #0x000A
    bra .B7CB

.B7C5:
    ldx.b #0x00
    clc
    adc.w #0x000A
.B7CB:
    sec
    sbc.b 0x05
    asl
    asl
    asl
    sta.b 0x1A
    sep #0x20
    lda.b #0x40
    trb.b 0x11
    txa
    tsb.b 0x11
    lda.b #0xFF
    sta.b 0x2F
    rts

.B7E1:
    jsl _848EEA
    lda.b 0x0F
    beq .B81B

    jsl update_pos_xy.neg_ay
    lda.b 0x1D
    bpl .B81B

    lda.b #0x04
    sta.b 0x03
    lda.b #0x09
    jsl _848EEA.8F07
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x000A
    bcc .B809

    lda.w #0xFFF6
.B809:
    clc
    adc.w #0x0080
    clc
    adc.w 0x1E60
    sta.b 0x05
    stz.b 0x1C
    stz.b 0x1A
    sep #0x20
    stz.b 0x34
.B81B:
    rts

.B81C:
    lda.b 0x34
    beq .B82F

    dec.b 0x34
    bne .B841

    lda.b #0x06
    sta.b 0x03
    lda.b #0x07
    jsl _848EEA.8F07
    rts

.B82F:
    jsl _848EEA
    lda.b 0x0F
    bpl .B841

    lda.b #0x1E
    sta.b 0x34
    ldy.b #0x1B
    lda.b #0x01
    sta (0x0C),Y
.B841:
    rts

.B842:
    jsl _848EEA
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .B860

    lda.b #0x08
    sta.b 0x03
    lda.b #0x08
    jsl _848EEA.8F07
    stz.b 0x2F
.B860:
    rts

.B861:
    jsl _848EEA
    lda.b 0x0F
    bpl .B877

    lda.b #0x0A
    sta.b 0x03
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x1E
    sta.b 0x34
.B877:
    rts

.B878:
    jsl _848EEA
    dec.b 0x34
    bne .B883

    jsr _81C00F
.B883:
    rts

.B884:
    ldx.b 0x03
    jmp (.B889,X)

.B889: d16[.B891, .B8C2, .B8D7, .B925]

.B891:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x38
    jsl 0x84AC92
    lda.b #0x02
    jsl _848EEA.8F07
    stz.b 0x2F
    lda.b #0x10
    sta.b 0x1F
    stz.b 0x1E
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0600
    bcs .B8B7

    lda.w #0xFA00
.B8B7:
    sta.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x01
    sta.b 0x39
    rts

.B8C2:
    jsl _848EEA
    lda.b 0x0F
    and.b #0x7F
    beq .B8D6

    lda.b #0x04
    sta.b 0x03
    lda.b #0x49
    jsl _80888B
.B8D6:
    rts

.B8D7:
    jsl _848EEA
    lda.b 0x11
    asl
    asl
    bcs .B8E7

    jsl update_pos_xy.neg_ay_pos_ax
    bra .B8EB

.B8E7:
    jsl update_pos_xy.neg_ay_ax
.B8EB:
    jsl 0x8491BE
    rep #0x20
    lda.b 0x1A
    sep #0x20
    beq .B910

    lda.b 0x2B
    and.b #0x03
    beq .B924

    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    rts

.B910:
    lda.b #0x06
    sta.b 0x03
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x01
    sta.b 0x38
    lda.b #0x1E
    sta.b 0x34
    stz.b 0x39
.B924:
    rts

.B925:
    jsl _848EEA
    dec.b 0x34
    beq .B930

    jsr _81C00F
.B930:
    rts

.B931:
    ldx.b 0x03
    jmp (.B936,X)

.B936: d16[.B942, .B970, .B97F, .B99E, .B9CF, .B9E6]

.B942:
    jsl 0x84AC92
    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    sta.b 0x38
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    asl
    asl
    sta.b 0x1A
    lda.w #0x087E
    sta.b 0x1C
    sep #0x20
    lda.b #0x05
    jsl _848EEA.8F07
    rts

.B970:
    jsl _848EEA
    lda.b 0x0F
    and.b #0x7F
    beq .B97E

    lda.b #0x04
    sta.b 0x03
.B97E:
    rts

.B97F:
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    jsl _848EEA
    rep #0x20
    lda.b 0x1C
    sep #0x20
    bpl .B99D

    lda.b #0x06
    sta.b 0x03
    lda.b #0x07
    jsl _848EEA.8F07
.B99D:
    rts

.B99E:
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    jsl _848EEA
    rep #0x20
    lda.b 0x1C
    cmp.w #0xF900
    bpl .B9BC

    lda.w #0xF900
    sta.b 0x1C
    sep #0x20
    stz.b 0x1E
.B9BC:
    sep #0x20
    lda.b 0x2B
    and.b #0x04
    beq .B9CE

    lda.b #0x08
    sta.b 0x03
    lda.b #0x08
    jsl _848EEA.8F07
.B9CE:
    rts

.B9CF:
    jsl _848EEA
    lda.b 0x0F
    bpl .B9E5

    lda.b #0x0A
    sta.b 0x03
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x1E
    sta.b 0x34
.B9E5:
    rts

.B9E6:
    jsl _848EEA
    dec.b 0x34
    bne .B9F1

    jsr _81C00F
.B9F1:
    rts

.B9F2:
    ldx.b 0x03
    jmp (.B9F7,X)

.B9F7: d16[.BA01, .BA44, .BA61, .BA8B, .BAA9]

.BA01:
    jsl 0x84AC92
    stz.b 0x38
    rep #0x30
    ldx.w #0x1428
.BA0C:
    sep #0x20
    lda.w 0x0000,X
    beq .BA2A

    lda.w 0x000A,X
    cmp.b #0x1A
    bne .BA2A

    lda.w 0x000B,X
    beq .BA2A

    sep #0x10
    stz.b 0x02
    stz.b 0x03
    lda.b #0x01
    sta.b 0x38
    rts

.BA2A:
    rep #0x20
    txa
    clc
    adc.w #0x0040
    tax
    cmp.w #0x1628
    bcc .BA0C

    sep #0x30
    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x03
    rts

.BA44:
    jsl _848EEA
    lda.b 0x0F
    beq .BA60

    lda.b #0x04
    sta.b 0x03
    lda.b #0x0E
    jsl _848EEA.8F07
    lda.b #0x3C
    sta.b 0x34
    lda.b #0x72
    jsl _80888B
.BA60:
    rts

.BA61:
    jsl _848EEA
    jsr _81BF0C
    dec.b 0x34
    bne .BA8A

    lda.b #0x30
    sta.w 0x0000
    stz.w 0x0001
    jsr _81BF52
    lda.b #0x50
    sta.w 0x0000
    stz.w 0x0001
    jsr _81BF52
    lda.b #0x06
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x34
.BA8A:
    rts

.BA8B:
    jsl _848EEA
    jsr _81BF0C
    dec.b 0x34
    bne .BAA8

    lda.b #0x08
    sta.b 0x03
    lda.b #0x1E
    sta.b 0x34
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x01
    sta.b 0x38
.BAA8:
    rts

.BAA9:
    jsl _848EEA
    dec.b 0x34
    bne .BAB4

    jsr _81C00F
.BAB4:
    rts

.BAB5:
    ldx.b 0x03
    jmp (.BABA,X)

.BABA: d16[.BAC6, .BAD2, .BB00, .BB2A, .BB00, .BB2A]

.BAC6:
    lda.b #0x04
    sta.b 0x03
    lda.b #0x14
    sta.b 0x37
    lda.b #0x04
    bra .BADC

.BAD2:
    lda.b #0x08
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x37
    lda.b #0x0D
.BADC:
    jsl _848EEA.8F07
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0100
    bcc .BAEE

    lda.w #0xFF00
.BAEE:
    sta.b 0x1A
    lda.w #0x0221
    sta.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
    rts

.BB00:
    jsl update_pos_xy.neg_ay
    jsl _848EEA
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .BB23

    inc.b 0x03
    inc.b 0x03
    rep #0x20
    lda.b 0x1A
    and.w #0x8000
    lsr.b 0x1A
    tsb.b 0x1A
    sep #0x20
.BB23:
    lda.b 0x37
    beq .BB29

    dec.b 0x37
.BB29:
    rts

.BB2A:
    jsl update_pos_x
    jsl _848EEA
    jsl 0x8491BE
    lda.b 0x37
    bne .BB4A

    stz.b 0x02
    jsr _81C00F
    lda.b #0x00
    jsl _848EEA.8F07
    jsl 0x84AC92
    rts

.BB4A:
    dec.b 0x37
    rts

.BB4D:
    jsl 0x84A66D
    bpl .BB6C

    lda.w 0x1F7A
    cmp.b #0x09
    bcc .BB68

    lda.b #0x1B
    jsl _80878B
    lda.b #0xF5
    ldy.b #0x03
    jsl _808850.8868
.BB68:
    jml 0x828398

.BB6C:
    lda.b 0x03
    cmp.b #0x14
    bcs .BB76

    jml 0x8280B4

.BB76:
    rtl
