
void draw() {

  background(210, 230, 255);

  place_pieces();

  if (millis()-lastRecordedTime>interval) {
    if (!pause) {
      stepTime();
      lastRecordedTime = millis();
    }
  }

  if (pause && mousePressed) {
    int xCellOver = int(map(mouseX, 0, width, 0, Nx));
    xCellOver = constrain(xCellOver, 0, Nx-1);

    if (cellsCarbonCopy[xCellOver]==1) { // alive
      cells[xCellOver]=0; // Kill
    } else { // dead
      cells[xCellOver]=1; // Make alive
    }
  } else if (pause && !mousePressed) { 
    boundaryCondition();
    copyCells();
  }
}


void place_pieces() {
  for (int i=0; i<Nx; i++) {
      if (cells[i]==1) {
        place_alive_piece(i);
      } else {
        place_dead_piece(i);
      }
  }
}



void place_alive_piece(int i) {
  fill(0); // black
  ellipse(i*cellSize+0.5*cellSize, 0.5*height-0.0*cellSize,
          0.95*cellSize, 0.95*cellSize);
}


void place_dead_piece(int i) {
  fill(255); // white
  ellipse(i*cellSize+0.5*cellSize, 0.5*height-0.0*cellSize,
          0.95*cellSize, 0.95*cellSize);
}
