float[] sectionTwistPhase ;
String timestamp;

boolean displayMesh = false;
boolean record;

float commonDiameter;
int numRings, boxSize, boxnum;

void setup() {
  size(800, 800, P3D);
  UI();  // 调用UI函数初始化控件
  cam.lookAt(width / 2, height / 2, 0); // 设置相机初始聚焦点
  cam.setDistance(1000); // 设置相机初始距离

}

void draw() {
  background(0);
  lights();

  translate(width / 2, height / 2);

  float commonRadius = commonDiameter / 2;
  float boxSide = slider.getController("boxSize").getValue();
  int numBoxes = (int) slider.getController("boxnum").getValue();
  float boxcolor = slider.getController("boxcolor").getValue();

  for (int i = 0; i < numRings; i++) {
    float currentHeight = i * boxSide; // 保持环之间的距离和正方体的边长相等

    for (int j = 0; j < numBoxes; j++) {
      float currentAngle = j * radians(360.0 / boxnum);
      float x = cos(currentAngle) * commonRadius;
      float y = sin(currentAngle) * commonRadius;

      pushMatrix();
      translate(x, y, currentHeight);
      rotateX(currentAngle);
      rotateY(currentAngle * 2);
      int boxColor = color(255, 255, boxcolor);
      fill(boxColor);
      box(boxSide);
      
      popMatrix();
     
    }
    if (record) {
   timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
 beginRecord("nervoussystem.obj.OBJExport", "C:/Users/30957/Desktop/" + timestamp + ".obj");
/[表情]ve("C:\\Users\\30957\\Desktop\\12\\"+ frameCount + ".png");
  }
  }
  cam.beginHUD();
  slider.draw();
  cam.endHUD();
   if (record) {
    endRecord();
    record = false;
  }
  
}

void keyPressed() {
  print(key);
  if (key == 's') {
    record = true;
  }
}
