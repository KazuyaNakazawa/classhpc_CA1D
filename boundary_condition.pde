
void boundaryCondition() {
  //
  // When Nx = 10
  //
  //       0    1    2    3    4    5    6    7    8    9
  //       o----o----o----o----o----o----o----o----o----o
  //       |    |                                  |    |
  //   ----o----o                                  o----o----
  //       8    9                                  0    1
    cells[   0] = cells[Nx-2];
    cells[Nx-1] = cells[   1];
}
