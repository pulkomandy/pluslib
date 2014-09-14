.PHONY: clean

%.rel : %.s
	sdasz80 -plosgff $<

pluslib_o=plus_SetBorder.rel plus_SetColour.rel plus_SetSpriteColour.rel \
  plus_SetSpriteCoords.rel plus_SetSpriteMag.rel plus_SetSpritePixel.rel plus_RegisterPageEnable.rel \
  plus_RegisterPageDisable.rel plus_Unlock.rel plus_Lock.rel plus_VerifyUnlockStack.rel \
  plus_Sequence.rel plus_SetScreenSplit.rel plus_SetRasterInterruptLine.rel plus_DownloadSpritePixels.rel

all: pluslib

clean:
	rm -f *.lst *.rel *.sym *.lib

pluslib: $(pluslib_o)
	sdcclib pluslib.lib $(pluslib_o)
