sting_chameleao:
    ldx.b 0x01
    jmp (.8543,X)

.8543: d16[.854B, .85F0, .870A, .8CF3]

.854B:
    lda.b 0x02
    bne .859C

    jsl 0x84AACA
    beq .8559

    jml 0x828398

.8559:
    jsl 0x849FE6
    inc.b 0x02
    lda.b #0x3C
    sta.b 0x34
    lda.b #0xFF
    sta.b 0x2F
    lda.w 0x1E89
    sta.b 0x3B
    lda.b #0x0C
    sta.w 0x1E89
    lda.b #0x15
    sta.w 0x00C0
    rep #0x20
    stz.w 0x1E8D
    lda.w #0x0200
    ldx.w 0x1F7A
    cpx.b #0x09
    bcc .8588

    lda.w #0x0100
.8588:
    sta.w 0x1E90
    sep #0x20
    jsl _80E02C
    lda.w 0x1F26
    beq .859C

    lda.b #0x2E
    jsl _80878B
.859C:
    dec.b 0x34
    beq .85A1

    rtl

.85A1:
    jsl 0x82827D
    stz.b 0x02
    lda.b #0x04
    sta.b 0x26
    stz.b 0x33
    lda.b #0x2B
    sta.b 0x11
    and.b #0x0E
    sta.b 0x3A
    ldx.b #0x1F
.85B7:
    stz.w 0x04A0,X
    dex
    bpl .85B7

    inc.w 0x00A1
    lda.b #0x04
    sta.b 0x12
    lda.b #0x03
    jsl _848EEA.8F07
    stz.b 0x36
    stz.b 0x35
    jsr .8D79
    jsr .8D2F
    lda.b #0x15
    sta.w 0x00C0
    lda.b #0x02
    sta.w 0x00C1
    lda.b #0x10
    sta.w 0x00CA
    lda.b #0x02
    sta.w 0x00C9
    lda.b #0x1E
    sta.b 0x34
    jml 0x8280B4

.85F0:
    jsr .8D2F
    ldx.b 0x02
    jsr (.85FC,X)
    jml 0x8280B4

.85FC: d16[.860C, .8622, .863D, .8669, .8694, .86A7, .86B4, .86D5]

.860C:
    dec.b 0x34
    bne .8621

    lda.b #0x02
    sta.b 0x02
    lda.b #0x3C
    sta.b 0x34
    rep #0x20
    lda.w #0xFF80
    sta.b 0x1C
    sep #0x20
.8621:
    rts

.8622:
    jsl update_pos_y
    jsl _848EEA
    dec.b 0x34
    bne .863C

    lda.b #0x04
    sta.b 0x02
    lda.b #0x5A
    sta.b 0x34
    lda.b #0x76
    jsl _80888B
.863C:
    rts

.863D:
    lda.w 0x0B9C
    lsr
    bcc .8646

    jsr .8DAB
.8646:
    dec.b 0x34
    bne .8668

    lda.b #0x06
    sta.b 0x02
    stz.w 0x00C1
    rep #0x20
    stz.b 0x1C
    stz.b 0x1A
    lda.w #0xC774
    sta.b 0x20
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0x11
    jsl _848EEA.8F07
.8668:
    rts

.8669:
    jsl update_pos_xy.neg_ay
    jsl _848EEA
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x04
    beq .8693

    lda.b #0x08
    sta.b 0x02
    lda.b #0x06
    jsl _848EEA.8F07
    stz.b 0x2F
    rep #0x20
    tdc
    sta.w 0x1F0E
    sep #0x20
    lda.b #0x80
    sta.b 0x27
.8693:
    rts

.8694:
    jsl _848EEA
    lda.b 0x0F
    bpl .86A6

    lda.b #0x0A
    sta.b 0x02
    lda.b #0x05
    jsl _848EEA.8F07
.86A6:
    rts

.86A7:
    jsl _848EEA
    lda.b 0x0F
    beq .86B3

    lda.b #0x0C
    sta.b 0x02
.86B3:
    rts

.86B4:
    inc.b 0x34
    lda.b 0x34
    lsr
    bcc .86D0

    lda.b #0x0C
    jsl _80888B.88B6
    lda.b 0x27
    and.b #0x7F
    inc
    sta.b 0x27
    cmp.b #0x20
    bcc .86D0

    lda.b #0x0E
    sta.b 0x02
.86D0:
    lda.b #0x80
    tsb.b 0x27
    rts

