float[][] samplePoints = {{0, 0, 0}, {1, 0, 0}, {1, 0, 1}, {0, 0, 1},{0, 1, 0}, {1, 1, 0}, {1, 1, 1}, {0, 1, 1}};
int[][] sampleTris = {{0, 1, 2}, {0, 2, 3}, {3, 2, 6}, {3, 6, 7}, {1, 2, 6}, {1, 6, 5}, {0, 1, 5}, {0, 5, 4}, {0, 3, 7}, {0, 7, 4}, {4, 5, 6}, {4, 6, 7}};
color[] sampleColors = {color(255, 0, 0), color(255, 255, 0), color(255, 255, 0), color(0, 0, 255), color(0), color(0, 0, 255), color(0, 255, 255), color(255, 0, 255), color(0, 0, 255), color(0, 255, 0), color(255), color(0, 0, 255)};

DOBJECT sampleDOBJECT;
Arcball arcball;
PFont MSGothic20;

int editorSize;
int initialMouseX, initialMouseY, scrollY, initialEditorSize;

void settings() {
  fullScreen(P3D);
}

void setup() {
  background(0);
  textSize(20);
  fill(0);
  noStroke();
  editorSize = int(width/2.5);
  
  sampleDOBJECT = new DOBJECT(samplePoints, sampleTris, sampleColors, 200, 200, 200, "cube");
  input = sampleDOBJECT.encode();
  arcball = new Arcball(this, 600);
  MSGothic20 = loadFont("MS-Gothic-20.vlw");
  textFont(MSGothic20);
}

void draw() {
  background(30);
  
  // renderer
  lights();
  hint(ENABLE_DEPTH_TEST);
  pushMatrix();
  arcball.run();
  translate(sampleDOBJECT.size[0]*-0.5, sampleDOBJECT.size[1]*-0.5, sampleDOBJECT.size[2]*-0.5);
  renderDOBJECT(sampleDOBJECT);
  popMatrix();

  noLights();
  
  // editor
  hint(DISABLE_DEPTH_TEST);
  fill(255);
  rect(0, 0, editorSize, height);
  fill(0);
  text(input, 20, 20, editorSize-40, height+scrollY);
}

void mousePressed() {
  if (mouseX>editorSize+20)
    arcball.mousePressed();
  initialMouseX = mouseX;
  initialMouseY = mouseY;
  if (initialMouseX>editorSize-20 && initialMouseX<editorSize+20) {
    initialEditorSize = editorSize;
  }
  mouseDragged();
}

void mouseDragged() {
  if (initialMouseX>editorSize+20) 
    arcball.mouseDragged();
  if (initialMouseX>editorSize-20)
    cursor(MOVE);
  if (initialMouseX>initialEditorSize-20 && initialMouseX<initialEditorSize+20) {
    editorSize = initialEditorSize-initialMouseX+mouseX;
  }
  if (initialMouseX<editorSize-20)
    cursor(TEXT);
}

void mouseMoved() {
  if (mouseX<editorSize-20)
    cursor(TEXT);
  else if (mouseX>editorSize-20 && mouseX<editorSize+20)
    cursor(CROSS);
  if (mouseX>editorSize+20 && !mousePressed)
    cursor(HAND);
}

void mouseReleased() {
  cursor(ARROW);
}

void keyPressed() {
  keyboardInput();
}
