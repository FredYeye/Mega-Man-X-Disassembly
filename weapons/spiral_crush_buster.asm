spiral_crush_buster:
    ldx.b 0x01
    jsr (.899C,X)
    lda.b 0x0B
    bne .899B

    jsl 0x848FCA
.899B:
    rtl

.899C: d16[.89A6, .8A15, .8AF4, .8A0D, .8B2E]

.89A6:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x30
    lda.b 0x0B
    beq .89B4

    lda.b #0x02
    sta.b 0x02
.89B4:
    lda.b #0xFF
    sta.b 0x10
    stz.b 0x18
    stz.b 0x12
    lda.b 0x0B
    bne .89E1

    ldx.w ram.current_stage
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    jsr .8B6A
    rep #0x21
    lda.w ram.obj.mega_man.pos_y+1
    adc.w 0x0002
    sta.b 0x08
    jsr .8C25
    sep #0x20
    inc.w 0x0C25
.89E1:
    rep #0x20
    lda.w #0xAAF3
    sta.b 0x31
    lda.w #0xBE80
    sta.b 0x20
    lda.b 0x0B
    and.w #0x00FF
    tax
    lda.w #0xB800
    clc
    adc.w 0x00BE96,X
    sta.b 0x26
    sep #0x20
    lda.b #0x7F
    sta.b 0x28
    stz.b 0x3A
    lda.b #0x0E
    sta.b 0x16
    sta.b 0x0E
    stz.b 0x17
    rts

.8A0D:
    lda.b #0x02
    sta.b 0x01
    jsl 0x84A51A
.8A15:
    lda.b 0x0E
    bne .8A24

    lda.b #0x08
    sta.b 0x01
    lda.b #0x02
    sta.b 0x02
    inc.b 0x30
    rts

.8A24:
    ldx.b 0x02
    jsr (.8A2E,X)
    jsl _82808F.80B4
    rts

.8A2E: d16[.8A32, .8A57]

.8A32:
    ldx.b 0x03
    bne .8A3E

    inc.b 0x03
    lda.b #0x09
    jsl _848EEA.8F07
.8A3E:
    lda.b 0x0F
    bpl .8A50

    jsr .8B99
    lda.b #0x04
    jsl _848EEA.8F07
    lda.b #0x02
    jmp _8386F1

.8A50:
    jsl _848EEA
    jmp .8B6A

.8A57:
    ldx.b 0x03
    jmp (.8A5C,X)

.8A5C: d16[.8A62, .8A78, .8AB5]

.8A62:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x30
    lda.b 0x0B
    lsr
    tax
    lda.w 0x00BE9C,X
    sta.b 0x38
    lda.b #0x04
    jsl _848EEA.8F07
    rts

.8A78:
    dec.b 0x38
    beq .8A7D

    rts

.8A7D:
    lda.b #0x04
    sta.b 0x03
    rep #0x21
    lda.b 0x0B
    and.w #0x00FF
    tax
    lda.w 0x00BE90,X
    adc.b 0x08
    sta.b 0x08
    lda.w 0x00BE84,X
    sta.b 0x1C
    lda.w #0x00C0
    sta.b 0x1E
    lda.w #0x0600
    bit.b 0x10
    bvs .8AA4

    lda.w #0xFA00
.8AA4:
    sta.b 0x1A
    sep #0x20
    lda.w 0x00BE8A,X
    sta.b 0x39
    lda.w 0x00BE8B,X
    sta.b 0x38
    jsr .8BCE
.8AB5:
    ldx.b #0x00
    lda.b 0x1D
    bpl .8ABD

    ldx.b #0x02
.8ABD:
    stx.b 0x12
    jsr .8BF8
    ldx.b 0x39
    bne .8ADD

    dec.b 0x38
    bne .8AD8

    inc.b 0x39
    lda.b #0xB6
    sta.b 0x1C
    lda.b #0xFA
    sta.b 0x1D
    lda.b #0x08
    sta.b 0x38
.8AD8:
    jsl update_pos_xy.neg_ay_ax
    rts

