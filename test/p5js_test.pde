ArrayList<AniLine> aniLineList = null;

void setup(){
    size(800, 200);
    background(255);
    
    aniLineList = new ArrayList<AniLine>();
    for(int i=0; i<50; i++){
        aniLineList.add(new AniLine(random(width), random(height)));
    }
}

void draw(){
    noStroke();
    fill(255, 50);
    rect(0, 0, width-1, height-1);
    
    for(AniLine aniline : aniLineList){
        aniline.update();
        aniline.show();
    }
}
public class AniLine {
    private float x = 0;
    private float y = 0;
    private float ox = 0;
    private float oy = 0;
    private float tx = 0;
    private float ty = 0;
    private int step = 30;
 
    
    public AniLine(float x, float y){
        this.x = ox = x;
        this.y = this.ty = oy = y;
        tx = random(width);
        step = (int)random(30, 240);
    }
    
    public void update(){
        x = x + (tx-x)/step;
        y = y + (ty-y)/step;
        
        if(dist(x, y, tx, ty) < 0.1){
            ox = x = random(width);
            tx = random(width);
            ty = y = oy = random(height);
            step = (int)random(30, 240);
        }
    }
    
    public void show(){
        stroke(0);
        line(x, y, ox, oy);
    }
}

