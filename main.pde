// CA1D
//    - A 1-D cellular automaton
//    - by Akira Kageyama
//    - on 2018.11.25


// Size of a cell in pixel
int cellSize = 20;  // Decrease this for more cells 

// Variables for timer
int interval = 200; // increase this for slower view



// Number of cell in x
int Nx;  // Will be set from the window width and cellSize.

// Alice cell density for random distribution (in percentage)
float probabilityOfAliveAtStart = 15;

// A variable to monitor the elapsed time
int lastRecordedTime = 0;


// Array of cells
int[] cells;
// Buffer to record the state of the cells and use this while changing the others in the interations
int[] cellsCarbonCopy;

// Pause
boolean pause = true;



void setup() {
  size (640, 100);
  Nx = width / cellSize;
  println("Nx = ", Nx);
  println("Space=>stop/start. 'c'=>clear, 'r'=>random, Return=>one step, Mouse click=>cell reversal.");

  cells = new int[Nx];
  cellsCarbonCopy = new int[Nx];

  // Gray curve around each circle.
  stroke(100);

  // Anti-aliasing
  smooth(8);

  // Initialization (only one alive cell)
  for (int i=1; i<Nx-1; i++) {
    if (i==Nx/2) { 
      cells[i] = 1; // Alive
    } else {
      cells[i] = 0; // Dead
    }
  }

  boundaryCondition();
  copyCells();
}



void keyPressed() {
  if (key=='r' || key == 'R') {
    // Restart: reinitialization of cells
    for (int i=1; i<Nx-1; i++) {
      float state = random (100);
      if (state > probabilityOfAliveAtStart) {
        state = 0;
      } else {
        state = 1;
      }
      cells[i] = int(state); // Save state of each cell
    }
    boundaryCondition();
    copyCells();
  }
  if (key==' ') { // On/off of pause
    pause = !pause;
  }
  if (key=='c' || key == 'C') { // Clear all
    for (int i=0; i<Nx; i++) {
      cells[i] = 0; // Save all to zero
    }
  }
  if (key=='\n') {
    stepTime();
  }
}
