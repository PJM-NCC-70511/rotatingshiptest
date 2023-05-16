include	Makefile.config

PROJECT=rotatingship
SRCC=main.c
SRCS=data.s
SRCH=
OBJS=$(SRCC:.c=.o) $(SRCS:.s=.o)
OTHEROBJS=
SRCOIDS=moidl00.png moidl01.png moidl02.png moidl03.png
SRCOIDS+=moidl04.png moidl05.png moidl06.png moidl07.png
SRCOIDS+=moidl08.png moidl09.png moidl10.png moidl11.png
SRCOIDS+=moidl12.png moidl13.png moidl14.png moidl15.png
RGBOIDS=$(SRCOIDS:.png=.rgb)
DATA=ship1.rgb
DATA+=$(SRCOIDS)
EXTRAS=ship1.rgb
EXTRAS+=$(RGBOIDS)
RMVLIBS=display.o interrupt.o rmvlib.a

include Makefile.example

data.o: a256.pal ship1.rgb $(RGBOIDS)

ship1.rgb: ship1.png
	$(CONVERTER) --binary --overwrite $<
      
%.rgb: %.png
	$(CONVERTER) -rgb --binary --overwrite $<
    

