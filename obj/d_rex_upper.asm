d_rex_upper:
    ldx.b 0x01
    jmp (.B68E,X)

.B68E: d16[.B694, .B6C7, .BBBB]

.B694:
    jsl 0x82827D
    lda.b #0x02
    sta.b 0x12
    lda.b #0x06
    sta.b 0x28
    stz.b 0x35
    stz.b 0x3C
    stz.b 0x34
    stz.b 0x39
    stz.b 0x3B
    lda.b #0x20
    sta.b 0x27
    sta.b 0x2F
    lda.b #0x04
    sta.b 0x26
    lda.b #0xA0
    sta.b 0x20
    lda.b #0xD5
    sta.b 0x21
    lda.l 0x7F8398
    ora.b #0x30
    sta.b 0x11
    sta.b 0x36
    rtl

.B6C7:
    lda.w 0x0BCF
    cmp.b #0x80
    bne .B6D9

    rep #0x10
    ldy.w #0x019C
    jsl 0x828011
    sep #0x10
.B6D9:
    ldx.b 0x02
    jsr (.B71A,X)
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    lda.w 0x0BCF
    and.b #0x7F
    beq .B70B

    jsl 0x849B43
    beq .B707

    bpl .B703

    lda.b #0x10
    sta.b 0x02
    stz.b 0x03
    lda.b #0x13
    jsl _80888B
    bra .B716

.B703:
    lda.b #0x02
    sta.b 0x3C
.B707:
    jsl _849B03
.B70B:
    jsr .B761
    bit.b 0x34
    bvs .B716

    jsl _8491AD.91BE
.B716:
    jml 0x8280B4

.B71A: d16[.B7BA, .B7E2, .B86C, .B8BB, .B8F5, .B957, .BA9E, .B9CC, .B72C]

.B72C:
    ldx.b 0x03
    bne .B743

    inc.b 0x03
    lda.b #0x28
    sta.b 0x33
    lda.b #0x01
    sta.w 0x1F13
    sta.w 0x1F14
    jsl 0x849F85
    rts

.B743:
    dec.b 0x33
    bne .B760

    stz.w 0x1F3F
    inc.w 0x1F42
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    sta.w 0x0BD8
    stz.w 0x1F13
    stz.w 0x1F14
    jsl 0x849FE6
.B760:
    rts

.B761:
    ldx.b 0x3C
    jmp (.B766,X)

.B766: d16[.B788, .B76C, .B789]

.B76C:
    lda.b #0x04
    sta.b 0x3C
    lda.b #0x05
    sta.b 0x28
    lda.b #0x0E
    trb.b 0x11
    lda.b #0x13
    jsl _80888B
    lda.b #0x3C
    sta.b 0x35
    lda.b #0x09
    jsl _848EEA.8F07
.B788:
    rts

.B789:
    lda.w 0x0BCF
    and.b #0x7F
    beq .B794

    dec.b 0x35
    bne .B7A7

.B794:
    stz.b 0x3C
    lda.b #0x06
    sta.b 0x28
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b 0x36
    sta.b 0x11
    jmp _88BD71

.B7A7:
    lda.b 0x35
    lsr
    bcc .B7B3

    lda.b #0x0E
    trb.b 0x11
    jmp _88BD90

.B7B3:
    lda.b 0x36
    sta.b 0x11
    jmp _88BD71

.B7BA:
    ldx.b 0x03
    bne .B7D7

    rep #0x20
    lda.w 0x1E5E
    cmp.w 0x1E56
    bne .B7CA

    inc.b 0x03
.B7CA:
    sep #0x20
    lda.b #0x3C
    sta.b 0x33
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.B7D7:
    dec.b 0x33
    bne .B7E1

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.B7E1:
    rts

.B7E2:
    ldx.b 0x03
    jmp (.B7E7,X)

.B7E7: d16[.B7ED, .B807, .B859]

.B7ED:
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    lda.w #0x0040
    sta.b 0x1E
    sep #0x20
    lda.b #0x40
    tsb.b 0x34
    lda.b #0x1E
    sta.b 0x33
    rts

.B807:
    lda.b 0x33
    beq .B813

    dec.b 0x33
    bne .B813

    lda.b #0x40
    trb.b 0x34
.B813:
    rep #0x20
    lda.w #0x027F
    cmp.b 0x08
    sep #0x20
    bcs .B847

    sta.b 0x08
    lda.b #0x1E
    jsl 0x84A333
    lda.b #0x20
    jsl _80888B
    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    lsr
    sta.b 0x1C
    cmp.w #0x0100
    sep #0x20
    bcs .B847

    lda.b #0x04
    sta.b 0x03
    lda.b #0x5E
    sta.b 0x33
    rts

