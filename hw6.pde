// ArrayLists 分别存储前景雨滴和远景雨滴
ArrayList<Raindrop> foregroundRaindrops;
ArrayList<BackgroundRaindrop> backgroundRaindrops;

void setup() {
  size(800, 600);
  foregroundRaindrops = new ArrayList<Raindrop>();
  backgroundRaindrops = new ArrayList<BackgroundRaindrop>();
}

void draw() {
  background(200);

  // 产生新的前景雨滴
  if (random(1) < 0.1) {
    foregroundRaindrops.add(new Raindrop());
  }

  // 产生新的远景雨滴
  if (random(1) < 0.05) {
    backgroundRaindrops.add(new BackgroundRaindrop());
  }

  // 更新和显示每个前景雨滴
  for (int i = foregroundRaindrops.size() - 1; i >= 0; i--) {
    Raindrop drop = foregroundRaindrops.get(i);
    drop.update();
    drop.display();
    
    // 移除离开屏幕的前景雨滴
    if (drop.offScreen()) {
      foregroundRaindrops.remove(i);
    }
  }

  // 更新和显示每个远景雨滴
  for (int i = backgroundRaindrops.size() - 1; i >= 0; i--) {
    BackgroundRaindrop drop = backgroundRaindrops.get(i);
    drop.update();
    drop.display();
    
    // 移除离开屏幕的远景雨滴
    if (drop.offScreen()) {
      backgroundRaindrops.remove(i);
    }
  }
  
  // 设置保存帧的路径和文件名
  String folderPath = "D:/Star/大二上/创意编程/homework/homework6/";
  frameRate(30);
  saveFrame(folderPath + "frame-######.png");
}

// 雨滴类
class Raindrop {
  float x, y;   // 雨滴位置
  float length; // 雨滴长度
  float speed;  // 雨滴下落速度
  float gravity; // 重力加速度
  float airResistance; // 空气阻力

  Raindrop() {
    x = random(width);
    y = random(-50, -10);
    length = random(10, 20);
    speed = 0; // 初始速度为0
    gravity = 0.2; // 重力加速度
    airResistance = 0.01; // 空气阻力
  }

  // 更新雨滴位置
  void update() {
    speed += gravity; // 模拟重力对速度的影响
    speed -= airResistance * speed * abs(speed); // 模拟空气阻力的影响
    y += speed;
  }

  // 显示雨滴
  void display() {
    strokeWeight(2); // 设置线条粗细
    stroke(0, 100, 255); // 蓝色
    line(x, y, x, y + length);
  }

  // 判断雨滴是否离开屏幕
  boolean offScreen() {
    return y > height;
  }
}

// 远景雨滴类
class BackgroundRaindrop {
  float x, y;   // 雨滴位置
  float length; // 雨滴长度
  float speed;  // 雨滴下落速度
  float gravity; // 重力加速度
  float airResistance; // 空气阻力

  BackgroundRaindrop() {
    x = random(width);
    y = random(-50, -10);
    length = random(5, 10); // 更小的雨滴
    speed = 0; // 初始速度为0
    gravity = 0.2; // 重力加速度
    airResistance = 0.01; // 空气阻力
  }

  // 更新雨滴位置
  void update() {
    speed += gravity; // 模拟重力对速度的影响
    speed -= airResistance * speed * abs(speed); // 模拟空气阻力的影响
    y += speed;
  }

  // 显示雨滴
  void display() {
    strokeWeight(1); // 设置线条粗细
    stroke(0, 100, 200); // 浅蓝色
    line(x, y, x, y + length);
  }

  // 判断雨滴是否离开屏幕
  boolean offScreen() {
    return y > height;
  }
}