.86D5:
    lda.b 0x0F
    bmi .86F1

    jsl _848EEA
    lda.b 0x0F
    bpl .86F0

    lda.b #0x1E
    sta.b 0x34
    lda.w 0x1F26
    beq .86F0

    lda.b #0x1E
    jsl _80878B
.86F0:
    rts

.86F1:
    dec.b 0x34
    beq .8709

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    stz.b 0x37
    jsl 0x849FFE
    lda.b #0x00
    jsl _848EEA.8F07
.8709:
    rts

.870A:
    lda.b 0x3A
    tsb.b 0x11
    ldx.b 0x02
    jsr (.87BD,X)
    lda.b 0x37
    beq .871A

    jmp .879A

.871A:
    lda.b 0x17
    and.b #0x7F
    tax
    lda.w 0x00C722,X
    asl
    asl
    rep #0x20
    and.w #0x00FF
    clc
    adc.w #0xC754
    sta.b 0x20
    sep #0x20
    ldx.b #0x06
    lda.b 0x33
    beq .8739

    ldx.b #0x05
.8739:
    stx.b 0x28
    stz.b 0x30
    lda.w 0x0BCF
    and.b #0x7F
    beq .879A

    jsl 0x849B43
    beq .879A

    bpl .877B

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    lda.b #0x15
    jsl _848EEA.8F07
    stz.b 0x37
    stz.w 0x00C1
    lda.b #0x29
    sta.b 0x11
    lda.b 0x3B
    sta.w 0x1E89
    ldx.b 0x35
    stz.w 0x0AA1,X
    lda.b #0x13
    jsl _80888B
    jsl 0x84AC92
    jml 0x8280B4

.877B:
    lda.b 0x33
    bne .879A

    lda.b #0x13
    jsl _80888B
    lda.b #0x3C
    sta.b 0x33
    lda.w 0x1F1D
    cmp.b #0x0D
    beq .8794

    cmp.b #0x16
    bne .879A

.8794:
    lda.b #0x0C
    sta.b 0x02
    stz.b 0x03
.879A:
    lda.b 0x33
    beq .87AD

    dec
    sta.b 0x33
    ldx.b 0x37
    bne .87B5

    and.b #0x03
    bne .87B5

    lda.b #0x0E
    trb.b 0x11
.87AD:
    lda.b 0x37
    bne .87B5

    jsl _849B03
.87B5:
    lda.b 0x37
    sta.b 0x30
    jml 0x8280B4

.87BD: d16[.87CB, .88FF, .8959, .8AE7, .8B5F, .8BCF, .8C8F]

.87CB:
    ldx.b 0x03
    jmp (.87D0,X)

.87D0: d16[.87DC, .8879, .889D, .88B4, .88D0, .88F0]

.87DC:
    lda.b 0x2F
    beq .87F7

    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    jsl _848EEA.8F07
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    rts

.87F7:
    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x40
    trb.b 0x11
    ldx.b #0x00
    jsl get_rng
    and.b #0x0F
    cmp.b #0x04
    bcc .8845

    rep #0x20
    lda.w 0x1E4D
    clc
    adc.w #0x0080
    cmp.b 0x05
    lda.w #0x0040
    bcc .8826

    lda.w #0x00C0
    ldx.b #0x40
.8826:
    clc
    adc.w 0x1E4D
    sec
    sbc.b 0x05
    asl
    asl
    asl
    sta.b 0x1A
    lda.w #0x0593
    sta.b 0x1C
    sep #0x20
    lda.b #0x30
    sta.b 0x1E
    txa
    tsb.b 0x11
    lda.b #0x06
    sta.b 0x03
    rts

.8845:
    rep #0x20
    lda.w 0x1E4D
    clc
    adc.w #0x0080
    cmp.b 0x05
    lda.w #0x0030
    bcc .885A

    ldx.b #0x40
    lda.w #0x00D0
.885A:
    clc
    adc.w 0x1E4D
    sec
    sbc.b 0x05
    asl
    asl
    asl
    sta.b 0x1A
    lda.w #0x070D
    sta.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1C
    txa
    tsb.b 0x11
    lda.b #0x08
    sta.b 0x03
    rts

.8879:
    jsl update_pos_xy.neg_ay
    rep #0x20
    lda.w #0xC774
    sta.b 0x20
    sep #0x20
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x04
    beq .889C

    stz.b 0x2F
    lda.b #0x06
    jsl _848EEA.8F07
    lda.b #0x04
    sta.b 0x03
