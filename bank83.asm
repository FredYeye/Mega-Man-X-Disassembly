org 0x8000*3
base 0x838000

;-----

_838000:
    rep #0x20
    lda.w 0x0BDE
    sta.b 0x36
    lda.w 0x0BE2
    sta.b 0x3A
    lda.b 0x05
    sta.b 0x22
    lda.b 0x08
    sta.b 0x24
    sep #0x20
    ldx.b 0x01
    jsr (.8028,X)
    lda.b #0x80
    trb.b 0x27
    lda.b 0x11
    and.b #0x3F
    ora.b 0x33
    sta.b 0x11
    rtl

.8028: d16[.802E, .806C, .8600]

.802E:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x4A
    sta.b 0x16
    sta.b 0x30
    lda.l 0x7F8249
    sta.b 0x18
    lda.b #0x10
    sta.b 0x27
    lda.b #0x02
    sta.b 0x12
    stz.b 0x2F
    stz.b 0x0A
    stz.b 0x10
    stz.b 0x0C
    stz.b 0x0D
    stz.b 0x2C
    stz.b 0x47
    stz.b 0x32
    stz.b 0x26
    stz.b 0x3E
    stz.b 0x0F
    stz.b 0x1F
    lda.b #0x40
    sta.b 0x1E
    rep #0x20
    lda.w #0xBB4F
    sta.b 0x20
    sep #0x20
    rts

.806C:
    jsr _838948
    bcc .8076

    jsl 0x828398
    rts

.8076:
    lda.l 0x7F8349
    ora.b 0x33
    sta.b 0x11
    lda.b 0x27
    bpl .80B7

    cmp.b #0x80
    bne .80A0

    lda.b #0x80
    tsb.b 0x0A
    lda.b #0x1E
    sta.b 0x47
    sta.b 0x32
    stz.b 0x26
    ldx.b #0x02
    lda.b 0x2B
    bit.b #0x04
    bne .809C

    ldx.b #0x18
.809C:
    txa
    jsr _8386F1
.80A0:
    lda.b #0x0D
    jsr _83CD15
    lda.b #0x09
    jsl _80888B.88B6
    lda.b #0x02
    tsb.b 0x0A
    lda.b #0x02
    sta.b 0x40
    lda.b #0x0E
    trb.b 0x11
.80B7:
    lda.b 0x26
    beq .80CA

    dec.b 0x26
    bne .80CA

    bit.b 0x0A
    bvc .80CA

    lda.b #0x01
    sta.w 0x0BB6
    stz.b 0x30
.80CA:
    lda.b 0x0A
    and.b #0x41
    cmp.b #0x41
    bne .80DB

    lda.b #0x01
    trb.b 0x0A
    lda.b #0x16
    jsr _8386F1
.80DB:
    jsr _83875B
    jsr _83879E
    ldx.b 0x02
    jsr (.810F,X)
    jsr _8388C4
    jsl 0x8491BE
    bit.b 0x0A
    bvc .80F4

    jsr _838747
.80F4:
    jsr _838810
    jsr _838824
    lda.b 0x0A
    bit.b #0x04
    bne .8109

    lda.b 0x26
    lsr
    bcs .8109

    jsl 0x82808F
.8109:
    jsr _83884C
    jmp _8387BB

.810F: d16[
    .8129, .8188, .81DD, .8247, .826F, .82D9, .8350, .83BB,
    .8437, .848D, .84DD, .850A, .857C,
]

.8129:
    ldx.b 0x03
    bne .813F

    inc.b 0x03
    rep #0x20
    lda.w #0xBB4F
    sta.b 0x20
    sep #0x20
    lda.b #0x09
    jsl 0x848F07
    rts

.813F:
    lda.b 0x2B
    bit.b #0x04
    bne .814A

    lda.b #0x18
    jmp _8386F1

.814A:
    lda.b 0x0A
    bmi .8187

    bit.b #0x02
    bne .8187

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .8187

    lda.w 0x1F9E
    bmi .8187

    lda.w 0x1F23
    bne .8187

    lda.w 0x0BCF
    and.b #0x7F
    beq .8187

    lda.b #0x14
    sta.b 0x02
    stz.b 0x03
    rep #0x20
    lda.w #0xBB45
    sta.b 0x20
    sep #0x20
    lda.b #0x09
    jsr _8386EA
    jsr _838605
.8187:
    rts

.8188:
    ldx.b 0x03
    bne .81A1

    inc.b 0x03
    lda.b #0x78
    sta.b 0x34
    lda.b #0x01
    sta.b 0x35
    lda.b #0x00
    jsr _8386EA
    lda.b #0x00
    jsl 0x848F07
.81A1:
    jsr _8386DF
    beq .81AB

    lda.b #0x16
    jmp _8386F1

.81AB:
    lda.b 0x2B
    bit.b #0x04
    bne .81B6

    lda.b #0x18
    jmp _8386F1

.81B6:
    lda.b 0x0A
    bmi .81DC

    bit.b #0x02
    bne .81DC

    jsr _838735
    beq .81C8

    lda.b #0x04
    jmp _8386F1

.81C8:
    lda.b 0x3B
    bit.b #0x80
    beq .81D3

    lda.b #0x08
    jmp _8386F1

.81D3:
    bit.b #0x40
    beq .81DC

    lda.b #0x06
    jmp _8386F1

.81DC:
    rts

.81DD:
    ldx.b 0x03
    bne .81F6

    inc.b 0x03
    lda.b #0x78
    sta.b 0x34
    lda.b #0x01
    sta.b 0x35
    lda.b #0x01
    jsr _8386EA
    lda.b #0x01
    jsl 0x848F07
.81F6:
    jsr _8386DF
    beq .8200

    lda.b #0x16
    jmp _8386F1

.8200:
    lda.b 0x2B
    bit.b #0x04
    bne .820B

    lda.b #0x18
    jmp _8386F1

.820B:
    lda.b 0x0A
    bit.b #0x02
    bne .8236

    jsr _838735
    bne .821B

    lda.b #0x02
    jmp _8386F1

.821B:
    lda.b 0x3B
    bit.b #0x80
    beq .8226

    lda.b #0x08
    jmp _8386F1

.8226:
    bit.b #0x40
    beq .822F

    lda.b #0x06
    jmp _8386F1

.822F:
    jsr _8386F6
    jsl 0x82823E
.8236:
    jsl 0x848EEA
    lda.b 0x0F
    and.b #0x03
    beq .8246

    ora.b #0x38
    jsl _80888B.88B6
.8246:
    rts

.8247:
    ldx.b 0x03
    bne .8261

    inc.b 0x03
    lda.b #0x19
    jsr _838933
    inc
    sta.w 0x1F0D
    lda.b #0x02
    jsr _8386EA
    lda.b #0x02
    jsl 0x848F07
.8261:
    lda.b 0x0F
    bpl .826A

    lda.b #0x02
    jmp _8386F1

.826A:
    jsl 0x848EEA
    rts

.826F:
    ldx.b 0x03
    bne .829D

    inc.b 0x03
    rep #0x20
    stz.b 0x1A
    lda.w #0x0553
    sta.b 0x1C
    lda.w #0x0040
    sta.b 0x1E
    sep #0x20
    lda.b #0x0C
    jsr _83CD15
    inc.b 0x2F
    lda.b #0x38
    jsl _80888B.88B6
    lda.b #0x03
    jsr _8386EA
    lda.b #0x03
    jsl 0x848F07
.829D:
    lda.b 0x3B
    bit.b #0x40
    beq .82A8

    lda.b #0x0C
    jmp _8386F1

.82A8:
    jsr _8386DF
    beq .82B2

    lda.b #0x16
    jmp _8386F1

.82B2:
    lda.b 0x0A
    bit.b #0x02
    bne .82D8

    stz.b 0x1A
    stz.b 0x1B
    jsr _838707
    lda.b 0x2B
    bit.b #0x08
    bne .82CF

    lda.b 0x1D
    bmi .82CF

    lda.b 0x37
    bit.b #0x80
    bne .82D4

.82CF:
    lda.b #0x18
    jmp _8386F1

.82D4:
    jsl 0x828174
.82D8:
    rts

.82D9:
    ldx.b 0x03
    bne .830E

    inc.b 0x03
    stz.b 0x2F
    lda.b #0x78
    sta.b 0x34
    lda.b #0x01
    sta.b 0x35
    ldx.b #0x02
    ldy.b #0x01
    lda.b #0x0A
    jsl 0x84A33C
    jsr _83CD3E
    jsr _83CD69
    lda.b #0x39
    jsl _80888B.88B6
    lda.b #0x04
    jsr _8386EA
    lda.b #0x04
    jsl 0x848F07
    lda.b #0x04
    tsb.b 0x2B
.830E:
    jsr _8386DF
    beq .8318

    lda.b #0x16
    jmp _8386F1

.8318:
    lda.b 0x0F
    bpl .8321

    lda.b #0x02
    jmp _8386F1

.8321:
    lda.b 0x0A
    bmi .834B

    bit.b #0x02
    bne .834B

    lda.b 0x2B
    bit.b #0x04
    bne .8334

    lda.b #0x18
    jmp _8386F1

.8334:
    lda.b 0x3B
    bit.b #0x40
    beq .833F

    lda.b #0x06
    jmp _8386F1

.833F:
    jsr _838735
    beq .834B

    jsr _8386F6
    jsl 0x82823E
.834B:
    jsl 0x848EEA
    rts

.8350:
    ldx.b 0x03
    bne .836A

    inc.b 0x03
    lda.b #0x19
    jsr _838933
    inc
    sta.w 0x1F0D
    lda.b #0x05
    jsr _8386EA
    lda.b #0x05
    jsl 0x848F07
.836A:
    lda.b 0x2B
    bit.b #0x04
    beq .8375

    lda.b #0x0A
    jmp _8386F1

.8375:
    lda.b 0x0A
    bit.b #0x02
    bne .83B6

    stz.b 0x1A
    stz.b 0x1B
    jsr _83871D
    lda.b 0x2B
    bit.b #0x08
    bne .8392

    lda.b 0x1D
    bmi .8396

    lda.b 0x37
    bit.b #0x80
    bne .8396

.8392:
    stz.b 0x1C
    stz.b 0x1D
.8396:
    lda.b 0x0F
    bpl .83A5

    ldx.b #0x08
    lda.b 0x1D
    bpl .83A2

    ldx.b #0x18
.83A2:
    stx.b 0x02
    rts

.83A5:
    rep #0x20
    lda.w #0xFA80
    cmp.b 0x1C
    bmi .83B0

    sta.b 0x1C
.83B0:
    sep #0x20
    jsl 0x828174
.83B6:
    jsl 0x848EEA
    rts

.83BB:
    ldx.b 0x03
    bne .83EA

    inc.b 0x03
    rep #0x20
    lda.w #0x0400
    sta.b 0x34
    bit.b 0x32
    bvs .83CF

    lda.w #0xFC00
.83CF:
    sta.b 0x1A
    sep #0x20
    stz.b 0x31
    lda.b #0x40
    sta.b 0x2C
    lda.b #0x3B
    jsl _80888B.88B6
    lda.b #0x06
    jsr _8386EA
    lda.b #0x06
    jsl 0x848F07
.83EA:
    jsr _83CDB0
    jsr _8386DF
    beq .83F7

    lda.b #0x16
    jmp _8386F1

.83F7:
    lda.b 0x0A
    bit.b #0x02
    bne .8432

    lda.b 0x3B
    bit.b #0x80
    beq .8408

    lda.b #0x08
    jmp _8386F1

.8408:
    bit.b #0x40
    beq .8411

    lda.b #0x12
    jmp _8386F1

.8411:
    lda.b 0x2B
    bit.b #0x04
    bne .841C

    lda.b #0x18
    jmp _8386F1

.841C:
    bit.b #0x03
    bne .8425

    jsr _838969
    bne .842A

.8425:
    lda.b #0x10
    jmp _8386F1

.842A:
    jsl 0x82823E
    dec.b 0x2C
    bmi .8425

.8432:
    jsl 0x848EEA
    rts

.8437:
    ldx.b 0x03
    bne .8450

    inc.b 0x03
    lda.b #0x78
    sta.b 0x34
    lda.b #0x01
    sta.b 0x35
    lda.b #0x07
    jsr _8386EA
    lda.b #0x07
    jsl 0x848F07
.8450:
    jsr _8386DF
    beq .845A

    lda.b #0x16
    jmp _8386F1

.845A:
    lda.b 0x0A
    bit.b #0x02
    bne .8488

    lda.b 0x0F
    bpl .8469

    lda.b #0x02
    jmp _8386F1

.8469:
    lda.b 0x3B
    bit.b #0x80
    beq .8474

    lda.b #0x08
    jmp _8386F1

.8474:
    bit.b #0x40
    beq .847D

    lda.b #0x06
    jmp _8386F1

.847D:
    lda.b 0x37
    bit.b #0x03
    beq .8488

    lda.b #0x04
    jmp _8386F1

.8488:
    jsl 0x848EEA
    rts

.848D:
    ldx.b 0x03
    bne .84A7

    inc.b 0x03
    lda.b #0x1A
    jsr _838933
    inc
    sta.w 0x1F0D
    lda.b #0x08
    jsr _8386EA
    lda.b #0x08
    jsl 0x848F07
.84A7:
    dec.b 0x2C
    lda.b 0x2B
    bit.b #0x04
    bne .84B4

    lda.b #0x18
    jmp _8386F1

.84B4:
    lda.b 0x0A
    bit.b #0x02
    bne .84D8

    lda.b 0x2B
    bit.b #0x03
    bne .84C4

    lda.b 0x0F
    bpl .84CF

.84C4:
    ldx.b #0x0E
    lda.b 0x2C
    bpl .84CC

    ldx.b #0x10
.84CC:
    stx.b 0x02
    rts

.84CF:
    jsr _838969
    beq .84D8

    jsl 0x82823E
.84D8:
    jsl 0x848EEA
    rts

.84DD:
    ldx.b 0x03
    bne .84EE

    inc.b 0x03
    lda.b #0x09
    jsr _8386EA
    lda.b #0x09
    jsl 0x848F07
.84EE:
    lda.b 0x0F
    bpl .84FF

    lda.b 0x26
    bne .84F8

    stz.b 0x30
.84F8:
    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    rts

.84FF:
    lsr
    bcc .8505

    jsr _83CD3E
.8505:
    jsl 0x848EEA
    rts

.850A:
    ldx.b 0x03
    bne .855B

    inc.b 0x03
    inc.b 0x30
    rep #0x20
    stz.b 0x41
    stz.b 0x43
    lda.w #0x0040
    sta.b 0x45
    sep #0x20
    lda.b 0x0A
    bit.b #0x02
    bne .8535

    rep #0x20
    stz.b 0x1A
    lda.w #0x01DC
    sta.b 0x1C
    lda.w #0x0040
    sta.b 0x1E
    sep #0x20
.8535:
    bit.b 0x0A
    bvc .854A

    lda.b 0x0A
    bit.b #0x02
    bne .8547

    rep #0x20
    stz.b 0x1C
    stz.b 0x1E
    sep #0x20
.8547:
    jsr _838673
.854A:
    lda.b 0x2B
    bit.b #0x04
    bne .8555

    lda.b #0x18
    jmp _8386F1

.8555:
    lda.b #0x0A
    jsl 0x848F07
.855B:
    lda.b 0x2B
    bit.b #0x04
    beq .8565

    stz.b 0x1C
    stz.b 0x1D
.8565:
    lda.b 0x0F
    bpl .856D

    stz.b 0x02
    stz.b 0x03
.856D:
    lda.b 0x0A
    bit.b #0x02
    bne .8577

    jsl 0x828174
.8577:
    jsl 0x848EEA
    rts

.857C:
    ldx.b 0x03
    bne .85A0

    inc.b 0x03
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    lda.w #0x0040
    sta.b 0x1E
    sep #0x20
    inc.b 0x2F
    bit.b 0x0A
    bvc .859A

    lda.b #0x03
    jsr _8386EA
.859A:
    lda.b #0x03
    jsl 0x848F07
.85A0:
    bit.b 0x0A
    bvc .85AE

    jsr _8386DF
    beq .85AE

    lda.b #0x16
    jmp _8386F1

.85AE:
    lda.b 0x2B
    bit.b #0x04
    beq .85CE

    bit.b 0x0A
    bvs .85C9

    stz.b 0x2F
    ldx.b #0x02
    ldy.b #0x01
    lda.b #0x0A
    jsl 0x84A33C
    lda.b #0x16
    jmp _8386F1

.85C9:
    lda.b #0x0A
    jmp _8386F1

.85CE:
    lda.b 0x0A
    bit.b #0x02
    bne .85FD

    lda.b 0x0A
    bmi .85EE

    bit.b 0x0A
    bvc .85EE

    lda.b 0x3B
    bit.b #0x40
    beq .85E7

    lda.b #0x0C
    jmp _8386F1

.85E7:
    stz.b 0x1A
    stz.b 0x1B
    jsr _838707
.85EE:
    rep #0x20
    lda.w #0xFA80
    cmp.b 0x1C
    bmi .85F9

    sta.b 0x1C
.85F9:
    jsl 0x828174
.85FD:
    sep #0x20
    rts

.8600:
    jsl 0x828398
    rts

;-----

_838605:
    lda.b #0x2C
    sta.w 0x0BAA
    stz.w 0x0BAB
    sta.w 0x0BD8
    sta.w 0x0C0C
    sta.w 0x0C24
    stz.w 0x0C00
    stz.w 0x0C03
    stz.w 0x0C13
    stz.w 0x0BD3
    lda.b #0x01
    sta.w 0x0BB6
    lda.b #0x17
    jsl _80888B.88B6
    ldx.b #0x6A
    lda.w 0x1F99
    bit.b #0x01
    beq .8637

    inx
.8637:
    stx.w 0x0BBE
    lda.b #0x6C
    sta.w 0x0C48
    sta.w 0x0C68
    sta.w 0x0C88
    stz.w 0x0C39
    stz.w 0x0C59
    stz.w 0x0C79
    rep #0x31
    lda.w 0x0BDB
    and.w #0x00FF
    adc.w #0x0100
    tay
    jsl 0x828011
    lda.w #0xA8A5
    sta.w 0x0BD9
    lda.w #0xBB59
    sta.w 0x0BC8
    sep #0x30
    lda.b #0x40
    tsb.b 0x0A
    jmp _838747

;-----

_838673:
    lda.b #0x06
    sta.w 0x0BAA
    stz.w 0x0BAB
    stz.w 0x0BD8
    stz.w 0x0C0C
    stz.w 0x0C24
    lda.b #0x01
    sta.w 0x0BB6
    lda.b #0x5D
    sta.w 0x0C48
    sta.w 0x0C68
    sta.w 0x0C88
    stz.w 0x0C39
    stz.w 0x0C59
    stz.w 0x0C79
    rep #0x30
    lda.w #0x0178
    ldx.b 0x34
    cpx.w #0x0178
    beq .86AC

    lda.w #0x0375
.86AC:
    sta.w 0x0C04
    stz.w 0x0BC2
    lda.w #0x0553
    sta.w 0x0BC4
    lda.w #0xA555
    sta.w 0x0BC8
    lda.w #0xA597
    sta.w 0x0BD9
    sep #0x30
    ldx.b #0x00
    lda.w 0x1F99
    bit.b #0x01
    beq .86D1

    ldx.b #0x18
.86D1:
    stx.w 0x0BBE
    stz.w 0x0BC7
    lda.b #0x40
    sta.w 0x0BC6
    trb.b 0x0A
    rts

;-----

_8386DF:
    lda.b 0x37
    bit.b #0x08
    beq .86E9

    lda.b 0x3B
    bit.b #0x80
.86E9:
    rts

;-----

_8386EA:
    sta.w 0x0C23
    stz.w 0x0BAB
    rts

;-----

_8386F1:
    sta.b 0x02
    stz.b 0x03
    rts

;-----

_8386F6:
    rep #0x20
    lda.w #0x0178
    bit.b 0x32
    bvs .8702

    lda.w #0xFE88
.8702:
    sta.b 0x1A
    sep #0x20
    rts

;-----

_838707:
    jsr _838735
    beq .871C

    rep #0x20
    lda.b 0x34
    bit.b 0x32
    bvs .8718

    eor.w #0xFFFF
    inc
.8718:
    sta.b 0x1A
    sep #0x20
.871C:
    rts

;-----

_83871D:
    lda.b 0x37
    and.b #0x03
    beq .8734

    tax
    rep #0x20
    lda.b 0x34
    cpx.b #0x01
    beq .8730

    eor.w #0xFFFF
    inc
.8730:
    sta.b 0x1A
    sep #0x20
.8734:
    rts

;-----

_838735:
    lda.b 0x37
    bit.b #0x02
    beq .873E

    stz.b 0x33
    rts

.873E:
    bit.b #0x01
    beq .8746

    lda.b #0x40
    sta.b 0x33
.8746:
    rts

;-----

_838747:
    rep #0x20
    lda.b 0x05
    sta.w 0x0BAD
    lda.b 0x08
    sta.w 0x0BB0
    sep #0x20
    lda.b 0x33
    sta.w 0x0C11
.875A:
    rts

;-----

_83875B:
    lda.b 0x0A
    bmi _838747.875A

    bit.b #0x02
    bne _838747.875A

    ldx.b 0x10
    bne .8776

    lda.b 0x3B
    and.b #0x03
    beq .8775

    sta.b 0x0D
    inc.b 0x10
    lda.b #0x0C
    sta.b 0x0C
.8775:
    rts

.8776:
    lda.b 0x0D
    bit.b 0x3B
    beq .878A

    jsr _838791
    bne .878A

    lda.b #0x08
    trb.b 0x0A
    lda.b #0x0E
    jmp _8386F1

.878A:
    dec.b 0x0C
    bne .8790

    stz.b 0x10
.8790:
    rts

;-----

_838791:
    lda.b 0x02
    cmp.b #0x02
    beq .879D

    cmp.b #0x04
    beq .879D

    cmp.b #0x0A
.879D:
    rts

;-----

_83879E:
    lda.b 0x0A
    bmi _838747.875A

    bit.b #0x02
    bne _838747.875A

    lda.b 0x3A
    bit.b #0x80
    beq .87BA

    jsr _838791
    bne .87BA

    lda.b #0x08
    tsb.b 0x0A
    lda.b #0x0E
    jmp _8386F1

.87BA:
    rts

;-----

_8387BB:
    rep #0x20
    bit.b 0x09
    bvc .87F3

    lda.w 0x1E58
    clc
    adc.w #0x0100
    sta.w 0x0000
    lda.b 0x05
    clc
    adc.w #0x0010
    cmp.w 0x0000
    bmi .87DF

    lda.w 0x1E58
    clc
    adc.w #0x00F0
    sta.b 0x05
.87DF:
    lda.b 0x05
    sec
    sbc.w #0x0010
    cmp.w 0x1E56
    bpl .87F3

    lda.w 0x1E56
    clc
    adc.w #0x0010
    sta.b 0x05
.87F3:
    lda.w 0x1E5C
    clc
    adc.w #0x00E0
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0xFFE0
    cmp.w 0x0000
    bmi .880D

    lda.w #0x0004
    sta.b 0x01
.880D:
    sep #0x20
    rts

;-----

_838810:
    bit.b 0x0A
    bvc .8823

    lda.b 0x26
    beq .8823

    ldx.b #0x01
    stx.w 0x0BB6
    lsr
    bcc .8823

    stz.w 0x0BB6
.8823:
    rts

;-----

_838824:
    lda.b 0x0A
    bpl .883C

    dec.b 0x32
    bne .883C

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x47
    sta.b 0x32
    dec.b 0x47
    bne .883C

    lda.b #0x02
    sta.b 0x3E
.883C:
    rts

;-----

_83883D:
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    rts

;-----

_83884C:
    ldx.b 0x3E
    jmp (.8851,X)

.8851: d16[.8882, .8857, .8883]

.8857:
    lda.b #0x04
    sta.b 0x3E
    lda.l 0x7F8349
    ora.b 0x33
    sta.b 0x11
    lda.b #0xFF
    sta.b 0x26
    lda.b #0x0D
    bit.b 0x0A
    bvc .8872

    jsr _838673
    lda.b #0x00
.8872:
    sta.b 0x10
    lda.b #0x04
    tsb.b 0x0A
    lda.b #0x1E
    sta.b 0x2C
    jsr _83CC43.CC4F
    jmp _83CCBA

.8882:
    rts

.8883:
    dec.b 0x2C
    bne .8890

    jsl 0x84A4AB
    lda.b #0x04
    sta.b 0x01
    rts

.8890:
    rep #0x20
    lda.b 0x10
    and.w #0x00FF
    bit.b 0x32
    bvc .889F

    eor.w #0xFFFF
    inc
.889F:
    sec
    sbc.w #0x000D
    sta.w 0x0000
    stz.w 0x0002
    lda.w #0x001F
    sta.w 0x0004
    sta.w 0x0006
    sep #0x20
    lda.b #0x07
    sta.w 0x0008
    jsl 0x82806E
    bcs .88C3

    jsl 0x84A4C6
.88C3:
    rts

;-----

_8388C4:
    ldx.b 0x40
    jmp (.88C9,X)

.88C9: d16[.88F3, .88CF, .88F4]

.88CF:
    lda.b #0x04
    sta.b 0x40
    rep #0x20
    lda.b 0x1A
    sta.b 0x41
    lda.b 0x1C
    sta.b 0x43
    lda.b 0x1E
    sta.b 0x45
    lda.b 0x3E
    and.w #0xFF00
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0x4040
    sta.b 0x1E
    sep #0x20
    stz.b 0x31
.88F3:
    rts

.88F4:
    bit.b 0x33
    bvc .88FE

    jsl 0x828195
    bra .8902

.88FE:
    jsl 0x828174
.8902:
    rep #0x20
    lda.b 0x1A
    bpl .890C

    eor.w #0xFFFF
    inc
.890C:
    cmp.w #0x0040
    sep #0x20
    bcs .8925

    lda.b #0x02
    trb.b 0x0A
    stz.b 0x40
    rep #0x20
    lda.b 0x41
    sta.b 0x1A
    lda.b 0x45
    sta.b 0x1E
    sep #0x20
.8925:
    lda.b 0x2B
    bit.b #0x04
    beq .8932

    stz.b 0x1C
    stz.b 0x1D
    jsr _83CDB0
.8932:
    rts

;-----

_838933:
    sta.w 0x0000
    jsl 0x82833E
    bne .8945

    inc.w 0x0000,X
    lda.w 0x0000
    sta.w 0x000A,X
.8945:
    sep #0x10
    rts

;-----

_838948:
    rep #0x20
    sec
    lda.b 0x05
    sbc.w 0x1E4D
    clc
    adc.w #0x0080
    cmp.w #0x0200
    bcs .8966

    sec
    lda.b 0x08
    sbc.w 0x1E50
    clc
    adc.w #0x0080
    cmp.w #0x01E0
.8966:
    sep #0x20
    rts

;-----

_838969:
    lda.b 0x0A
    bit.b #0x08
    bne .897A

    lda.b #0x01
    bit.b 0x33
    bvs .8977

    lda.b #0x02
.8977:
    bit.b 0x37
    rts

.897A:
    lda.b #0x02
    bit.b 0x33
    bvs .8982

    lda.b #0x01
.8982:
    bit.b 0x37
    bne .898B

    lda.b 0x36
    bit.b #0x80
    rts

.898B:
    lda.b #0x00
    rts

;-----

_83898E:
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

    ldx.w 0x1F7A
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    jsr _838B6A
    rep #0x21
    lda.w 0x0BB0
    adc.w 0x0002
    sta.b 0x08
    jsr _838C25
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
    jsl 0x8280B4
    rts

.8A2E: d16[.8A32, .8A57]

.8A32:
    ldx.b 0x03
    bne .8A3E

    inc.b 0x03
    lda.b #0x09
    jsl 0x848F07
.8A3E:
    lda.b 0x0F
    bpl .8A50

    jsr _838B99
    lda.b #0x04
    jsl 0x848F07
    lda.b #0x02
    jmp _8386F1

.8A50:
    jsl 0x848EEA
    jmp _838B6A

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
    jsl 0x848F07
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
    jsr _838BCE
.8AB5:
    ldx.b #0x00
    lda.b 0x1D
    bpl .8ABD

    ldx.b #0x02
.8ABD:
    stx.b 0x12
    jsr _838BF8
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
    jsl 0x828174
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
    jsl 0x8281B2
    rts

.8AF4:
    ldx.b 0x02
    jsr (.8AFE,X)
    jsl 0x8280B4
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
    jsl 0x848F07
.8B1A:
    lda.b 0x0F
    bpl .8B27

    lda.b #0x08
    sta.b 0x01
    lda.b #0x02
    sta.b 0x02
    rts

.8B27:
    jsl 0x848EEA
    jmp _838C1A

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
    jmp _838C1A

.8B54:
    dec.b 0x38
    beq .8B5B

    jmp _838C1A

.8B5B:
    lda.b 0x0B
    bne .8B62

    dec.w 0x0BDD
.8B62:
    dec.w 0x0C25
    jsl 0x8283A3
    rts

;-----

_838B6A:
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
    adc.w 0x0BAD
    sta.b 0x05
    sep #0x20
    rts

;-----

_838B99:
    ldy.b #0x01
.8B9B:
    jsl 0x82833E
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

;-----

_838BCE:
    ldy.b #0x03
.8BD0:
    jsl 0x8282ED
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

;-----

_838BF8:
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

;-----

_838C1A:
    lda.b 0x3A
    inc
    inc
    inc
    inc
    and.b #0xFF
    sta.b 0x3A
    rts

