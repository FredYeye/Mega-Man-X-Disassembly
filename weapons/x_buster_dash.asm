x_buster_dash:
    ldx.b 0x01
    jsr (.A4C8,X)
    rtl

.A4C8: d16[.A4D2, .A50A, .A51B, .A53B, .A53B] 

.A4D2:
    jsr _81A54C
    inc.w 0x0C0B
    rep #0x20
    lda.w #0x0600
    bit.b 0x10
    bvs .A4E4

    lda.w #0xFA00
.A4E4:
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0xBE20
    sta.b 0x20
    sep #0x20
    lda.w 0x1F9D
    bpl .A4F7

    stz.w 0x1F9B
.A4F7:
    stz.b 0x1F
    stz.b 0x1E
    jsl _82808F.80B4
    lda.b #0x08
    sta.b 0x16
    lda.b #0x04
    jsl _848EEA.8F07
    rts

.A50A:
    jsl update_pos_xy.neg_ay_ax
    jsl _82808F.80B4
    lda.b 0x0E
    beq .A541

    jsl _848EEA
    rts

.A51B:
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    lda.w #0x0300
    sta.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    jsl _82808F.80B4
    inc.b 0x30
    lda.b #0x02
    sta.b 0x01
    rts

.A53B:
    inc.b 0x30
    jsl 0x84A51A
.A541:
    dec.w 0x0BDD
    dec.w 0x0C0B
    jsl _8283A3
    rts