.889C:
    rts

.889D:
    jsl _848EEA
    lda.b 0x0F
    bpl .88A8

    jmp .87F7

.88A8:
    jsr .8EA4
    bcc .88B3

    lda.b #0x0A
    sta.b 0x02
    stz.b 0x03
.88B3:
    rts

.88B4:
    jsl update_pos_xy.neg_ay
    rep #0x20
    lda.w #0xC774
    sta.b 0x20
    sep #0x20
    jsl _8491AD.91BE
    lda.b 0x1D
    bpl .88CF

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
.88CF:
    rts

.88D0:
    jsl update_pos_xy.neg_ay
    rep #0x20
    lda.w #0xC774
    sta.b 0x20
    sep #0x20
    jsl _8491AD.91BE
    lda.b 0x1D
    bpl .88EF

    lda.b #0x0A
    sta.b 0x03
    lda.b #0x12
    jsl _848EEA.8F07
.88EF:
    rts

.88F0:
    jsl _848EEA
    lda.b 0x0F
    bpl .88FE

    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
.88FE:
    rts

.88FF:
    jsr .8D2F
    ldx.b 0x03
    jmp (.8907,X)

.8907: d16[.890F, .8925, .8932, .8948]

.890F:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x20
    sta.b 0x34
    lda.b #0x02
    sta.w 0x00C1
    inc.b 0x37
    lda.b #0x76
    jsl _80888B
    rts

.8925:
    dec.b 0x34
    bne .8931

    lda.b #0x04
    sta.b 0x03
    lda.b #0x20
    sta.b 0x34
.8931:
    rts

.8932:
    lda.w 0x0B9C
    lsr
    bcc .8947

    jsr .8E0F
    dec.b 0x34
    bne .8947

    lda.b #0x06
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x34
.8947:
    rts

.8948:
    dec.b 0x34
    bne .8958

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    lda.b #0x03
    jsl _848EEA.8F07
.8958:
    rts

.8959:
    ldx.b 0x03
    jmp (.895E,X)

.895E: d16[.8972, .8A18, .8A44, .8A57, .8A77, .8A44, .8AC0, .8A44, .8ADD, .8A6A]

.8972:
    stz.b 0x38
    lda.b #0x03
    jsl _848EEA.8F07
    jsl get_rng
    and.b #0x0F
    cmp.b #0x06
    bcs .89E1

    lda.b #0x02
    sta.b 0x03
    rep #0x20
    lda.w 0x1E4D
    clc
    adc.w #0x0080
    cmp.b 0x05
    lda.w #0x0030
    bcc .899B

    lda.w #0x00D0
.899B:
    clc
    adc.w 0x1E4D
    sta.w 0x0004
    lda.w 0x1E50
    clc
    adc.w #0x0030
    sta.w 0x0006
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    jsl 0x84A097
    and.w #0x00FF
    asl
    asl
    tax
    lda.w 0x00EE3A,X
    sta.b 0x1A
    lda.w 0x00EE3C,X
    sta.b 0x1C
    jsl _80CEAE
    sep #0x20
    lda.w 0x0000
    inc
    sta.b 0x34
    lda.b #0x40
    trb.b 0x11
    ldx.b 0x1B
    bmi .89E0

    tsb.b 0x11
.89E0:
    rts

.89E1:
    rep #0x20
    lda.b 0x05
    cmp.w 0x0BAD
    lda.w #0xFE00
    bcs .89F2

    lda.w #0x0200
    ldx.b #0x40
.89F2:
    sta.b 0x1A
    lda.b 0x08
    sec
    sbc.w 0x1E50
    sec
    sbc.w #0x0080
    asl
    asl
    asl
    sta.b 0x1C
    sep #0x20
    lda.b #0x12
    sta.b 0x03
    lda.b #0x20
    sta.b 0x34
    lda.b #0x40
    trb.b 0x11
    ldx.b 0x1B
    bmi .8A17

    tsb.b 0x11
.8A17:
    rts

.8A18:
    jsl 0x82820A
    jsl _848EEA
    rep #0x20
    lda.w #0xC774
    sta.b 0x20
    sep #0x20
    dec.b 0x34
    beq .8A35

    jsl _8491AD.91BE
    lda.b 0x2B
    beq .8A43

.8A35:
    lda.b #0x04
    sta.b 0x03
    lda.b #0x20
    sta.b 0x34
    lda.b #0x76
    jsl _80888B
.8A43:
    rts

