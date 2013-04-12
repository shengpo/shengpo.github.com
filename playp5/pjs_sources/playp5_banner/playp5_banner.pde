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

