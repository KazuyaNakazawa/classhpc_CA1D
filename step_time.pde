
void stepTime() {  
  for (int i=1; i<Nx-1; i++) {
    int me = cellsCarbonCopy[i];
    int left = cellsCarbonCopy[i-1];
    int right = cellsCarbonCopy[i+1];
    //cells[i] = rule30(left,me,right);
    cells[i] = rule90(left,me,right);
  }
  boundaryCondition();
  copyCells();
}


int rule30(int left, int me, int right) {
  return (left+me+right+me*right) % 2;
}

int rule90(int left, int me, int right) {    
  return (left+right)%2;
}