.8A44:
    jsr .8D2F
    jsr .8DAB
    dec.b 0x34
    bne .8A56

    inc.b 0x03
    inc.b 0x03
    lda.b #0x20
    sta.b 0x34
.8A56:
    rts

.8A57:
    jsr .8D2F
    dec.b 0x34
    bne .8A69

    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
    stz.w 0x00C1
    stz.b 0x37
.8A69:
    rts

.8A6A:
    dec.b 0x34
    bne .8A76

    lda.b #0x08
    sta.b 0x03
    lda.b #0x20
    sta.b 0x34
.8A76:
    rts

.8A77:
    jsl 0x82820A
    rep #0x20
    lda.w #0xC774
    sta.b 0x20
    sep #0x20
    jsl _8491AD.91BE
    jsr .8E4F
    bne .8AAF

    jsl _848EEA
    dec.b 0x34
    bne .8ABF

    inc.b 0x38
    lda.b 0x38
    cmp.b #0x03
    bcc .8AAC

    lda.b #0x0E
    sta.b 0x03
    lda.b #0x20
    sta.b 0x34
    lda.b #0x76
    jsl _80888B
    rts

.8AAC:
    jmp .89E1

.8AAF:
    sta.b 0x39
    lda.b #0x0C
    sta.b 0x03
    lda.b #0x20
    sta.b 0x34
    lda.b #0x76
    jsl _80888B
.8ABF:
    rts

.8AC0:
    jsr .8D2F
    jsr .8DAB
    dec.b 0x34
    bne .8ADC

    jsr .8E4F
    beq .8AD1

    sta.b 0x39
.8AD1:
    lda.b #0x0A
    sta.b 0x02
    stz.b 0x03
    stz.w 0x00C1
    stz.b 0x37
.8ADC:
    rts

.8ADD:
    stz.b 0x02
    stz.b 0x03
    stz.w 0x00C1
    stz.b 0x37
    rts

.8AE7:
    ldx.b 0x03
    jmp (.8AEC,X)

.8AEC: d16[.8AF4, .8B03, .8B17, .8B54]

.8AF4:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x04
    jsl _848EEA.8F07
    lda.b #0x20
    sta.b 0x34
    rts

.8B03:
    dec.b 0x34
    bne .8B16

    jsl get_rng
    and.b #0x7F
    clc
    adc.b #0x3C
    sta.b 0x34
    lda.b #0x04
    sta.b 0x03
.8B16:
    rts

.8B17:
    jsl _848EEA
    lda.b 0x34
    bne .8B30

    lda.b 0x17
    and.b #0x7F
    cmp.b #0x0A
    bne .8B2F

    lda.b #0x06
    sta.b 0x03
    lda.b #0x20
    sta.b 0x34
.8B2F:
    rts

.8B30:
    dec.b 0x34
    lda.b 0x17
    bpl .8B53

    and.b #0x7F
    sta.b 0x17
    jsl 0x828358
    bne .8B51

    inc.w 0x0000,X
    lda.b #0x11
    sta.w 0x000A,X
    stz.w 0x000B,X
    rep #0x20
    tdc
    sta.w 0x000C,X
.8B51:
    sep #0x30
.8B53:
    rts

.8B54:
    dec.b 0x34
    bne .8B5E

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.8B5E:
    rts

.8B5F:
    ldx.b 0x03
    jmp (.8B64,X)

.8B64: d16[.8B6A, .8B7B, .8B9A]

.8B6A:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x38
    lda.b #0x08
    jsl _848EEA.8F07
    jsl 0x84AC92
    rts

.8B7B:
    jsl _848EEA
    lda.b 0x0F
    beq .8B99

    bpl .8B8E

    lda.b #0x04
    sta.b 0x03
    lda.b #0x20
    sta.b 0x34
    rts

.8B8E:
    lda.b 0x17
    bpl .8B99

    and.b #0x7F
    sta.b 0x17
    jmp .8EB9

.8B99:
    rts

.8B9A:
    dec.b 0x34
    bne .8BCE

    jsl get_rng
    and.b #0x0F
    cmp.b #0x0C
    bcs .8BBC

    lda.b 0x38
    inc
    sta.b 0x38
    cmp.b #0x03
    bcs .8BBC

    lda.b #0x08
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x03
    rts

.8BBC:
    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    jsl get_rng
    and.b #0x0F
    cmp.b #0x03
    bcs .8BCE

    stz.b 0x02
.8BCE:
    rts

.8BCF:
    ldx.b 0x03
    jmp (.8BD4,X)

