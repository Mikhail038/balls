#include "sim.h"

#define USED_DELAY_MS 20

#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_BLACK 0xFF000000
#define COLOR_RED 0xFFFF0000
#define COLOR_BLUE 0xFF0000FF
#define COLOR_MAGENTA 0xFFFF00FF

#define WIDTH 800
#define HEIGHT 600
#define BALLS 10

int X[BALLS];
int Y[BALLS];
int VX[BALLS];
int VY[BALLS];
int Radius[BALLS];
int Color[BALLS];

void initBalls() {
  for (int i = 0; i < BALLS; i++) {
    X[i] = simRand() % (WIDTH - 40) + 20;
    Y[i] = simRand() % (HEIGHT - 40) + 20;

    VX[i] = (simRand() % 11) - 5;
    if (VX[i] == 0)
      VX[i] = 1;

    VY[i] = (simRand() % 11) - 5;
    if (VY[i] == 0)
      VY[i] = 1;

    Radius[i] = 5 + (simRand() % 16);

    int colors[] = {COLOR_RED, COLOR_BLUE, COLOR_MAGENTA, COLOR_WHITE};
    Color[i] = colors[simRand() % 4];
  }
}

void updateBalls() {
  for (int y = 0; y < HEIGHT; y++) {
    for (int x = 0; x < WIDTH; x++) {
      simPutPixel(x, y, COLOR_BLACK);
    }
  }

  for (int i = 0; i < BALLS; i++) {
    X[i] += VX[i];
    Y[i] += VY[i];

    if (X[i] < Radius[i]) {
      X[i] = Radius[i];
      VX[i] = -VX[i];
    }
    if (X[i] >= WIDTH - Radius[i]) {
      X[i] = WIDTH - Radius[i] - 1;
      VX[i] = -VX[i];
    }

    if (Y[i] < Radius[i]) {
      Y[i] = Radius[i];
      VY[i] = -VY[i];
    }
    if (Y[i] >= HEIGHT - Radius[i]) {
      Y[i] = HEIGHT - Radius[i] - 1;
      VY[i] = -VY[i];
    }

    int r = Radius[i];
    int xc = X[i];
    int yc = Y[i];
    int color = Color[i];

    for (int dy = -r; dy <= r; dy++) {
      for (int dx = -r; dx <= r; dx++) {
        if (dx * dx + dy * dy <= r * r) {
          int px = xc + dx;
          int py = yc + dy;
          if (px >= 0 && px < WIDTH && py >= 0 && py < HEIGHT) {
            simPutPixel(px, py, color);
          }
        }
      }
    }
  }
}

void app() {
  initBalls();
  while (!hasQuitSignal()) {
    updateBalls();
    simFlush();
    simDelay(USED_DELAY_MS);
  }
}
