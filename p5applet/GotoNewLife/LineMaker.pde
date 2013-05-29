public class LineMaker {
        //points of line
        public float x1 = -1;
        public float y1 = -1;
        public float x2 = -1;
        public float y2 = -1;

        //bubbles at the intersection parts
        public ArrayList<Bubble> bubbleList = null;
        private float bubbleD = 50;
        private boolean isFilledBubble = false;

        private int life = 180;
        
        
        public LineMaker(){
                life = (int)random(100, 256);
                bubbleList = new ArrayList<Bubble>();
        }

        public LineMaker(float x1, float y1, float x2, float y2){
                this.x1 = x1;
                this.y1 = y1;
                this.x2 = x2;
                this.y2 = y2;
                life = (int)random(100, 256);
                bubbleList = new ArrayList<Bubble>();
        }

        
        public void update(){
                if(x1>=0 && y1>=0 && x2>=0 && y2>=0){
                        life = life - 5;
                }
        }
        
        public void show(){
                strokeWeight(1);
                
                if(x1>=0 && y1>=0){
                        noFill();
                        stroke(0, life);
                        ellipse(x1, y1, 8, 8);
                }

                if(x2>=0 && y2>=0){
                        noFill();
                        stroke(0, life);
                        ellipse(x2, y2, 8, 8);
                }else{
                        noFill();
                        stroke(0, life);
                        line(x1, y1, mouseX, mouseY);
                        ellipse(mouseX, mouseY, 8, 8);
                }

                if(x1>=0 && y1>=0 && x2>=0 && y2>=0 && life >0){
                        noFill();
                        stroke(0, life);
                        line(x1, y1, x2, y2);
                }
        }
        
        
        public boolean isLive(){
                if(bubbleList.size() > 0){        //if there are bubbles
                        boolean isBubbleLive = false;
                        for(int i=0; i<bubbleList.size(); i++){
                                isBubbleLive = isBubbleLive || bubbleList.get(i).isLive();
                        }
                        
                        if(!isBubbleLive && life<=0){
                                return false;
                        }else{
                                return true;
                        }
                }else{        //if there is no bubbles
                        if(life > 0){
                                return true;
                        }else{
                                return false;
                        }
                }
        }
        
        //detect the cutting points for bubbles        
       public void makerCuttingPoints(){
                // Create a cutting line
                RShape cuttingLine = RG.getLine(x1-width/2, y1-height/2, x2-width/2, y2-height/2);
                RG.shape(cuttingLine);
                
                // Get the intersection points
                RPoint[] ps = shp.getIntersections(cuttingLine);
                if(ps != null){
                        for(int i=0; i<ps.length; i++){
                                Bubble bubble = new Bubble(ps[i].x, ps[i].y, bubbleD);
                                bubble.isFillBubble(isFilledBubble);
                                bubbleList.add(bubble);
                        }
                }
       }
       
       public void setBuubleDiameter(float diameter){
               bubbleD = diameter;
       }
       
       public void setBuubleIsFilled(boolean isFilledBubble){
               this.isFilledBubble = isFilledBubble;
       }
}