.B847:
    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.w #0xFA00
    cmp.b 0x1C
    bmi .B856

    sta.b 0x1C
.B856:
    sep #0x20
    rts

.B859:
    dec.b 0x33
    bne .B86B

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rep #0x20
    tdc
    sta.w 0x1F0E
    sep #0x20
.B86B:
    rts

.B86C:
    ldx.b 0x03
    jmp (.B871,X)

.B871: d16[.B877, .B88A, .B89D]

.B877:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x00
    sta.b 0x1C
    lda.b #0x01
    sta.b 0x1D
    lda.b #0x01
    jsl _848EEA.8F07
    rts

.B88A:
    lda.b 0x0F
    bpl .B898

    lda.b #0x04
    sta.b 0x03
    lda.b #0x00
    jsl _848EEA.8F07
.B898:
    jsl _848EEA
    rts

.B89D:
    rep #0x20
    lda.w #0x0230
    cmp.b 0x08
    bcc .B8B0

    sta.b 0x08
    sep #0x20
    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
.B8B0:
    sep #0x20
    jsl update_pos_y
    jsl _848EEA
    rts

.B8BB:
    ldx.b 0x03
    bne .B8C6

    inc.b 0x03
    lda.b #0x1E
    sta.b 0x33
    rts

.B8C6:
    dec.b 0x33
    bne .B8F0

    jsl get_rng
    and.b #0x0F
    clc
    adc.b 0x39
    tax
    lda.w 0x00D5B6,X
    cmp.b #0x0C
    sta.b 0x02
    stz.b 0x03
    beq .B8EE

    lda.b 0x39
    clc
    adc.b #0x10
    cmp.b #0x60
    bcc .B8EA

    lda.b #0x50
.B8EA:
    sta.b 0x39
    bra .B8F0

.B8EE:
    stz.b 0x39
.B8F0:
    jsl _848EEA
    rts

.B8F5:
    ldx.b 0x03
    bne .B91D

    inc.b 0x03
    rep #0x30
    ldx.w #0x0180
    lda.b 0x05
    cmp.w #0x1180
    bcc .B90A

    ldx.w #0xFE80
.B90A:
    stx.b 0x1A
    sep #0x30
    lda.b 0x27
    and.b #0x7F
    cmp.b #0x10
    bcs .B91C

    rep #0x20
    asl.b 0x1A
    sep #0x20
.B91C:
    rts

.B91D:
    jsr .BCDA
    bne .B929

    lda.b #0x0E
    sta.b 0x02
    stz.b 0x03
    rts

.B929:
    jsl _848EEA
    jsl update_pos_x
    lda.b 0x1B
    bmi .B94B

    rep #0x20
    lda.w #0x11C0
    cmp.b 0x05
    bcs .B954

.B93E:
    sta.b 0x05
    sep #0x20
    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    stz.b 0x3B
    rts

.B94B:
    rep #0x20
    lda.w #0x1140
    cmp.b 0x05
    bcs .B93E

.B954:
    sep #0x20
    rts

.B957:
    ldx.b 0x03
    jmp (.B95C,X)

.B95C: d16[.B962, .B98F, .B9AE]

.B962:
    lda.b #0x02
    sta.b 0x03
    rep #0x30
    ldx.w #0x0199
    lda.b 0x05
    cmp.w #0x1180
    bcc .B975

    ldx.w #0xFE67
.B975:
    stx.b 0x1A
    lda.w #0xFECD
    sta.b 0x1C
    sep #0x30
    lda.b 0x27
    and.b #0x7F
    cmp.b #0x10
    bcs .B98E

    rep #0x20
    asl.b 0x1A
    asl.b 0x1C
    sep #0x20
.B98E:
    rts

.B98F:
    rep #0x20
    lda.w #0x027F
    cmp.b 0x08
    bcs .B9A3

    sta.b 0x08
    ldx.b #0x04
    stx.b 0x03
    lda.w #0x0100
    sta.b 0x1C
.B9A3:
    sep #0x20
    jsl 0x82820A
    jsl _848EEA
    rts

.B9AE:
    rep #0x20
    lda.w #0x0230
    cmp.b 0x08
    bcc .B9C1

    sta.b 0x08
    sep #0x20
    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
.B9C1:
    sep #0x20
    jsl update_pos_y
    jsl _848EEA
    rts

.B9CC:
    ldx.b 0x03
    jmp (.B9D1,X)

.B9D1: d16[.B9DB, .B9F8, .BA19, .BA65, .BA80]

