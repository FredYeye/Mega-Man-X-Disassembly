org 0x8000*0x2C
base 0xAC8000

//-----

_AC8000: incbin "data/AC8000.bin"
_AC9A80: incbin "data/AC9A80.bin"
_ACB5A0: incbin "data/ACB5A0.bin"
_ACEC18: incbin "data/ACEC18.bin"

// todo: fill_bytes{value: 0xFF, count: 1000}