;-----

_838C25:
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

;-----

_838C3E:
    ldx.b 0x01
    jsr (.8C44,X)
    rtl

.8C44: d16[.8C4E, .8C7F, .8D34, .8C79, .8CE8]

.8C4E:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x30
    inc.w 0x0C25
    lda.b #0xFF
    sta.b 0x10
    stz.b 0x18
    stz.b 0x12
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    jsl _839518
    lda.b #0x9A
    sta.b 0x31
    lda.b #0xAB
    sta.b 0x32
    lda.b #0x9E
    sta.b 0x16
    rts

.8C79:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x30
.8C7F:
    ldx.b 0x02
    jsr (.8C9D,X)
    jsl 0x848FCA
    jsl 0x8280B4
    lda.b 0x0E
    bne .8C9A

    lda.b #0x08
    sta.b 0x01
    lda.b #0x04
    sta.b 0x02
    sta.b 0x30
.8C9A:
    jmp _838D71

.8C9D: d16[.8CA1, .8CC0]

.8CA1:
    ldx.b 0x03
    bne .8CAF

    inc.b 0x03
    stz.b 0x30
    lda.b #0x00
    jsl 0x848F07
.8CAF:
    lda.b 0x0F
    bpl .8CB9

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.8CB9:
    jsl 0x848EEA
    jmp _838D82

.8CC0:
    ldx.b 0x03
    bne .8CDF

    inc.b 0x03
    stz.b 0x30
    rep #0x21
    lda.w #0x0800
    bit.b 0x10
    bvs .8CD4

    lda.w #0xF800
.8CD4:
    sta.b 0x1A
    sep #0x20
    lda.b #0x01
    jsl 0x848F07
    rts

.8CDF:
    jsl 0x82823E
    jsl 0x848EEA
    rts

.8CE8:
    ldx.b 0x02
    jmp (.8CED,X)

.8CED: d16[.8CF3, .8D14, .8D29]

.8CF3:
    rep #0x30
    lda.b 0x33
    sta.b 0x05
    lda.b 0x35
    sta.b 0x08
    sep #0x30
    inc.b 0x30
    lda.b #0x02
    sta.b 0x02
    jsl 0x8280B4
    lda.b #0x02
    jsl 0x848F07
    jsl 0x848FCA
    rts

.8D14:
    lda.b 0x0F
    bpl .8D1C

    lda.b #0x04
    sta.b 0x02
.8D1C:
    jsl 0x8280B4
    jsl 0x848FCA
    jsl 0x848EEA
    rts

.8D29:
    dec.w 0x0BDD
    dec.w 0x0C25
    jsl 0x8283A3
    rts

.8D34:
    ldx.b 0x02
    jsr (.8D42,X)
    jsl 0x848FCA
    jsl 0x8280B4
    rts

.8D42: d16[.8D46, .8D5F]

.8D46:
    rep #0x30
    lda.b 0x33
    sta.b 0x05
    lda.b 0x35
    sta.b 0x08
    sep #0x30
    lda.b #0x02
    sta.b 0x02
    inc.b 0x30
    lda.b #0x03
    jsl 0x848F07
    rts

.8D5F:
    lda.b 0x0F
    bpl .8D6C

    lda.b #0x08
    sta.b 0x01
    lda.b #0x04
    sta.b 0x02
    rts

.8D6C:
    jsl 0x848EEA
    rts

;-----

_838D71:
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    asl
    asl
    adc.w #0xBE9F
    sta.b 0x20
    sep #0x20
    rts

;-----

_838D82:
    ldx.b 0x3C
    lda.w 0x86BE3C,X
    sta.w 0x0000
    stz.w 0x0001
    stz.w 0x0003
    lda.w 0x86BE3D,X
    sta.w 0x0002
    bpl .8D9B

    dec.w 0x0003
.8D9B:
    rep #0x20
    lda.w 0x0000
    bit.b 0x10
    bvs .8DA8

    eor.w #0xFFFF
    inc
.8DA8:
    clc
    adc.w 0x0BAD
    sta.b 0x05
    rts

;-----

_838DAF:
    ldx.b 0x01
    jsr (.8DB5,X)
    rtl

.8DB5: d16[.8DBF, .8E0B, .8E51, .8E05, .8E51]

.8DBF:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x30
    inc.w 0x0C35
    lda.b #0xFF
    sta.b 0x10
    stz.b 0x18
    stz.b 0x12
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    rep #0x20
    lda.w #0x0019
    bit.b 0x10
    bvs .8DE5

    lda.w #0xFFE7
.8DE5:
    clc
    adc.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    clc
    adc.w #0xFFFD
    sta.b 0x08
    lda.w #0xA957
    sta.b 0x31
    lda.w #0xBEAF
    sta.b 0x20
    sep #0x20
    lda.b #0xAB
    sta.b 0x16
    rts

.8E05:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x30
.8E0B:
    ldx.b 0x02
    jsr (.8E27,X)
    jsl 0x848FCA
    jsl 0x8280B4
    lda.b 0x0E
    bne .8E26

    lda.b #0x08
    sta.b 0x01
    lda.b #0x04
    sta.b 0x02
    sta.b 0x30
.8E26:
    rts

.8E27: d16[.8E29]

.8E29:
    ldx.b 0x03
    bne .8E48

    inc.b 0x03
    stz.b 0x30
    rep #0x21
    lda.w #0x0400
    bit.b 0x10
    bvs .8E3D

    lda.w #0xFC00
.8E3D:
    sta.b 0x1A
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
    rts

.8E48:
    jsl 0x82823E
    jsl 0x848EEA
    rts

.8E51:
    ldx.b 0x02
    jmp (.8E56,X)

.8E56: d16[.8E5C, .8E7D, .8E92]

.8E5C:
    rep #0x30
    lda.b 0x33
    sta.b 0x05
    lda.b 0x35
    sta.b 0x08
    sep #0x30
    inc.b 0x30
    lda.b #0x02
    sta.b 0x02
    jsl 0x8280B4
    lda.b #0x01
    jsl 0x848F07
    jsl 0x848FCA
    rts

.8E7D:
    lda.b 0x0F
    bpl .8E85

    lda.b #0x04
    sta.b 0x02
.8E85:
    jsl 0x8280B4
    jsl 0x848FCA
    jsl 0x848EEA
    rts

.8E92:
    dec.w 0x0C35
    dec.w 0x0BDD
    jsl 0x8283A3
    rts

;-----

_838E9D:
    ldx.b 0x01
    jmp (.8EA2,X)

.8EA2: d16[.8EAC, .8F65, .9040, .903C, .903C]

.8EAC:
    lda.b #0x02
    sta.b 0x01
    jsl _83917D
    ldx.w 0x1F7A
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    stz.b 0x30
    lda.b #0x01
    sta.b 0x38
    lda.b #0x03
    sta.b 0x3E
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x10
    sta.b 0x16
    ldx.b 0x3C
    lda.w 0x00BE3C,X
    sta.w 0x0000
    stz.w 0x0001
    stz.w 0x0003
    lda.w 0x00BE3D,X
    sta.w 0x0002
    bpl .8EEB

    dec.w 0x0003
.8EEB:
    rep #0x20
    lda.w 0x0000
    bit.b 0x10
    bvs .8EF8

    eor.w #0xFFFF
    inc
.8EF8:
    clc
    adc.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    clc
    adc.w 0x0002
    sta.b 0x08
    lda.w #0x0400
    bit.b 0x10
    bvs .8F11

    lda.w #0xFC00
.8F11:
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0xBED3
    sta.b 0x20
    lda.w #0xABE5
    sta.b 0x31
    stz.b 0x0C
    lda.w #0xFFFF
    sta.b 0x39
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b 0x11
    asl
    asl
    bcc .8F40

    lda.b #0x01
    sta.b 0x1B
    lda.b #0x08
    sta.b 0x37
    sta.b 0x3B
    lda.b #0x0C
    bra .8F4C

.8F40:
    lda.b #0xFF
    sta.b 0x1B
    lda.b #0x18
    sta.b 0x37
    sta.b 0x3B
    lda.b #0x04
.8F4C:
    sta.b 0x3D
    jsl 0x848F07
    jsl 0x848FCA
    lda.b #0x40
    trb.b 0x11
    jsr _839047
    lda.b #0x08
    sta.b 0x38
    stz.b 0x1F
    stz.b 0x1E
.8F65:
    dec.b 0x3E
    bne .8F70

    lda.b #0x03
    sta.b 0x3E
    jsr _839133
.8F70:
    dec.b 0x38
    bne .8F84

    lda.b #0x01
    sta.b 0x38
    lda.b 0x0D
    beq .8F81

    jsr _8390AF
    bra .8F84

.8F81:
    jsr _839047
.8F84:
    lda.b 0x3B
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    asl
    asl
    asl
    asl
    bpl .8F98

    eor.w #0xFFFF
    inc
.8F98:
    sep #0x20
    xba
    sta.b 0x1F
    rep #0x20
    lda.w 0x00EE3C,X
    asl
    asl
    asl
    asl
    bpl .8FAC

    eor.w #0xFFFF
    inc
.8FAC:
    sep #0x20
    xba
    sta.b 0x1E
    lda.b 0x37
    bit.b #0x10
    beq .8FF5

    bit.b #0x08
    beq .8FD8

    jsl 0x8281B2
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bmi .8FCD

    sta.b 0x1A
.8FCD:
    lda.w 0x0002
    cmp.b 0x1C
    bpl .9031

    sta.b 0x1C
    bra .9031

.8FD8:
    jsl 0x828174
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bmi .8FEA

    sta.b 0x1A
.8FEA:
    lda.w 0x0002
    cmp.b 0x1C
    bmi .9031

    sta.b 0x1C
    bra .9031

.8FF5:
    bit.b #0x08
    beq .9016

    jsl 0x828195
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bpl .900B

    sta.b 0x1A
.900B:
    lda.w 0x0002
    cmp.b 0x1C
    bmi .9031

    sta.b 0x1C
    bra .9031

.9016:
    jsl 0x8281CF
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bpl .9028

    sta.b 0x1A
.9028:
    lda.w 0x0002
    cmp.b 0x1C
    bpl .9031

    sta.b 0x1C
.9031:
    sep #0x20
    jsl 0x8280B4
    lda.b 0x0E
    beq .9040

    rtl

.903C:
    jsl 0x84A51A
.9040:
    dec.w 0x0BDD
    jml 0x8283A3

;-----

_839047:
    rep #0x10
    ldx.w #0xFFFF
    stx.b 0x39
    ldx.w #0x0E68
.9051:
    sep #0x20
    lda.w 0x0000,X
    beq .9097

    lda.w 0x000E,X
    beq .9097

    lda.w 0x0027,X
    and.b #0x7F
    beq .9097

    lda.w 0x0028,X
    beq .9097

    lda.w 0x0030,X
    bne .9097

    rep #0x20
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    lda.w 0x0005,X
    sta.w 0x0004
    lda.w 0x0008,X
    sta.w 0x0006
    phx
    jsl 0x80CEAE
    plx
    lda.w 0x0000
    cmp.b 0x39
    bcs .9097

    sta.b 0x39
    stx.b 0x0C
.9097:
    rep #0x20
    txa
    clc
    adc.w #0x0040
    tax
    cpx.w #0x1228
    bcc .9051

    sep #0x30
    lda.b 0x0D
    bne .90AE

    lda.b 0x37
    sta.b 0x3B
.90AE:
    rts

;-----

_8390AF:
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0000,X
    beq .910E

    lda.w 0x0027,X
    and.b #0x7F
    beq .910E

    lda.w 0x0030,X
    bne .910E

    rep #0x20
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    lda.w 0x0005,X
    sta.w 0x0004
    lda.w 0x0008,X
    sta.w 0x0006
    sep #0x30
    jsl 0x84A097
    sta.b 0x3B
    sec
    sbc.b 0x37
    beq .910D

    and.b #0x1F
    cmp.b #0x10
    bcc .90F3

    dec.b 0x37
    dec.b 0x37
.90F3:
    inc.b 0x37
    lda.b 0x37
    and.b #0x1F
    sta.b 0x37
    tax
    lda.w 0x00BEB3,X
    cmp.b 0x3D
    beq .910D

    sta.b 0x3D
    jsl 0x848F07
    jsl 0x848FCA
.910D:
    rts

.910E:
    sep #0x30
    stz.b 0x0D
    rts

;-----

_839113:
    lda.b 0x37
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    asl
    clc
    adc.w 0x00EE3A,X
    sta.w 0x0000
    lda.w 0x00EE3C,X
    asl
    clc
    adc.w 0x00EE3C,X
    sta.w 0x0002
    sep #0x20
    rts

;-----

_839133:
    jsl 0x8282D3
    bne .917A

    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    lda.b #0x05
    sta.w 0x000B,X
    stz.w 0x0011,X
    rep #0x20
    lda.b 0x3D
    and.w #0x00FF
    asl
    asl
    asl
    tay
    lda 0x00EE3A,Y
    asl
    and.w #0xFF00
    bpl .9160

    ora.w #0x00FF
.9160:
    xba
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda 0x00EE3C,Y
    asl
    and.w #0xFF00
    bpl .9173

    ora.w #0x00FF
.9173:
    xba
    clc
    adc.b 0x08
    sta.w 0x0008,X
.917A:
    sep #0x30
    rts

;-----

_83917D:
    php
    phd
    rep #0x30
    tdc
    sta.w 0x0000
    lda.w #0x0000
    tcd
    stz.b 0x02
    ldx.w #0x1228
.918E:
    cpx.b 0x00
    beq .91B2

    sep #0x20
    lda.b 0x00,X
    beq .91B2

    lda.b 0x01
    beq .91B2

    lda.b 0x0A,X
    cmp.b #0x07
    beq .91A6

    cmp.b #0x10
    bne .91B2

.91A6:
    lda.b #0x00
    xba
    lda.b 0x18,X
    lsr
    tay
    lda 0x00BED7,Y
    tsb.b 0x02
.91B2:
    rep #0x30
    txa
    clc
    adc.w #0x0040
    tax
    cmp.w #0x1428
    bcc .918E

    sep #0x30
    ldx.b #0x07
    lda.b 0x02
.91C5:
    lsr
    bcc .91CB

    dex
    bra .91C5

.91CB:
    txa
    asl
    pld
    sta.b 0x18
    plp
    rtl

;-----

_8391D2:
    ldx.b 0x01
    jsr (.91D8,X)
    rtl

.91D8: d16[.91E4, .920C, .929A, .9296, .9296, .929A]

.91E4:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x18
    sta.b 0x30
    stz.b 0x12
    lda.b 0x0B
    bne .91FF

    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    jsl _839518
.91FF:
    lda.b 0x0B
    beq .9207

    lda.b #0x02
    sta.b 0x02
.9207:
    lda.b #0x0F
    sta.b 0x16
    rts

.920C:
    ldx.b 0x02
    jsr (.921E,X)
    jsl 0x8280B4
    lda.b 0x0E
    bne .921D

    lda.b #0x0A
    sta.b 0x01
.921D:
    rts

.921E: d16[.9222, .9261]

.9222:
    ldx.b 0x03
    bne .9230

    inc.b 0x03
    stz.b 0x30
    lda.b #0x00
    jsl 0x848F07
.9230:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .923D

    lda.b #0x0A
    sta.b 0x01
    rts

.923D:
    bit.b #0x20
    beq .924A

    lda.b #0x67
    jsl _80888B.88B6
    jsr _8392A4
.924A:
    bit.b #0x40
    beq .9250

    sta.b 0x30
.9250:
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    asl
    asl
    adc.w #0xBEDF
    sta.b 0x20
    sep #0x20
    rts

.9261:
    ldx.b 0x03
    bne .9291

    inc.b 0x03
    stz.b 0x30
    rep #0x21
    lda.b 0x0B
    and.w #0x00FF
    asl
    tax
    lda.w 0x00BEF1,X
    sta.b 0x1C
    lda.w #0x0600
    bit.b 0x10
    bvs .9281

    lda.w #0xFA00
.9281:
    sta.b 0x1A
    lda.w #0xBEEF
    sta.b 0x20
    sep #0x20
    lda.b 0x0B
    jsl 0x848F07
    rts

.9291:
    jsl 0x82820A
    rts

.9296:
    jsl 0x84A51A
.929A:
    inc.b 0x30
    dec.w 0x0BDD
    jsl 0x8283A3
    rts

;-----

_8392A4:
    rep #0x10
    ldy.w #0x0003
.92A9:
    jsl 0x82833E
    bne .92E9

    inc.w 0x0000,X
    inc.w 0x0BDD
    lda.b #0x08
    sta.w 0x000A,X
    tya
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    phy
    rep #0x21
    tya
    asl
    asl
    tay
    lda 0x00BEF5,Y
    bit.b 0x10
    bvc .92D5

    eor.w #0xFFFF
    inc
.92D5:
    adc.b 0x05
    sta.w 0x0005,X
    lda 0x00BEF7,Y
    clc
    adc.b 0x08
    sta.w 0x0008,X
    sep #0x20
    ply
    dey
    bne .92A9

.92E9:
    sep #0x10
    rts

;-----

_8392EC:
    ldx.b 0x01
    jsr (.92F5,X)
    jml 0x848FCA

.92F5: d16[.92FF, .9347, .941C, .941C, .941C]

.92FF:
    lda.b #0x02
    sta.b 0x01
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x02
    sta.b 0x18
    sta.b 0x30
    stz.b 0x12
    stz.b 0x3A
    stz.b 0x38
    stz.b 0x39
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    jsl _839518
    rep #0x20
    lda.w #0x0400
    bit.b 0x10
    bvs .932E

    lda.w #0xFC00
.932E:
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0x0040
    sta.b 0x1E
    lda.w #0xAF87
    sta.b 0x31
    sep #0x20
    lda.b #0x48
    sta.b 0x16
    lda.b #0x80
    sta.b 0x17
.9346:
    rts

.9347:
    ldx.b 0x02
    jsr (.9381,X)
    lda.b #0x0F
    sta.b 0x20
    lda.b #0xBF
    sta.b 0x21
    jsl 0x849BC8
    lda.b #0x05
    sta.b 0x20
    lda.b #0xBF
    sta.b 0x21
    jsl 0x8491BE
    lda.b 0x00
    beq .9346

    jsl 0x8280B4
    lda.b 0x0E
    bne .9378

    lda.b #0x04
    sta.b 0x02
    sta.b 0x03
    sta.b 0x30
.9378:
    lda.b 0x02
    sta.b 0x38
    lda.b 0x03
    sta.b 0x39
    rts

.9381: d16[.9387, .93A3, .9420]

.9387:
    ldx.b 0x03
    bne .9394

    inc.b 0x03
    lda.b #0x00
    jsl 0x848F07
    rts

.9394:
    lda.b 0x0F
    bpl .939E

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.939E:
    jsl 0x848EEA
    rts

.93A3:
    ldx.b 0x03
    jmp (.93A8,X)

.93A8: d16[.93AE, .93BB, .93F0]

.93AE:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x30
    lda.b #0x01
    jsl 0x848F07
    rts

.93BB:
    lda.b 0x2B
    bit.b #0x04
    beq .93C6

    lda.b #0x04
    sta.b 0x03
    rts

.93C6:
    bit.b #0x03
    beq .93DA

    inc.b 0x3A
    lda.b 0x3A
    cmp.b #0x02
    bcc .93D7

    lda.b #0x08
    sta.b 0x01
    rts

.93D7:
    jsr _83942A
.93DA:
    jsl 0x828174
    rep #0x20
    lda.w #0xFC00
    cmp.b 0x1C
    bmi .93E9

    sta.b 0x1C
.93E9:
    sep #0x20
    jsl 0x848EEA
    rts

.93F0:
    lda.b 0x2B
    bit.b #0x04
    bne .93FF

    lda.b #0x02
    sta.b 0x03
    stz.b 0x1C
    stz.b 0x1D
    rts

.93FF:
    bit.b #0x03
    beq .9413

    inc.b 0x3A
    lda.b 0x3A
    cmp.b #0x02
    bcc .9410

    lda.b #0x08
    sta.b 0x01
    rts

.9410:
    jsr _83942A
.9413:
    jsl 0x82823E
    jsl 0x848EEA
    rts

.941C:
    jsl 0x84A4AB
.9420:
    inc.b 0x30
    dec.w 0x0BDD
    jsl 0x8283A3
    rts

;-----

_83942A:
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

;-----

_83943D:
    ldx.b 0x01
    jsr (.9443,X)
    rtl

.9443: d16[.944D, .94B2, .94A4, .94A4, .94A4]

.944D:
    lda.b #0x02
    sta.b 0x01
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x02
    sta.b 0x18
    sta.b 0x30
    stz.b 0x12
    lda.w 0x0B9C
    and.b #0x0E
    bne .946A

    lda.b #0x61
    jsl _80888B.88B6
.946A:
    stz.b 0x38
    stz.b 0x39
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    jsl _839518
    rep #0x20
    lda.w #0x0700
    bit.b 0x10
    bvs .9487

    lda.w #0xF900
.9487:
    sta.b 0x1A
    lda.w #0xBF13
    sta.b 0x20
    stz.b 0x28
    sep #0x20
    lda.w 0x0C18
    beq .949B

    lda.b #0x02
    sta.b 0x02
.949B:
    lda.b #0x46
    sta.b 0x16
    lda.b #0x80
    sta.b 0x17
.94A3:
    rts

.94A4:
    lda.b #0x02
    sta.b 0x01
    lda.b 0x38
    sta.b 0x02
    lda.b 0x39
    sta.b 0x03
    stz.b 0x30
.94B2:
    ldx.b 0x02
    jsr (.94CE,X)
    lda.b 0x00
    beq .94A3

    jsl 0x8280B4
    lda.b 0x02
    sta.b 0x38
    lda.b 0x03
    sta.b 0x39
    lda.b 0x30
    eor.b #0x01
    sta.b 0x30
    rts

.94CE: d16[.94D2, .94F8]

.94D2:
    ldx.b 0x03
    bne .94E5

    inc.b 0x03
    stz.b 0x30
    lda.b #0x05
    sta.b 0x37
    lda.b #0x00
    jsl 0x848F07
    rts

.94E5:
    dec.b 0x37
    bne .94EF

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.94EF:
    jsl 0x82823E
    jsl 0x848EEA
    rts

.94F8:
    ldx.b 0x03
    bne .9505

    inc.b 0x03
    lda.b #0x01
    jsl 0x848F07
    rts

.9505:
    lda.b 0x0F
    bpl .9513

    inc.b 0x30
    dec.w 0x0BDD
    jsl 0x8283A3
    rts

.9513:
    jsl 0x848EEA
    rts

;-----

_839518:
    ldx.b 0x3C
    lda.w 0x86BE3C,X
    sta.w 0x0000
    stz.w 0x0001
    stz.w 0x0003
    lda.w 0x86BE3D,X
    sta.w 0x0002
    bpl .9531

    dec.w 0x0003
.9531:
    rep #0x20
    lda.w 0x0000
    bit.b 0x10
    bvs .953E

    eor.w #0xFFFF
    inc
.953E:
    clc
    adc.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    clc
    adc.w 0x0002
    sta.b 0x08
    sep #0x20
    rtl

;-----

_839550:
    ldx.b 0x01
    jsr (.9559,X)
    jml 0x848FCA

.9559: d16[.9563, .95C0, .95B2, .95B2, .95B2]

.9563:
    lda.b #0x02
    sta.b 0x01
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x02
    sta.b 0x18
    sta.b 0x30
    stz.b 0x12
    stz.b 0x38
    stz.b 0x39
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    rep #0x21
    lda.w #0x0010
    bit.b 0x10
    bvs .958C

    lda.w #0xFFF0
.958C:
    adc.w 0x0BAD
    sta.b 0x05
    lda.w #0x0800
    bit.b 0x10
    bvs .959B

    lda.w #0xF800
.959B:
    sta.b 0x1A
    lda.w 0x0BB0
    sta.b 0x08
    lda.w #0xAE67
    sta.b 0x31
    sep #0x20
    lda.b #0x87
    sta.b 0x16
    lda.b #0x80
    sta.b 0x17
.95B1:
    rts

.95B2:
    lda.b #0x02
    sta.b 0x01
    lda.b 0x38
    sta.b 0x02
    lda.b 0x39
    sta.b 0x03
    stz.b 0x30
.95C0:
    ldx.b 0x02
    jsr (.95E7,X)
    lda.b 0x00
    beq .95B1

    lda.w 0x0B9C
    lsr
    bcs .95D3

    jsl 0x82808F
.95D3:
    jsr _83963A
    bcc .95DC

    lda.b #0x04
    sta.b 0x02
.95DC:
    lda.b 0x02
    sta.b 0x38
    lda.b 0x03
    sta.b 0x39
    jmp .9629

.95E7: d16[.95ED, .960A, .961F]

.95ED:
    ldx.b 0x03
    bne .95FB

    inc.b 0x03
    stz.b 0x30
    lda.b #0x00
    jsl 0x848F07
.95FB:
    lda.b 0x0F
    bpl .9605

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.9605:
    jsl 0x848EEA
    rts

.960A:
    ldx.b 0x03
    bne .9616

    inc.b 0x03
    lda.b #0x01
    jsl 0x848F07
.9616:
    jsl 0x82823E
    jsl 0x848EEA
    rts

.961F:
    inc.b 0x30
    dec.w 0x0BDD
    jsl 0x8283A3
    rts

.9629:
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    asl
    asl
    adc.w #0xBF17
    sta.b 0x20
    sep #0x20
    rts

;-----

_83963A:
    rep #0x20
    sec
    lda.b 0x05
    sbc.w 0x1E4D
    clc
    adc.w #0x0020
    cmp.w #0x0140
    bcs .9658

    sec
    lda.b 0x08
    sbc.w 0x1E50
    clc
    adc.w #0x0080
    cmp.w #0x01E0
.9658:
    sep #0x20
    rts

;-----

_83965B:
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
    jsl 0x8280B4
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
    jsl 0x848F07
    rts

.96EF:
    jsl 0x8490A0
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
    jsl 0x82823E
    jsl 0x848EEA
    rts

.9710:
    ldx.b 0x03
    bne .971F

    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    jsl 0x848F07
    rts

.971F:
    lda.b 0x0F
    bpl .972B

    lda.b #0x0A
    sta.b 0x01
    jml .9771

.972B:
    jsl 0x848EEA
    rts

.9730:
    ldx.b 0x03
    bne .973F

    inc.b 0x03
    stz.b 0x30
    lda.b #0x00
    jsl 0x848F07
    rts

.973F:
    jsl 0x82820A
    jsl 0x848EEA
    rts

.9748:
    ldx.b 0x02
    bne .9756

    inc.b 0x02
    lda.b #0x01
    sta.b 0x30
    jsl 0x848F07
.9756:
    lda.b 0x0F
    bpl .975E

    lda.b #0x0A
    sta.b 0x01
.975E:
    jsl 0x848EEA
    jsl 0x8280B4
    rts

.9767:
    inc.b 0x30
    dec.w 0x0BDD
    jsl 0x8283A3
    rts

.9771:
    rep #0x10
    ldy.w #0x0001
.9776:
    jsl 0x82833E
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
    jsr _8397A8
    dey
    bpl .9776

.97A5:
    sep #0x10
    rts

;-----

_8397A8:
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
    jsl 0x8490A0
    ply
    bra .97AE

;-----

_839807:
    ldx.b 0x01
    jmp (.980C,X)

.980C: d16[.9816, .98BA, .98E3, .98DF, .98DF]

.9816:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x02
    sta.b 0x18
    ldx.w 0x1F7A
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    stz.b 0x30
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x44
    sta.b 0x16
    lda.b #0x01
    sta.b 0x37
    lda.b 0x0B
    bne .9890

    ldx.b 0x3C
    lda.w 0x00BE3C,X
    sta.w 0x0000
    stz.w 0x0001
    stz.w 0x0003
    lda.w 0x00BE3D,X
    sta.w 0x0002
    bpl .9855

    dec.w 0x0003
.9855:
    rep #0x20
    lda.w 0x0000
    bit.b 0x10
    bvs .9862

    eor.w #0xFFFF
    inc
.9862:
    clc
    adc.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    clc
    adc.w 0x0002
    sta.b 0x08
    lda.w #0x0800
    bit.b 0x10
    bvs .987B

    lda.w #0xF800
.987B:
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0xBF6F
    sta.b 0x20
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
    jml 0x8280B4

.9890:
    sep #0x30
    ldx.b 0x0B
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    asl
    asl
    sta.b 0x1A
    lda.w 0x00EE3C,X
    asl
    asl
    sta.b 0x1C
    lda.w #0xBF79
    sta.b 0x20
    sep #0x20
    lda.b #0x03
    jsl 0x848F07
    inc.b 0x02
    jml 0x8280B4

.98BA:
    lda.b 0x02
    bne .98D2

    jsl 0x82823E
    jsr _8398F7
    jsl 0x8491BE
    lda.b 0x2B
    beq .98D6

    jsr _839924
    bra .98F0

.98D2:
    jsl 0x82820A
.98D6:
    jsl 0x8280B4
    lda.b 0x0E
    beq .98F0

    rtl

.98DF:
    jsl 0x84A51A
.98E3:
    lda.b 0x0B
    bne .98F0

    jsr _839924
    lda.b #0x78
    jsl _80888B
.98F0:
    dec.w 0x0BDD
    jml 0x8283A3

;-----

_8398F7:
    dec.b 0x37
    bne .9923

    lda.b #0x04
    sta.b 0x37
    jsl 0x8282ED
    bne .9921

    inc.w 0x0000,X
    lda.b #0x02
    sta.w 0x000A,X
    stz.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.9921:
    sep #0x30