.B9DB:
    lda.b #0x02
    sta.b 0x03
    stz.w 0x1F3F
    rep #0x30
    ldx.b 0x37
    ldy.w #0x0100
    lda.w 0x0005,X
    cmp.b 0x05
    bcs .B9F3

    ldy.w #0xFF00
.B9F3:
    sty.b 0x1A
    sep #0x30
    rts

.B9F8:
    jsr .BD12
    bcs .BA10

    lda.b #0x04
    sta.b 0x03
    lda.b #0x0A
    sta.b 0x26
    rep #0x20
    lda.w #0x0000
    sta.b 0x1C
    stz.b 0x1A
    sep #0x20
.BA10:
    jsl update_pos_x
    jsl _848EEA
    rts

.BA19:
    rep #0x20
    lda.w #0x027F
    cmp.b 0x08
    sep #0x20
    bcs .BA53

    sta.b 0x08
    lda.b #0x1E
    jsl 0x84A333
    lda.b #0x20
    jsl _80888B
    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    lsr
    sta.b 0x1C
    cmp.w #0x0100
    sep #0x20
    bcs .BA53

    lda.b #0x06
    sta.b 0x03
    lda.b #0x04
    sta.b 0x26
    lda.b #0x01
    jsl _848EEA.8F07
    rts

.BA53:
    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.w #0xFA00
    cmp.b 0x1C
    bmi .BA62

    sta.b 0x1C
.BA62:
    sep #0x20
    rts

.BA65:
    lda.b 0x0F
    bpl .BA7B

    lda.b #0x08
    sta.b 0x03
    lda.b #0x00
    sta.b 0x1C
    lda.b #0x01
    sta.b 0x1D
    lda.b #0x00
    jsl _848EEA.8F07
.BA7B:
    jsl _848EEA
    rts

.BA80:
    rep #0x20
    lda.w #0x0230
    cmp.b 0x08
    bcc .BA97

    sta.b 0x08
    sep #0x20
    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
    sta.w 0x1F3F
    rts

.BA97:
    sep #0x20
    jsl update_pos_y
    rts

.BA9E:
    ldx.b 0x03
    jmp (.BAA3,X)

.BAA3: d16[.BAB3, .BAD0, .BAFF, .BB21, .BB38, .BB5C, .BB89, .BB99]

.BAB3:
    lda.b #0x02
    sta.b 0x03
    rep #0x30
    ldx.w #0x0180
    lda.w #0x11C0
    cmp.b 0x05
    bcs .BAC6

    ldx.w #0xFE80
.BAC6:
    stx.b 0x1A
    sep #0x30
    stz.b 0x3A
    stz.w 0x1F40
    rts

.BAD0:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x11C0
    bpl .BADE

    eor.w #0xFFFF
    inc
.BADE:
    cmp.w #0x0002
    bcs .BAF4

    lda.w #0x11C0
    sta.b 0x05
    lda.w #0xFEC0
    sta.b 0x1C
    sep #0x20
    lda.b #0x04
    sta.b 0x03
    rts

.BAF4:
    sep #0x20
    jsl update_pos_x
    jsl _848EEA
    rts

.BAFF:
    rep #0x20
    lda.w #0x025F
    cmp.b 0x08
    bcs .BB16

    sta.b 0x08
    sep #0x20
    lda.b #0x06
    sta.b 0x03
    lda.b #0x80
    tsb.w 0x1F40
    rts

.BB16:
    sep #0x20
    jsl update_pos_y
    jsl _848EEA
    rts

.BB21:
    lda.w 0x1F40
    cmp.b #0xC0
    bne .BB33

    lda.b #0x08
    sta.b 0x03
    lda.b #0x78
    sta.b 0x33
    jmp _88BD28.BD32

.BB33:
    jsl _848EEA
    rts

.BB38:
    jsl _848EEA
    dec.b 0x33
    bne .BB59

    lda.b #0x0A
    sta.b 0x03
    ldx.b #0x5E
    lda.b 0x27
    and.b #0x7F
    cmp.b #0x10
    bcs .BB50

    ldx.b #0x14
.BB50:
    stx.b 0x33
    lda.b 0x36
    sta.b 0x11
    jmp _88BD71

.BB59:
    jmp _88BD97

.BB5C:
    jsl _848EEA
    dec.b 0x33
    bne .BB88

    jsl get_rng
    and.b #0x0F
    clc
    adc.b 0x3A
    tax
    lda.w 0x00D616,X
    cmp.b #0x06
    sta.b 0x03
    bne .BB86

    lda.b 0x3A
    clc
    adc.b #0x10
    cmp.b #0x30
    bcc .BB82

    lda.b #0x20
.BB82:
    sta.b 0x3A
    bra .BB88

.BB86:
    stz.b 0x3A