.8BD4: d16[.8BDA, .8C09, .8C57]

.8BDA:
    stz.b 0x38
    lda.b 0x2F
    bne .8BF5

    lda.b #0x07
    jsl _848EEA.8F07
    lda.b #0x7C
    jsl _80888B
    jsl 0x84AC92
    lda.b #0x04
    sta.b 0x03
    rts

.8BF5:
    lda.b 0x39
    clc
    adc.b #0x0B
    jsl _848EEA.8F07
    lda.b #0x7C
    jsl _80888B
    lda.b #0x02
    sta.b 0x03
    rts

.8C09:
    jsl _848EEA
    lda.b 0x0F
    beq .8C56

    bpl .8C43

    lda.b 0x38
    inc
    sta.b 0x38
    cmp.b #0x03
    bcs .8C2F

    jsr .8E4F
    beq .8C2F

    clc
    adc.b #0x0B
    jsl _848EEA.8F07
    lda.b #0x7C
    jsl _80888B
    rts

.8C2F:
    stz.b 0x03
    jsl get_rng
    and.b #0x0F
    cmp.b #0x08
    bcs .8C3E

    stz.b 0x02
    rts

.8C3E:
    lda.b #0x02
    sta.b 0x02
    rts

.8C43:
    dec
    asl
    asl
    rep #0x21
    and.w #0x00FF
    adc.w #0xC782
    sta.b 0x20
    sep #0x20
    jsl _849B03
.8C56:
    rts

.8C57:
    jsl _848EEA
    lda.b 0x0F
    beq .8C8E

    bpl .8C81

    lda.b 0x38
    inc
    sta.b 0x38
    cmp.b #0x03
    bcs .8C7C

    jsr .8EA4
    bcc .8C7C

    lda.b #0x07
    jsl _848EEA.8F07
    lda.b #0x7C
    jsl _80888B
    rts

.8C7C:
    stz.b 0x02
    stz.b 0x03
    rts

.8C81:
    rep #0x20
    lda.w #0xC77E
    sta.b 0x20
    sep #0x20
    jsl _849B03
.8C8E:
    rts

.8C8F:
    ldx.b 0x03
    jmp (.8C94,X)

.8C94: d16[.8C9A, .8CC4, .8CE6]

.8C9A:
    lda.b #0x02
    sta.b 0x03
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0100
    bcc .8CAC

    lda.w #0xFF00
.8CAC:
    sta.b 0x1A
    lda.w #0x0200
    sta.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x02
    jsl _848EEA.8F07
    rts

.8CC4:
    jsl update_pos_xy.neg_ay
    jsl _848EEA
    rep #0x20
    lda.w #0xC774
    sta.b 0x20
    sep #0x20
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x04
    beq .8CE5

    lda.b #0x04
    sta.b 0x03
    stz.b 0x2F
.8CE5:
    rts

.8CE6:
    jsl _848EEA
    lda.b 0x0F
    bpl .8CF2

    stz.b 0x02
    stz.b 0x03
.8CF2:
    rts

.8CF3:
    jsl 0x84A66D
    bpl .8D20

    lda.w 0x1F7A
    cmp.b #0x09
    bcc .8D1C

    lda.b #0x1C
    jsl _80878B
    lda.b #0xF5
    ldy.b #0x03
    jsl _808850.8868
    lda.b #0x17
    sta.w 0x00C0
    stz.w 0x00C1
    stz.w 0x2131
    stz.w 0x2130
.8D1C:
    jml 0x828398

.8D20:
    lda.b 0x03
    cmp.b #0x14
    bcs .8D2E

    jsl _848EEA
    jml 0x8280B4

.8D2E:
    rtl

;-----

.8D2F:
    lda.b #0xA0
    sta.w 0x0B22
    sta.w 0x0B25
    sta.w 0x0B28
    sta.w 0x0B2B
    sta.w 0x0B2E
    sta.w 0x0B31
    sta.w 0x0B34
    stz.w 0x0B37
    lda.b 0x36
    inc
    cmp.b #0x20
    bcc .8D52

    lda.b #0x00
.8D52:
    sta.b 0x36
    asl
    rep #0x21
    and.w #0x00FF
    clc
    adc.w #0xC7B2
    sta.w 0x0B23
    sta.w 0x0B26
    sta.w 0x0B29
    sta.w 0x0B2C
    sta.w 0x0B2F
    sta.w 0x0B32
    sta.w 0x0B35
    sta.w 0x0B38
    sep #0x20
    rts

