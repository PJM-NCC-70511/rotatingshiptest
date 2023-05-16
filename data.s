        .data
     .globl	_color_palette
     .phrase       
  _color_palette:
	incbin  "a256.pal"
    
	.globl	_sprite_ship1
	.phrase
_sprite_ship1:
	incbin	"ship1.rgb" 

	.globl	_sprite_ship2

    .globl	_sprite_moidl00
    .phrase
_sprite_moidl00:
    incbin	"moidl00.rgb"

    .phrase
_sprite_moidl01:
    incbin	"moidl01.rgb"

    .phrase
_sprite_moidl02:
    incbin	"moidl02.rgb"
    
    .phrase
_sprite_moidl03:
    incbin	"moidl03.rgb"

    .phrase
_sprite_moidl04:
    incbin	"moidl04.rgb"

    .phrase
_sprite_moidl05:
    incbin	"moidl05.rgb"

    .phrase
_sprite_moidl06:
    incbin	"moidl06.rgb"
    
    .phrase
_sprite_moidl07:
    incbin	"moidl07.rgb"

    .phrase
_sprite_moidl08:
    incbin	"moidl08.rgb"

    .phrase
_sprite_moidl09:
    incbin	"moidl09.rgb"

    .phrase
_sprite_moidl10:
    incbin	"moidl10.rgb"
    
    .phrase
_sprite_moidl11:
    incbin	"moidl11.rgb"

    .phrase
_sprite_moidl12:
    incbin	"moidl12.rgb"

    .phrase
_sprite_moidl13:
    incbin	"moidl13.rgb"

    .phrase
_sprite_moidl14:
    incbin	"moidl14.rgb"
    
    .phrase
_sprite_moidl15:
    incbin	"moidl15.rgb"

	.globl	_asteroid_animation	
	.long
_asteroid_animation:
    dc.l	_sprite_moidl00
    dc.l	_sprite_moidl01
    dc.l	_sprite_moidl02
    dc.l	_sprite_moidl03
    dc.l	_sprite_moidl04
    dc.l	_sprite_moidl05
    dc.l	_sprite_moidl06
    dc.l	_sprite_moidl07
    dc.l	_sprite_moidl08
    dc.l	_sprite_moidl09
    dc.l	_sprite_moidl10
    dc.l	_sprite_moidl11
    dc.l	_sprite_moidl12
    dc.l	_sprite_moidl13
    dc.l	_sprite_moidl14
    dc.l	_sprite_moidl15
	    
