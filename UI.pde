import controlP5.*;
import peasy.*;

ControlP5 slider;
PeasyCam cam;

void UI() {
  int sliderWidth = 300;//控制条宽度
  int sliderHeight = 30;//控制条高度

  cam = new PeasyCam(this, width/2, height/2, 0, 800);


  slider = new ControlP5(this, createFont("微软雅黑", 14));

  slider.addSlider("boxcolor")//color
    .setPosition(20, 20)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0, 255)
    .setValue(100)
    ;

  slider.addSlider("commonDiameter")//初始环的直径
    .setPosition(20, 60)
    .setSize(sliderWidth, sliderHeight)
    .setRange(1, 80)
    .setValue(72)
    ;

  slider.addSlider("numRings")//环的层数
    .setPosition(20, 100)
    .setSize(sliderWidth, sliderHeight)
    .setRange(1, 20)
    .setValue(5)
    ;

  slider.addSlider("boxSize")//小正方体的边长
    .setPosition(20, 140)
    .setSize(sliderWidth, sliderHeight)
    .setRange(10, 200)
    .setValue(100)
    ;
    
    slider.addSlider("boxnum")//小正方体的数量
    .setPosition(20, 180)
    .setSize(sliderWidth, sliderHeight)
    .setRange(20,100)
    .setValue(50)
    ;

  
  slider.setAutoDraw(false);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(slider.getController("unitAngle")) ||
    theEvent.isFrom(slider.getController("commonDiameter")) ||
    theEvent.isFrom(slider.getController("numRings")) ||
    theEvent.isFrom(slider.getController("boxSize")) ||
    theEvent.isFrom(slider.getController("boxnum")) ) {
   
  }
}