.9923:
    rts

;-----

_839924:
    lda.b #0x05
    sta.b 0x38
    ldy.b #0x04
    lda.b 0x1B
    bpl .9930

    ldy.b #0x09
.9930:
    jsl 0x82833E
    bne .995A

    inc.w 0x0000,X
    lda.b #0x0E
    sta.w 0x000A,X
    lda 0x00BF7D,Y
    sta.w 0x000B,X
    rep #0x30
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    inc.w 0x0BDD
    dey
    dec.b 0x38
    bne .9930

.995A:
    sep #0x30
    rts

;-----

_83995D:
    ldx.b 0x01
    jmp (.9962,X)

.9962: d16[.996C, .9A62, .9B4F, .9B3F, .9B3F]

.996C:
    lda.b #0x02
    sta.b 0x01
    jsl _83917D
    ldx.w 0x1F7A
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    stz.b 0x30
    lda.b #0x01
    sta.b 0x38
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x93
    sta.b 0x16
    ldx.b 0x3C
    lda.w 0x00BE3C,X
    sta.w 0x0000
    stz.w 0x0001
    stz.w 0x0003
    lda.w 0x00BE3D,X
    sta.w 0x0002
    bpl .99A7

    dec.w 0x0003
.99A7:
    rep #0x20
    lda.w 0x0000
    bit.b 0x10
    bvs .99B4

    eor.w #0xFFFF
    inc
.99B4:
    clc
    adc.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    clc
    adc.w 0x0002
    sta.b 0x08
    lda.w #0x0400
    bit.b 0x10
    bvs .99CD

    lda.w #0xFC00
.99CD:
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0xBFA7
    sta.b 0x20
    lda.w #0xACA5
    sta.b 0x31
    stz.b 0x0C
    lda.w #0xFFFF
    sta.b 0x39
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b 0x11
    asl
    asl
    bcc .99FC

    lda.b #0x01
    sta.b 0x1B
    lda.b #0x08
    sta.b 0x37
    sta.b 0x3B
    lda.b #0x0C
    bra .9A08

.99FC:
    lda.b #0xFF
    sta.b 0x1B
    lda.b #0x18
    sta.b 0x37
    sta.b 0x3B
    lda.b #0x04
.9A08:
    sta.b 0x3D
    jsl 0x848F07
    lda.b #0x40
    trb.b 0x11
    jsr _839047
    lda.b #0x10
    sta.b 0x38
    lda.b #0x05
    sta.b 0x3E
    stz.b 0x1F
    stz.b 0x1E
    lda.b 0x0B
    beq .9A5B

    asl
    asl
    clc
    adc.b 0x3B
    sta.b 0x3B
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    sta.b 0x1A
    lda.w 0x00EE3C,X
    sta.b 0x1C
    sep #0x20
    lda.b 0x0B
    clc
    adc.b 0x3E
    sta.b 0x3E
    lda.b 0x0B
    clc
    adc.b 0x37
    sta.b 0x37
    tax
    lda.w 0x00BF87,X
    sta.b 0x3D
    jsl 0x848F07
    jsl 0x848FCA
    bra .9A62

.9A5B:
    jsl 0x848FCA
    jsr _839B56
.9A62:
    dec.b 0x3E
    bne .9A6D

    lda.b #0x03
    sta.b 0x3E
    jsr _839133
.9A6D:
    dec.b 0x38
    bne .9A85

    lda.b #0x01
    sta.b 0x38
    lda.b 0x0D
    beq .9A82

    jsr _8390AF
    lda.b 0x37
    sta.b 0x3B
    bra .9A85

.9A82:
    jsr _839047
.9A85:
    lda.b 0x3B
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    asl
    asl
    asl
    asl
    asl
    bpl .9A9A

    eor.w #0xFFFF
    inc
.9A9A:
    sep #0x20
    xba
    sta.b 0x1F
    rep #0x20
    lda.w 0x00EE3C,X
    asl
    asl
    asl
    asl
    asl
    bpl .9AAF

    eor.w #0xFFFF
    inc
.9AAF:
    sep #0x20
    xba
    sta.b 0x1E
    lda.b 0x37
    bit.b #0x10
    beq .9AF8

    bit.b #0x08
    beq .9ADB

    jsl 0x8281B2
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bmi .9AD0

    sta.b 0x1A
.9AD0:
    lda.w 0x0002
    cmp.b 0x1C
    bpl .9B34

    sta.b 0x1C
    bra .9B34

.9ADB:
    jsl 0x828174
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bmi .9AED

    sta.b 0x1A
.9AED:
    lda.w 0x0002
    cmp.b 0x1C
    bmi .9B34

    sta.b 0x1C
    bra .9B34

.9AF8:
    bit.b #0x08
    beq .9B19

    jsl 0x828195
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bpl .9B0E

    sta.b 0x1A
.9B0E:
    lda.w 0x0002
    cmp.b 0x1C
    bmi .9B34

    sta.b 0x1C
    bra .9B34

.9B19:
    jsl 0x8281CF
    jsr _839113
    rep #0x20
    lda.w 0x0000
    cmp.b 0x1A
    bpl .9B2B

    sta.b 0x1A
.9B2B:
    lda.w 0x0002
    cmp.b 0x1C
    bpl .9B34

    sta.b 0x1C
.9B34:
    sep #0x20
    jsl 0x8280B4
    lda.b 0x0E
    beq .9B4F

    rtl

.9B3F:
    rep #0x20
    lda.b 0x33
    sta.b 0x05
    lda.b 0x35
    sta.b 0x08
    sep #0x20
    jsl 0x84A4AB
.9B4F:
    dec.w 0x0BDD
    jml 0x8283A3

;-----

_839B56:
    ldy.b #0x04
.9B58:
    jsl 0x82833E
    bne .9B7A

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    tya
    lsr
    bcc .9B6C

    eor.b #0xFF
.9B6C:
    sta.w 0x000B,X
    inc.w 0x0BDD
    lda.b 0x3C
    sta.w 0x003C,X
    dey
    bne .9B58

.9B7A:
    sep #0x30
    rts

;-----

_839B7D:
    ldx.b 0x01
    jmp (.9B82,X)

.9B82: d16[.9B88, .9BAF, .9BB9]

.9B88:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x30
    sta.w 0x0C31
    sta.w 0x0C32
    inc.w 0x0C25
    inc.w 0x0C0F
    lda.b #0xE0
    sta.b 0x37
    lda.b #0x01
    sta.b 0x38
    stz.b 0x39
    lda.b #0x06
    sta.b 0x3A
    stz.b 0x3B
    lda.b #0x02
    sta.b 0x3C
    rtl

.9BAF:
    jsr _839BDE
    jsr _839C02
    jsr _839C22
    rtl

.9BB9:
    stz.w 0x0C31
    dec.w 0x0BDD
    dec.w 0x0C25
    dec.w 0x0C0F
    lda.w 0x0BCF
    and.b #0x7F
    beq .9BD1

    lda.b #0x01
    sta.w 0x0BB6
.9BD1:
    rep #0x10
    ldy.w #0x0104
    jsl 0x828011
    jml 0x8283A3

;-----

_839BDE:
    rep #0x20
    dec.b 0x37
    bne .9BEB

    sep #0x20
    lda.b #0x04
    sta.b 0x01
    rts

.9BEB:
    lda.b 0x37
    cmp.w #0x0168
    bne .9BF6

    inc.b 0x3B
    inc.b 0x3B
.9BF6:
    cmp.w #0x0078
    bne .9BFF

    inc.b 0x3B
    inc.b 0x3B
.9BFF:
    sep #0x20
    rts

;-----

_839C02:
    lda.w 0x0BCF
    and.b #0x7F
    beq .9C21

    dec.b 0x3C
    bne .9C21

    lda.b 0x3B
    eor.b #0x01
    sta.b 0x3B
    tax
    lda.w 0x00BFAB,X
    sta.b 0x3C
    lda.w 0x0BB6
    eor.b #0x01
    sta.w 0x0BB6
.9C21:
    rts

;-----

_839C22:
    dec.b 0x3A
    bne .9C46

    lda.b #0x06
    sta.b 0x3A
    lda.w 0x1F1A
    bne .9C47

    lda.b 0x39
    inc
    inc
    and.b #0x0E
    sta.b 0x39
    rep #0x31
    and.w #0x00FF
    adc.w #0x01A0
    tay
    jsl 0x828011
    sep #0x30
.9C46:
    rts

.9C47:
    rep #0x10
    ldy.w #0x0104
    jsl 0x828011
    sep #0x10
    rts

;-----

_839C53:
    ldx.b 0x01
    jsr (.9C5C,X)
    jml 0x848FCA

.9C5C: d16[.9C66, .9CA8, .9D4A, .9C9A, .9D4A]

.9C66:
    lda.b #0x02
    sta.b 0x01
    lda.b #0xFF
    sta.b 0x10
    sta.w 0x0C30
    lda.b #0x08
    sta.b 0x18
    sta.b 0x30
    stz.b 0x12
    stz.b 0x38
    stz.b 0x39
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    lda.b #0xB9
    sta.b 0x31
    lda.b #0xAF
    sta.b 0x32
    lda.b #0x8E
    sta.b 0x16
    lda.b #0x80
    sta.b 0x17
    inc.w 0x0C25
    rts

.9C9A:
    lda.b #0x02
    sta.b 0x01
    lda.b 0x38
    sta.b 0x02
    lda.b 0x39
    sta.b 0x03
    stz.b 0x30
.9CA8:
    ldx.b 0x02
    jsr (.9CFC,X)
    lda.b #0xB5
    sta.b 0x20
    lda.b #0xBF
    sta.b 0x21
    lda.w 0x0BAA
    cmp.b #0x2C
    beq .9CD5

    lda.w 0x1F23
    bne .9CD5

    lda.w 0x1F7B
    cmp.b #0x04
    beq .9CD5

    lda.w 0x0BCF
    and.b #0x7F
    beq .9CD5

    jsl 0x849BC8
    bpl .9CDB

.9CD5:
    lda.b #0x08
    sta.b 0x01
    stz.b 0x02
.9CDB:
    lda.b #0xB1
    sta.b 0x20
    lda.b #0xBF
    sta.b 0x21
    lda.b 0x02
    sta.b 0x38
    lda.b 0x03
    sta.b 0x39
    lda.b 0x37
    beq .9CF5

    lda.w 0x0B9C
    lsr
    bcs .9CF9

.9CF5:
    jsl 0x8280B4
.9CF9:
    jmp .9DC5

.9CFC: d16[.9D00, .9D20]

.9D00:
    ldx.b 0x03
    bne .9D11

    inc.b 0x03
    stz.b 0x37
    stz.b 0x30
    lda.b #0x00
    jsl 0x848F07
    rts

.9D11:
    lda.b 0x0F
    bpl .9D1B

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.9D1B:
    jsl 0x848EEA
    rts

.9D20:
    ldx.b 0x03
    bne .9D3A

    inc.b 0x03
    lda.b #0x02
    sta.b 0x3C
    inc.b 0x37
    lda.b #0x86
    sta.b 0x3A
    lda.b #0x01
    sta.b 0x3B
    lda.b #0x01
    jsl 0x848F07
.9D3A:
    lda.w 0x0B9C
    and.b #0x0F
    bne .9D47

    lda.b #0x64
    jsl _80888B.88B6
.9D47:
    jmp .9DA2

.9D4A:
    ldx.b 0x02
    jsr (.9D5A,X)
    lda.b 0x00
    beq .9D57

    jsl 0x8280B4
.9D57:
    jmp .9DC5

.9D5A: d16[.9D5E, .9D75]

.9D5E:
    lda.b #0x02
    sta.b 0x02
    inc.b 0x30
    stz.b 0x37
    ldx.b #0x30
    ldy.b #0x46
    jsl 0x828000
    lda.b #0x02
    jsl 0x848F07
    rts

.9D75:
    lda.b 0x0F
    bpl .9D89

    inc.b 0x30
    dec.w 0x0BDD
    dec.w 0x0C25
    stz.w 0x0C30
    jsl 0x8283A3
    rts

.9D89:
    jsl 0x848EEA
    rts

    jsl 0x82833E
    bne .9D9F

    inc.w 0x0000,X
    lda.b #0x14
    sta.w 0x000A,X
    sta.w 0x000B,X
.9D9F:
    sep #0x10
    rts

.9DA2:
    dec.b 0x3C
    bne .9DC4

    lda.b #0x02
    sta.b 0x3C
    rep #0x30
    ldy.b 0x3A
    jsl 0x828011
    lda.b 0x3A
    inc
    inc
    cmp.w #0x018E
    sta.b 0x3A
    bcc .9DC2

    lda.w #0x0184
    sta.b 0x3A
.9DC2:
    sep #0x30
.9DC4:
    rts

.9DC5:
    rep #0x20
    lda.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    sta.b 0x08
    sep #0x20
    rts

;-----

_839DD4:
    ldx.b 0x01
    jsr (.9DDA,X)
    rtl

.9DDA: d16[.9DE4, .9E38, .9E2A, .9E2A, .9E2A]

.9DE4:
    lda.b #0x02
    sta.b 0x01
    inc.w 0x0C25
    lda.b #0x08
    sta.b 0x18
    sta.b 0x30
    stz.b 0x12
    stz.b 0x38
    stz.b 0x39
    lda.b 0x0B
    bpl .9E05

    lda.b #0x02
    sta.b 0x02
    sta.b 0x38
    stz.b 0x03
    bra .9E1A

.9E05:
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    jsl _839518
    lda.b #0xCD
    sta.b 0x20
    lda.b #0xBF
    sta.b 0x21
.9E1A:
    lda.b #0xF0
    sta.b 0x2A
    jsr _839F65
    lda.b #0x8C
    sta.b 0x16
    lda.b #0x80
    sta.b 0x17
.9E29:
    rts

.9E2A:
    lda.b #0x02
    sta.b 0x01
    lda.b 0x38
    sta.b 0x02
    lda.b 0x39
    sta.b 0x03
    stz.b 0x30
.9E38:
    ldx.b 0x02
    jsr (.9E62,X)
    lda.b 0x00
    beq .9E29

    lda.b 0x02
    sta.b 0x38
    lda.b 0x03
    sta.b 0x39
    lda.b 0x02
    cmp.b #0x06
    beq .9E29

    jsl 0x8280B4
    lda.b 0x0E
    bne .9E5B

    lda.b #0x04
    sta.b 0x02
.9E5B:
    lda.b 0x30
    eor.b #0x01
    sta.b 0x30
    rts

.9E62: d16[.9E6A, .9EBA, .9EE0, .9EED]

.9E6A:
    ldx.b 0x03
    bne .9E90

    inc.b 0x03
    stz.b 0x30
    rep #0x20
    lda.w #0x0180
    bit.b 0x10
    bvs .9E7E

    lda.w #0xFE80
.9E7E:
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0x0040
    sta.b 0x1E
    sep #0x20
    lda.b #0x01
    jsl 0x848F07
    rts

.9E90:
    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x04
    beq .9EA0

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
.9EA0:
    jsl 0x828174
    rep #0x20
    lda.w #0xFE00
    cmp.b 0x1C
    bmi .9EAF

    sta.b 0x1C
.9EAF:
    sep #0x20
    jsl 0x848EEA
    stz.b 0x2A
    jmp _839F65

.9EBA:
    ldx.b 0x03
    bne .9ED1

    inc.b 0x03
    stz.b 0x30
    lda.b #0x61
    jsl _80888B
    lda.b #0x00
    jsl 0x848F07
    jmp .9F2A

.9ED1:
    lda.b 0x0F
    bpl .9ED9

    lda.b #0x04
    sta.b 0x02
.9ED9:
    jsl 0x848EEA
    jmp .9F2A

.9EE0:
    inc.b 0x30
    dec.w 0x0BDD
    dec.w 0x0C25
    jsl 0x8283A3
    rts

.9EED:
    ldx.b 0x03
    bne .9EFB

    inc.b 0x03
    inc.b 0x30
    stz.b 0x2F
    lda.b #0x01
    sta.b 0x37
.9EFB:
    lda.b #0xF0
    sta.b 0x2A
    jsr _839F65
    dec.b 0x37
    bne .9F0D

    lda.b #0x0A
    sta.b 0x37
    jsr _839F3B
.9F0D:
    jsl 0x82823E
    jsl 0x8491BE
    jsl 0x82806E
    bcs .9F25

    lda.b 0x2B
    bit.b #0x04
    beq .9F25

    bit.b #0x03
    beq .9F29

.9F25:
    lda.b #0x04
    sta.b 0x02
.9F29:
    rts

.9F2A:
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    asl
    asl
    adc.w #0xBFB9
    sta.b 0x20
    sep #0x20
    rts

;-----

_839F3B:
    jsl 0x82833E
    bne .9F62

    inc.w 0x0000,X
    inc.w 0x0BDD
    lda.b #0x13
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b #0x80
    sta.w 0x000B,X
    rep #0x21
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.9F62:
    sep #0x30
    rts

;-----

_839F65:
    stz.b 0x29
    jsl 0x8490A0
    and.b #0x3F
    cmp.b #0x0E
    beq .9F7E

    cmp.b #0x0D
    beq .9F7E

    cmp.b #0x34
    bcc .9F84

    lda.w 0x0C18
    beq .9F84

.9F7E:
    lda.b #0x04
    sta.b 0x02
    bra .9F85

.9F84:
    rts

.9F85:
    jsl 0x8282D3
    bne .9FA7

    inc.w 0x0000,X
    lda.b #0x31
    sta.w 0x000A,X
    stz.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    rep #0x21
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.9FA7:
    sep #0x30
    rts

;-----

_839FAA:
    ldx.b 0x01
    jsr (.9FB8,X)
    lda.b 0x0B
    bne .9FB7

    jml 0x848FCA

.9FB7:
    rtl

.9FB8: d16[.9FC2, .A01D, .A00F, .A00F, .A00F]

.9FC2:
    lda.b #0x02
    sta.b 0x01
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x02
    sta.b 0x18
    sta.b 0x30
    stz.b 0x12
    stz.b 0x38
    stz.b 0x39
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    rep #0x21
    lda.w #0xFFA0
    ldx.b 0x0B
    beq .9FEB

    lda.w #0x0060
.9FEB:
    adc.w 0x0BB0
    sta.b 0x08
    lda.w 0x0BAD
    sta.b 0x05
    lda.w #0xAECF
    sta.b 0x31
    sep #0x20
    lda.b #0x41
    sta.b 0x16
    lda.b 0x0B
    bne .A00E

    lda.b #0x80
    sta.b 0x17
    inc.w 0x0C25
    jmp .A0B5

.A00E:
    rts

.A00F:
    lda.b #0x02
    sta.b 0x01
    lda.b 0x38
    sta.b 0x02
    lda.b 0x39
    sta.b 0x03
    stz.b 0x30
.A01D:
    ldx.b 0x02
    jsr (.A03B,X)
    lda.b 0x00
    beq .A00E

    lda.b 0x02
    sta.b 0x38
    lda.b 0x03
    sta.b 0x39
    lda.w 0x0B9C
    lsr
    bcs .A038

    jsl 0x82808F
.A038:
    jmp .A0C9

.A03B: d16[.A043, .A066, .A085, .A0A4]

.A043:
    ldx.b 0x03
    bne .A057

    inc.b 0x03
    stz.b 0x30
    lda.b #0x01
    ldx.b 0x0B
    beq .A053

    lda.b #0x04
.A053:
    jsl 0x848F07
.A057:
    lda.b 0x0F
    bpl .A061

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.A061:
    jsl 0x848EEA
    rts

.A066:
    ldx.b 0x03
    bne .A076

    inc.b 0x03
    lda.b #0x1E
    sta.b 0x37
    lda.b #0x02
    jsl 0x848F07
.A076:
    dec.b 0x37
    bne .A080

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
.A080:
    jsl 0x848EEA
    rts

.A085:
    ldx.b 0x03
    bne .A097

    inc.b 0x03
    lda.b #0x03
    ldx.b 0x0B
    beq .A093

    lda.b #0x00
.A093:
    jsl 0x848F07
.A097:
    lda.b 0x0F
    bpl .A09F

    lda.b #0x06
    sta.b 0x02
.A09F:
    jsl 0x848EEA
    rts

.A0A4:
    lda.b 0x0B
    bne .A0B0

    inc.b 0x30
    dec.w 0x0BDD
    dec.w 0x0C25
.A0B0:
    jsl 0x8283A3
    rts

.A0B5:
    jsl 0x82833E
    bne .A0C6

    inc.w 0x0000,X
    lda.b #0x14
    sta.w 0x000A,X
    sta.w 0x000B,X
.A0C6:
    sep #0x10
    rts

.A0C9:
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    asl
    asl
    adc.w #0xBFD7
    sta.b 0x20
    sep #0x20
    rts

;-----

_83A0DA:
    ldx.b 0x01
    jsr (.A0E0,X)
    rtl

.A0E0: d16[.A0EC, .A129, .A11B, .A11B, .A11B, .A191]

.A0EC:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x30
    inc.w 0x0C25
    stz.b 0x18
    stz.b 0x12
    stz.b 0x38
    stz.b 0x39
    lda.b 0x0B
    bne .A10E

    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    jsl _839518
.A10E:
    lda.b 0x0B
    beq .A116

    lda.b #0x02
    sta.b 0x02
.A116:
    lda.b #0x47
    sta.b 0x16
    rts

.A11B:
    lda.b #0x02
    sta.b 0x01
    lda.b 0x38
    sta.b 0x02
    lda.b 0x39
    sta.b 0x03
    stz.b 0x30
.A129:
    ldx.b 0x02
    jsr (.A145,X)
    jsl 0x8280B4
    lda.b 0x02
    sta.b 0x38
    lda.b 0x03
    sta.b 0x39
    lda.b 0x0E
    bne .A142

    lda.b #0x0A
    sta.b 0x01
.A142:
    jmp .A19E

.A145: d16[.A149, .A169]

.A149:
    ldx.b 0x03
    bne .A157

    inc.b 0x03
    stz.b 0x30
    lda.b #0x02
    jsl 0x848F07
.A157:
    lda.b 0x0F
    bpl .A164

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    jmp .A1AF

.A164:
    jsl 0x848EEA
    rts

.A169:
    ldx.b 0x03
    bne .A188

    inc.b 0x03
    stz.b 0x30
    rep #0x21
    lda.w #0x0800
    bit.b 0x10
    bvs .A17D

    lda.w #0xF800
.A17D:
    sta.b 0x1A
    sep #0x20
    lda.b #0x03
    jsl 0x848F07
    rts

.A188:
    jsl 0x82823E
    jsl 0x848EEA
    rts

.A191:
    inc.b 0x30
    dec.w 0x0BDD
    dec.w 0x0C25
    jsl 0x8283A3
    rts

.A19E:
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    asl
    asl
    adc.w #0xC003
    sta.b 0x20
    sep #0x20
    rts

.A1AF:
    jsl 0x82833E
    bne .A1D8

    inc.w 0x0000,X
    inc.w 0x0BDD
    lda.b #0x15
    sta.w 0x000A,X
    lda.b 0x11
    eor.b #0x40
    sta.w 0x0011,X
    lda.b #0x01
    sta.w 0x000B,X
    rep #0x21
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.A1D8:
    sep #0x30
    rts

;-----

_83A1DB:
    ldx.b 0x01
    jmp (.A1E0,X)

.A1E0: d16[.A1EA, .A2C1, .A387, .A2BB, .A387]

.A1EA:
    lda.b #0x02
    sta.b 0x01
    inc.w 0x0C25
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    stz.b 0x30
    stz.b 0x12
    lda.b #0x08
    sta.b 0x18
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x97
    sta.b 0x16
    lda.b #0x0A
    sta.b 0x37
    lda.b 0x11
    asl
    asl
    lda.b #0x08
    bcs .A218

    lda.b #0x18
.A218:
    clc
    adc.b 0x0B
    and.b #0x1F
    sta.b 0x38
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    asl
    asl
    sta.b 0x1A
    lda.w 0x00EE3C,X
    asl
    asl
    sta.b 0x1C
    lda.w #0xC01F
    sta.b 0x20
    lda.w #0xADA7
    sta.b 0x31
    lda.w 0x0BAD
    sta.b 0x05
    sta.b 0x28
    sta.b 0x2A
    sta.b 0x2D
    lda.w 0x0BB0
    sta.b 0x08
    sta.b 0x3A
    sta.b 0x3C
    sta.b 0x3E
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
    lda.b 0x0B
    bne .A29C

    jsl 0x848FCA
    lda.b #0x0C
    sta.b 0x18
    lda.b 0x17
    pha
    clc
    adc.b #0x08
    ora.b #0x80
    sta.b 0x17
    jsl 0x848FCA
    lda.b #0x08
    sta.b 0x18
    pla
    sta.b 0x17
    lda.b #0x18
    sta.b 0x39
.A27F:
    jsl 0x82833E
    bne .A29C

    inc.w 0x0BDD
    inc.w 0x0000,X
    lda.b #0x16
    sta.w 0x000A,X
    lda.b 0x39
    sta.w 0x000B,X
    sec
    sbc.b #0x08
    sta.b 0x39
    bne .A27F

.A29C:
    jsl 0x8282ED
    bne .A2B5

    inc.w 0x0000,X
    lda.b #0x03
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    rep #0x20
    tdc
    sta.w 0x000C,X
.A2B5:
    sep #0x30
    jml 0x8280B4

.A2BB:
    stz.b 0x30
    lda.b #0x02
    sta.b 0x01
.A2C1:
    ldx.b 0x02
    jsr (.A347,X)
    rep #0x20
    lda.b 0x2A
    sta.b 0x2D
    lda.b 0x28
    sta.b 0x2A
    lda.b 0x22
    sta.b 0x28
    lda.b 0x3C
    sta.b 0x3E
    lda.b 0x3A
    sta.b 0x3C
    lda.b 0x24
    sta.b 0x3A
    sep #0x20
    jsl 0x82806E
    bcc .A2F2

    dec.w 0x0BDD
    dec.w 0x0C25
    jml 0x8283A3

.A2F2:
    lda.b 0x0B
    beq .A31E

    rep #0x10
    ldx.w #0x1228
.A2FB:
    lda.w 0x0000,X
    beq .A30B

    lda.w 0x000A,X
    cmp.b #0x16
    bne .A30B

    lda.b 0x0B
    beq .A31C

.A30B:
    rep #0x20
    txa
    clc
    adc.w #0x0040
    tax
    sep #0x20
    cpx.w #0x1428
    bcc .A2FB

    stz.b 0x0B
.A31C:
    sep #0x30
.A31E:
    jsl 0x848EEA
    lda.b 0x0B
    bne .A343

    jsl 0x848FCA
    lda.b #0x0C
    sta.b 0x18
    lda.b 0x17
    pha
    clc
    adc.b #0x08
    ora.b #0x80
    sta.b 0x17
    jsl 0x848FCA
    lda.b #0x08
    sta.b 0x18
    pla
    sta.b 0x17
.A343:
    jml 0x8280B4

.A347: d16[.A34D, .A35E, .A359]

.A34D:
    dec.b 0x37
    bne .A359

    lda.b #0x02
    sta.b 0x02
    lda.b #0x1C
    sta.b 0x37
.A359:
    jsl 0x82820A
    rts

.A35E:
    lda.b 0x38
    inc
    and.b #0x1F
    sta.b 0x38
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    asl
    asl
    sta.b 0x1A
    lda.w 0x00EE3C,X
    asl
    asl
    sta.b 0x1C
    sep #0x20
    dec.b 0x37
    bne .A382

    lda.b #0x04
    sta.b 0x02
.A382:
    jsl 0x82820A
    rts

.A387:
    dec.w 0x0BDD
    dec.w 0x0C25
    jml 0x8283A3

;-----

_83A391:
    lda.w 0x1F49
    beq .A39A

    lda.b #0x04
    sta.b 0x01
.A39A:
    ldx.b 0x01
    jmp (.A39F,X)

.A39F: d16[.A3A9, .A429, .A4F5, .A423, .A4F1]

.A3A9:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x08
    sta.b 0x18
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    stz.b 0x30
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x95
    sta.b 0x16
    lda.b #0x01
    sta.b 0x37
    ldx.b 0x3C
    lda.w 0x00BE3C,X
    sta.w 0x0000
    stz.w 0x0001
    stz.w 0x0003
    lda.w 0x00BE3D,X
    sta.w 0x0002
    bpl .A3E1

    dec.w 0x0003
.A3E1:
    rep #0x20
    lda.w 0x0000
    bit.b 0x10
    bvs .A3EE

    eor.w #0xFFFF
    inc
.A3EE:
    clc
    adc.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    clc
    adc.w 0x0002
    sta.b 0x08
    stz.b 0x1A
    stz.b 0x1C
    lda.w #0xC023
    sta.b 0x20
    lda.w #0xB049
    sta.b 0x31
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x00
    jsl 0x848F07
    jsl 0x848FCA
    jml 0x8280B4

.A423:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x30
.A429:
    ldx.b 0x02
    jsr (.A446,X)
    jsl 0x848FCA
    jsl 0x82806E
    bcs .A43C

    jml 0x8280B4

.A43C:
    stz.w 0x0C25
    dec.w 0x0BDD
    jml 0x8283A3

.A446: d16[.A450, .A463, .A490, .A4A7, .A4CD]

.A450:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .A462

    lda.b #0x02
    sta.b 0x02
    lda.b #0x02
    jsl 0x848F07
.A462:
    rts

.A463:
    jsl 0x8281E8
    rep #0x20
    lda.b 0x1C
    cmp.w #0xFA00
    bpl .A475

    lda.w #0xFA00
    sta.b 0x1C
