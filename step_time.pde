
void stepTime() {  
  for (int i=1; i<Nx-1; i++) {
    int me = cellsCarbonCopy[i];
    int left = cellsCarbonCopy[i-1];
    int right = cellsCarbonCopy[i+1];
    cells[i] = ruleLeft(left,me,right);
  }
  boundaryCondition();
  copyCells();
}


int ruleLeft(int left, int me, int right) {
  int meInverse = (me+1) % 2; // 0-->1, 1-->0

  if ( left!=me ) 
    return meInverse;
  else
    return me;
}
