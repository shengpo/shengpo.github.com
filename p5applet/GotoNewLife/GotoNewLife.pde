import geomerative.*;

RShape shp;

ArrayList<LineMaker> lineMakerList = null;
LineMaker curLineMaker = null;

boolean isAuto = false;

int counter = 0;


void setup() {
        size(600, 600, JAVA2D);

        RG.init(this);        //must initializing RG first!!
//        RG.setPolygonizer(RG.ADAPTATIVE);

        shp = RG.loadShape("new_life.svg");
        shp = RG.centerIn(shp, g);
        RG.ignoreStyles();

        //for line maker
        lineMakerList = new ArrayList<LineMaker>();
}

void draw() {
        background(255);
        
        if(isAuto){
                autoMakeLine();
                if(lineMakerList.size() > 500){
                        isAuto = false;
                }
        }

        pushMatrix();
        translate(width/2, height/2);

//        noFill();
//        stroke(255);
//
//        // Draw the shape
//        RG.shape(shp);

        //remove older lineMaker
        for (int i=lineMakerList.size()-1; i>=0; i--) {
                if (!lineMakerList.get(i).isLive()) {
                        lineMakerList.remove(i);
                        println("remove!");
                }
        }

        //show lines
        translate(-width/2, -height/2);
        for (int i=0; i<lineMakerList.size(); i++) {
                lineMakerList.get(i).update();
                lineMakerList.get(i).show();
        }

        //show bubbles
        translate(width/2, height/2);
        for (int i=0; i<lineMakerList.size(); i++) {
                for(int b=0; b<lineMakerList.get(i).bubbleList.size(); b++){
                        lineMakerList.get(i).bubbleList.get(b).update();
                        lineMakerList.get(i).bubbleList.get(b).show();
                }
        }

        popMatrix();
}

void autoMakeLine(){
        for(int i=0; i<3; i++){
                LineMaker lm = new LineMaker(random(width), random(height), random(width), random(height));
                lm.setBuubleDiameter(10);
                lm.setBuubleIsFilled(true);
                lm.makerCuttingPoints();
                lineMakerList.add(lm);
        }
}


void mousePressed() {
        //make first point of line
        if (curLineMaker==null && !isAuto) {
                curLineMaker = new LineMaker();
                curLineMaker.x1 = mouseX;
                curLineMaker.y1 = mouseY;
                lineMakerList.add(curLineMaker);
        }
}

void mouseReleased() {
        //make second point of line
        if (curLineMaker!=null && !isAuto) {
//                lineMakerList.get(lineMakerList.size()-1).x2 = mouseX;
//                lineMakerList.get(lineMakerList.size()-1).y2 = mouseY;
//                lineMakerList.get(lineMakerList.size()-1).makerCuttingPoints();
                curLineMaker.x2 = mouseX;
                curLineMaker.y2 = mouseY;
                curLineMaker.setBuubleIsFilled(false);
                curLineMaker.makerCuttingPoints();
                curLineMaker = null;
                
                if(!isAuto){
                        counter = counter + 1;
                        if(counter >= 12){
                                isAuto = true;
                                counter = 0;
                        }
                }
        }
}


void keyPressed(){
        if(key == 'a'){
                isAuto = !isAuto;
        }
}