.A475:
    sep #0x20
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .A48F

    lda.b #0x04
    sta.b 0x02
    lda.b #0x1E
    sta.b 0x37
    stz.b 0x1E
    stz.b 0x1C
    stz.b 0x1D
.A48F:
    rts

.A490:
    dec.b 0x37
    bne .A4A2

    lda.b #0x01
    jsl 0x848F07
    lda.b #0x10
    sta.b 0x1F
    lda.b #0x06
    sta.b 0x02
.A4A2:
    jsl 0x84AB6E
    rts

.A4A7:
    jsr _83A508
    jsl 0x848EEA
    lda.b 0x2B
    and.b #0x04
    bne .A4C8

    lda.b #0x08
    sta.b 0x02
    lda.b #0x02
    jsl 0x848F07
    lda.b #0xFF
    sta.b 0x2F
    stz.b 0x1F
    lda.b #0x40
    sta.b 0x1E
.A4C8:
    jsl 0x84AB6E
    rts

.A4CD:
    jsr _83A508
    lda.b 0x2B
    and.b #0x04
    beq .A4EC

    lda.b #0x06
    sta.b 0x02
    lda.b #0x01
    jsl 0x848F07
    stz.b 0x2F
    stz.b 0x1E
    lda.b #0x10
    sta.b 0x1F
    stz.b 0x1C
    stz.b 0x1D
.A4EC:
    jsl 0x84AB6E
    rts

.A4F1:
    jsl 0x84A51A
.A4F5:
    lda.b #0x4C
    jsl _80888B
    jsr _83A55B
    stz.w 0x0C25
    dec.w 0x0BDD
    jml 0x8283A3

;-----

_83A508:
    lda.b 0x11
    asl
    asl
    bcs .A526

    jsl 0x828174
    rep #0x20
    lda.b 0x1A
    cmp.w #0xFC00
    bpl .A53C

    lda.w #0xFC00
    sta.b 0x1A
    ldx.b #0x00
    stx.b 0x1F
    bra .A53C

.A526:
    jsl 0x828195
    rep #0x20
    lda.b 0x1A
    cmp.w #0x0400
    bmi .A53C

    lda.w #0x0400
    sta.b 0x1A
    ldx.b #0x00
    stx.b 0x1F
.A53C:
    lda.b 0x1C
    cmp.w #0xFA00
    bpl .A548

    lda.w #0xFA00
    sta.b 0x1C
.A548:
    sep #0x20
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    beq .A55A

    lda.b #0x04
    sta.b 0x01
    inc.b 0x30
.A55A:
    rts

;-----

_83A55B:
    lda.b #0x06
    sta.b 0x38
.A55F:
    jsl 0x8282ED
    bne .A598

    inc.w 0x0000,X
    lda.b 0x38
    ror
    ror
    ror
    and.b #0x40
    eor.b 0x11
    sta.w 0x0011,X
    lda.b #0x02
    sta.w 0x000A,X
    lda.b 0x38
    cmp.b #0x03
    lda.b #0x01
    bcs .A583

    lda.b #0x02
.A583:
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    dec.b 0x38
    bne .A55F

.A598:
    sep #0x30
    rts

;-----

_83A59B:
    ldx.b 0x01
    jmp (.A5A0,X)

.A5A0: d16[.A5AA, .A5D8, .A5D6, .A5D6, .A5D6]

.A5AA:
    lda.b #0x02
    sta.b 0x01
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x08
    sta.b 0x18
    stz.b 0x30
    ldx.w 0x1F7A
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    lda.b #0x50
    sta.b 0x31
    lda.b #0xAB
    sta.b 0x32
    lda.b #0x54
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
.A5D6:
    stz.b 0x30
.A5D8:
    rep #0x20
    lda.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    sta.b 0x08
    jsl 0x848EEA
    lda.b 0x0F
    and.w #0x007F
    clc
    adc.w #0xC051
    sta.b 0x20
    sep #0x20
    lda.b 0x0F
    bpl .A5FD

    jml 0x8283A3

.A5FD:
    jsl 0x848FCA
    jml 0x8280B4

;-----

_83A605:
    lda.b 0x01
    bne .A637

    inc.b 0x01
    lda.b #0x01
    sta.b 0x28
    lda.b 0x0B
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    sta.b 0x1A
    lda.w 0x00EE3C,X
    sta.b 0x1C
    lda.w #0xC2B2
    sta.b 0x20
    sep #0x20
    lda.b #0x01
    sta.b 0x27
    sta.b 0x26
    lda.b #0x04
    jsl 0x848F07
    lda.b #0x80
    sta.b 0x37
.A637:
    jsl 0x82820A
    jsl 0x849B03
    bne .A64E

    jsl 0x8280B4
    lda.b 0x0E
    beq .A64E

    dec.b 0x37
    beq .A64E

    rtl

.A64E:
    jml 0x8283A3

;-----

_83A652:
    ldx.b 0x01
    jsr (.A658,X)
    rtl

.A658: d16[.A65C, .A67D]

.A65C:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x27
    lda.b #0x01
    sta.b 0x28
    lda.b #0x02
    sta.b 0x26
    lda.b #0x02
    sta.b 0x12
    jsl 0x8280B4
    lda.b #0x60
    sta.b 0x39
    lda.b 0x0B
    jsl 0x848F07
    rts

.A67D:
    dec.b 0x39
    bne .A684

    jmp .A6A5

.A684:
    lda.b 0x28
    bne .A68C

    jsl 0x849B43
.A68C:
    jsl 0x849B03
    bne .A6A5

    jsl 0x82823E
    jsl 0x848EEA
    jsl 0x8280B4
    lda.b 0x0E
    bne .A6B3

    jmp .A6AF

.A6A5:
    lda.b 0x16
    cmp.b #0x28
    bne .A6AF

    jsl 0x84A4AB
.A6AF:
    jsl 0x8283A3
.A6B3:
    rts

;-----

_83A6B4:
    ldx.b 0x01
    jsr (.A6BA,X)
    rtl

.A6BA: d16[.A6BE, .A6EE]

.A6BE:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x27
    lda.b #0x01
    sta.b 0x28
    lda.b #0x02
    sta.b 0x26
    lda.b #0x02
    sta.b 0x12
    lda.b #0x40
    sta.b 0x1E
    stz.b 0x37
    rep #0x20
    lda.w #0xC2CC
    sta.b 0x20
    sep #0x20
    lda.b #0x50
    sta.b 0x16
    lda.b #0x02
    jsl 0x848F07
    jsl 0x8280B4
    rts

.A6EE:
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0027,X
    and.b #0x7F
    bne .A6FD

    lda.b #0x01
    sta.b 0x37
.A6FD:
    sep #0x10
    jsl 0x849B03
    bne .A71E

    jsl 0x8281E8
    jsl 0x848EEA
    jsl 0x8280B4
    jsl 0x82806E
    bcc .A73B

    jsl 0x8283A3
    jmp .A73B

.A71E:
    jsl 0x8283A3
    lda.b 0x37
    bne .A73B

    rep #0x10
    ldx.b 0x0C
    lda.w 0x000A,X
    cmp.b #0x30
    bne .A73B

    lda.w 0x0000,X
    beq .A73B

    lda.b #0xFF
    sta.w 0x000B,X
.A73B:
    sep #0x10
    rts

;-----

_83A73E:
    ldx.b 0x01
    jmp (.A743,X)

.A743: d16[.A749, .A7BF, .A803]

.A749:
    rep #0x20
    lda.w #0xC2D8
    sta.b 0x20
    sep #0x20
    lda.b #0x0C
    jsl 0x848F07
    lda.b #0x02
    sta.b 0x27
    sta.b 0x26
    stz.b 0x28
    lda.b 0x0B
    beq .A7AB

    lda.b #0x04
    sta.b 0x01
    jsl 0x84A07C
    sta.b 0x0B
    lda.b 0x11
    asl
    asl
    lda.b 0x0B
    bcc .A786

    cmp.b #0x0D
    bcc .A77E

    lda.b #0x0C
    bra .A794

.A77E:
    cmp.b #0x04
    bcs .A794

    lda.b #0x04
    bra .A794

.A786:
    cmp.b #0x1D
    bcc .A78E

    lda.b #0x1C
    bra .A794

.A78E:
    cmp.b #0x14
    bcs .A794

    lda.b #0x14
.A794:
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
    sep #0x20
    jml 0x8280B4

.A7AB:
    lda.b #0x02
    sta.b 0x01
    rep #0x20
    stz.b 0x1C
    stz.b 0x1A
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    jml 0x8280B4

.A7BF:
    jsl 0x8281E8
    jsl 0x849B03
    lda.b 0x02
    bne .A7E7

    rep #0x10
    ldx.b 0x0C
    lda.w 0x0000,X
    beq .A7E3

    jsl 0x849C0E
    bcc .A7E7

    lda.b #0x01
    sta.w 0x000B,X
    jml 0x8283A3

.A7E3:
    sep #0x10
    inc.b 0x02
.A7E7:
    sep #0x10
    jsl 0x8280B4
    lda.b 0x0E
    beq .A7F2

    rtl

.A7F2:
    lda.b 0x02
    bne .A7FF

    rep #0x10
    ldx.b 0x0C
    lda.b #0x80
    sta.w 0x000B,X
.A7FF:
    jml 0x8283A3

.A803:
    jsl 0x82820A
    jsl 0x849B03
    bne .A81C

    jsl 0x82806E
    bcs .A81C

    jsl 0x8280B4
    lda.b 0x0E
    beq .A858

    rtl

.A81C:
    stz.b 0x38
    lda.b #0x18
    sta.b 0x37
    lda.b #0x03
    sta.b 0x3C
    stz.b 0x3B
    jsr _83A85C
    lda.b #0x40
    sta.b 0x38
    lda.b #0x19
    sta.b 0x37
    lda.b #0x03
    sta.b 0x3C
    stz.b 0x3B
    jsr _83A85C
    stz.b 0x38
    lda.b #0x19
    sta.b 0x37
    stz.b 0x3B
    stz.b 0x3C
    jsr _83A85C
    lda.b #0x40
    sta.b 0x38
    lda.b #0x1A
    sta.b 0x37
    stz.b 0x3B
    stz.b 0x3C
    jsr _83A85C
.A858:
    jml 0x8283A3

;-----

_83A85C:
    rep #0x20
    jsl 0x849086
    and.w #0x03FF
    clc
    adc.w #0x0100
    sta.b 0x39
    jsl 0x849086
    and.w #0x01FF
    clc
    adc.b 0x3B
    sta.b 0x3B
    jsl 0x8282D3
    bne .A8BA

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda.b 0x37
    sta.w 0x000B,X
    stz.w 0x001F,X
    lda.b #0x40
    sta.w 0x001E,X
    lda.b 0x38
    ora.b #0x30
    sta.w 0x0011,X
    asl
    asl
    rep #0x20
    lda.b 0x39
    bcs .A8A5

    eor.w #0xFFFF
    inc
.A8A5:
    sta.w 0x001A,X
    lda.b 0x3B
    sta.w 0x001C,X
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    stz.w 0x000C,X
.A8BA:
    sep #0x30
    rts

;-----

_83A8BD:
    ldx.b 0x01
    jmp (.A8C2,X)

.A8C2: d16[.A8C8, .A921, .AB0F]

.A8C8:
    stz.b 0x29
    stz.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcc .A8D9

    lda.b #0x04
    sta.b 0x01
    rtl

.A8D9:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x30
    lda.l 0x7F825C
    sta.b 0x18
    stz.b 0x12
    stz.b 0x2F
    stz.b 0x26
    stz.b 0x34
    stz.b 0x33
    stz.b 0x10
    lda.b #0x04
    sta.b 0x27
    lda.b #0x03
    sta.b 0x28
    rep #0x20
    lda.w #0xC300
    sta.b 0x20
    lda.b 0x0B
    asl
    tay
    lda 0x00C314,Y
    sta.b 0x1A
    lda.w #0x02F5
    sta.b 0x1C
    lda.w #0x0040
    sta.b 0x1E
    sep #0x20
    lda.b 0x1A
    and.b #0x40
    eor.b #0x40
    tsb.b 0x11
    lda.b #0x65
    sta.b 0x16
.A921:
    lda.l 0x7F835C
    ora.b #0x30
    sta.b 0x11
    jsl 0x82806E
    bcc .A934

    lda.b #0x04
    sta.b 0x01
    rtl

.A934:
    ldx.b 0x02
    jsr (.A975,X)
    bit.b 0x34
    bvs .A952

    jsl 0x849B03
    beq .A952

    lda.b #0x40
    tsb.b 0x34
    lda.b #0x0C
    ldx.b 0x2F
    beq .A94F

    lda.b #0x0E
.A94F:
    jsr _8386F1
.A952:
    jsl 0x849B43
    beq .A963

    bpl .A95F

    lda.b #0x10
    jsr _8386F1
.A95F:
    lda.b #0x0E
    trb.b 0x11
.A963:
    lda.b 0x33
    beq .A96A

    dec
    sta.b 0x33
.A96A:
    lsr
    bcs .A971

    jsl 0x8280B4
.A971:
    jml 0x8491BE

.A975: d16[.A987, .A9A9, .A9D0, .A9F0, .AA22, .AA3C, .AA6A, .AAB5, .AAF6]

.A987:
    ldx.b 0x03
    bne .A995

    inc.b 0x03
    inc.b 0x2F
    lda.b #0x01
    jsl 0x848F07
.A995:
    lda.b 0x1D
    bpl .A99E

    lda.b #0x02
    jmp _8386F1

.A99E:
    jsl 0x828174
    jsl 0x848EEA
    jmp .AB1A

.A9A9:
    ldx.b 0x03
    bne .A9B5

    inc.b 0x03
    inc.b 0x2F
    stz.b 0x1C
    stz.b 0x1D
.A9B5:
    lda.b 0x2B
    bit.b #0x04
    beq .A9C2

    stz.b 0x2F
    lda.b #0x06
    jmp _8386F1

.A9C2:
    jsl 0x828174
    jsr _83AB4A
    jsl 0x848EEA
    jmp .AB1A

.A9D0:
    ldx.b 0x03
    bne .A9DC

    inc.b 0x03
    lda.b #0x03
    jsl 0x848F07
.A9DC:
    lda.b 0x0F
    bpl .A9EB

    lda.b #0x00
    ldx.b 0x1D
    bpl .A9E8

    lda.b #0x02
.A9E8:
    jmp _8386F1

.A9EB:
    jsl 0x848EEA
    rts

.A9F0:
    ldx.b 0x03
    bne .A9FE

    inc.b 0x03
    inc.b 0x10
    lda.b #0x04
    jsl 0x848F07
.A9FE:
    lda.b 0x0F
    bpl .AA1D

    ldx.b #0x08
    lda.b 0x10
    cmp.b #0x02
    bcs .AA19

    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    lsr
    sta.b 0x1C
    sep #0x20
    ldx.b #0x00
.AA19:
    txa
    jmp _8386F1

.AA1D:
    jsl 0x848EEA
    rts

.AA22:
    ldx.b 0x03
    bne .AA2E

    inc.b 0x03
    lda.b #0x05
    jsl 0x848F07
.AA2E:
    lda.b 0x0F
    bpl .AA37

    lda.b #0x0A
    jmp _8386F1

.AA37:
    jsl 0x848EEA
    rts

.AA3C:
    ldx.b 0x03
    bne .AA54

    inc.b 0x03
    lda.b #0x5A
    sta.b 0x10
    lda.b #0x0A
    sta.b 0x20
    lda.b #0xC3
    sta.b 0x21
    lda.b #0x06
    jsl 0x848F07
.AA54:
    dec.b 0x10
    bne .AA5D

    lda.b #0x04
    sta.b 0x01
    rts

.AA5D:
    lda.b #0x0A
    cmp.b 0x10
    bne .AA65

    sta.b 0x33
.AA65:
    jsl 0x848EEA
    rts

.AA6A:
    ldx.b 0x03
    bne .AA88

    inc.b 0x03
    rep #0x20
    lda.w #0xC30A
    sta.b 0x20
    lda.w 0x0BAD
    sta.b 0x05
    sep #0x20
    lda.b #0x78
    sta.b 0x10
    lda.b #0x07
    jsl 0x848F07
.AA88:
    lda.w 0x0BCF
    beq .AA98

    bmi .AA98

    lda.b #0x08
    tsb.w 0x0BD4
    dec.b 0x10
    bne .AA9D

.AA98:
    lda.b #0x10
    jmp _8386F1

.AA9D:
    lda.w 0x0BE2
    ora.w 0x0BE3
    beq .AAAE

    lda.b 0x10
    sec
    sbc.b #0x05
    sta.b 0x10
    bmi .AA98

.AAAE:
    jsl 0x848EEA
    jmp .AB38

.AAB5:
    ldx.b 0x03
    bne .AADA

    inc.b 0x03
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    lda.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    clc
    adc.w #0x0008
    sta.b 0x08
    sep #0x20
    lda.b #0x08
    jsl 0x848F07
    jmp .AB38

.AADA:
    lda.b #0x08
    tsb.w 0x0BD4
    lda.b 0x2B
    bit.b #0x04
    beq .AAEC

    stz.b 0x2F
    lda.b #0x0C
    jmp _8386F1

.AAEC:
    jsl 0x828174
    jsr _83AB4A
    jmp .AB38

.AAF6:
    ldx.b 0x03
    bne .AB02

    inc.b 0x03
    lda.b #0x09
    jsl 0x848F07
.AB02:
    lda.b 0x0F
    bpl .AB0A

    lda.b #0x04
    sta.b 0x01
.AB0A:
    jsl 0x848EEA
    rts

.AB0F:
    rep #0x10
    ldx.b 0x0C
    dec.w 0x0037,X
    jml 0x8283A3

.AB1A:
    lda.b 0x2B
    bit.b #0x03
    beq .AB37

    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
    lda.b #0x04
    jmp _8386F1

.AB37:
    rts

.AB38:
    rep #0x21
    lda.b 0x08
    adc.w #0xFFF8
    sta.w 0x0BB0
    lda.b 0x05
    sta.w 0x0BAD
    sep #0x20
    rts

;-----

_83AB4A:
    rep #0x20
    lda.w #0xFD00
    cmp.b 0x1C
    bmi .AB55

    sta.b 0x1C
.AB55:
    sep #0x20
    rts

;-----

_83AB58:
    ldy.b #0x27
    lda (0x0C),Y
    and.b #0x7F
    bne .AB64

    jml 0x8283A3

.AB64:
    lda.b 0x0F
    bpl .AB6E

    lda.b #0x51
    jsl _80888B
.AB6E:
    ldx.b 0x01
    jmp (.AB73,X)

.AB73: d16[.AB79, .ABC5, .ABDD]

.AB79:
    stz.b 0x28
    jsl 0x84A07C
    sta.b 0x37
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
    lda.w #0xC31C
    sta.b 0x20
    sep #0x20
    lda.b #0x28
    sta.b 0x38
    lda.l 0x7F8269
    sta.b 0x18
    lda.l 0x7F8369
    sta.b 0x11
    lda.b #0x75
    sta.b 0x16
    lda.b #0x16
    jsl 0x848F07
    lda.b #0x02
    sta.b 0x01
    lda.b #0x02
    sta.b 0x26
    sta.b 0x27
    jsl 0x849B03
    jml 0x8280B4

.ABC5:
    jsl 0x82820A
    dec.b 0x38
    bne .ABD1

    lda.b #0x04
    sta.b 0x01
.ABD1:
    jsl 0x848EEA
    jsl 0x849B03
    jml 0x8280B4

.ABDD:
    rep #0x30
    ldx.b 0x0C
    lda.w 0x0005,X
    sta.w 0x0004
    lda.w 0x0008,X
    sec
    sbc.w #0x0010
    sta.w 0x0006
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    sep #0x30
    jsl 0x84A097
    sec
    sbc.b 0x37
    beq .AC10

    and.b #0x10
    beq .AC0E

    dec.b 0x37
    bra .AC10

.AC0E:
    inc.b 0x37
.AC10:
    lda.b 0x37
    and.b #0x1F
    sta.b 0x37
    asl
    asl
    tax
    rep #0x30
    lda.w 0x00EE3A,X
    asl
    sta.b 0x1A
    lda.w 0x00EE3C,X
    asl
    sta.b 0x1C
    jsl 0x82820A
    ldx.b 0x0C
    lda.b 0x05
    sec
    sbc.w 0x0005,X
    bcs .AC39

    eor.w #0xFFFF
    inc
.AC39:
    cmp.w #0x0006
    bcs .AC5C

    lda.b 0x08
    clc
    adc.w #0x0010
    sec
    sbc.w 0x0008,X
    bcs .AC4E

    eor.w #0xFFFF
    inc
.AC4E:
    cmp.w #0x0006
    bcs .AC5C

    sep #0x20
    inc.w 0x0037,X
    jml 0x8283A3

.AC5C:
    sep #0x30
    jsl 0x848EEA
    jsl 0x849B03
    jml 0x8280B4

;-----

_83AC6A:
    ldx.b 0x01
    jsr (.AC70,X)
    rtl

.AC70: d16[.AC76, .ACCB, .AD37]

.AC76:
    inc.b 0x28
    lda.b #0x02
    sta.b 0x01
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x06
    sta.b 0x12
    lda.b #0x0A
    sec
    sbc.b 0x0B
    sta.b 0x38
    sta.b 0x37
    asl
    asl
    clc
    adc.b 0x37
    sta.b 0x37
    rep #0x20
    lda.b 0x37
    and.w #0x00FF
    clc
    adc.w #0xC320
    sta.b 0x20
    sep #0x20
    jsl 0x8280B4
    lda.b 0x0B
    jsl 0x848F07
    lda.b 0x38
    asl
    tax
    lda.w 0x00C34D,X
    sta.b 0x29
    lda.w 0x00C34E,X
    sta.b 0x2A
    lda.b 0x11
    and.b #0x40
    beq .ACCA

    lda.b 0x29
    eor.b #0xFF
    inc
    sta.b 0x29
.ACCA:
    rts

.ACCB:
    jsl 0x849B03
    jsl 0x8490A0
    cmp.b #0x00
    beq .AD22

    rep #0x20
    lda.b 0x29
    and.w #0x00FF
    sta.w 0x0000
    and.w #0x0080
    beq .ACEE

    lda.b 0x29
    ora.w #0xFF00
    sta.w 0x0000
.ACEE:
    lda.b 0x2A
    and.w #0x00FF
    sta.w 0x0002
    and.w #0x0080
    beq .AD03

    lda.b 0x2A
    ora.w #0xFF00
    sta.w 0x0002
.AD03:
    lda.b 0x05
    clc
    adc.w 0x0000
    sta.b 0x05
    lda.b 0x08
    clc
    adc.w 0x0002
    sta.b 0x08
    sep #0x20
    lda.b #0x0B
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x01
    jmp .AD36

.AD22:
    jsl 0x82820A
    jsl 0x848EEA
    jsl 0x8280B4
    lda.b 0x0E
    bne .AD36

    jsl 0x8283A3
.AD36:
    rts

.AD37:
    lda.b 0x0F
    bmi .AD46

    jsl 0x848EEA
    jsl 0x8280B4
    jmp .AD4A

.AD46:
    jsl 0x8283A3
.AD4A:
    rts

;-----

_83AD4B:
    ldx.b 0x01
    jsr (.AD82,X)
    lda.b 0x37
    tsb.b 0x11
    lda.b 0x00
    bne .AD59

    rtl

.AD59:
    jsl 0x849B03
    bne .AD67

    jsl 0x849B43
    beq .AD75

    bpl .AD71

.AD67:
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    jml 0x8280B4

.AD71:
    lda.b #0x0E
    trb.b 0x11
.AD75:
    jsl 0x8280B4
    lda.b 0x0E
    beq .AD7E

    rtl

.AD7E:
    jml 0x8283A3

.AD82: d16[.AD88, .ADCC, .AE36]

.AD88:
    rep #0x20
    lda.w #0xC3BE
    sta.b 0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    asl
    asl
    asl
    sta.b 0x1A
    lda.w #0x0606
    sta.b 0x1C
    sep #0x20
    lda.b 0x11
    and.b #0x0E
    sta.b 0x37
    stz.b 0x1F
    lda.b #0x44
    sta.b 0x1E
    lda.b #0x03
    sta.b 0x26
    sta.b 0x28
    lda.b #0x04
    sta.b 0x27
    stz.b 0x2B
    stz.b 0x2F
    stz.b 0x30
    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    lda.b #0x05
    jsl 0x848F07
    rts

.ADCC:
    ldx.b 0x02
    jmp (.ADD1,X)

.ADD1: d16[.ADD7, .ADF0, .AE1D]

.ADD7:
    jsl 0x8281E8
    rep #0x20
    lda.b 0x1C
    bpl .ADED

    sep #0x20
    lda.b #0x04
    jsl 0x848F07
    lda.b #0x02
    sta.b 0x02
.ADED:
    sep #0x20
    rts

.ADF0:
    lda.b 0x0F
    bpl .AE14

    lda.b #0x06
    jsl 0x848F07
    rep #0x20
    stz.b 0x1A
    lda.w #0xFE80
    sta.b 0x1C
    lda.b 0x08
    sec
    sbc.w #0x0003
    sta.b 0x08
    sep #0x20
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rts

.AE14:
    jsl 0x8281E8
    jsl 0x848EEA
    rts

.AE1D:
    jsl 0x82825D
    jsl 0x848EEA
    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x04
    beq .AE35

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
.AE35:
    rts

.AE36:
    jsl 0x8283A3
    jsl 0x84A445
    rts

;-----

_83AE3F:
    ldx.b 0x01
    jmp (.AE44,X)

.AE44: d16[.AE48, .AE65]

.AE48:
    lda.b #0x02
    sta.b 0x26
    sta.b 0x27
    lda.b #0x01
    sta.b 0x28
    lda.b #0x02
    sta.b 0x12
    lda.b #0x02
    sta.b 0x01
    lda.b #0x60
    sta.b 0x38
    lda.b #0x05
    jsl 0x848F07
    rtl

.AE65:
    dec.b 0x38
    beq .AE7D

    jsl 0x82820A
    jsl 0x849B03
    bne .AE7D

    jsl 0x82806E
    bcs .AE7D

    jml 0x8280B4

.AE7D:
    jml 0x8283A3

;-----

    incsrc "obj/hoganmer.asm"
    incsrc "obj/armor_armarge.asm"

;-----

_83B938:
    lda.b 0x01
    bne .B9AA

    inc.b 0x01
    lda.b #0x01
    sta.b 0x28
    lda.b #0x40
    sta.b 0x18
    lda.b #0x28
    tsb.b 0x11
    lda.b #0x63
    sta.b 0x16
    lda.b #0x02
    sta.b 0x12
    lda.b 0x0B
    beq .B983

    dec
    asl
    asl
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    asl
    asl
    sta.b 0x1A
    lda.w 0x00EE3C,X
    asl
    asl
    sta.b 0x1C
    lda.w #0xC95C
    sta.b 0x20
    sep #0x20
    lda.b #0x06
    sta.b 0x26
    lda.b #0x01
    sta.b 0x27
    lda.b #0x03
    jsl 0x848F07
    bra .B9AA

.B983:
    lda.b #0x04
    sta.b 0x26
    lda.b #0x01
    sta.b 0x27
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0300
    bcs .B999

    lda.w #0xFD00
.B999:
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0xC95C
    sta.b 0x20
    sep #0x20
    lda.b #0x02
    jsl 0x848F07
.B9AA:
    jsl 0x848EEA
    jsl 0x82820A
    jsl 0x849B03
    bne .B9C1

    jsl 0x8280B4
    lda.b 0x0E
    beq .B9C1

    rtl

.B9C1:
    jml 0x8283A3

;-----

_83B9C5:
    php
    sep #0x30
    cmp.b #0x0B
    beq .B9E7

    ldx.b 0x33
    beq .B9D3

    clc
    adc.b #0x0B
.B9D3:
    tax
    lda.w 0x00C960,X
    ldx.b #0x62
    stx.b 0x16
    jsl 0x848F07
    lda.b #0x01
    tsb.b 0x11
    stz.b 0x18
    plp
    rts

.B9E7:
    ldx.b #0x63
    stx.b 0x16
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x01
    trb.b 0x11
    lda.b #0x40
    sta.b 0x18
    plp
    rts

;-----

_83B9FB:
    rep #0x20
    lda.w #0x0100
    ldx.b 0x1B
    bpl .BA07

    lda.w #0xFF00
.BA07:
    sta.b 0x1A
    lda.w #0x0506
    sta.b 0x1C
    sep #0x20
    lda.b #0x0C
    sta.b 0x03
    lda.b #0x80
    trb.b 0x37
    lda.b #0x04
    jmp _83B9C5

;-----

_83BA1D:
    lda.b 0x33
    beq .BA24

    lda.b #0x00
    rts

.BA24:
    rep #0x10
    ldx.w #0x1228
.BA29:
    sep #0x20
    lda.w 0x0000,X
    beq .BA84

    lda.w 0x0030,X
    bne .BA84

    lda.w 0x002C,X
    bne .BA84

    rep #0x20
    lda.w 0x0020,X
    tay
    lda 0x0000,Y
    and.w #0x00FF
    bit.w #0x0080
    beq .BA4E

    ora.w #0xFF00
.BA4E:
    pha
    lda.w 0x0011,X
    xba
    asl
    asl
    pla
    bcc .BA5C

    eor.w #0xFFFF
    inc
.BA5C:
    clc
    adc.w 0x0005,X
    sec
    sbc.b 0x05
    bcs .BA69

    eor.w #0xFFFF
    inc
