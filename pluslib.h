
/* use this macro to define the rgb value you want */
/* r,g,b are 4-bit values */
#define PLUS_RGB(r,g,b) \
	((((r)&0x0f)<<4)|((b)&0x0f)|(((g)&0x0f)<<16))

#define DEBUG_BREAK \
	__asm .db 0x0ed,0x0ff __endasm
	
	
#define SPRITE_MAG_DISABLE 0
#define SPRITE_MAG_1 1
#define SPRITE_MAG_2 2
#define SPRITE_MAG_4 3

/* width and height in pixels, not magnified */
#define HW_SPRITE_WIDTH_X1 16
#define HW_SPRITE_HEIGHT_X1 16

#define HW_SPRITE_WIDTH_X2 (16*2)
#define HW_SPRITE_HEIGHT_X2 (16*2)

#define HW_SPRITE_WIDTH_X4 (16*4)
#define HW_SPRITE_HEIGHT_X4 (16*4)

#define HW_SPRITE_PIXEL_DATA_SIZE 256

#define NUM_HW_SPRITE_COLOURS 15


/* set screen pen */
/* requires register page to be enabled */
/* requires firmware interrupts to be turned off, otherwise the firmware will change the colours
back to what it wants */
void plus_SetColour(int pen, int rgb);

/* enable register page in the region 0x04000-0x07fff */
void plus_RegisterPageEnable();

/* disable register page in the region 0x04000-0x07fff */
void plus_RegisterPageDisable();

/* unlock plus features */
/* Call first to enable the features */
void plus_Unlock();

/* lock plus features */
/*  disable the register page before lock or the register page will be locked into place! */
void plus_Lock();

/* verify unlock was successful; code is put onto stack, make sure there is at least 15 bytes free. */
/* returns 0 if not successful, any other value indicates success */
int plus_VerifyUnlockStack();

/* set border */
/* requires register page to be enabled */
/* requires firmware interrupts to be turned off, otherwise the firmware will change the colours
back to what it wants */
void plus_SetBorder(int rgb);

/* set raster interrupt line. 0 = disabled, any other value = line */
void plus_SetRasterInterruptLine(int line);

/* line is 0-255, addr is a crtc address */
void plus_SetScreenSplit(int line, const unsigned char *addr);

/* set sprite pen */
/* requires register page to be enabled */
void plus_SetSpriteColour(int pen, int rgb);

/* set sprite coords */
/* requires register page to be enabled */
void plus_SetSpriteCoords(int spriteid, signed int x, signed int y);

/* set the pixels for a sprite */
/* requires register page to be enabled */
void plus_DownloadSpritePixels(int spriteid, const unsigned char *pixels);

/* set sprite mag */
/* requires register page to be enabled */
void plus_SetSpriteMag(int spriteid, int magx, int magy);

/* set pixel defined by x (range 0-15),y (range 0-15) within the data for sprite 
defined by spriteid to the sprite pen index */
/* requires register page to be enabled */
void plus_SetSpritePixel(int spriteid, int x, int y, int pen);

#define ADDR_2_CRTC_ADDR(addr) \
	(((addr)>>2) & 0x03ff) | (((addr)&0x0c000)>>2)

void plus_SetScreenSplit(unsigned char Line, unsigned char *CRTCAddr);
