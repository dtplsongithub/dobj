class DOBJECT {
  float[][] points;
  int[][] tris;
  color[] colors;
  float[] size = new float[3];
  String name;
  public DOBJECT(float[][] points, int[][] tris, color[] colors, float sizeX, float sizeY, float sizeZ, String name) {
    this.points = points;
    this.tris = tris;
    this.colors = colors;
    this.size[0] = sizeX;
    this.size[1] = sizeY;
    this.size[2] = sizeZ;
    this.name = name;
  }
  public String encode() {
    String result = this.name + "\nPOINTS:\n";
    for (float[] point: this.points) {
      result += join(nf(point), ", ")+"\n";
    }
    result+="TRIS:\n";
    for (int[] tri: this.tris) {
      result += join(nf(tri, 0), ", ")+"\n";
    }
    result+="TRI COLORS:\n";
    for (int color_: this.colors) {
      result += hex(color_, 6)+"\n";
    }
    return result;
  }
}

void renderDOBJECT(DOBJECT object) {
  for (int i = 0; i<object.tris.length; i++) {
    if (i<object.colors.length && object.colors[i] != -1) fill(object.colors[i]);
    float[] tri0 = object.points[object.tris[i][0]];
    float[] tri1 = object.points[object.tris[i][1]];
    float[] tri2 = object.points[object.tris[i][2]];
    tri3d(
      tri0[0]*object.size[0],tri0[1]*object.size[1],tri0[2]*object.size[2],
      tri1[0]*object.size[0],tri1[1]*object.size[1],tri1[2]*object.size[2],
      tri2[0]*object.size[0],tri2[1]*object.size[1],tri2[2]*object.size[2]
    );
  }
}

void tri3d(float x1, float y1, float z1, float x2, float y2, float z2, float x3, float y3, float z3) {
  beginShape();
  vertex(x1, y1, z1);
  vertex(x2, y2, z2);
  vertex(x3, y3, z3);
  endShape();
}