.BA69:
    cmp.w #0x0050
    bcs .BA84

    lda.b 0x08
    sec
    sbc.w 0x0008,X
    bcs .BA7A

    eor.w #0xFFFF
    inc
.BA7A:
    cmp.w #0x0024
    bcs .BA84

    inc.w 0x002C,X
    bra .BA96

.BA84:
    rep #0x20
    txa
    clc
    adc.w #0x0040
    tax
    cmp.w #0x1428
    bcc .BA29

.BA91:
    sep #0x30
    lda.b #0x00
    rts

.BA96:
    sep #0x30
    jsl 0x849086
    and.b #0x0F
    cmp.b #0x04
    bcc .BA91

    stz.b 0x3C
    lda.b #0x01
    rts

;-----

_83BAA7:
    lda.b 0x3C
    beq .BAC6

    dec.b 0x3C
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0002
    bcc .BABB

    lda.w #0xFFFE
.BABB:
    clc
    adc.b 0x05
    sta.b 0x05
    sep #0x20
    jsl 0x8491BE
.BAC6:
    rts

;-----

_83BAC7:
    lda.b #0x04
    sta.b 0x3D
.BACB:
    jsl 0x8282D3
    bne .BB32

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda.b 0x3D
    clc
    adc.b #0x1E
    sta.w 0x000B,X
    lda.b #0x00
    xba
    lda.b 0x3D
    asl
    tay
    lda.b 0x11
    and.b #0x70
    sta.w 0x0011,X
    asl
    asl
    rep #0x20
    lda 0x00C9B3,Y
    bcc .BAFC

    eor.w #0xFFFF
    inc
.BAFC:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda 0x00C9BD,Y
    clc
    adc.b 0x08
    sta.w 0x0008,X
    lda.b 0x10
    asl
    asl
    lda 0x00C9C7,Y
    bcc .BB18

    eor.w #0xFFFF
    inc
.BB18:
    sta.w 0x001A,X
    lda 0x00C9D1,Y
    sta.w 0x001C,X
    stz.w 0x000C,X
    sep #0x20
    stz.w 0x001F,X
    lda.b #0x40
    sta.w 0x001E,X
    dec.b 0x3D
    bpl .BACB

.BB32:
    sep #0x10
    rts

;-----

_83BB35:
    php
    sep #0x30
    lda.b #0x03
    sta.b 0x3D
    jsl 0x849086
    and.b #0x0F
    sta.w 0x0004
.BB45:
    jsl 0x8282D3
    beq .BB4D

    plp
    rts

.BB4D:
    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda.b #0x00
    xba
    lda.w 0x0004
    clc
    adc.b 0x3D
    tay
    lda 0x00C9DB,Y
    sta.w 0x000B,X
    rep #0x20
    stz.w 0x000C,X
    jsl 0x849086
    and.w #0x000F
    asl
    tay
    lda.b 0x3D
    lsr
    lda 0x00C9EE,Y
    bcc .BB7F

    eor.w #0xFFFF
    inc
.BB7F:
    sta.w 0x001A,X
    jsl 0x849086
    and.w #0x000F
    asl
    tay
    lda 0x00CA0E,Y
    sta.w 0x001C,X
    lda.w 0x0000
    sta.w 0x0005,X
    lda.w 0x0002
    sta.w 0x0008,X
    sep #0x20
    lda.b #0x40
    sta.w 0x001E,X
    stz.w 0x001F,X
    dec.b 0x3D
    bpl .BB45

    jsl 0x8282D3
    bne .BBCD

    inc.w 0x0000,X
    lda.b #0x22
    sta.w 0x000A,X
    stz.w 0x000B,X
    stz.w 0x0011,X
    rep #0x20
    lda.w 0x0000
    sta.w 0x0005,X
    lda.w 0x0002
    sta.w 0x0008,X
.BBCD:
    plp
    rts

;-----

_83BBCF:
    ldx.b 0x01
    jmp (.BBD4,X)

.BBD4: d16[.BBDC, .BCA3, .BCBC, .BD67]

.BBDC:
    jsl 0x82827D
    lda.b 0x0B
    beq .BC23

    rep #0x10
    ldx.w #0x0E68
.BBE9:
    sep #0x20
    lda.w 0x0000,X
    beq .BC0B

    lda.w 0x000A,X
    cmp.b #0x18
    bne .BC0B

    lda.w 0x000B,X
    beq .BC0B

    rep #0x20
    tdc
    sta.w 0x0000
    cpx.w 0x0000
    beq .BC0B

    jml 0x828387

.BC0B:
    rep #0x21
    txa
    adc.w #0x0040
    tax
    cmp.w #0x1228
    bcc .BBE9

    lda.w #0xCAA9
    sta.b 0x20
    sep #0x30
    lda.b #0x06
    sta.b 0x01
    rtl

.BC23:
    lda.b #0x04
    sta.b 0x12
    lda.b #0x01
    sta.b 0x27
    sta.b 0x26
    lda.b #0x00
    jsl 0x848F07
    rep #0x20
    lda.w #0xCA9F
    sta.b 0x20
    lda.b 0x05
    cmp.w #0x0C20
    bcs .BC46

    cmp.w #0x05E0
    bcs .BC4A

.BC46:
    jml 0x828398

.BC4A:
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .BC56

    eor.w #0xFFFF
    inc
.BC56:
    cmp.w #0x0018
    sep #0x20
    bcs .BC67

    jsl 0x849086
    and.b #0x0F
    cmp.b #0x0A
    bcc .BC46

.BC67:
    lda.b #0x20
    jsl _80888B.88B6
    lda.b #0x14
    jsl 0x84A333
    stz.b 0x29
    lda.b #0xF7
    sta.b 0x2A
.BC79:
    jsl 0x8490A0
    cmp.b #0x34
    bcs .BC8F

    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x0010
    sta.b 0x08
    sep #0x20
    bra .BC79

.BC8F:
    cmp.b #0x34
    bne .BC97

    jml 0x828398

.BC97:
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
    jml 0x8280B4

.BCA3:
    jsl 0x848EEA
    lda.b 0x0F
    beq .BD09

    lda.b #0x04
    sta.b 0x01
    rep #0x20
    lda.w #0xFE00
    sta.b 0x1C
    sep #0x20
    stz.b 0x36
    bra .BD09

.BCBC:
    jsl 0x848EEA
    jsl 0x8281E8
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .BD09

    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    lsr
    lsr
    ldx.b 0x36
    beq .BCE1

    cmp.w #0x0100
    bcc .BCE9

.BCE1:
    sta.b 0x1C
    inc.b 0x36
    sep #0x20
    bra .BD09

.BCE9:
    rep #0x20
    lda.w #0x0227
    sta.w 0x0008
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    sep #0x20
    jsl 0x849111
    jsl _80B8D5
    jml 0x828398

.BD09:
    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .BD3B

    lda.w 0x0C32
    ora.w 0x1F0C
    bne .BD54

    rep #0x20
    lda.w 0x0BB0
    cmp.b 0x08
    sep #0x20
    bcc .BD30

    lda.w 0x1F99
    and.b #0x01
    bne .BD54

.BD30:
    lda.b #0x01
    sta.w 0x0BCE
    jsl 0x849F2A
    bra .BD54

.BD3B:
    jsl 0x849B43
    bne .BD54

    jsr _83BF1E
    bne .BD54

    jsl 0x82806E
    bcs .BD50

    jml 0x8280B4

.BD50:
    jml 0x828398

.BD54:
    rep #0x20
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    jsr _83BEC0
    jml 0x828398

.BD67:
    rep #0x10
    ldx.w #0x1228
.BD6C:
    lda.w 0x0000,X
    beq .BD7B

    lda.w 0x000E,X
    beq .BD7B

    lda.w 0x0030,X
    beq .BD7E

.BD7B:
    jmp .BE22

.BD7E:
    rep #0x20
    lda.w 0x0020,X
    tay
    rep #0x20
    lda.w 0x0010,X
    asl
    asl
    lda 0x0000,Y
    bcc .BD94

    eor.w #0x00FF
    inc
.BD94:
    and.w #0x00FF
    bit.w #0x0080
    beq .BD9F

    ora.w #0xFF00
.BD9F:
    clc
    adc.w 0x0005,X
    and.w #0xFFF0
    sec
    sbc.w #0x0008
    sta.b 0x05
    lda 0x0001,Y
    and.w #0x00FF
    bit.w #0x0080
    beq .BDBA

    ora.w #0xFF00
.BDBA:
    clc
    adc.w 0x0008,X
    and.w #0xFFF0
    sec
    sbc.w #0x0008
    sta.b 0x08
    jsr _83BE48
    lda.b 0x05
    clc
    adc.w #0x0010
    sta.b 0x05
    jsr _83BE48
    lda.b 0x05
    clc
    adc.w #0x0010
    sta.b 0x05
    jsr _83BE48
    lda.b 0x08
    clc
    adc.w #0x0010
    sta.b 0x08
    jsr _83BE48
    lda.b 0x05
    sec
    sbc.w #0x0010
    sta.b 0x05
    jsr _83BE48
    lda.b 0x05
    sec
    sbc.w #0x0010
    sta.b 0x05
    jsr _83BE48
    lda.b 0x08
    clc
    adc.w #0x0010
    sta.b 0x08
    jsr _83BE48
    lda.b 0x05
    clc
    adc.w #0x0010
    sta.b 0x05
    jsr _83BE48
    lda.b 0x05
    clc
    adc.w #0x0010
    sta.b 0x05
    jsr _83BE48
.BE22:
    rep #0x20
    txa
    clc
    adc.w #0x0040
    tax
    sep #0x20
    cpx.w #0x1428
    bcs .BE34

    jmp .BD6C

.BE34:
    rep #0x20
    lda.w 0x1E4D
    cmp.w #0x0440
    bcc .BE44

    cmp.w #0x0CA0
    bcs .BE44

    rtl

.BE44:
    jml 0x828387

;-----

_83BE48:
    php
    rep #0x30
    stx.b 0x34
    lda.w 0x0005,X
    cmp.w #0x0C50
    bcs .BEBC

    cmp.w #0x05B0
    bcc .BEBC

    lda.w 0x0008,X
    cmp.w #0x02F0
    bcs .BEBC

    cmp.w #0x0250
    bcc .BEBC

    sep #0x20
    jsl 0x849C0E
    bcc .BEBC

    jsl 0x84A544
    phd
    rep #0x20
    lda.w #0x0000
    tcd
    jsl 0x849156
    lda.l 0x7E2000,X
    tay
    lda.w 0x0B92
    sta.b 0x10
    lda.w 0x0B94
    sta.b 0x12
    lda [0x10],Y
    sep #0x20
    pld
    ldx.b 0x34
    cmp.b #0x34
    bne .BEBC

    lda.b #0x06
    sta.w 0x0001,X
    rep #0x20
    lda.w 0x0000
    sta.w 0x0033,X
    lda.w 0x0002
    sta.w 0x0035,X
    lda.w #0x0226
    sta.w 0x0008
    jsl 0x849111
    jsl _80B8D5
    jsr _83BEC0
.BEBC:
    plp
    ldx.b 0x34
    rts

;-----

_83BEC0:
    php
    sep #0x30
    ldy.b #0x03
    jsl 0x849086
    and.b #0x03
    asl
    asl
    sta.b 0x33
.BECF:
    jsl 0x8282D3
    bne .BF1C

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    phy
    tya
    clc
    adc.b 0x33
    tay
    lda 0x00CAED,Y
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b #0x40
    sta.w 0x001E,X
    stz.w 0x001F,X
    tya
    asl
    tay
    rep #0x20
    lda 0x00CAAD,Y
    sta.w 0x001A,X
    lda 0x00CACD,Y
    sta.w 0x001C,X
    lda.w 0x0000
    sta.w 0x0005,X
    lda.w 0x0002
    sta.w 0x0008,X
    stz.w 0x000C,X
    sep #0x20
    ply
    dey
    bpl .BECF

.BF1C:
    plp
    rts

;-----

_83BF1E:
    lda.b #0x34
    sta.b 0x0A
    jsl 0x84A1D0
    lda.b #0x18
    sta.b 0x0A
    cpy.b #0x00
    beq .BF3E

    rep #0x10
    ldx.w 0x0000
    jsl 0x849C0E
    sep #0x10
    bcc .BF3E

    lda.b #0x01
    rts

.BF3E:
    lda.b #0x00
    rts

;-----

    incsrc "obj/mole_borer.asm"
    incsrc "obj/mettool_c_15.asm"
    incsrc "obj/ride_armor.asm"

;-----

_83CB02:
    rep #0x20
    ldx.b #0x40
    lda.w 0x0BAD
    cmp.b 0x05
    bcs .CB0F

    ldx.b #0x00
.CB0F:
    stx.b 0x33
    sep #0x20
    rts

;-----

_83CB14:
    jsr _83CB02
    rep #0x20
    lda.w #0x0178
    bit.b 0x32
    bvs .CB23

    lda.w #0xFE88
.CB23:
    sta.b 0x1A
    sep #0x20
    rts

;-----

_83CB28:
    rep #0x20
    sta.w 0x0000
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bpl .CB39

    eor.w #0xFFFF
    inc
.CB39:
    cmp.w 0x0000
    sep #0x20
    rts

;-----

_83CB3F:
    rep #0x20
    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bcc .CB4E

    cmp.w #0x0018
    bcs .CB62

.CB4E:
    sep #0x20
    lda.w 0x1F0D
    beq .CB60

    lda.w 0x0BB9
    and.b #0x40
    cmp.b 0x33
    beq .CB60

    sec
    rts

.CB60:
    clc
    rts

.CB62:
    sep #0x20
    lda.b #0x80
    tsb.b 0x10
    rts

;-----

_83CB69:
    bit.b 0x0F
    bvc .CBA1

    rep #0x21
    lda.b 0x0F
    and.w #0x0030
    lsr
    lsr
    adc.w #0xCF48
    sta.b 0x20
    sep #0x20
    lda.b #0x03
    ldx.b 0x0A
    cpx.b #0x67
    bne .CB87

    lda.b #0x06
.CB87:
    sta.b 0x26
    jsl 0x849B03
    beq .CB95

    lda.b #0x3C
    jsl _80888B
.CB95:
    lda.b #0x3E
    sta.b 0x20
    lda.b #0xCF
    sta.b 0x21
    lda.b #0x01
    sta.b 0x26
.CBA1:
    rts

;-----

_83CBA2:
    lda.b 0x35
    beq .CBAE

    dec.b 0x35
    bne .CBAE

    lda.b #0x03
    sta.b 0x28
.CBAE:
    rts

;-----

_83CBAF:
    ldx.b 0x32
    jmp (.CBB4,X)

.CBB4: d16[.CBE7, .CBBA, .CBE8]

.CBBA:
    lda.b #0x04
    sta.b 0x32
    stz.b 0x31
    lda.b 0x27
    and.b #0x7F
    sta.w 0x0000
    lda.b 0x3B
    sec
    sbc.w 0x0000
    rep #0x20
    and.w #0x00FF
    xba
    cmp.w #0x0800
    bcc .CBDB

    lda.w #0x0700
.CBDB:
    bit.b 0x39
    bvc .CBE3

    eor.w #0xFFFF
    inc
.CBE3:
    sta.b 0x36
    sep #0x20
.CBE7:
    rts

.CBE8:
    rep #0x30
    ldx.b 0x1A
    lda.b 0x36
    sta.b 0x1A
    stx.b 0x36
    lda.b 0x1C
    sta.b 0x38
    stz.b 0x1C
    lda.w #0x4040
    sta.b 0x1E
    sep #0x30
    lda.b 0x2B
    bit.b #0x04
    beq .CC08

    jsr _83CDB0
.CC08:
    lda.b 0x3A
    sta.b 0x33
    bit.b 0x3A
    bvc .CC16

    jsl 0x828195
    bra .CC1A

.CC16:
    jsl 0x828174
.CC1A:
    rep #0x20
    lda.b 0x1A
    bpl .CC24

    eor.w #0xFFFF
    inc
.CC24:
    cmp.w #0x0040
    bcs .CC2D

    ldx.b #0x00
    stx.b 0x32
.CC2D:
    rep #0x10
    ldx.b 0x36
    lda.b 0x1A
    sta.b 0x36
    stx.b 0x1A
    lda.b 0x38
    sta.b 0x1C
    lda.w #0x0040
    sta.b 0x1E
    sep #0x30
    rts

;-----

_83CC43:
    rep #0x10
    lda.b #0x12
    sta.w 0x0000
    ldy.w #0x0001
    bra .CC5F

.CC4F:
    rep #0x10
    lda.b #0x21
    jsl _80888B
    lda.b #0x08
    sta.w 0x0000
    ldy.w #0x0009
.CC5F:
    jsl 0x8282D3
    bne .CCB7

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda.w 0x0000
    sta.w 0x000B,X
    inc.w 0x0000
    lda.b 0x33
    ora.b #0x30
    sta.w 0x0011,X
    stz.w 0x001F,X
    lda.b #0x30
    sta.w 0x001E,X
    rep #0x20
    stz.w 0x000C,X
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    phy
    jsl 0x849086
    and.w #0x0006
    tay
    lda 0x86CF54,Y
    sta.w 0x001A,X
    jsl 0x849086
    and.w #0x0006
    tay
    lda 0x86CF5C,Y
    sta.w 0x001C,X
    ply
    sep #0x20
    dey
    bpl .CC5F

.CCB7:
    sep #0x10
    rts

;-----

_83CCBA:
    rep #0x10
    ldy.w #0x0007
.CCBF:
    jsl 0x8282D3
    bne .CD12

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    tya
    and.b #0x03
    clc
    adc.b #0x0E
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    stz.w 0x001F,X
    lda.b #0x30
    sta.w 0x001E,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    phy
    jsl 0x849086
    and.w #0x0006
    tay
    lda 0x86CF64,Y
    sta.w 0x001A,X
    jsl 0x849086
    and.w #0x0006
    tay
    lda 0x86CF6C,Y
    sta.w 0x001C,X
    ply
    sep #0x20
    dey
    bpl .CCBF

.CD12:
    sep #0x10
    rts

;-----

_83CD15:
    sta.w 0x0000
    jsl 0x8282D3
    bne .CD3B

    inc.w 0x0000,X
    lda.b #0x2C
    sta.w 0x000A,X
    lda.w 0x0000
    sta.w 0x000B,X
    lda.b 0x11
    ora.b 0x33
    sta.w 0x0011,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    sep #0x20
.CD3B:
    sep #0x10
    rts

;-----

_83CD3E:
    jsl 0x8282D3
    bne .CD66

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b 0x11
    ora.b 0x33
    sta.w 0x0011,X
    lda.b #0x0B
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
.CD66:
    sep #0x10
    rts

;-----

_83CD69:
    jsr _83CDE7
    beq .CDAF

    rep #0x10
    ldy.w #0x0001
.CD73:
    jsl 0x8282D3
    bne .CDAD

    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    stz.w 0x000B,X
    rep #0x21
    lda.b 0x08
    adc.w #0x0020
    sta.w 0x0008,X
    jsl 0x849086
    and.w #0x0007
    clc
    adc.w #0x0008
    cpy.w #0x0001
    beq .CDA2

    eor.w #0xFFFF
    inc
.CDA2:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    sep #0x20
    dey
    bpl .CD73

.CDAD:
    sep #0x10
.CDAF:
    rts

;-----

_83CDB0:
    jsr _83CDE7
    beq .CDE6

    lda.b 0x31
    cmp.b #0x04
    bcs .CDE4

    lda.w 0x0B9C
    bit.b #0x03
    bne .CDE4

    jsl 0x8282D3
    bne .CDE4

    inc.b 0x31
    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    stz.w 0x000B,X
    rep #0x21
    lda.b 0x08
    adc.w #0x0020
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
.CDE4:
    sep #0x30
.CDE6:
    rts

;-----

_83CDE7:
    stz.b 0x29
    lda.b #0x22
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x11
    beq .CDFF

    lda.b #0x10
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x11
.CDFF:
    rts

;-----

    incsrc "obj/dig_labour.asm"

;-----

_83CF6D:
    ldx.b 0x01
    jmp (.CF72,X)

.CF72: d16[.CF78, .CFA9, .D6E0]

.CF78:
    jsl 0x82827D
    lda.b #0x04
    sta.b 0x12
    stz.b 0x33
    stz.b 0x2F
    lda.b #0x02
    sta.b 0x26
    lda.b #0x7F
    sta.b 0x27
    sta.b 0x3B
    lda.b #0x03
    sta.b 0x28
    stz.b 0x10
    stz.b 0x32
    rep #0x20
    lda.w #0xCF3E
    sta.b 0x20
    stz.b 0x36
    stz.b 0x38
    lda.w #0x0040
    sta.b 0x1E
    sep #0x20
    rtl

.CFA9:
    lda.l 0x7F8349
    ora.b 0x33
    sta.b 0x11
    ldx.b 0x02
    jsr (.D039,X)
    jsl 0x8280B4
    lda.b 0x27
    and.b #0x7F
    sta.b 0x3B
    jsl 0x849B43
    beq .D01A

    bpl .CFD3

    lda.b #0x30
    sta.b 0x27
    lda.b 0x3B
    clc
    adc.b #0x30
    sta.b 0x3B
.CFD3:
    lda.w 0x1F1D
    cmp.b #0x1C
    bne .CFF4

    bit.b 0x10
    bvs .CFF4

    lda.b #0x40
    tsb.b 0x10
    jsr _83D7A9
    jsr _83D7EA
    lda.b #0x1C
    jsr _8386F1
    inc.w 0x1F3B
    jsl 0x84A04D
.CFF4:
    lda.b #0x0E
    trb.b 0x11
    lda.w 0x1F1B
    sta.b 0x3A
    sta.b 0x33
    lda.b 0x3C
    bne .D00C

    lda.b #0x05
    sta.b 0x3C
    lda.b #0x0D
    jsr _83CD15
.D00C:
    bit.b 0x10
    bvs .D016

    lda.b #0x13
    jsl _80888B
.D016:
    lda.b #0x02
    sta.b 0x32
.D01A:
    lda.b 0x3C
    beq .D020

    dec.b 0x3C
.D020:
    jsr _83CBAF
    lda.b 0x11
    and.b #0x3F
    ora.b 0x33
    sta.b 0x11
    lda.w 0x0C2F
    lsr
    bcs .D035

    jsl 0x849B03
.D035:
    jml 0x8491BE

.D039: d16[
    .D061, .D08D, .D0D7, .D156, .D1AA, .D1EC, .D230, .D230,
    .D2BD, .D2A3, .D369, .D392, .D3C2, .D423, .D510, .D562,
    .D59B, .D612, .D638, .D2F3,
]

.D061:
    ldx.b 0x03
    bne .D07F

    inc.b 0x03
    lda.b #0x02
    jsl 0x848F07
    rep #0x20
    lda.w #0xFF80
    sta.b 0x1C
    lda.w #0x0040
    sta.b 0x1E
    sep #0x20
    lda.b #0x54
    sta.b 0x34
.D07F:
    dec.b 0x34
    bne .D088

    lda.b #0x02
    jsr _8386F1
.D088:
    jsl 0x82825D
    rts

.D08D:
    ldx.b 0x03
    bne .D099

    inc.b 0x03
    stz.b 0x34
    lda.b #0x07
    sta.b 0x35
.D099:
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0013,X
    cmp.b #0x01
    sep #0x10
    bne .D0D6

    rep #0x21
    stz.w 0x0000
    ldx.b 0x34
    lda.w 0x86CFF6,X
    and.w #0x00FF
    bit.w #0x0080
    beq .D0BE

    dec.w 0x0000
    ora.w #0xFF00
.D0BE:
    adc.b 0x08
    sta.b 0x08
    sep #0x20
    lda.b 0x08
    adc.w 0x0000
    sta.b 0x08
    inc.b 0x34
    dec.b 0x35
    bne .D0D6

    lda.b #0x24
    jsr _8386F1
.D0D6:
    rts

.D0D7:
    ldx.b 0x03
    bne .D0EC

    inc.b 0x03
    jsr _83CB02
    lda.b #0x02
    bit.b 0x10
    bvc .D0E8

    lda.b #0x09
.D0E8:
    jsl 0x848F07
.D0EC:
    jsr _83D6E4
    jsr (.D0F5,X)
    jmp _83D752

.D0F5: d16[.D0FB, .D114, .D135]

.D0FB:
    jsr _83D709.D711
    jsl 0x849086
    and.b #0x07
    tax
    lda.w 0x00D001,X
    beq .D113

    lda.b #0x80
    tsb.b 0x10
    lda.b #0x0A
    jmp _8386F1

.D113:
    rts

.D114:
    lda.b #0x06
    jsr _8386F1
    jsl 0x849086
    and.b #0x07
    tax
    lda.w 0x86D009,X
    beq .D134

    lda.b #0x0E
    jmp _8386F1

    jsl 0x849086
    lsr
    bcc .D134

    jmp _83D709

.D134:
    rts

.D135:
    lda.b #0x0E
    jsr _8386F1
    jsl 0x849086
    lsr
    bcc .D144

    jmp _83D709

.D144:
    jsl 0x849086
    and.b #0x07
    tax
    lda.w 0x86D009,X
    beq .D155

    lda.b #0x06
    jmp _8386F1

.D155:
    rts

.D156:
    ldx.b 0x03
    bne .D162

    inc.b 0x03
    lda.b #0x00
    jsl 0x848F07
.D162:
    lda.b 0x2B
    bit.b #0x04
    bne .D171

    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x14
    jmp _8386F1

.D171:
    jsr _83CB14
    jsr _83D6E4
    stx.w 0x0000
    jsl 0x82823E
    jsr _83D6E4
    cpx.w 0x0000
    beq .D18A

    lda.b #0x04
    sta.b 0x02
.D18A:
    lda.b #0x00
    xba
    lda.b #0x20
    jsr _83CB28
    bcs .D197

    jmp _83D709.D711

.D197:
    jsl 0x848EEA
    lda.b 0x0F
    and.b #0x03
    beq .D1A7

    ora.b #0x38
    jsl _80888B
.D1A7:
    jmp _83D752

.D1AA:
    ldx.b 0x03
    jmp (.D1AF,X)

.D1AF: d16[.D1B5, .D1CA, .D1D9]

.D1B5:
    lda.b #0x02
    sta.b 0x03
    jsl 0x849086
    and.b #0x0F
    clc
    adc.b #0x0F
    sta.b 0x34
    lda.b #0x02
    jsl 0x848F07
.D1CA:
    dec.b 0x34
    bne .D1D8

    lda.b #0x01
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x03
.D1D8:
    rts

.D1D9:
    lda.b 0x0F
    bpl .D1E2

    lda.b #0x04
    jmp _8386F1

.D1E2:
    jsr _83CB69
    jsl 0x848EEA
    jmp _83D752

.D1EC:
    ldx.b 0x03
    bne .D21C

    inc.b 0x03
    rep #0x20
    lda.b 0x1A
    bit.b 0x0F
    bpl .D1FE

    eor.w #0xFFFF
    inc
.D1FE:
    sta.b 0x1A
    lda.w #0x0553
    sta.b 0x1C
    sep #0x20
    lda.b #0x80
    trb.b 0x10
    lda.b #0x38
    jsl _80888B
    lda.b #0x0C
    jsr _83CD15
    lda.b #0x03
    jsl 0x848F07
.D21C:
    lda.b 0x1D
    bmi .D226

    lda.b 0x2B
    bit.b #0x08
    beq .D22B

.D226:
    lda.b #0x14
    jmp _8386F1

.D22B:
    jsl 0x828174
    rts

.D230:
    ldx.b 0x03
    bne .D258

    inc.b 0x03
    rep #0x20
    lda.w #0x0400
    bit.b 0x32
    bvs .D242

    lda.w #0xFC00
.D242:
    sta.b 0x1A
    sep #0x20
    stz.b 0x31
    lda.b #0x3B
    jsl _80888B
    lda.b #0x40
    sta.b 0x34
    lda.b #0x06
    jsl 0x848F07
.D258:
    jsr _83CDB0
    dec.b 0x34
    bne .D264

    lda.b #0x12
    jmp _8386F1

.D264:
    lda.b 0x2B
    bit.b #0x04
    bne .D273

    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x14
    jmp _8386F1

.D273:
    bit.b #0x03
    beq .D27C

    lda.b #0x0A
    jmp _8386F1

.D27C:
    lda.b #0x00
    xba
    lda.b #0x20
    jsr _83CB28
    bcs .D298

    jsl 0x849086
    and.b #0x07
    tax
    lda.w 0x86D011,X
    bne .D295

    jmp _83D709.D711

.D295:
    jmp _83D709.D70D

.D298:
    jsl 0x82823E
    jsl 0x848EEA
    jmp _83D752

.D2A3:
    ldx.b 0x03
    bne .D2AF

    inc.b 0x03
    lda.b #0x07
    jsl 0x848F07
.D2AF:
    lda.b 0x0F
    bpl .D2B8

    lda.b #0x04
    jmp _8386F1

.D2B8:
    jsl 0x848EEA
    rts

.D2BD:
    ldx.b 0x03
    bne .D2C9

    inc.b 0x03
    lda.b #0x08
    jsl 0x848F07
.D2C9:
    dec.b 0x34
    beq .D2E0

    lda.b 0x2B
    bit.b #0x04
    bne .D2DC

    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x14
    jmp _8386F1

.D2DC:
    bit.b #0x03
    beq .D2E5

.D2E0:
    lda.b #0x12
    jmp _8386F1

.D2E5:
    jsr _83CB69
    jsl 0x82823E
    jsl 0x848EEA
    jmp _83D752

.D2F3:
    ldx.b 0x03
    jmp (.D2F8,X)

