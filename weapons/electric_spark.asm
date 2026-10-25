electric_spark:
    ldx.b 0x01
    jsr (.9661,X)
    rtl

.9661: d16[.966D, .96B8, .96A0, .9748, .9748, .9767]

.966D:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x18
    sta.b 0x30
    stz.b 0x12
    lda.b 0x0B
    bne .9688

    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    jsl _839518
.9688:
    lda.b 0x0B
    beq .9690

    lda.b #0x04
    sta.b 0x02
.9690:
    rep #0x20
    lda.w #0xBF37
    sta.b 0x20
    stz.b 0x29
    sep #0x20
    lda.b #0x47
    sta.b 0x16
    rts

.96A0:
    lda.b 0x0B
    bne .96B0

    lda.b #0x02
    sta.b 0x01
    sta.b 0x02
    stz.b 0x03
    stz.b 0x2D
    bra .96B8

.96B0:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.b 0x02
.96B8:
    ldx.b 0x02
    jsr (.96CA,X)
    jsl _82808F.80B4
    lda.b 0x0E
    bne .96C9

    lda.b #0x0A
    sta.b 0x01
.96C9:
    rts

.96CA: d16[.96D0, .9710, .9730]

.96D0:
    ldx.b 0x03
    bne .96EF

    inc.b 0x03
    stz.b 0x30
    rep #0x21
    lda.w #0x0300
    bit.b 0x10
    bvs .96E4

    lda.w #0xFD00
.96E4:
    sta.b 0x1A
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.96EF:
    jsl _8490A0
    cmp.b #0x34
    bcs .96FF

    cmp.b #0x0D
    bcs .9707

    cmp.b #0x01
    bcc .9707

.96FF:
    sta.b 0x2D
    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.9707:
    jsl update_pos_x
    jsl _848EEA
    rts

.9710:
    ldx.b 0x03
    bne .971F

    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    jsl _848EEA.8F07
    rts

.971F:
    lda.b 0x0F
    bpl .972B

    lda.b #0x0A
    sta.b 0x01
    jml .9771

.972B:
    jsl _848EEA
    rts

.9730:
    ldx.b 0x03
    bne .973F

    inc.b 0x03
    stz.b 0x30
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.973F:
    jsl update_pos_xy.no_accel
    jsl _848EEA
    rts

.9748:
    ldx.b 0x02
    bne .9756

    inc.b 0x02
    lda.b #0x01
    sta.b 0x30
    jsl _848EEA.8F07
.9756:
    lda.b 0x0F
    bpl .975E

    lda.b #0x0A
    sta.b 0x01
.975E:
    jsl _848EEA
    jsl _82808F.80B4
    rts

.9767:
    inc.b 0x30
    dec.w 0x0BDD
    jsl _8283A3
    rts

.9771:
    rep #0x10
    ldy.w #0x0001
.9776:
    jsl _82833E
    bne .97A5

    inc.w 0x0000,X
    inc.w 0x0BDD
    lda.b #0x0C
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b #0x01
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    jsr .97A8
    dey
    bpl .9776

.97A5:
    sep #0x10
    rts

//-----

.97A8:
    lda.b 0x2D
    cmp.b #0x34
    bcs .97DD

.97AE:
    phy
    rep #0x20
    and.w #0x00FF
    asl
    asl
    tay
    lda 0x00BF37,Y
    sta.w 0x001A,X
    lda 0x00BF39,Y
    sta.w 0x001C,X
    ply
    beq .97DA

    lda.w 0x001A,X
    eor.w #0xFFFF
    inc
    sta.w 0x001A,X
    lda.w 0x001C,X
    eor.w #0xFFFF
    inc
    sta.w 0x001C,X
.97DA:
    sep #0x20
    rts

.97DD:
    cmp.b #0x39
    beq .97FB

    cmp.b #0x3A
    beq .97FB

    rep #0x20
    stz.w 0x001A,X
    lda.w #0x0600
    cpy.w #0x0000
    beq .97F5

    lda.w #0xFA00
.97F5:
    sta.w 0x001C,X
    sep #0x20
    rts

.97FB:
    phy
    lda.b #0xF0
    sta.b 0x2A
    jsl _8490A0
    ply
    bra .97AE
