#include "sim.h"
#include <SDL2/SDL.h>
#include <assert.h>
#include <stdlib.h>
#include <time.h>

#define FRAME_TICKS 50

static SDL_Renderer *Renderer = NULL;
static SDL_Window *Window = NULL;
static Uint32 Ticks = 0;

void simInit() {
  SDL_Init(SDL_INIT_VIDEO);
  SDL_CreateWindowAndRenderer(SIM_X_SIZE, SIM_Y_SIZE, 0, &Window, &Renderer);
  SDL_SetRenderDrawColor(Renderer, 0, 0, 0, 0);
  SDL_RenderClear(Renderer);
  srand(time(NULL));
  simPutPixel(0, 0, 0);
  simFlush();
}

void simExit() {
}

void simFlush() {
  Uint32 cur_ticks = SDL_GetTicks() - Ticks;
  if (cur_ticks < FRAME_TICKS) {
    SDL_Delay(FRAME_TICKS - cur_ticks);
  }
  SDL_RenderPresent(Renderer);
}

void simPutPixel(int x, int y, int argb) {
  assert(0 <= x && x < SIM_X_SIZE && "Out of range");
  assert(0 <= y && y < SIM_Y_SIZE && "Out of range");
  Uint8 a = argb >> 24;
  Uint8 r = (argb >> 16) & 0xFF;
  Uint8 g = (argb >> 8) & 0xFF;
  Uint8 b = argb & 0xFF;
  SDL_SetRenderDrawColor(Renderer, r, g, b, a);
  SDL_RenderDrawPoint(Renderer, x, y);
  Ticks = SDL_GetTicks();
}

int simRand() { return rand(); }

void simDelay(int ms) { SDL_Delay(ms); }

int hasQuitSignal() {
  SDL_Event event;
  while (SDL_PollEvent(&event) != 0) {
    if (event.type == SDL_QUIT)
      return 1;
  }
  return 0;
}