.D2F8: d16[.D2FE, .D30D, .D33C]

.D2FE:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x34
    lda.b #0x16
    jsl 0x848F07
    rts

.D30D:
    dec.b 0x34
    bne .D337

    lda.b #0x04
    sta.b 0x03
    rep #0x20
    lda.w #0x0400
    bit.b 0x32
    bvs .D321

    lda.w #0xFC00
.D321:
    sta.b 0x1A
    sep #0x20
    stz.b 0x31
    lda.b #0x3B
    jsl _80888B
    lda.b #0x40
    sta.b 0x34
    lda.b #0x15
    jsl 0x848F07
.D337:
    jsl 0x848EEA
    rts

.D33C:
    jsr _83CDB0
    dec.b 0x34
    beq .D356

    lda.b 0x2B
    bit.b #0x04
    bne .D352

    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x14
    jmp _8386F1

.D352:
    bit.b #0x03
    beq .D35B

.D356:
    lda.b #0x12
    jmp _8386F1

.D35B:
    jsr _83CB69
    jsl 0x82823E
    jsl 0x848EEA
    jmp _83D752

.D369:
    ldx.b 0x03
    bne .D375

    inc.b 0x03
    lda.b #0x03
    jsl 0x848F07
.D375:
    lda.b 0x2B
    bit.b #0x04
    beq .D380

    lda.b #0x16
    jmp _8386F1

.D380:
    rep #0x20
    lda.w #0xFA80
    cmp.b 0x1C
    bmi .D38B

    sta.b 0x1C
.D38B:
    sep #0x20
    jsl 0x828174
    rts

.D392:
    ldx.b 0x03
    bne .D3B4

    inc.b 0x03
    ldx.b #0x02
    ldy.b #0x01
    lda.b #0x0A
    jsl 0x84A33C
    lda.b #0x39
    jsl _80888B
    jsr _83CD3E
    jsr _83CD69
    lda.b #0x04
    jsl 0x848F07
.D3B4:
    lda.b 0x0F
    bpl .D3BD

    lda.b #0x04
    jmp _8386F1

.D3BD:
    jsl 0x848EEA
    rts

.D3C2:
    ldx.b 0x03
    jmp (.D3C7,X)

.D3C7: d16[.D3CD, .D3FB, .D412]

.D3CD:
    lda.b #0x02
    sta.b 0x03
    sta.b 0x2F
    rep #0x30
    ldx.w #0x0000
    jsl 0x849086
    bit.w #0x0007
    beq .D3EB

    ldx.w #0x0178
    bit.b 0x32
    bvc .D3EB

    ldx.w #0xFE88
.D3EB:
    stx.b 0x1A
    lda.w #0x0553
    sta.b 0x1C
    sep #0x30
    lda.b #0x03
    jsl 0x848F07
    rts

.D3FB:
    lda.b 0x2B
    bit.b #0x04
    beq .D40D

    lda.b #0x04
    sta.b 0x03
    stz.b 0x2F
    lda.b #0x0F
    jsl 0x848F07
.D40D:
    jsl 0x828174
    rts

.D412:
    lda.b 0x0F
    bpl .D41E

    jsr _83D722
    lda.b #0x04
    jmp _8386F1

.D41E:
    jsl 0x848EEA
    rts

.D423:
    ldx.b 0x03
    jmp (.D428,X)

.D428: d16[.D434, .D466, .D489, .D4C5, .D503, .D50F]

.D434:
    lda.b #0x02
    sta.b 0x03
    rep #0x31
    lda.w 0x0BAD
    adc.w #0xFF80
    sta.w 0x1E5E
    sta.w 0x1E60
    ldx.w #0x0178
    lda.w 0x0BAD
    clc
    adc.w #0x0020
    cmp.b 0x05
    bcs .D457

    ldx.w #0xFE88
.D457:
    stx.b 0x1A
    sep #0x30
    lda.b #0x78
    sta.b 0x34
    lda.b #0x02
    jsl 0x848F07
    rts

.D466:
    dec.b 0x34
    bne .D488

    lda.b #0x04
    sta.b 0x03
    rep #0x21
    ldx.b #0x40
    lda.w 0x0BAD
    adc.w #0x0020
    cmp.b 0x05
    bcs .D47E

    ldx.b #0x00
.D47E:
    stx.b 0x33
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
.D488:
    rts

.D489:
    rep #0x21
    lda.w 0x0BAD
    adc.w #0x0020
    sec
    sbc.b 0x05
    clc
    adc.w #0x0008
    cmp.w #0x0010
    sep #0x20
    bcs .D4B0

    stz.b 0x33
    lda.b #0x06
    sta.b 0x03
    lda.b #0x02
    sta.b 0x12
    lda.b #0x14
    jsl 0x848F07
    rts

.D4B0:
    jsl 0x82823E
    jsl 0x848EEA
    lda.b 0x0F
    and.b #0x03
    beq .D4C4

    ora.b #0x38
    jsl _80888B
.D4C4:
    rts

.D4C5:
    jsl 0x848EEA
    bit.b 0x0F
    bpl .D4F9

    lda.b #0x08
    sta.b 0x03
    ldy.b #0x02
    lda.b #0xF6
    jsl _808850.8868
    lda.b #0x80
    sta.w 0x0000
    lda.b #0x48
    sta.w 0x0002
    lda.b #0x40
    sta.w 0x0004
    lda.b #0x28
    sta.w 0x0006
    lda.b #0x01
    sta.w 0x0008
    jsl _83F747
    jmp _83D843

.D4F9:
    bvc .D502

    jsl 0x84A061
    jsr _83D75D
.D502:
    rts

.D503:
    lda.w 0x1F2C
    bmi .D50F

    lda.b #0x0A
    sta.b 0x03
    jsr _83D787
.D50F:
    rts

.D510:
    jsr _83D80A
    ldx.b 0x03
    jmp (.D518,X)

.D518: d16[.D51E, .D52E, .D543]

.D51E:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x40
    sta.w 0x0C11
    lda.b #0x0E
    jsl 0x848F07
    rts

.D52E:
    lda.b 0x0F
    bpl .D53E

    lda.b #0x04
    sta.b 0x03
    sta.b 0x30
    lda.b #0x09
    jsl 0x848F07
.D53E:
    jsl 0x848EEA
    rts

.D543:
    lda.b #0x33
    sta.b 0x0A
    jsl 0x84A1D0
    lda.b #0x32
    sta.b 0x0A
    rep #0x10
    ldx.w 0x0000
    lda.w 0x003B,X
    sep #0x10
    lsr
    bcc .D561

    lda.b #0x1E
    jmp _8386F1

.D561:
    rts

.D562:
    jsr _83D80A
    ldx.b 0x03
    bne .D57E

    inc.b 0x03
    rep #0x20
    lda.w #0x0500
    sta.b 0x1C
    stz.b 0x1A
    stz.b 0x1E
    sep #0x20
    lda.b #0x0A
    jsl 0x848F07
.D57E:
    jsl 0x82825D
    rep #0x20
    lda.w #0x0136
    cmp.b 0x08
    bcc .D594

    sta.b 0x08
    sep #0x20
    lda.b #0x20
    jmp _8386F1

.D594:
    sep #0x20
    jsl 0x848EEA
    rts

.D59B:
    jsr _83D80A
    ldx.b 0x03
    jmp (.D5A3,X)

.D5A3: d16[.D5A9, .D5C4, .D5D4]

.D5A9:
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0002,X
    cmp.b #0x04
    bne .D5BD

    lda.b #0x01
    sta.w 0x0010,X
    lda.b #0x02
    sta.b 0x03
.D5BD:
    sep #0x10
    jsl 0x848EEA
    rts

.D5C4:
    lda.b #0x04
    sta.b 0x03
    lda.b #0x09
    jsl 0x848F07
    stz.b 0x34
    lda.b #0x04
    sta.b 0x35
.D5D4:
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0013,X
    cmp.b #0x01
    sep #0x10
    bne .D611

    rep #0x21
    stz.w 0x0000
    ldx.b 0x34
    lda.w 0x86CFFD,X
    and.w #0x00FF
    bit.w #0x0080
    beq .D5F9

    dec.w 0x0000
    ora.w #0xFF00
.D5F9:
    adc.b 0x08
    sta.b 0x08
    sep #0x20
    lda.b 0x08
    adc.w 0x0000
    sta.b 0x08
    inc.b 0x34
    dec.b 0x35
    bne .D611

    lda.b #0x22
    jsr _8386F1
.D611:
    rts

.D612:
    jsr _83D80A
    ldx.b 0x03
    bne .D627

    inc.b 0x03
    lda.b #0x00
    sta.b 0x1C
    lda.b #0x01
    sta.b 0x1D
    lda.b #0x2A
    sta.b 0x34
.D627:
    dec.b 0x34
    bne .D633

    lda.b #0x02
    tsb.b 0x10
    lda.b #0x04
    sta.b 0x01
.D633:
    jsl 0x82825D
    rts

.D638:
    ldx.b 0x03
    jmp (.D63D,X)

.D63D: d16[.D647, .D664, .D69D, .D6AE, .D6C3]

.D647:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x00
    sta.b 0x1C
    lda.b #0x05
    sta.b 0x1D
    lda.b #0x38
    jsl _80888B
    lda.b #0x0C
    jsr _83CD15
    lda.b #0x03
    jsl 0x848F07
.D664:
    lda.b 0x2B
    bit.b #0x04
    beq .D68B

    lda.b #0x04
    sta.b 0x03
    lda.b #0x39
    jsl _80888B
    ldx.b #0x02
    ldy.b #0x01
    lda.b #0x0A
    jsl 0x84A33C
    jsr _83CD3E
    jsr _83CD69
    lda.b #0x04
    jsl 0x848F07
    rts

.D68B:
    jsl 0x828174
    rep #0x20
    lda.w #0xFA80
    cmp.b 0x1C
    bmi .D69A

    sta.b 0x1C
.D69A:
    sep #0x20
    rts

.D69D:
    lda.b 0x0F
    bpl .D6A9

    lda.b #0x06
    sta.b 0x03
    lda.b #0xB0
    sta.b 0x34
.D6A9:
    jsl 0x848EEA
    rts

.D6AE:
    dec.b 0x34
    bne .D6C2

    lda.b #0x08
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x34
    ldy.b #0x02
    lda.b #0xF6
    jsl _808850.8868
.D6C2:
    rts

.D6C3:
    dec.b 0x34
    bne .D6DF

    lda.l 0x001F26
    beq .D6D3

    lda.b #0x24
    jsl _80878B
.D6D3:
    jsl 0x849FFE
    stz.w 0x0BD8
    lda.b #0x04
    jmp _8386F1

.D6DF:
    rts

.D6E0:
    jml 0x828398

;-----

_83D6E4:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bpl .D6F2

    eor.w #0xFFFF
    inc
.D6F2:
    cmp.w #0x0020
    bcc .D704

    cmp.w #0x00A0
    bcc .D700

    ldx.b #0x04
    bra .D706

.D700:
    ldx.b #0x02
    bra .D706

.D704:
    ldx.b #0x00
.D706:
    sep #0x20
    rts

;-----

_83D709:
    ldx.b #0x26
    bra .D713

.D70D:
    ldx.b #0x10
    bra .D713

.D711:
    ldx.b #0x08
.D713:
    lda.w 0x0BCF
    and.b #0x7F
    cmp.b #0x04
    bcs .D71E

    ldx.b #0x18
.D71E:
    txa
    jmp _8386F1

;-----

_83D722:
    jsl 0x828358
    bne .D74F

    inc.w 0x0000,X
    lda.b #0x16
    sta.w 0x000A,X
    lda.b 0x33
    sta.w 0x0011,X
    rep #0x21
    lda.w #0x0016
    bit.b 0x32
    bvs .D741

    lda.w #0xFFEA
.D741:
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0xFFE2
    sta.w 0x0008,X
.D74F:
    sep #0x30
    rts

;-----

_83D752:
    lda.w 0x0C26
    bpl .D75C

    lda.b #0x1A
    jmp _8386F1

.D75C:
    rts

;-----

_83D75D:
    rep #0x21
    lda.b 0x0F
    and.w #0x0003
    tax
    lda.w 0x86D019,X
    and.w #0x00FF
    bit.b 0x32
    bvs .D773

    eor.w #0xFFFF
    inc
.D773:
    adc.b 0x05
    sta.w 0x0BAD
    lda.w 0x86D01A,X
    and.w #0x00FF
    clc
    adc.b 0x08
    sta.w 0x0BB0
    sep #0x20
    rts

;-----

_83D787:
    jsl 0x828321
    bne .D7A6

    inc.w 0x0000,X
    lda.b #0x33
    sta.w 0x000A,X
    rep #0x21
    lda.w 0x1E4D
    adc.w #0xFFD0
    sta.w 0x0005,X
    lda.w #0x01AF
    sta.w 0x0008,X
.D7A6:
    sep #0x30
    rts

;-----

_83D7A9:
    jsl 0x8282D3
    bne .D7E7

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda.b #0x14
    sta.w 0x000B,X
    lda.b 0x33
    ora.b #0x30
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    lda.w #0xFF00
    sta.w 0x001A,X
    lda.w #0x0300
    sta.w 0x001C,X
    lda.w #0x0030
    sta.w 0x001E,X
    lda.w #0x01BC
    sta.w 0x000C,X
.D7E7:
    sep #0x30
    rts

;-----

_83D7EA:
    rep #0x21
    lda.b 0x05
    adc.w #0xFFED
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0xFFF4
    sta.w 0x0002
    lda.w #0x0508
    sta.w 0x0004
    jsl 0x84A462
    sep #0x20
    rts

;-----

_83D80A:
    lda.w 0x0B9C
    and.b #0x07
    bne .D842

    jsl 0x8282D3
    bne .D840

    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    lda.b #0x80
    sta.w 0x000B,X
    jsl 0x849086
    and.b #0x01
    sta.w 0x000C,X
    rep #0x21
    lda.b 0x05
    adc.w #0x0011
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0xFFF5
    sta.w 0x0008,X
.D840:
    sep #0x30
.D842:
    rts

;-----

_83D843:
    jsl 0x828321
    bne .D856

    inc.w 0x0000,X
    lda.b #0x3C
    sta.w 0x000A,X
    lda.b #0x01
    sta.w 0x000B,X
.D856:
    sep #0x10
    rts

;-----

    incsrc "obj/crag_man.asm"
    incsrc "obj/metal_wing.asm"
    incsrc "obj/jamminger.asm"
    incsrc "obj/flamer.asm"

;-----

_83E1B9:
    ldx.b 0x01
    jsr (.E202,X)
    rep #0x20
    lda.w #0xD163
    sta.b 0x20
    sep #0x20
    jsl 0x849B43
    rep #0x20
    lda.w #0xD159
    sta.b 0x20
    sep #0x20
    jsl 0x849B43
    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x0030
    sta.b 0x08
    sep #0x20
    jsl 0x8280B4
    jsl 0x82806E
    bcc .E1F5

    jsl 0x828387
    jmp .E201

.E1F5:
    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x0030
    sta.b 0x08
    sep #0x20
.E201:
    rtl

.E202: d16[.E20C, .E248, .E2C8, .E2F6, .E3A5]

.E20C:
    jsl 0x82827D
    lda.b #0x01
    sta.b 0x27
    stz.b 0x28
    lda.b #0x04
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0x01
    sta.b 0x35
    lda.b #0x14
    sta.b 0x38
    rep #0x20
    lda.w #0xFE00
    sta.b 0x1C
    lda.b 0x08
    sec
    sbc.w #0x0011
    sta.b 0x33
    sta.b 0x08
    lda.b 0x05
    sta.b 0x36
    sep #0x20
    lda.b #0x50
    sta.b 0x1E
    lda.b #0x00
    jsl 0x848F07
    rts

.E248:
    rep #0x20
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0004
    tdc
    sta.w 0x0002
    lda.w #0x0E68
.E25B:
    tcd
    sep #0x20
    lda.b 0x00
    beq .E290

    lda.b 0x0A
    cmp.b #0x2A
    bne .E290

    lda.b 0x0F
    and.b #0x02
    cmp.b #0x02
    beq .E290

    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0000
    bcs .E27E

    eor.w #0xFFFF
    inc
.E27E:
    cmp.w #0x0028
    bcs .E290

    lda.w 0x0002
    tcd
    sep #0x20
    lda.b #0x04
    sta.b 0x01
    jmp .E2C2

.E290:
    rep #0x21
    tdc
    adc.w #0x0040
    cmp.w #0x1228
    bcc .E25B

    rep #0x20
    lda.w 0x0002
    tcd
    lda.w 0x0BAD
    sec
    sbc.w 0x0000
    bcs .E2AE

    eor.w #0xFFFF
    inc
.E2AE:
    cmp.w #0x0020
    bcs .E2C2

    lda.w 0x0BB0
    sec
    sbc.w 0x0004
    bcc .E2C2

    sep #0x20
    lda.b #0x04
    sta.b 0x01
.E2C2:
    sep #0x20
    jsr _83E3DE
    rts

.E2C8:
    dec.b 0x38
    beq .E2EA

    lda.b 0x38
    and.b #0x01
    beq .E2DA

    lda.b #0x02
    sta.w 0x0000
    jmp .E2DF

.E2DA:
    lda.b #0xFE
    sta.w 0x0000
.E2DF:
    lda.b 0x05
    sec
    sbc.w 0x0000
    sta.b 0x05
    jmp .E2F2

.E2EA:
    lda.b #0x06
    sta.b 0x01
    lda.b #0x14
    sta.b 0x38
.E2F2:
    jsr _83E3DE
    rts

.E2F6:
    jsr _83E3DE
    rep #0x20
    lda.w 0x0006
    cmp.w #0x0008
    bcs .E33C

    lda.w 0x0002
    bmi .E33C

    lda.w 0x0006
    cmp.w #0x0004
    lda.w #0xD159
    bcc .E319

    lda.w #0x0003
    sta.w 0x0006
.E319:
    rep #0x20
    lda.w 0x0BB0
    sec
    sbc.w 0x0006
    sta.w 0x0BB0
    sep #0x20
    lda.w 0x0C06
    and.b #0x04
    bne .E335

    lda.w 0x0BD3
    and.b #0x04
    beq .E33C

.E335:
    jsl 0x849B03
    jmp .E33C

.E33C:
    sep #0x20
    dec.b 0x35
    bne .E398

    lda.b #0x01
    sta.b 0x35
    jsl 0x8281E8
    lda.b 0x2C
    and.b #0x7F
    beq .E354

    jsl 0x82C70E
.E354:
    jsl 0x8491BE
    lda.b 0x2E
    cmp.b #0x00
    beq .E398

    lda.b #0x10
    jsl 0x84A333
    lda.b #0x3D
    jsl _80888B
    lda.b #0x08
    sta.b 0x01
    lda.b #0x2C
    sta.b 0x35
    lda.b #0x01
    jsl 0x848F07
    jsl 0x849B7E
    beq .E38C

    cmp.b #0x2A
    bne .E38C

    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x0006
    sta.b 0x08
.E38C:
    rep #0x20
    lda.w #0x0180
    sta.b 0x1C
    sep #0x20
    jmp .E398

.E398:
    rep #0x20
    lda.b 0x36
    sta.b 0x05
    sep #0x20
    jsl 0x848EEA
    rts

.E3A5:
    jsr _83E3DE
    dec.b 0x35
    bne .E3D1

    lda.b #0x01
    sta.b 0x35
    lda.b #0x00
    jsl 0x848F07
    jsl 0x82825D
    rep #0x20
    lda.b 0x08
    cmp.b 0x33
    bpl .E3D1

    lda.w #0xFE00
    sta.b 0x1C
    sep #0x20
    lda.b #0x02
    sta.b 0x01
    lda.b #0x20
    sta.b 0x35
.E3D1:
    rep #0x20
    lda.b 0x36
    sta.b 0x05
    sep #0x20
    jsl 0x848EEA
    rts

;-----

_83E3DE:
    rep #0x20
    lda.w #0xD163
    sta.b 0x20
    sep #0x20
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    rep #0x20
    lda.w #0xD159
    sta.b 0x20
    sep #0x20
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    rts

;-----

_83E401:
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
    jsl 0x848F07
    rts

.E4ED:
    dec.b 0x34
    beq .E4F8

    jsl 0x82825D
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
    jsl 0x848EEA
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
    jsl 0x848F07
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

    jsr _83E772
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

    jsl 0x8281B2
    jmp .E5B6

.E5B2:
    jsl 0x8281CF
.E5B6:
    sep #0x20
.E5B8:
    jsl 0x848EEA
    rts

.E5BD:
    dec.b 0x34
    beq .E5D5

    lda.b 0x0B
    and.b #0x01
    bne .E5CE

    jsl 0x828195
    jmp .E5FD

.E5CE:
    jsl 0x828174
    jmp .E5FD

.E5D5:
    lda.b #0x03
    jsl 0x848F07
    lda.b #0x06
    sta.b 0x01
    lda.b #0x00
    sta.b 0x12
    lda.b #0x10
    ora.b 0x11
    sta.b 0x11
    lda.b #0x01
    sta.b 0x39
    jsr _83E6C1
    jsr _83E68C
    jsr _83E669
    jsr _83E7C6
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
    jsl 0x848F07
    stz.b 0x37
    jmp .E62D

.E611:
    dec.b 0x34
    bne .E622

    jsr _83E68C
    lda.b 0x37
    bne .E61F

    jsr _83E669
.E61F:
    jsr _83E7C6
.E622:
    jsl 0x82820A
    jsr _83E7A1
    jsl 0x848EEA
.E62D:
    rts

.E62E:
    jsl 0x848EEA
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
    jsl 0x848F07
    lda.b #0x06
    sta.b 0x01
    lda.b #0x01
    sta.b 0x34
.E65B:
    jsl 0x82820A
    rts

.E660:
    jsl 0x82825D
    jsl 0x848EEA
    rts

;-----

_83E669:
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

_83E68C:
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
    jsl 0x848F07
    lda.b #0x01
    sta.b 0x37
    jmp .E6C0

.E6B0:
    lda.b 0x11
    and.b #0x40
    bne .E6C0

    lda.b #0x02
    jsl 0x848F07
    lda.b #0x01
    sta.b 0x37
.E6C0:
    rts

;-----

_83E6C1:
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

_83E772:
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

_83E7A1:
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

_83E7C6:
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

;-----

_83E7DE:
    ldx.b 0x01
    jmp (.E7E3,X)

.E7E3: d16[.E7E9, .E85B, .EE4E]

.E7E9:
    lda.w 0x1F7D
    cmp.b #0x03
    beq .E808

    cmp.b #0x02
    bne .E80C

    rep #0x20
    lda.w #0x0A80
    sta.w 0x1E5E
    sta.w 0x1E60
    sep #0x20
    jsr _83EF1C
    jsl 0x88D808
.E808:
    jml 0x828398

.E80C:
    jsl 0x82827D
    lda.b #0x04
    sta.b 0x12
    sta.b 0x30
    stz.b 0x33
    stz.b 0x2F
    lda.b #0x06
    sta.b 0x26
    lda.b #0x7F
    sta.b 0x27
    sta.b 0x3B
    lda.b #0x03
    sta.b 0x28
    stz.b 0x10
    stz.b 0x32
    rep #0x20
    lda.w #0xCF3E
    sta.b 0x20
    stz.b 0x36
    stz.b 0x38
    lda.w #0x0040
    sta.b 0x1E
    lda.w #0x0A80
    sta.w 0x1E5E
    sta.w 0x1E60
    sep #0x20
    jsl 0x849FE6
    lda.b #0x1A
    sta.b 0x02
    sta.w 0x1F49
    jsr _83EF1C
    lda.b #0x02
    jml 0x848F07

.E85B:
    lda.l 0x7F8349
    ora.b 0x33
    sta.b 0x11
    ldx.b 0x02
    jsr (.E8C3,X)
    jsl 0x8280B4
    lda.b 0x27
    and.b #0x7F
    sta.b 0x3B
    jsl 0x849B43
    beq .E8A4

    bpl .E885

    lda.b #0x30
    sta.b 0x27
    lda.b 0x3B
    clc
    adc.b #0x30
    sta.b 0x3B
.E885:
    lda.b #0x0E
    trb.b 0x11
    lda.w 0x1F1B
    sta.b 0x3A
    lda.b 0x3C
    bne .E896

    lda.b #0x05
    sta.b 0x3C
.E896:
    bit.b 0x10
    bvs .E8A0

    lda.b #0x13
    jsl _80888B
.E8A0:
    lda.b #0x02
    sta.b 0x32
.E8A4:
    lda.b 0x3C
    beq .E8AA

    dec.b 0x3C
.E8AA:
    jsr _83CBAF
    lda.b 0x11
    and.b #0x3F
    ora.b 0x33
    sta.b 0x11
    lda.w 0x0C2F
    lsr
    bcs .E8BF

    jsl 0x849B03
.E8BF:
    jml 0x8491BE

.E8C3: d16[
    .E948, .E9C1, .EA15, .EA57, .EA9B, .EA9B, .EB28, .EB0E,
    .EBD4, .EBFD, .EC2D, .EC8E, .EB5E, .E8DF,
]

.E8DF:
    ldx.b 0x03
    bne .E929

    rep #0x20
    lda.w 0x1E4D
    cmp.w 0x1E56
    sep #0x20
    bne .E928

    lda.b #0x02
    sta.b 0x03
    stz.w 0x1F49
    lda.w 0x1F7D
    cmp.b #0x01
    beq .E928

    lda.b #0x80
    sta.w 0x0000
    lda.b #0x50
    sta.w 0x0002
    lda.b #0x40
    sta.w 0x0004
    lda.b #0x30
    sta.w 0x0006
    lda.b #0x11
    sta.w 0x0008
    jsl _83F747
    lda.b #0x40
    sta.w 0x0C11
    jsr _83EEFD
    lda.b #0x02
    jsl 0x848F07
.E928:
    rts

.E929:
    lda.w 0x1F2C
    bmi .E947

    lda.b #0x01
    sta.w 0x1F7D
    sta.w 0x1F81
    stz.b 0x30
    jsl 0x849FFE
    lda.b #0x1E
    jsl _80878B
    lda.b #0x00
    jmp _8386F1

.E947:
    rts

.E948:
    ldx.b 0x03
    bne .E957

    inc.b 0x03
    jsr _83CB02
    lda.b #0x02
    jsl 0x848F07
.E957:
    jsr _83EE52
    jsr (.E960,X)
    jmp _83EEC0

.E960: d16[.E966, .E97F, .E9A0]

.E966:
    jsr _83EE77.EE7F
    jsl 0x849086
    and.b #0x07
    tax
    lda.w 0x00D7DF,X
    beq .E97E

    lda.b #0x80
    tsb.b 0x10
    lda.b #0x06
    jmp _8386F1

.E97E:
    rts

.E97F:
    lda.b #0x02
    jsr _8386F1
    jsl 0x849086
    and.b #0x07
    tax
    lda.w 0x00D7E7,X
    beq .E99F

    lda.b #0x0A
    jmp _8386F1

    jsl 0x849086
    lsr
    bcc .E99F

    jmp _83EE77

.E99F:
    rts

.E9A0:
    lda.b #0x0A
    jsr _8386F1
    jsl 0x849086
    lsr
    bcc .E9AF

    jmp _83EE77

.E9AF:
    jsl 0x849086
    and.b #0x07
    tax
    lda.w 0x00D7E7,X
    beq .E9C0

    lda.b #0x02
    jmp _8386F1

.E9C0:
    rts

.E9C1:
    ldx.b 0x03
    bne .E9CD

    inc.b 0x03
    lda.b #0x00
    jsl 0x848F07
.E9CD:
    lda.b 0x2B
    bit.b #0x04
    bne .E9DC

    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x10
    jmp _8386F1

.E9DC:
    jsr _83CB14
    jsr _83EE52
    stx.w 0x0000
    jsl 0x82823E
    jsr _83EE52
    cpx.w 0x0000
    beq .E9F5

    lda.b #0x00
    sta.b 0x02
.E9F5:
    lda.b #0x00
    xba
    lda.b #0x20
    jsr _83CB28
    bcs .EA02

    jmp _83EE77.EE7F

.EA02:
    jsl 0x848EEA
    lda.b 0x0F
    and.b #0x03
    beq .EA12

    ora.b #0x38
    jsl _80888B
.EA12:
    jmp _83EEC0

.EA15:
    ldx.b 0x03
    jmp (.EA1A,X)

.EA1A: d16[.EA20, .EA35, .EA44]

.EA20:
    lda.b #0x02
    sta.b 0x03
    jsl 0x849086
    and.b #0x0F
    clc
    adc.b #0x0F
    sta.b 0x34
    lda.b #0x02
    jsl 0x848F07
.EA35:
    dec.b 0x34
    bne .EA43

    lda.b #0x01
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x03
.EA43:
    rts

.EA44:
    lda.b 0x0F
    bpl .EA4D

    lda.b #0x00
    jmp _8386F1

.EA4D:
    jsr _83CB69
    jsl 0x848EEA
    jmp _83EEC0

.EA57:
    ldx.b 0x03
    bne .EA87

    inc.b 0x03
    rep #0x20
    lda.b 0x1A
    bit.b 0x0F
    bpl .EA69

    eor.w #0xFFFF
    inc
.EA69:
    sta.b 0x1A
    lda.w #0x0553
    sta.b 0x1C
    sep #0x20
    lda.b #0x80
    trb.b 0x10
    lda.b #0x38
    jsl _80888B
    lda.b #0x0C
    jsr _83CD15
    lda.b #0x03
    jsl 0x848F07