.BB88:
    rts

.BB89:
    lda.b #0x0E
    sta.b 0x03
    lda.b #0x00
    sta.b 0x1C
    lda.b #0x02
    sta.b 0x1D
    stz.w 0x1F41
    rts

.BB99:
    rep #0x20
    lda.w #0x0230
    cmp.b 0x08
    bcc .BBB0

    sta.b 0x08
    sep #0x20
    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
    sta.w 0x1F41
    rts

.BBB0:
    sep #0x20
    jsl update_pos_y
    jsl _848EEA
    rts

.BBBB:
    ldx.b 0x02
    jmp (.BBC0,X)

.BBC0: d16[.BBCC, .BBF2, .BC30, .BC6C, .BCB5, .BCD6]

.BBCC:
    lda.b #0x02
    sta.b 0x02
    ldy.b #0x02
    lda.b #0xF6
    jsl _808850.8868
    lda.b #0x30
    tsb.w 0x0BB9
    lda.b #0xFF
    sta.b 0x33
    jsr _88BD71
    lda.b 0x36
    sta.b 0x11
    lda.b #0x0A
    jsl _848EEA.8F07
    jml 0x8280B4

.BBF2:
    lda.w 0x0B9C
    and.b #0x1F
    bne .BBFF

    lda.b #0x20
    jsl 0x84A333
.BBFF:
    dec.b 0x33
    bne .BC07

    lda.b #0x04
    sta.b 0x02
.BC07:
    rep #0x20
    lda.w #0xFFE0
    sta.w 0x0000
    lda.w #0xFFF0
    sta.w 0x0002
    lda.w #0x003F
    sta.w 0x0004
    lda.w #0x001F
    sta.w 0x0006
    sep #0x20
    lda.b #0x03
    sta.w 0x0008
    jsl _82808F.80B4
    jml 0x84A4C6

.BC30:
    lda.b #0x06
    sta.b 0x02
    phb
    rep #0x30
    ldx.w #0xD529
    ldy.w #0x0AA1
    lda.w #0x0006
    mvn 0x00,0x86
    ldx.w #0xD530
    ldy.w #0x0B22
    lda.w #0x0009
    mvn 0x00,0x86
    jsr _88ADFC
    sep #0x30
    plb
    lda.b #0x3F
    sta.w 0x00CA
    stz.w 0x00CB
    lda.b #0x01
    sta.b 0x3D
    jsr _88AD92
    lda.b #0xC0
    sta.b 0x33
    jml 0x8280B4

.BC6C:
    lda.w 0x0B9C
    and.b #0x01
    bne .BC7B

    lda.b 0x3D
    cmp.b #0x1F
    beq .BC7B

    inc.b 0x3D
.BC7B:
    lda.b 0x33
    cmp.b #0xB0
    bne .BC87

    lda.b #0x21
    jsl _80888B
.BC87:
    dec.b 0x33
    lda.b 0x33
    bne .BCA3

    lda.b #0x08
    sta.b 0x02
    lda.b #0x1F
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    stz.w 0x0AA1
    inc.w 0x1F3F
    rtl

.BCA3:
    cmp.b #0xB0
    bcc .BCAE

    jsr _88AD92
    jml 0x8280B4

.BCAE:
    jsr _88ADB9
    jml 0x8280B4

.BCB5:
    lda.w 0x0B9C
    and.b #0x01
    bne .BCD5

    dec.w 0x00CB
    dec.w 0x00CC
    dec.w 0x00CD
    bne .BCD5

    lda.b #0x01
    sta.w 0x1F23
    lda.b #0x03
    sta.w 0x1F7B
    lda.b #0x0A
    sta.b 0x02
.BCD5:
    rtl

.BCD6:
    jml 0x828398

.BCDA:
    rep #0x30
    ldx.b 0x37
    lda.w 0x0005,X
    sec
    sbc.b 0x05
    bpl .BCEA

    eor.w #0xFFFF
    inc
.BCEA:
    cmp.w #0x0020
    bcs .BD0D

    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bpl .BCFB

    eor.w #0xFFFF
    inc
.BCFB:
    cmp.w #0x0020
    bcs .BD0D

    sep #0x30
    inc.b 0x3B
    lda.b 0x3B
    cmp.b #0x03
    bcs .BD0D

    lda.b #0x00
    rts

.BD0D:
    sep #0x30
    lda.b #0x01
    rts

;-----

.BD12:
    rep #0x30
    ldx.b 0x37
    lda.w 0x0005,X
    sec
    sbc.b 0x05
    bpl .BD22

    eor.w #0xFFFF
    inc
.BD22:
    cmp.w #0x0002
    sep #0x30
    rts