.8ADD:
    dec.b 0x38
    bne .8AEF

    stz.b 0x39
    lda.b #0x4A
    sta.b 0x1C
    lda.b #0x05
    sta.b 0x1D
    lda.b #0x08
    sta.b 0x38
.8AEF:
    jsl update_pos_xy.pos_ay_neg_ax
    rts

.8AF4:
    ldx.b 0x02
    jsr (.8AFE,X)
    jsl _82808F.80B4
    rts

.8AFE: d16[.8B02, .8B1A]

.8B02:
    rep #0x20
    lda.b 0x33
    sta.b 0x05
    lda.b 0x35
    sta.b 0x08
    sep #0x20
    lda.b #0x02
    sta.b 0x02
    inc.b 0x30
    lda.b #0x08
    jsl _848EEA.8F07
.8B1A:
    lda.b 0x0F
    bpl .8B27

    lda.b #0x08
    sta.b 0x01
    lda.b #0x02
    sta.b 0x02
    rts

.8B27:
    jsl _848EEA
    jmp .8C1A

.8B2E:
    ldx.b 0x02
    jmp (.8B33,X)

.8B33: d16[.8B39, .8B42, .8B54]

.8B39:
    lda.b #0x02
    sta.b 0x02
    jsl 0x84A51A
    rts

.8B42:
    lda.b #0x04
    sta.b 0x02
    lda.b #0x10
    sta.b 0x38
    ldy.b 0x3A
    iny
    lda.b #0xFF
    sta [0x26],Y
    jmp .8C1A

.8B54:
    dec.b 0x38
    beq .8B5B

    jmp .8C1A

.8B5B:
    lda.b 0x0B
    bne .8B62

    dec.w 0x0BDD
.8B62:
    dec.w 0x0C25
    jsl _8283A3
    rts

//-----

.8B6A:
    ldx.b 0x3C
    lda.w 0x00BE3C,X
    sta.w 0x0000
    stz.w 0x0001
    stz.w 0x0003
    lda.w 0x00BE3D,X
    sta.w 0x0002
    bpl .8B83

    dec.w 0x0003
.8B83:
    rep #0x20
    lda.w 0x0000
    bit.b 0x10
    bvs .8B90

    eor.w #0xFFFF
    inc
.8B90:
    clc
    adc.w ram.obj.mega_man.pos_x+1
    sta.b 0x05
    sep #0x20
    rts

//-----

.8B99:
    ldy.b #0x01
.8B9B:
    jsl _82833E
    bne .8BCB

    inc.w 0x0000,X
    inc.w 0x0C25
    lda.b #0x02
    sta.w 0x000A,X
    sta.w 0x0030,X
    lda.b 0x11
    sta.w 0x0011,X
    tya
    inc
    asl
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x08
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
    sep #0x20
    dey
    bpl .8B9B

.8BCB:
    sep #0x10
    rts

//-----

.8BCE:
    ldy.b #0x03
.8BD0:
    jsl _8282AC.82ED
    bne .8BF5

    inc.w 0x0000,X
    stz.w 0x000A,X
    tya
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    lda.b 0x26
    sta.w 0x001A,X
    sep #0x20
    dey
    bpl .8BD0

.8BF5:
    sep #0x10
    rts

//-----

.8BF8:
    rep #0x20
    ldy.b 0x3A
    lda.w #0x0000
    ldx.b 0x12
    beq .8C06

    lda.w #0x4000
.8C06:
    ora.b 0x05
    sta [0x26],Y
    iny
    iny
    lda.b 0x08
    sta [0x26],Y
    iny
    iny
    sep #0x20
    tya
    and.b #0xFF
    sta.b 0x3A
    rts

//-----

.8C1A:
    lda.b 0x3A
    inc
    inc
    inc
    inc
    and.b #0xFF
    sta.b 0x3A
    rts

//-----

.8C25:
    rep #0x10
    ldx.w #0x02FC
    lda.w #0x7F00
.8C2D:
    sta.l 0x7FB800,X
    sta.l 0x7FB802,X
    dex
    dex
    dex
    dex
    bpl .8C2D

    sep #0x10
    rts