.EA87:
    lda.b 0x1D
    bmi .EA91

    lda.b 0x2B
    bit.b #0x08
    beq .EA96

.EA91:
    lda.b #0x10
    jmp _8386F1

.EA96:
    jsl 0x828174
    rts

.EA9B:
    ldx.b 0x03
    bne .EAC3

    inc.b 0x03
    rep #0x20
    lda.w #0x0400
    bit.b 0x32
    bvs .EAAD

    lda.w #0xFC00
.EAAD:
    sta.b 0x1A
    sep #0x20
    stz.b 0x31
    lda.b #0x3B
    jsl _80888B
    lda.b #0x40
    sta.b 0x34
    lda.b #0x06
    jsl 0x848F07
.EAC3:
    jsr _83CDB0
    dec.b 0x34
    bne .EACF

    lda.b #0x0E
    jmp _8386F1

.EACF:
    lda.b 0x2B
    bit.b #0x04
    bne .EADE

    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x10
    jmp _8386F1

.EADE:
    bit.b #0x03
    beq .EAE7

    lda.b #0x06
    jmp _8386F1

.EAE7:
    lda.b #0x00
    xba
    lda.b #0x20
    jsr _83CB28
    bcs .EB03

    jsl 0x849086
    and.b #0x07
    tax
    lda.w 0x00D7EF,X
    bne .EB00

    jmp _83EE77.EE7F

.EB00:
    jmp _83EE77.EE7B

.EB03:
    jsl 0x82823E
    jsl 0x848EEA
    jmp _83EEC0

.EB0E:
    ldx.b 0x03
    bne .EB1A

    inc.b 0x03
    lda.b #0x07
    jsl 0x848F07
.EB1A:
    lda.b 0x0F
    bpl .EB23

    lda.b #0x00
    jmp _8386F1

.EB23:
    jsl 0x848EEA
    rts

.EB28:
    ldx.b 0x03
    bne .EB34

    inc.b 0x03
    lda.b #0x08
    jsl 0x848F07
.EB34:
    dec.b 0x34
    beq .EB4B

    lda.b 0x2B
    bit.b #0x04
    bne .EB47

    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x10
    jmp _8386F1

.EB47:
    bit.b #0x03
    beq .EB50

.EB4B:
    lda.b #0x0E
    jmp _8386F1

.EB50:
    jsr _83CB69
    jsl 0x82823E
    jsl 0x848EEA
    jmp _83EEC0

.EB5E:
    ldx.b 0x03
    jmp (.EB63,X)

.EB63: d16[.EB69, .EB78, .EBA7]

.EB69:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x34
    lda.b #0x16
    jsl 0x848F07
    rts

.EB78:
    dec.b 0x34
    bne .EBA2

    lda.b #0x04
    sta.b 0x03
    rep #0x20
    lda.w #0x0400
    bit.b 0x32
    bvs .EB8C

    lda.w #0xFC00
.EB8C:
    sta.b 0x1A
    sep #0x20
    stz.b 0x31
    lda.b #0x3B
    jsl _80888B
    lda.b #0x40
    sta.b 0x34
    lda.b #0x15
    jsl 0x848F07
.EBA2:
    jsl 0x848EEA
    rts

.EBA7:
    jsr _83CDB0
    dec.b 0x34
    beq .EBC1

    lda.b 0x2B
    bit.b #0x04
    bne .EBBD

    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x10
    jmp _8386F1

.EBBD:
    bit.b #0x03
    beq .EBC6

.EBC1:
    lda.b #0x0E
    jmp _8386F1

.EBC6:
    jsr _83CB69
    jsl 0x82823E
    jsl 0x848EEA
    jmp _83EEC0

.EBD4:
    ldx.b 0x03
    bne .EBE0

    inc.b 0x03
    lda.b #0x03
    jsl 0x848F07
.EBE0:
    lda.b 0x2B
    bit.b #0x04
    beq .EBEB

    lda.b #0x12
    jmp _8386F1

.EBEB:
    rep #0x20
    lda.w #0xFA80
    cmp.b 0x1C
    bmi .EBF6

    sta.b 0x1C
.EBF6:
    sep #0x20
    jsl 0x828174
    rts

.EBFD:
    ldx.b 0x03
    bne .EC1F

    inc.b 0x03
    ldx.b #0x02
    ldy.b #0x01
    lda.b #0x0A
    jsl 0x84A33C
    lda.b #0x39
    jsl _80888B
    jsr _83CD3E
    jsr _83CD69
    lda.b #0x04
    jsl 0x848F07
.EC1F:
    lda.b 0x0F
    bpl .EC28

    lda.b #0x00
    jmp _8386F1

.EC28:
    jsl 0x848EEA
    rts

.EC2D:
    ldx.b 0x03
    jmp (.EC32,X)

.EC32: d16[.EC38, .EC66, .EC7D]

.EC38:
    lda.b #0x02
    sta.b 0x03
    sta.b 0x2F
    rep #0x30
    ldx.w #0x0000
    jsl 0x849086
    bit.w #0x0007
    beq .EC56

    ldx.w #0x0178
    bit.b 0x32
    bvc .EC56

    ldx.w #0xFE88
.EC56:
    stx.b 0x1A
    lda.w #0x0553
    sta.b 0x1C
    sep #0x30
    lda.b #0x03
    jsl 0x848F07
    rts

.EC66:
    lda.b 0x2B
    bit.b #0x04
    beq .EC78

    lda.b #0x04
    sta.b 0x03
    stz.b 0x2F
    lda.b #0x0F
    jsl 0x848F07
.EC78:
    jsl 0x828174
    rts

.EC7D:
    lda.b 0x0F
    bpl .EC89

    jsr _83EE90
    lda.b #0x00
    jmp _8386F1

.EC89:
    jsl 0x848EEA
    rts

.EC8E:
    ldx.b 0x03
    jmp (.EC93,X)

.EC93: d16[.ECA5, .ED05, .ED28, .ED66, .ED92, .EDC4, .EDF3, .EE34, .EE44]

.ECA5:
    rep #0x20
    lda.w 0x0BAD
    cmp.w #0x0AB0
    sep #0x20
    bcs .ECD7

    lda.b #0x0C
    sta.b 0x03
    rep #0x30
    ldy.w #0x0040
    ldx.w #0x0178
    lda.b 0x05
    cmp.w #0x0B30
    bcc .ECCA

    ldy.w #0x0000
    ldx.w #0xFE88
.ECCA:
    stx.b 0x1A
    sep #0x30
    sty.b 0x33
    lda.b #0x00
    jsl 0x848F07
    rts

.ECD7:
    lda.b #0x02
    sta.b 0x03
    rep #0x31
    ldx.w #0x0178
    lda.w 0x0BAD
    clc
    adc.w #0x0020
    cmp.b 0x05
    bcs .ECEE

    ldx.w #0xFE88
.ECEE:
    stx.b 0x1A
    sep #0x30
    ldy.b #0x03
    lda.b #0xF6
    jsl _808850.8868
    lda.b #0x78
    sta.b 0x34
    lda.b #0x02
    jsl 0x848F07
    rts

.ED05:
    dec.b 0x34
    bne .ED27

    lda.b #0x04
    sta.b 0x03
    rep #0x21
    ldx.b #0x40
    lda.w 0x0BAD
    adc.w #0x0020
    cmp.b 0x05
    bcs .ED1D

    ldx.b #0x00
.ED1D:
    stx.b 0x33
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
.ED27:
    rts

.ED28:
    rep #0x21
    lda.w 0x0BAD
    adc.w #0x0020
    sec
    sbc.b 0x05
    clc
    adc.w #0x0008
    cmp.w #0x0010
    sep #0x20
    bcs .ED51

    stz.b 0x33
    lda.b #0x06
    sta.b 0x03
    sta.b 0x30
    lda.b #0x02
    sta.b 0x12
    lda.b #0x14
    jsl 0x848F07
    rts

.ED51:
    jsl 0x82823E
    jsl 0x848EEA
    lda.b 0x0F
    and.b #0x03
    beq .ED65

    ora.b #0x38
    jsl _80888B
.ED65:
    rts

.ED66:
    jsl 0x848EEA
    bit.b 0x0F
    bpl .ED83

    lda.b #0x08
    sta.b 0x03
    lda.b #0x88
    sta.b 0x1A
    lda.b #0xFE
    sta.b 0x1B
    lda.b #0x17
    jsl 0x848F07
    jmp _83EECB

.ED83:
    bvc .ED91

    jsl 0x84A061
    lda.b #0x40
    sta.w 0x0C11
    jsr _83EECB
.ED91:
    rts

.ED92:
    jsl 0x848EEA
    rep #0x20
    lda.b 0x05
    cmp.w #0x0AD0
    sep #0x20
    bcs .EDAD

    lda.b #0x0A
    sta.b 0x03
    stz.b 0x33
    lda.b #0x18
    jsl 0x848F07
.EDAD:
    jsl 0x82823E
    lda.b 0x0F
    and.b #0x30
    beq .EDC1

    lsr
    lsr
    lsr
    lsr
    ora.b #0x38
    jsl _80888B
.EDC1:
    jmp _83EECB

.EDC4:
    jsl 0x848EEA
    bit.b 0x0F
    bpl .EDE3

    lda.b #0x0C
    sta.b 0x03
    lda.b #0x40
    sta.b 0x33
    lda.b #0x78
    sta.b 0x1A
    lda.b #0x01
    sta.b 0x1B
    lda.b #0x00
    jsl 0x848F07
    rts

.EDE3:
    bvc .EDF2

    lda.b 0x0F
    cmp.b #0x50
    bne .EDEF

    jsl 0x84A026
.EDEF:
    jmp _83EECB

.EDF2:
    rts

.EDF3:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0B30
    bpl .EE01

    eor.w #0xFFFF
    inc
.EE01:
    cmp.w #0x0002
    bcs .EE1D

    lda.w #0x0B30
    sta.b 0x05
    sep #0x20
    lda.b #0x3C
    sta.b 0x34
    stz.b 0x33
    lda.b #0x0E
    sta.b 0x03
    lda.b #0x16
    jsl 0x848F07
.EE1D:
    sep #0x20
    jsl 0x82823E
    jsl 0x848EEA
    lda.b 0x0F
    and.b #0x03
    beq .EE33

    ora.b #0x38
    jsl _80888B
.EE33:
    rts

.EE34:
    dec.b 0x34
    bne .EE3F

    lda.b #0x10
    sta.b 0x03
    sta.w 0x1F40
.EE3F:
    jsl 0x848EEA
    rts

.EE44:
    lda.w 0x1F42
    beq .EE4D

    lda.b #0x04
    sta.b 0x01
.EE4D:
    rts

.EE4E:
    jml 0x828398

;-----

_83EE52:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bpl .EE60

    eor.w #0xFFFF
    inc
.EE60:
    cmp.w #0x0020
    bcc .EE72

    cmp.w #0x00A0
    bcc .EE6E

    ldx.b #0x04
    bra .EE74

.EE6E:
    ldx.b #0x02
    bra .EE74

.EE72:
    ldx.b #0x00
.EE74:
    sep #0x20
    rts

;-----

_83EE77:
    ldx.b #0x18
    bra .EE81

.EE7B:
    ldx.b #0x0C
    bra .EE81

.EE7F:
    ldx.b #0x04
.EE81:
    lda.w 0x0BCF
    and.b #0x7F
    cmp.b #0x07
    bcs .EE8C

    ldx.b #0x14
.EE8C:
    txa
    jmp _8386F1

;-----

_83EE90:
    jsl 0x828358
    bne .EEBD

    inc.w 0x0000,X
    lda.b #0x16
    sta.w 0x000A,X
    lda.b 0x33
    sta.w 0x0011,X
    rep #0x21
    lda.w #0x0016
    bit.b 0x32
    bvs .EEAF

    lda.w #0xFFEA
.EEAF:
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0xFFE2
    sta.w 0x0008,X
.EEBD:
    sep #0x30
    rts

;-----

_83EEC0:
    lda.w 0x0C26
    bpl .EECA

    lda.b #0x16
    jmp _8386F1

.EECA:
    rts

;-----

_83EECB:
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    tax
    lda.w 0x00D7F7,X
    and.w #0x00FF
    bit.b 0x32
    bvs .EEE1

    eor.w #0xFFFF
    inc
.EEE1:
    adc.b 0x05
    sta.w 0x0BAD
    lda.w 0x00D7F8,X
    and.w #0x00FF
    bit.w #0x0080
    beq .EEF4

    ora.w #0xFF00
.EEF4:
    clc
    adc.b 0x08
    sta.w 0x0BB0
    sep #0x20
    rts

;-----

_83EEFD:
    rep #0x10
    ldy.w #0x0001
.EF02:
    jsl 0x828321
    bne .EF19

    inc.w 0x0000,X
    lda.b #0x3C
    sta.w 0x000A,X
    lda 0x00D803,Y
    sta.w 0x000B,X
    dey
    bpl .EF02

.EF19:
    sep #0x10
    rts

;-----

_83EF1C:
    jsl 0x828321
    bne .EF2F

    inc.w 0x0000,X
    lda.b #0x66
    sta.w 0x000A,X
    lda.b #0x08
    sta.w 0x000B,X
.EF2F:
    sep #0x10
    rts

;-----

_83EF32:
    lda.w 0x1F3F
    bne .EF62

    rep #0x20
    lda.w 0x1E4D
    cmp.w #0x0440
    bcc .EF5E

    cmp.w #0x0CA0
    bcs .EF5E

    and.w #0xFFF0
    clc
    adc.w #0x0088
    sta.b 0x05
    lda.w 0x1E50
    cmp.w #0x0140
    bcc .EF5E

    sep #0x20
    ldx.b 0x01
    jmp (.EF66,X)

.EF5E:
    jml 0x828387

.EF62:
    jml 0x828398

.EF66: d16[.EF6A, .EFAB]

.EF6A:
    lda.b #0x02
    sta.b 0x01
    jsl 0x849086
    and.b #0xF0
    sta.b 0x0B
    lda.b #0x1E
    sta.b 0x1A
    rep #0x10
    ldx.w #0x1628
.EF7F:
    lda.w 0x0000,X
    beq .EF9A

    lda.w 0x000A,X
    cmp.b #0x0D
    bne .EF9A

    rep #0x20
    tdc
    sta.w 0x0000
    cpx.w 0x0000
    beq .EF9A

    jml 0x828387

.EF9A:
    rep #0x20
    txa
    clc
    adc.w #0x0030
    tax
    sep #0x20
    cpx.w #0x1928
    bcc .EF7F

    sep #0x10
.EFAB:
    dec.b 0x1A
    bne .EFFA

    lda.b #0x1E
    sta.b 0x1A
.EFB3:
    jsl 0x849086
    and.b #0xF0
    cmp.b 0x0B
    beq .EFB3

    sta.b 0x0B
    sta.b 0x29
    lda.b #0x20
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcs .EFFA

    jsl 0x828321
    bne .EFF8

    inc.w 0x0000,X
    lda.b #0x18
    sta.w 0x000A,X
    stz.w 0x000B,X
    rep #0x20
    lda.b 0x08
    sta.w 0x0008,X
    lda.b 0x29
    and.w #0x00FF
    bit.w #0x0080
    beq .EFF2

    ora.w #0xFF00
.EFF2:
    clc
    adc.b 0x05
    sta.w 0x0005,X
.EFF8:
    sep #0x30
.EFFA:
    rtl

;-----

_83EFFB:
    ldx.b 0x01
    jmp (.F000,X)

.F000: d16[.F006, .F04D, .F095]

.F006:
    lda.b #0x5B
    sta.b 0x16
    lda.l 0x7F825A
    sta.b 0x18
    lda.l 0x7F835A
    sta.b 0x11
    lda.b #0x04
    sta.b 0x12
    lda.b 0x0B
    and.b #0x0F
    tax
    lda.w 0x00DAB8,X
    sta.b 0x02
    txa
    asl
    tax
    stz.b 0x2C
    rep #0x20
    lda.w 0x00DAC2,X
    sta.b 0x05
    lda.w 0x00DAD6,X
    sta.b 0x08
    lda.w 0x00DAEA,X
    sta.b 0x29
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x02
    ldx.b 0x0B
    bpl .F04A

    lda.b #0x04
.F04A:
    sta.b 0x01
    rtl

.F04D:
    rep #0x20
    ldx.b 0x02
    jmp (.F054,X)

.F054: d16[.F05C, .F063, .F06A, .F071]

.F05C:
    lda.b 0x08
    dec
    sta.b 0x08
    bra .F076

.F063:
    lda.b 0x05
    inc
    sta.b 0x05
    bra .F076

.F06A:
    lda.b 0x08
    inc
    sta.b 0x08
    bra .F076

.F071:
    lda.b 0x05
    dec
    sta.b 0x05
.F076:
    dec.b 0x29
    bne .F092

    sep #0x20
    lda.b 0x02
    inc
    inc
    and.b #0x06
    sta.b 0x02
    lsr
    lsr
    rep #0x20
    lda.w #0x0200
    bcc .F090

    lda.w #0x0040
.F090:
    sta.b 0x29
.F092:
    jmp .F10D

.F095:
    rep #0x20
    ldx.b 0x02
    jmp (.F09C,X)

.F09C: d16[.F0A6, .F0BA, .F0D3, .F0E7, .F0FB]

.F0A6:
    lda.b 0x08
    dec
    sta.b 0x08
    dec.b 0x29
    bne .F10D

    inc.b 0x02
    inc.b 0x02
    lda.w #0x0080
    sta.b 0x29
    bra .F10D

.F0BA:
    lda.b 0x05
    inc
    sta.b 0x05
    lda.b 0x08
    dec
    sta.b 0x08
    dec.b 0x29
    bne .F10D

    inc.b 0x02
    inc.b 0x02
    lda.w #0x0040
    sta.b 0x29
    bra .F10D

.F0D3:
    lda.b 0x05
    inc
    sta.b 0x05
    dec.b 0x29
    bne .F10D

    inc.b 0x02
    inc.b 0x02
    lda.w #0x00E0
    sta.b 0x29
    bra .F10D

.F0E7:
    lda.b 0x08
    inc
    sta.b 0x08
    dec.b 0x29
    bne .F10D

    inc.b 0x02
    inc.b 0x02
    lda.w #0x00C0
    sta.b 0x29
    bra .F10D

.F0FB:
    lda.b 0x05
    dec
    sta.b 0x05
    dec.b 0x29
    bne .F10D

    ldx.b #0x00
    stx.b 0x02
    lda.w #0x0060
    sta.b 0x29
.F10D:
    sep #0x30
    jsl 0x82806E
    bcc .F116

    rtl

.F116:
    rep #0x20
    lda.w #0xDAB0
    sta.b 0x20
    jsl 0x84AB6E
    lda.w #0xDAB4
    sta.b 0x20
    jsl 0x84AB43
    sep #0x20
    jsl 0x848EEA
    jml 0x8280B4

;-----

_83F134:
    ldx.b 0x01
    jsr (.F19B,X)
    jsl 0x848EEA
    jsl 0x82806E
    bcc .F14C

    inc.b 0x1F
    bpl .F14B

    lda.b #0x80
    sta.b 0x1F
.F14B:
    rtl

.F14C:
    lda.b 0x1F
    beq .F181

    stz.b 0x1F
    cmp.b #0x0A
    bcc .F181

    lda.b #0x38
    sta.b 0x0A
    jsl 0x84A1D0
    lda.b #0x0F
    sta.b 0x0A
    cpy.b #0x02
    bcs .F181

    jsl 0x828321
    bne .F17F

    inc.w 0x0000,X
    lda.b #0x38
    sta.w 0x000A,X
    lda.b #0x80
    sta.w 0x000B,X
    rep #0x20
    tdc
    sta.w 0x000C,X
.F17F:
    sep #0x10
.F181:
    rep #0x20
    lda.w #0xDAFE
    sta.b 0x20
    jsl 0x84AB6E
    lda.w #0xDB02
    sta.b 0x20
    jsl 0x84AB43
    sep #0x20
    jml 0x8280B4

.F19B: d16[.F1A7, .F1FC, .F258, .F22A, .F258, .F273]

.F1A7:
    lda.b #0x5C
    sta.b 0x16
    stz.b 0x1F
    lda.l 0x7F825B
    sta.b 0x18
    lda.l 0x7F835B
    sta.b 0x11
    lda.b #0x04
    sta.b 0x12
    ldx.b 0x0B
    lda.w 0x00DB3D,X
    sta.b 0x01
    lda.w 0x00DB32,X
    sta.b 0x08
    stz.b 0x09
    bit.b #0x40
    beq .F1D3

    lda.b #0xFF
    sta.b 0x06
.F1D3:
    txa
    asl
    tax
    rep #0x20
    lda.w 0x00DB06,X
    sta.b 0x05
    lda.w 0x00DB1C,X
    sta.b 0x29
    clc
    adc.b 0x08
    sta.b 0x08
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
    jsl 0x849086
    and.b #0x0F
    cmp.b #0x04
    bcc .F1F9

.F1F9:
    sep #0x30
    rts

.F1FC:
    lda.b 0x02
    bne .F211

    inc.b 0x02
    lda.b #0x00
    jsl 0x848F07
    rep #0x20
    lda.w #0x0100
    sta.b 0x1C
    sep #0x20
.F211:
    jsl 0x82825D
    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x0040
    cmp.b 0x29
    sep #0x20
    bne .F229

    inc.b 0x01
    inc.b 0x01
    stz.b 0x02
.F229:
    rts

.F22A:
    lda.b 0x02
    bne .F23F

    inc.b 0x02
    lda.b #0x02
    jsl 0x848F07
    rep #0x20
    lda.w #0xFF00
    sta.b 0x1C
    sep #0x20
.F23F:
    jsl 0x82825D
    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x0040
    cmp.b 0x29
    sep #0x20
    bne .F257

    inc.b 0x01
    inc.b 0x01
    stz.b 0x02
.F257:
    rts

.F258:
    lda.b 0x02
    bne .F268

    inc.b 0x02
    lda.b #0x1E
    sta.b 0x1E
    lda.b #0x01
    jsl 0x848F07
.F268:
    dec.b 0x1E
    bne .F272

    inc.b 0x01
    inc.b 0x01
    stz.b 0x02
.F272:
    rts

.F273:
    lda.b #0x02
    sta.b 0x01
    jmp .F1FC

;-----

_83F27A:
    ldx.b 0x01
    jsr (.F283,X)
    jml 0x8280B4

.F283: d16[.F289, .F2C6, .F32D]

.F289:
    lda.b #0x9C
    sta.b 0x16
    lda.l 0x7F8293
    sta.b 0x18
    lda.l 0x7F8393
    sta.b 0x11
    lda.b #0x06
    sta.b 0x12
    rep #0x30
    jsr _83F350
    lda.b 0x0B
    and.w #0x001C
    lsr
    tax
    lda.w 0x00DB69,X
    sta.b 0x1E
    clc
    adc.w 0x00DB85,X
    sta.b 0x05
    lda.w 0x00DB77,X
    sta.b 0x08
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x02
    sta.b 0x01
    rts

.F2C6:
    jsl 0x82823E
    jsl 0x848EEA
    rep #0x20
    lda.w #0xDB5B
    sta.b 0x20
    jsl 0x84AB6E
    lda.w #0xDB65
    sta.b 0x20
    jsl 0x84AB43
    rep #0x10
    lda.b 0x1A
    bmi .F309

    lda.b 0x05
    sec
    sbc.b 0x1E
    bmi .F32A

    cmp.w #0x0040
    sep #0x20
    bcc .F32A

    lda.b #0x04
    sta.b 0x01
    lda.b #0x40
    sta.b 0x26
    lda.b #0x02
    trb.b 0x0B
    rep #0x20
    jsr _83F350
    bra .F32A

.F309:
    rep #0x20
    lda.b 0x1E
    sec
    sbc.b 0x05
    bmi .F32A

    cmp.w #0x0040
    sep #0x20
    bcc .F32A

    lda.b #0x04
    sta.b 0x01
    lda.b #0x40
    sta.b 0x26
    lda.b #0x02
    tsb.b 0x0B
    rep #0x20
    jsr _83F350
.F32A:
    sep #0x30
    rts

.F32D:
    dec.b 0x26
    bne .F335

    lda.b #0x02
    sta.b 0x01
.F335:
    jsl 0x848EEA
    rep #0x20
    lda.w #0xDB5B
    sta.b 0x20
    jsl 0x84AB6E
    lda.w #0xDB65
    sta.b 0x20
    jsl 0x84AB43
    sep #0x20
    rts

;-----

_83F350:
    lda.b 0x0B
    and.w #0x0003
    asl
    tax
    lda.w 0x00DB93,X
    sta.b 0x1A
    rts

;-----

_83F35D:
    ldx.b 0x01
    jmp (.F362,X)

.F362: d16[.F366, .F3A9]

.F366:
    lda.b #0x5B
    sta.b 0x16
    lda.l 0x7F825A
    sta.b 0x18
    lda.l 0x7F835A
    sta.b 0x11
    lda.b #0x04
    sta.b 0x12
    lda.b 0x0B
    bpl .F382

    lda.b #0x40
    tsb.b 0x11
.F382:
    lda.b 0x0B
    and.b #0x0F
    tax
    lda.w 0x00DBA3,X
    sta.b 0x02
    rep #0x20
    lda.w 0x00DBA9,X
    sta.b 0x05
    lda.w 0x00DBAF,X
    sta.b 0x08
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x40
    sta.b 0x26
    lda.b #0x02
    sta.b 0x01
    rtl

.F3A9:
    rep #0x20
    ldx.b 0x02
    jmp (.F3B0,X)

.F3B0: d16[.F3B8, .F3BC, .F3CB, .F3CF]

.F3B8:
    dec.b 0x08
    bra .F3DC

.F3BC:
    lda.b 0x0B
    and.w #0x0080
    bne .F3C7

    inc.b 0x05
    bra .F3DC

.F3C7:
    dec.b 0x05
    bra .F3DC

.F3CB:
    inc.b 0x08
    bra .F3DC

.F3CF:
    lda.b 0x0B
    and.w #0x0080
    bne .F3DA

    dec.b 0x05
    bra .F3DC

.F3DA:
    inc.b 0x05
.F3DC:
    sep #0x20
    dec.b 0x26
    bne .F3EE

    lda.b 0x02
    inc
    inc
    and.b #0x06
    sta.b 0x02
    lda.b #0x40
    sta.b 0x26
.F3EE:
    jsl 0x848EEA
    rep #0x20
    lda.w #0xDB9B
    sta.b 0x20
    jsl 0x84AB6E
    lda.w #0xDB9F
    sta.b 0x20
    jsl 0x84AB43
    sep #0x20
    jml 0x8280B4

;-----

_83F40C:
    lda.b 0x01
    bne .F47B

    inc.b 0x01
    lda.b 0x02
    bne .F41D

    lda.b #0x42
    sta.b 0x16
    jmp .F421

.F41D:
    lda.b #0x45
    sta.b 0x16
.F421:
    ldx.b 0x0B
    lda.b 0x02
    bne .F42D

    lda.w 0x00DFB4,X
    jmp .F438

.F42D:
    lda.w 0x00DFB4,X
    sec
    sbc.b #0x04
    cmp.b #0x01
    bne .F438

    inc
.F438:
    jsl 0x848F07
    ldx.b 0x0B
    lda.w 0x00E009,X
    sta.b 0x1E
    lda.w 0x00DFE7,X
    sta.b 0x1B
    stz.b 0x1A
    lda.w 0x00DFF8,X
    sta.b 0x1D
    stz.b 0x1C
    rep #0x20
    lda.w 0x00DFC5,X
    and.w #0x00FF
    bit.w #0x0080
    beq .F461

    ora.w #0xFF00
.F461:
    clc
    adc.b 0x05
    sta.b 0x05
    lda.w 0x00DFD6,X
    and.w #0x00FF
    bit.w #0x0080
    beq .F474

    ora.w #0xFF00
.F474:
    clc
    adc.b 0x08
    sta.b 0x08
    sep #0x20
.F47B:
    jsl 0x848EEA
    jsl 0x8281E8
    jsl 0x82806E
    bcs .F495

    lda.w 0x0B9C
    eor.b 0x0B
    lsr
    bcc .F499

    jml 0x8280B4

.F495:
    jml 0x828398

.F499:
    rtl

;-----

_83F49A:
    ldx.b 0x01
    jmp (.F49F,X)

.F49F: d16[.F4A3, .F4F7]

.F4A3:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x18
    stz.b 0x12
    lda.b #0x17
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x34
    ora.b 0x11
    sta.b 0x11
    asl
    asl
    rep #0x20
    bcs .F4D6

    lda.w #0xFC00
    sta.b 0x1A
    jsl 0x849086
    and.w #0x00FF
    eor.w #0xFFFF
    inc
    clc
    adc.b 0x05
    bra .F4E5

.F4D6:
    lda.w #0x0400
    sta.b 0x1A
    jsl 0x849086
    and.w #0x00FF
    clc
    adc.b 0x05
.F4E5:
    sta.b 0x05
    stz.b 0x1C
    sep #0x20
    lda.b #0x20
    sta.b 0x1F
    lda.b #0x10
    sta.b 0x1E
    jml 0x8280B4

.F4F7:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .F503

    jml 0x828398

.F503:
    lda.b 0x11
    asl
    asl
    bcs .F50F

    jsl 0x8281CF
    bra .F513

.F50F:
    jsl 0x8281B2
.F513:
    jml 0x8280B4

;-----

_83F517:
    ldx.b 0x01
    beq .F51E

    jmp _83F5B5

.F51E:
    ldx.b 0x02
    bne .F52F

    lda.w 0x1F25
    bne .F52E

    inc.b 0x02
    lda.b #0x04
    tsb.w 0x00A2
