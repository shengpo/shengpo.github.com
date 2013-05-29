public class Bubble {
        //position
        private float x = -1;
        private float y = -1;
        
        //diameter
        private float d = 10;
        private float od = 10;
        private float td = 10;
        private float maxd = 50;
        
        private int step = 30;
        private int direction = 1;
        
        private float alphavalue = 80;
        private float weight = 1;
        
        private boolean isFillBubble = false;
        
        
        public Bubble(float x, float y, float maxd){
                this.x = x;
                this.y = y;
                this.maxd = maxd;
                
                td = random(5, maxd);
                step = (int)random(10, 60);
                
                alphavalue = random(80, 100);
                weight = random(5);
        }
        
        
        public void update(){
                d = d + (td-d)/step;
                
                if(abs(d-td) < 1){
                        if(direction == 1){
                                td = od;
                                direction = -1;
                        }else{
                                td = random(5, maxd);
                                direction = 1;
                        }
                }
                
                alphavalue = alphavalue - 0.5 ;
        }
        
        public void show(){
                if(isFillBubble){
                        fill(255, 0, 0, alphavalue);
                        noStroke();
                }else{
                        noFill();
                        strokeWeight(weight);
                        stroke(255, 0, 0, alphavalue);
                }
                ellipse(x, y, d, d);
        }
        
        
        public void isFillBubble(boolean state){
                isFillBubble = state;
        }
        
        
        public boolean isLive(){
                if(alphavalue > 5){
                        return true;
                }else{
                        return false;
                }
        }
}
