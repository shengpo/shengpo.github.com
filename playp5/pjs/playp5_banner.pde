/***********************************
 This is a reactive banner for Play+Processing forum
 
 forum site:
 - http://shengpo.github.io/playp5
 - http://moot.it/playp5
 
 
 Author: Shen, Sheng-Po (http://shengpo.github.com)
 Developing Environment: Processing 2.0b8 (with JAVASCRIPT mode)
 License: CC BY-SA 3.0
 ***********************************/


Graffiti graffiti = null;

int changeCount = 0;
int changeCountFinal = 1000;


void setup() {
        size(window.innerWidth - 20, 50);
        background(255);
        smooth();
        
        //for text
//        textFont(createFont("Serif", 20));  
        textFont(createFont("Ubuntu", 20));  

        //for drawing
        graffiti = new Graffiti();
}

void draw() {
        //transparency background
        noStroke();
        fill(255, 10);
        rect(0, 0, width, height);

        //graffiti drawing
        graffiti.update();
        graffiti.show();

        //change graffiti drawing's style
        changeGraffitiStyle();
        
        //show play+processing
        fill(0, 0, 85);
        text("play + processing", 10, height-10);
}


void changeGraffitiStyle() {
        changeCount = changeCount + 1;
        if (changeCount > changeCountFinal) {
                int drawStyle = (int)random(3);
                int drawCurve = (int)random(2);
                graffiti.changeStyle(drawStyle, drawCurve);
                changeCount = 0;
        }
}


void mouseMoved() {
        graffiti.setTarget(mouseX, mouseY);
}

public class Graffiti {
        private float x = 0;
        private float  y = 0;
        private float tx = 0;
        private float ty = 0;
        private int step = 60;

        private float h = 100;
        private float s = 100;
        private  float b = 100;
        private boolean isColorful = false;

        private int drawStyle = 0;
        private boolean isDrawCurve = true;


        public Graffiti() {
                colorMode(HSB, 100);
                x = random(width);
                y = random(height);
                tx = random(width);
                ty = random(height);
                
                if(random(2) < 1){
                        isColorful = true;
                }else{
                        h = 0;
                        s = 0;
                }
        }

        public void update() {
                if(isColorful){
                        h = constrain(h+random(-10, 10), 0, 100);
                        s = constrain(h+random(-10, 10), 0, 100);
                }
                b = constrain(h+random(-10, 10), 0, 100);
                
                x = x + (tx-x)/step;
                y = y + (ty-y)/step;
        }

        public void show() {
                defineStyle();

                beginShape();
                for (int i=0; i<20; i++) {
                        if (isDrawCurve) {
                                curveVertex(x, y);
                        } else {
                                vertex(x, y);
                        }
                        x = x + random(-3, 3);
                        y = y + random(-3, 3);
                        
                        if(x<0 || x>width){
                                x = tx + random(-5, 5);
                        }
                        if(y<0 || y>height){
                                y = ty + random(-5, 5);
                        }
                }
                endShape();
        }

        
        private void defineStyle(){
                switch(drawStyle) {
                        case 0:
                                        if (random(2) > 1) {
                                                noFill();
                                                stroke(h, s, b, 50);
                                        } else {
                                                noStroke();
                                                fill(h, s, b, 50);
                                        }
                                        break;
                        case 1:
                                        noFill();
                                        stroke(h, s, b, 50);
                                        break;
                        case 2:
                                        noStroke();
                                        fill(h, s, b, 50);
                                        break;
                        default:
                                        break;
                }
        }


        public void setTarget(float mx, float my){
                tx = mx;
                ty = my;
        }
        
        public void changeStyle(int drawStyle, int isDrawCurve) {
                this.drawStyle = drawStyle;
                this.isDrawCurve = boolean(isDrawCurve);
        }
}