.F52E:
    rtl

.F52F:
    inc.b 0x01
    stz.b 0x02
    lda.w 0x1F7A
    cmp.b #0x05
    beq .F540

    ldy.b #0x12
    jsl 0x828011
.F540:
    lda.b #0x01
    sta.w snes_regs.bgmode
    lda.b #0x04
    tsb.w 0x00C0
    lda.b #0x22
    sta.w 0x2123
    sta.w 0x00C6
    stz.w 0x2124
    stz.w 0x00C7
    stz.w 0x2125
    stz.w 0x00C8
    stz.w 0x212A
    stz.w 0x212B
    lda.b #0xFF
    sta.w 0x2126
    stz.w 0x2127
    lda.b #0x03
    sta.w 0x212E
    sta.w 0x00CE
    lda.b #0x80
    sta.w 0x00C9
    lda.w 0x1F7B
    cmp.b #0x04
    beq .F584

    lda.b #0xA0
    bra .F586

.F584:
    lda.b #0x13
.F586:
    sta.w 0x00CA
    lda.b #0x3F
    sta.w 0x00CB
    lda.b #0x5F
    sta.w 0x00CC
    lda.b #0x9F
    sta.w 0x00CD
    stz.b 0x1A
    stz.b 0x1B
    inc.w 0x1F31
    phb
    rep #0x30
    ldx.w #0xE01A
    ldy.w #0x0AA1
    lda.w #0x000D
    mvn 0x00,0x86
    sep #0x30
    plb
    jsr _83F67B
    rtl

;-----

_83F5B5:
    ldx.b 0x02
    jmp (.F5BA,X)

.F5BA: d16[.F5C2, .F5EE, .F5F8, .F667]

.F5C2:
    stz.w 0x0000
    lda.b 0x07
    cmp.b 0x1A
    beq .F5D0

    inc.w 0x0000
    inc.b 0x1A
.F5D0:
    lda.b 0x08
    cmp.b 0x1B
    beq .F5DB

    inc.w 0x0000
    inc.b 0x1B
.F5DB:
    lda.w 0x0000
    bne .F5EA

    lda.b 0x06
    jsl _80E9F6
    lda.b #0x02
    sta.b 0x02
.F5EA:
    jsr _83F67B
    rtl

.F5EE:
    lda.w 0x0060
    bne .F5F7

    lda.b #0x04
    sta.b 0x02
.F5F7:
    rtl

.F5F8:
    stz.w 0x0000
    lda.b 0x1A
    beq .F604

    inc.w 0x0000
    dec.b 0x1A
.F604:
    lda.b 0x1B
    beq .F60D

    inc.w 0x0000
    dec.b 0x1B
.F60D:
    lda.w 0x0000
    bne .F663

    lda.w 0x1F25
    bne .F666

    lda.b #0x06
    sta.b 0x02
    lda.b #0x04
    tsb.w 0x00A2
    lda.b #0x80
    trb.w 0x1F2C
    lda.b #0x09
    sta.w snes_regs.bgmode
    lda.w 0x1F7B
    cmp.b #0x04
    beq .F651

    stz.w 0x2123
    stz.w 0x00C6
    stz.w 0x00C9
    stz.w 0x00CA
    lda.b #0xE0
    sta.w 0x2132
    lda.b #0x20
    sta.w 0x00CB
    lda.b #0x40
    sta.w 0x00CC
    lda.b #0x80
    sta.w 0x00CD
.F651:
    lda.w 0x1F7A
    beq .F65C

    stz.w 0x1F3B
    stz.w 0x1F31
.F65C:
    stz.w 0x0AA1
    stz.w 0x0AA8
    rtl

.F663:
    jsr _83F67B
.F666:
    rtl

.F667:
    lda.w 0x1F7A
    asl
    clc
    adc.b #0x60
    tay
    jsl 0x828011
    jsl 0x80B4F1
    jml 0x828398

;-----

_83F67B:
    ldx.b #0x00
    lda.b 0x05
    sec
    sbc.b 0x1B
    cmp.b #0x80
    bcc .F68E

    ldy.b #0xFF
    sty.w 0x0000
    jsr _83F734
.F68E:
    sta.w 0x0B22,X
    lda.b #0xFF
    sta.w 0x0B23,X
    inx
    inx
    lda.b 0x1B
    asl
    cmp.b #0x80
    bcc .F6A7

    ldy.b #0xFF
    sty.w 0x0000
    jsr _83F734
.F6A7:
    sta.w 0x0B22,X
    lda.b 0x04
    sec
    sbc.b 0x1A
    sta.w 0x0B23,X
    inx
    inx
    lda.b #0xE0
    sec
    sbc.b 0x05
    sec
    sbc.b 0x1B
    cmp.b #0x80
    bcc .F6C8

    ldy.b #0xFF
    sty.w 0x0000
    jsr _83F734
.F6C8:
    sta.w 0x0B22,X
    lda.b #0xFF
    sta.w 0x0B23,X
    inx
    inx
    stz.w 0x0B22,X
    inx
    rep #0x21
    txa
    adc.w #0x0AD2
    sta.w 0x0AAB
    sep #0x20
    lda.b 0x05
    sec
    sbc.b 0x1B
    cmp.b #0x80
    bcc .F6F0

    stz.w 0x0000
    jsr _83F734
.F6F0:
    sta.w 0x0B22,X
    lda.b #0x00
    sta.w 0x0B23,X
    inx
    inx
    lda.b 0x1B
    asl
    cmp.b #0x80
    bcc .F707

    stz.w 0x0000
    jsr _83F734
.F707:
    sta.w 0x0B22,X
    lda.b 0x04
    clc
    adc.b 0x1A
    sta.w 0x0B23,X
    inx
    inx
    lda.b #0xE0
    sec
    sbc.b 0x05
    sec
    sbc.b 0x1B
    cmp.b #0x80
    bcc .F726

    stz.w 0x0000
    jsr _83F734
.F726:
    sta.w 0x0B22,X
    lda.b #0x00
    sta.w 0x0B23,X
    inx
    inx
    stz.w 0x0B22,X
    rts

;-----

_83F734:
    pha
    lda.b #0x7F
    sta.w 0x0B22,X
    lda.w 0x0000
    sta.w 0x0B23,X
    inx
    inx
    pla
    sec
    sbc.b #0x7F
    rts

;-----

_83F747:
    jsl 0x8282D3
    bne .F77B

    inc.w 0x0000,X
    lda.b #0x2A
    sta.w 0x000A,X
    sta.w 0x1F3B
    lda.b #0x80
    tsb.w 0x1F2C
    lda.w 0x0000
    sta.w 0x0004,X
    lda.w 0x0002
    sta.w 0x0005,X
    lda.w 0x0004
    sta.w 0x0007,X
    lda.w 0x0006
    sta.w 0x0008,X
    lda.w 0x0008
    sta.w 0x0006,X
.F77B:
    sep #0x10
    rtl

;-----

_83F77E:
    ldx.b 0x01
    bne .F7D1

    inc.b 0x01
    lda.b #0x33
    sta.w 0x2123
    sta.w 0x00C6
    stz.w 0x2124
    stz.w 0x00C7
    stz.w 0x2125
    stz.w 0x00C8
    stz.w 0x212A
    stz.w 0x212B
    stz.w 0x2126
    lda.b #0xFF
    sta.w 0x2127
    lda.b #0x03
    sta.w 0x212E
    sta.w 0x00CE
    lda.b #0x7F
    sta.b 0x07
    lda.b #0x01
    sta.b 0x08
    phb
    rep #0x30
    lda.w #0x0100
    sta.b 0x11
    ldx.w #0xE01A
    ldy.w #0x0AA1
    lda.w #0x000D
    mvn 0x00,0x86
    sep #0x30
    plb
    jsr _83F873
    rtl

.F7D1:
    ldx.b 0x02
    jmp (.F7D6,X)

.F7D6: d16[.F7E0, .F81A, .F836, .F853, .F865]

.F7E0:
    stz.w 0x0000
    lda.b 0x08
    cmp.b #0x60
    beq .F7EE

    inc.w 0x0000
    inc.b 0x08
.F7EE:
    rep #0x20
    lda.b 0x11
    cmp.w #0x00A0
    beq .F7FC

    inc.w 0x0000
    dec.b 0x11
.F7FC:
    sep #0x20
    lda.b 0x07
    cmp.b #0x30
    beq .F809

    inc.w 0x0000
    dec.b 0x07
.F809:
    lda.w 0x0000
    bne .F816

    lda.b #0x02
    sta.b 0x02
    lda.b #0x1E
    sta.b 0x16
.F816:
    jsr _83F873
    rtl

.F81A:
    dec.b 0x16
    bne .F835

    lda.b #0x04
    sta.b 0x02
    rep #0x20
    lda.w #0x0318
    sta.w 0x1E68
    sta.w 0x1E6E
    lda.w #0x0001
    sta.w 0x1E52
    sep #0x20
.F835:
    rtl

.F836:
    dec.b 0x08
    rep #0x20
    dec.b 0x11
    lda.b 0x11
    cmp.w #0x0088
    sep #0x20
    bne .F84F

    lda.b #0x06
    sta.b 0x02
    lda.b #0x96
    jsl _80E9F6
.F84F:
    jsr _83F873
    rtl

.F853:
    lda.w 0x0060
    bne .F864

    lda.b #0x08
    sta.b 0x02
    lda.b #0x58
    sta.b 0x16
    lda.b #0x02
    sta.b 0x17
.F864:
    rtl

.F865:
    rep #0x20
    dec.b 0x16
    sep #0x20
    bne .F872

    lda.b #0x80
    sta.w 0x1F7F
.F872:
    rtl

;-----

_83F873:
    ldx.b #0x00
    stz.b 0x14
    stz.b 0x15
    lda.b 0x08
    sta.w 0x0B22,X
    lda.b #0xFF
    sta.w 0x0B23,X
    inx
    inx
    rep #0x20
    lda.b 0x11
    cmp.w #0x00E0
    sep #0x20
    bcc .F892

    lda.b #0xDF
.F892:
    sec
    sbc.b 0x08
    cmp.b #0x80
    bcc .F8A6

    pha
    lda.b #0x80
    sec
    sbc.b 0x07
    sta.w 0x0000
    pla
    jsr _83F734
.F8A6:
    sta.w 0x0B22,X
    lda.b #0x80
    sec
    sbc.b 0x07
    sta.w 0x0B23,X
    inx
    inx
    rep #0x20
    lda.w #0x00E0
    sec
    sbc.b 0x11
    sep #0x20
    bcc .F8D5

    cmp.b #0x80
    bcc .F8CB

    ldy.b #0xFF
    sty.w 0x0000
    jsr _83F734
.F8CB:
    sta.w 0x0B22,X
    lda.b #0xFF
    sta.w 0x0B23,X
    inx
    inx
.F8D5:
    stz.w 0x0B22,X
    inx
    rep #0x21
    txa
    adc.w #0x0AD2
    sta.w 0x0AAB
    sep #0x20
    lda.b 0x08
    sta.w 0x0B22,X
    lda.b #0x00
    sta.w 0x0B23,X
    inx
    inx
    rep #0x20
    lda.b 0x11
    cmp.w #0x00E0
    sep #0x20
    bcc .F8FD

    lda.b #0xDF
.F8FD:
    sec
    sbc.b 0x08
    cmp.b #0x80
    bcc .F911

    pha
    lda.b #0x80
    clc
    adc.b 0x07
    sta.w 0x0000
    pla
    jsr _83F734
.F911:
    sta.w 0x0B22,X
    lda.b #0x80
    clc
    adc.b 0x07
    sta.w 0x0B23,X
    inx
    inx
    rep #0x20
    lda.w #0x00E0
    sec
    sbc.b 0x11
    sep #0x20
    bcc .F93E

    cmp.b #0x80
    bcc .F934

    stz.w 0x0000
    jsr _83F734
.F934:
    sta.w 0x0B22,X
    lda.b #0x00
    sta.w 0x0B23,X
    inx
    inx
.F93E:
    stz.w 0x0B22,X
    rts

;-----

_83F942:
    lda.b 0x01
    bne .F9B2

    inc.b 0x01
    rep #0x30
    lda.b 0x0B
    and.w #0x007F
    asl
    asl
    tay
    sep #0x20
    lda.b #0x00
    xba
    lda 0x86E028,Y
    tax
    lda.l 0x7F8200,X
    sta.b 0x18
    lda.b 0x11
    and.b #0x70
    sta.b 0x11
    lda.l 0x7F8300,X
    and.b #0x0F
    tsb.b 0x11
    lda 0x86E02B,Y
    sta.b 0x12
    lda 0x86E029,Y
    sta.b 0x16
    stz.b 0x10
    rep #0x20
    bit.b 0x0A
    bpl .F9A0

    lda.w #0x0030
    sta.b 0x1E
    jsl 0x849086
    and.w #0x000E
    tax
    lda.w 0x86E1D8,X
    sta.b 0x1A
    jsl 0x849086
    and.w #0x000E
    tax
    lda.w 0x86E1E8,X
    sta.b 0x1C
.F9A0:
    tdc
    sec
    sbc.w #0x1928
    sep #0x20
    and.b #0x20
    sta.b 0x0B
    lda 0x86E02A,Y
    jml 0x848F07

.F9B2:
    rep #0x20
    lda.b 0x0C
    beq .F9C9

    cmp.b 0x08
    bcs .F9C9

    sta.b 0x08
    stz.b 0x0C
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    lsr
    sta.b 0x1C
.F9C9:
    sep #0x20
    inc.b 0x10
    jsl 0x82806E
    bcc .F9D7

    jml 0x828398

.F9D7:
    jsl 0x828174
    jsl 0x848EEA
    lda.b 0x10
    lsr
    ldx.b 0x0B
    beq .F9EA

    bcs .F9F0

    bra .F9EC

.F9EA:
    bcc .F9F0

.F9EC:
    jml 0x8280B4

.F9F0:
    rtl

;-----

_83F9F1:
    lda.b 0x01
    bne .FA13

    inc.b 0x01
    lda.l 0x7F8249
    sta.b 0x18
    lda.b 0x11
    and.b #0x40
    ora.l 0x7F8349
    sta.b 0x11
    stz.b 0x12
    lda.b #0x4F
    sta.b 0x16
    lda.b 0x0B
    jml 0x848F07

.FA13:
    rep #0x30
    ldx.b 0x0C
    lda.w 0x0005,X
    sta.b 0x05
    lda.w 0x0008,X
    sta.b 0x08
    sep #0x30
    lda.b 0x0F
    bpl .FA2B

    jml 0x828398

.FA2B:
    jsl 0x848EEA
    jml 0x8280B4

;-----

_83FA33:
    lda.b 0x01
    bne .FA66

    inc.b 0x01
    lda.l 0x7F8226
    sta.b 0x18
    lda.l 0x7F8326
    sta.b 0x11
    lda.b #0x04
    sta.b 0x12
    stz.b 0x07
    rep #0x20
    stz.b 0x1A
    lda.w #0xFF80
    sta.b 0x1C
    stz.b 0x1E
    sep #0x20
    lda.b #0x54
    sta.b 0x10
    lda.b #0x29
    sta.b 0x16
    lda.b #0x00
    jml 0x848F07

.FA66:
    ldx.b 0x02
    jsr (.FA6F,X)
    jml 0x8280B4

.FA6F: d16[.FA79, .FA86, .FA97, .FAA6, .FABF]

.FA79:
    dec.b 0x10
    bne .FA81

    lda.b #0x02
    sta.b 0x02
.FA81:
    jsl 0x82825D
    rts

.FA86:
    lda.b 0x0F
    bpl .FA92

    lda.b #0x3C
    sta.b 0x10
    lda.b #0x04
    sta.b 0x02
.FA92:
    jsl 0x848EEA
    rts

.FA97:
    dec.b 0x10
    bne .FAA5

    lda.b #0x06
    sta.b 0x02
    lda.b #0x02
    jsl 0x848F07
.FAA5:
    rts

.FAA6:
    lda.b 0x0F
    bpl .FABA

    lda.b #0x2A
    sta.b 0x10
    lda.b #0x00
    sta.b 0x1C
    lda.b #0x01
    sta.b 0x1D
    lda.b #0x08
    sta.b 0x02
.FABA:
    jsl 0x848EEA
    rts

.FABF:
    dec.b 0x10
    bne .FAC7

    jsl 0x828398
.FAC7:
    jsl 0x82825D
    rts

;-----

_83FACC:
    ldx.b 0x01
    bne .FB0A

    jsl 0x84A23A
    tya
    beq .FADB

    jml 0x828387

.FADB:
    inc.b 0x01
    stz.b 0x0F
    stz.b 0x0E
    stz.b 0x0B
    rep #0x30
    phb
    ldx.w #0xE266
    ldy.w #0x0ABD
    lda.w #0x0006
    mvn 0x00,0x86
    plb
    jsr _83FB44
    jsr _83FB58
    lda.w #0x0080
    sta.b 0x11
    lda.w #0x0100
    sta.b 0x1A
    lda.w #0x0080
    sta.b 0x1C
    stz.b 0x07
.FB0A:
    rep #0x30
    lda.w 0x0BAD
    cmp.w #0x0320
    bcs .FB23

    lda.w 0x0BB0
    cmp.w #0x049F
    bcc .FB23

    stz.w 0x0ABD
    jml 0x828387

.FB23:
    jsr _83FC84
    jsr _83FB76
    jsr _83FBF0
    jsr _83FC2C
    jsr _83FCD0
    jsr _83FCFE
    jsr _83FD5F
    sep #0x30
    jsr _83FD55
    lda.b 0x0F
    eor.b #0x40
    sta.b 0x0F
    rtl

;-----

_83FB44:
    ldx.w #0x0060
    lda.w #0x0000
.FB4A:
    sta.l 0x7FD085,X
    sta.l 0x7FD084,X
    dex
    dex
    dex
    bpl .FB4A

    rts

;-----

_83FB58:
    ldx.w #0x003E
.FB5B:
    lda.w 0x86E26D,X
    sta.l 0x7FD0E7,X
    dex
    dex
    bpl .FB5B

    rts

;-----

_83FB67:
    ldx.w #0x003E
    lda.w #0x0000
.FB6D:
    sta.l 0x7FD0E7,X
    dex
    dex
    bpl .FB6D

    rts

;-----

_83FB76:
    lda.w #0x007F
    xba
    sta.b 0x05
    lda.w #0xD000
    bit.b 0x0E
    bvc .FB86

    lda.w #0xD042
.FB86:
    sta.b 0x04
    lda.w 0x1E90
    and.w #0x001F
    sta.w 0x0000
    asl
    tay
    clc
    adc.w 0x0000
    tax
    lda.w #0x0020
    sta.w 0x0000
    stz.b 0x16
.FBA0:
    pea 0x867F
    plb
    stz.w 0xD129
    lda 0xD0E7,Y
    bpl .FBAF

    dec.w 0xD129
.FBAF:
    clc
    adc.w 0xD084,X
    sta.w 0xD084,X
    sep #0x20
    lda.w 0xD086,X
    adc.w 0xD129
    sta.w 0xD086,X
    rep #0x21
    plb
    lda.l 0x7FD085,X
    adc.w 0x1E8D
    phy
    ldy.b 0x16
    sta [0x04],Y
    inc.b 0x16
    inc.b 0x16
    ply
    txa
    inc
    inc
    inc
    cmp.w #0x0060
    bcc .FBE2

    sec
    sbc.w #0x0060
.FBE2:
    tax
    tya
    inc
    inc
    and.w #0x003E
    tay
    dec.w 0x0000
    bne .FBA0

    rts

;-----

_83FBF0:
    lda.w #0x0000
    bit.b 0x0E
    bvc .FBFA

    lda.w #0x0042
.FBFA:
    sta.w 0x0000
    ldx.w #0x0030
    ldy.w #0x0007
.FC03:
    lda.w #0x00A0
    sta.w 0x0B22,X
    lda.w #0xD000
    clc
    adc.w 0x0000
    sta.w 0x0B23,X
    inx
    inx
    inx
    dey
    bne .FC03

    lda.w #0x0001
    sta.w 0x0B22,X
    lda.w #0xD040
    sta.w 0x0B23,X
    inx
    inx
    inx
    stz.w 0x0B22,X
.FC2B:
    rts

;-----

_83FC2C:
    dec.b 0x11
    bne _83FBF0.FC2B

    sep #0x30
.FC32:
    ldx.b 0x0E
    inc.b 0x0E
    inc.b 0x0E
    lda.w 0x00E2AD,X
    cmp.b #0xFF
    bne .FC43

    stz.b 0x0E
    bra .FC32

.FC43:
    and.b #0x0F
    sta.b 0x0B
    rep #0x30
    lda.w 0x00E2AD,X
    and.w #0xFFF0
    sta.b 0x11
    lda.b 0x0B
    and.w #0x00FF
    tax
    jmp (.FC5A,X)

.FC5A: d16[.FC60, .FC66, .FC7C]

.FC60:
    jsr _83FCCA
    jmp _83FB58

.FC66:
    jsr _83FCCA
    ldx.w #0x003E
.FC6C:
    lda.w 0x00E26D,X
    eor.w #0xFFFF
    inc
    sta.l 0x7FD0E7,X
    dex
    dex
    bpl .FC6C

    rts

.FC7C:
    lda.w #0x0100
    sta.b 0x1A
    jmp _83FB67

;-----

_83FC84:
    lda.w 0x1E8C
    clc
    adc.b 0x1A
    sta.w 0x1E8C
    sep #0x20
    lda.w 0x1E8E
    adc.b #0x00
    sta.w 0x1E8E
    rep #0x20
    lda.w 0x1E4D
    sec
    sbc.w 0x1E6A
    clc
    adc.w 0x1E8D
    sta.w 0x1E8D
    sta.w 0x00B8
    lda.w 0x1E50
    lsr
    lsr
    sec
    sbc.b 0x08
    sta.w 0x1E90
    sta.w 0x00BA
    lda.b 0x07
    clc
    adc.b 0x1C
    sta.b 0x07
    sep #0x20
    lda.b 0x09
    adc.b #0x00
    sta.b 0x09
    rep #0x20
    rts

;-----

_83FCCA:
    lda.w #0x0100
    sta.b 0x1A
    rts

;-----

_83FCD0:
    lda.w #0x1650
    cmp.w 0x0BAD
    bcs .FCFD

    cmp.w 0x0BCA
    bcc .FCFD

    sep #0x20
    lda.w 0x1F45
    bne .FCFB

    lda.b #0x02
    sta.b 0x03
    sta.w 0x1F45
    lda.b #0xFF
    jsl 0x84A311
    lda.b #0xD0
    sta.w 0x1E5E
    lda.b #0x15
    sta.w 0x1E5F
.FCFB:
    rep #0x20
.FCFD:
    rts

;-----

_83FCFE:
    lda.b 0x03
    and.w #0x00FF
    tax
    jmp (.FD07,X)

.FD07: d16[.FD43, .FD0D, .FD44]

.FD0D:
    lda.b 0x1C
    clc
    adc.w #0x0004
    cmp.w #0x0800
    bcc .FD41

    jsl 0x849086
    and.w #0x007F
    bne .FD3E

    lda.w 0x1E58
    cmp.w 0x1E60
    bne .FD3E

    ldx.w #0x0001
    ldy.w #0x0002
    jsl 0x849086
    and.w #0x007F
    clc
    adc.w #0x001E
    jsl 0x84A31A
.FD3E:
    lda.w #0x0800
.FD41:
    sta.b 0x1C
.FD43:
    rts

.FD44:
    lda.b 0x1C
    sec
    sbc.w #0x0008
    cmp.w #0xF000
    bpl .FD52

    lda.w #0xF000
.FD52:
    sta.b 0x1C
    rts

;-----

_83FD55:
    lda.w 0x1F42
    beq .FD5E

    lda.b #0x04
    sta.b 0x03
.FD5E:
    rts

;-----

_83FD5F:
    lda.w 0x0BAD
    cmp.w #0x1650
    bcc .FD77

    sep #0x20
    lda.w 0x1E78
    beq .FD75

    lda.w 0x0B9C
    and.b #0x1F
    bne .FD75

.FD75:
    rep #0x20
.FD77:
    rts

;-----

_83FD78:
    php
    rep #0x20
    sep #0x10
    ldx.b 0x01
    jsr (.FD8E,X)
    jsl 0x82806E
    bcc .FD8C

    jsl 0x828387
.FD8C:
    plp
    rtl

.FD8E: d16[.FD92, .FD9F]

.FD92:
    ldx.b #0x02
    stx.b 0x01
    jsr .FDD0
    bpl .FD9F

    ldx.b #0x02
    stx.b 0x02
.FD9F:
    ldx.b 0x02
    jmp (.FDA4,X)

.FDA4: d16[.FDA8, .FDBD]

.FDA8:
    jsr .FDD0
    bpl .FDBC

    ldx.b #0x02
    stx.b 0x02
    lda.b 0x0A
    sec
    sbc.w #0x0015
    asl
    tax
    jsr (.FDEA,X)
.FDBC:
    rts

.FDBD:
    jsr .FDD0
    bmi .FDCF

    stz.b 0x02
    lda.b 0x0A
    sec
    sbc.w #0x0015
    asl
    tax
    jsr (.FDF6,X)
.FDCF:
    rts

.FDD0:
    lda.b 0x0A
    sec
    sbc.w #0x0015
    tax
    lda.w 0x86E4DF,X
    tax
    lda.w 0x0BA8,X
    cmp.b 0x00,X
    rts

.FDE1:
    lda.b 0x0B
    and.b #0xF0
    lsr
    lsr
    lsr
    lsr
    rts

.FDEA: d16[.FE02, .FE17, .FE2C, .FE02, .FE17, .FE2C]

.FDF6: d16[.FE09, .FE1E, .FE33, .FE09, .FE1E, .FE33]

.FE02:
    sep #0x30
    jsr .FDE1
    bra .FE0F

.FE09:
    sep #0x30
    lda.b 0x0B
    and.b #0x0F
.FE0F:
    sta.w 0x1F08
    jsl 0x80B085
    rts

.FE17:
    sep #0x30
    jsr .FDE1
    bra .FE24

.FE1E:
    sep #0x30
    lda.b 0x0B
    and.b #0x0F
.FE24:
    sta.w 0x1F09
    jsl 0x80B42A
    rts

.FE2C:
    sep #0x30
    jsr .FDE1
    bra .FE39

.FE33:
    sep #0x30
    lda.b 0x0B
    and.b #0x0F
.FE39:
    sta.w 0x1F0A
    jsl 0x80B4F1
    rts

;-----

_83FE41:
    lda.b 0x0B
    bmi .FE61

    rep #0x20
    lda.b 0x05
    sta.w 0x002C
    lda.b 0x08
    sta.w 0x002E
    sep #0x20
    lda.b 0x0C
    jsl 0x848011
    lda.b 0x01
    beq .FE6F

    jml 0x828398

.FE61:
    lda.b 0x0C
    jsl 0x848000
    lda.b 0x01
    beq .FE6F

    jml 0x828398

.FE6F:
    inc.b 0x01
    rtl

;-----

_83FE72:
    jsl 0x828307
    bne .FE9A

    inc.w 0x0000,X
    lda.b #0x1B
    sta.w 0x000A,X
    lda.w 0x0000
    sta.w 0x000B,X
    lda.w 0x0001
    sta.w 0x000C,X
    rep #0x20
    lda.w 0x002C
    sta.w 0x0005,X
    lda.w 0x002E
    sta.w 0x0008,X
.FE9A:
    sep #0x30
    rtl

;-----

_83FE9D:
    ldx.b 0x01
    jsr (.FEA5,X)
    jmp _83FF61

.FEA5: d16[.FEA9, .FEB6]

.FEA9:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x01
    sta.b 0x02
    lda.b #0x1C
    sta.b 0x0A
    rts

.FEB6:
    jsr _83FF33
    bne .FF30

    lda.b #0x2A
    sta.b 0x0A
    jsl 0x84A1D0
    lda.b #0x1C
    sta.b 0x0A
    tya
    cmp.b #0x08
    bpl .FF30

    rep #0x20
    dec.b 0x02
    bne .FF30

    lda.b 0x0B
    and.w #0x00FF
    bne .FEE1

    lda.w #0x00F0
    sta.b 0x02
    jmp .FF03

.FEE1:
    cmp.w #0x0001
    beq .FEF3

    cmp.w #0x0002
    beq .FEFB

    lda.w #0x008F
    sta.b 0x02
    jmp .FF03

.FEF3:
    lda.w #0x00C0
    sta.b 0x02
    jmp .FF03

.FEFB:
    lda.w #0x00B8
    sta.b 0x02
    jmp .FF03

.FF03:
    sep #0x20
    jsl 0x828321
    bne .FF30

    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    lda.b #0x2A
    sta.w 0x000A,X
    inc.w 0x0000,X
    phx
    jsl 0x849086
    and.b #0x02
    beq .FF2C

    lda.b #0x01
.FF2C:
    plx
    sta.w 0x000B,X
.FF30:
    sep #0x30
    rts

;-----

_83FF33:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .FF41

    eor.w #0xFFFF
    inc
.FF41:
    cmp.w #0x0028
    bcc .FF5C

    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bcs .FF52

    eor.w #0xFFFF
    inc
.FF52:
    cmp.w #0x0028
    bcc .FF5C

    sep #0x20
    lda.b #0x00
    rts

.FF5C:
    sep #0x20
    lda.b #0x01
    rts

;-----

_83FF61:
    jsl 0x82806E
    bcc .FF6B

    jml 0x828387

.FF6B:
    rtl

;-----

d08[
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,
]