;-----

.8D79:
    ldx.b #0x00
.8D7B:
    lda.w 0x0AA1,X
    beq .8D87

    txa
    clc
    adc.b #0x07
    tax
    bra .8D7B

.8D87:
    inc.w 0x0AA1,X
    lda.b #0x42
    sta.w 0x0AA2,X
    lda.b #0x0F
    sta.w 0x0AA3,X
    lda.b #0xD2
    sta.w 0x0AA4,X
    lda.b #0x0A
    sta.w 0x0AA5,X
    lda.b #0x00
    sta.w 0x0AA6,X
    lda.b #0x86
    sta.w 0x0AA7,X
    stx.b 0x35
    rts

;-----

.8DAB:
    php
    phd
    rep #0x20
    sep #0x10
    lda.w #0x0000
    tcd
    ldx.b #0x1E
.8DB7:
    lda.w 0x0480,X
    and.w #0x001F
    sta.b 0x00
    lda.w 0x0480,X
    and.w #0x03E0
    sta.b 0x02
    lda.w 0x0480,X
    and.w #0x7C00
    sta.b 0x04
    lda.w 0x04A0,X
    and.w #0x001F
    inc
    cmp.b 0x00
    bcc .8DDC

    lda.b 0x00
.8DDC:
    sta.b 0x06
    lda.w 0x04A0,X
    and.w #0x03E0
    clc
    adc.w #0x0020
    cmp.b 0x02
    bcc .8DEE

    lda.b 0x02
.8DEE:
    tsb.b 0x06
    lda.w 0x04A0,X
    and.w #0x7C00
    clc
    adc.w #0x0400
    cmp.b 0x04
    bcc .8E00

    lda.b 0x04
.8E00:
    ora.b 0x06
    sta.w 0x04A0,X
    dex
    dex
    bpl .8DB7

    inc.w 0x00A1
    pld
    plp
    rts

;-----

.8E0F:
    php
    phd
    rep #0x20
    sep #0x10
    lda.w #0x0000
    tcd
    ldx.b #0x1E
.8E1B:
    lda.w 0x04A0,X
    and.w #0x001F
    beq .8E24

    dec
.8E24:
    sta.b 0x00
    lda.w 0x04A0,X
    and.w #0x03E0
    beq .8E32

    sec
    sbc.w #0x0020
.8E32:
    tsb.b 0x00
    lda.w 0x04A0,X
    and.w #0x7C00
    beq .8E40

    sec
    sbc.w #0x0400
.8E40:
    ora.b 0x00
    sta.w 0x04A0,X
    dex
    dex
    bpl .8E1B

    inc.w 0x00A1
    pld
    plp
    rts

;-----

.8E4F:
    jsl 0x84AC92
    rep #0x10
    ldx.w #0xC7A2
    stx.b 0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcc .8E68

    sep #0x10
    lda.b #0x01
    rts

.8E68:
    ldx.w #0xC7A6
    stx.b 0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcc .8E7B

    sep #0x10
    lda.b #0x02
    rts

.8E7B:
    ldx.w #0xC7AA
    stx.b 0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcc .8E8E

    sep #0x10
    lda.b #0x03
    rts

.8E8E:
    ldx.w #0xC7AE
    stx.b 0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .8EA1

    lda.b #0x04
    rts

.8EA1:
    lda.b #0x00
    rts

;-----

.8EA4:
    jsl 0x84AC92
    rep #0x10
    ldx.w #0xC77E
    stx.b 0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    rts

;-----

.8EB9:
    rep #0x20
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0x0030
    sta.w 0x0002
    lda.w 0x0BAD
    sta.w 0x0004
    lda.w 0x0BB0
    sta.w 0x0006
    sep #0x20
    jsl 0x84A097
    lsr
    sec
    sbc.b #0x04
    beq .8EEB

    bmi .8EEB

    cmp.b #0x08
    bcc .8EED

    lda.b #0x07
    bra .8EED

.8EEB:
    lda.b #0x01
.8EED:
    sta.w 0x0000
    ldy.b #0x02
.8EF2:
    jsl 0x828358
    bne .8F21

    inc.w 0x0000,X
    lda.b #0x11
    sta.w 0x000A,X
    tya
    clc
    adc.w 0x0000
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x0030
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
    sep #0x20
    dey
    bpl .8EF2

.8F21:
    sep #0x30
    lda.b #0x79
    jsl _80888B
    rts
