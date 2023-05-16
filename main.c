#include <jagdefs.h>
#include <jagtypes.h>

#include <stdlib.h>

#include <interrupt.h>
#include <display.h>
#include <sprite.h>

#include <screen.h>

#include <joypad.h>

#include <console.h>

extern phrase color_palette;
extern phrase sprite_ship1;
extern phrase sprite_moidl00;
#define ANIM_LENGTH 16
extern phrase *asteroid_animation[ANIM_LENGTH];

#define SPRITEW 32
#define SPRITEH 32

#define ASTEROID_WIDTH_MEGA 64
#define ASTEROID_HEIGHT_MEGA 64


#define WIDTH 320
#define HEIGHT 200

int main(int argc, char *argv[]) {
  TOMREGS->vmode = RGB16|CSYNC|BGEN|PWIDTH4|VIDEN;
  init_interrupts();
  init_display_driver();
  screen *sprite_screen1 = new_screen();
  set_simple_screen(DEPTH16,SPRITEW,SPRITEH,sprite_screen1,&sprite_ship1);
  display *d = new_display(0);
  d->x = 16;
  d->y = 16;


    //load color palette
    memcpy((void *)TOMREGS->clut1, &color_palette, 256*sizeof(uint16_t));
    FILE *console = open_console(d, 0, HEIGHT, 4);
  
  fprintf(console, "Shall we play a game?    \n");    
  
  

  screen *fb1 = new_screen();
  alloc_simple_screen(DEPTH16,WIDTH,HEIGHT,fb1);

  clear_screen(fb1);  
  sprite *s3 = sprite_of_screen(0, 0, fb1); 
  attach_sprite_to_display_at_layer(s3, d, 0);
  sprite *s1 = new_sprite(32,32,192,64,DEPTH16,&sprite_ship1);
  attach_sprite_to_display_at_layer(s1, d, 0);
  sprite *s2 = new_sprite(64,64,32,80,DEPTH16,&sprite_moidl00);
  attach_sprite_to_display_at_layer(s2, d, 0);
  show_display(d);    
  s2->x = 16;
  s2->y = 40;
  s2->trans = 1;
  s1->trans = 1;
  
  sprite_screen1->x = SPRITEW/2;
  sprite_screen1->y = SPRITEH/2;

  fb1->x = 80;
  fb1->y = HEIGHT/2;

  joypad_state joypads; 

  int alpha = 0;
  int aframe = 0;  
  while(1) {
    vsync();
    screen_rotate(sprite_screen1, fb1, alpha); 
    read_joypad_state(&joypads);
    unsigned long cmd = joypads.j1;
    aframe=(aframe+1)&15;
    s2->data = asteroid_animation[aframe];
    if(cmd & JOYPAD_RIGHT) {
      alpha+=5;
    } else if(cmd & JOYPAD_LEFT) {
      alpha-=5;
    }
  }
}
