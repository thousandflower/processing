ArrayList<Branch> branches;

void setup() {
  size(800, 800);
  background(255);

  // 初始化树干
  branches = new ArrayList<Branch>();
  PVector start = new PVector(width / 2, height);
  PVector end = new PVector(width / 2, height - 100);
  Branch trunk = new Branch(start, end, 100);
  branches.add(trunk);
  // 确保output文件夹存在
  File folder = new File("output");
  if (!folder.exists()) {
    folder.mkdir();
  }
}


void draw() {
  background(255);
  for (Branch branch : branches) {
    branch.show();
  }
  
  // 保存每一帧
  saveFrame("output/frame-######.png");
}

void mousePressed() {
  ArrayList<Branch> newBranches = new ArrayList<Branch>();
  for (int i = branches.size()-1; i >= 0; i--) {
    Branch current = branches.get(i);
    if (!current.finished) {
      PVector dirToMouse = PVector.sub(new PVector(mouseX, mouseY), current.end);
      dirToMouse.normalize();
      dirToMouse.rotate(random(-PI/12, PI/12));
      newBranches.addAll(current.branch(dirToMouse));
      current.finished = true;
    }
  }
  branches.addAll(newBranches);
}

class Branch {
  PVector start;
  PVector end;

  float len;
  boolean finished = false;

  Branch(PVector start, PVector end, float len) {
    this.start = start.copy();
    this.end = end.copy();
    this.len = len;
  }

  void show() {
    stroke(0);
    line(start.x, start.y, end.x, end.y);
  }

  ArrayList<Branch> branch(PVector dir) {
    // 计算新的方向
  //  dir.rotate(PI / 6); // 将方向旋转 30 度

    // 计算两个新的分支的末端
    dir.rotate(PI / 1.5); // 第一个新分支的旋转
    PVector newEnd1 = PVector.add(end, PVector.mult(dir, 0.9 * len));
    dir.rotate(-PI / 1.5); // 第二个新分支的旋转
    PVector newEnd2 = PVector.add(end, PVector.mult(dir, 0.8 * len));

    // 创建两个新的分支
    ArrayList<Branch> newBranches = new ArrayList<Branch>();
    newBranches.add(new Branch(end, newEnd1, 0.9 * len));
    newBranches.add(new Branch(end, newEnd2, 0.8 * len));

    return newBranches;
  }
}
