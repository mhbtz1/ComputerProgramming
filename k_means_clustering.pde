

//K-means clustering algorithm
//and
//K-nearest neighbors algorithm
ArrayList<Point> datapoints = new ArrayList<Point>();
ArrayList<Point> k_means = new ArrayList<Point>();
HashMap<Point, ArrayList<Point> > belong_to_point = new HashMap<Point, ArrayList<Point> >();
static int NUM_DATA_POINTS = 5000;
static int NUM_K_MEANS = 10;
color[] arr = new color[NUM_K_MEANS];
//draw convex hull around each cluster(?)





void setup(){
  frameRate(40);
  size(1000,800);
  for(int i = 0; i < NUM_DATA_POINTS; i++){
      Point p = new Point(random(0,1000), random(0,800));
      datapoints.add(p);
  }
  //each k_mean point will have color with it
  for(int i = 0; i < NUM_K_MEANS; i++){
    color c= color(random(0,255),random(0,255),random(0,255));
    k_means.add(new Point(random(0,800),random(0,800),c));
  }
}

ArrayList<Point> recompute(){
  ArrayList<Point> newk_means = new ArrayList<Point>();
  for(Point p: k_means){
    ArrayList<Point> cont_dp = belong_to_point.get(p);
    float x_avg = 0, y_avg = 0;
    for(Point cont_in : cont_dp){
      x_avg += cont_in.x;
      y_avg += cont_in.y;
    }
    x_avg = x_avg/(cont_dp.size());
    y_avg = y_avg/(cont_dp.size());
    newk_means.add(new Point(x_avg,y_avg,p.label));
  }
  return newk_means;
}

void draw(){
    background(255);
    for(int i = 0; i < datapoints.size(); i++){
      Point belong = new Point(0,0);
      double dst = 100000000;
      for(int j = 0; j < k_means.size(); j++){
          dst = min( (float)(dst), dist(k_means.get(j).x, k_means.get(j).y, datapoints.get(i).x, datapoints.get(i).y));
          if(dst==  dist(k_means.get(j).x, k_means.get(j).y, datapoints.get(i).x, datapoints.get(i).y)){
            belong=k_means.get(j);
          }
      }
      if(belong_to_point.get(belong) != null){
        ArrayList<Point> cont = belong_to_point.get(belong);
      cont.add(datapoints.get(i));
      belong_to_point.put(belong, cont);
    } else {
      ArrayList<Point> new_arr = new ArrayList<Point>();
      new_arr.add(datapoints.get(i));
      belong_to_point.put(belong,new_arr);
    }
    fill(belong.label);
    circle(datapoints.get(i).x, datapoints.get(i).y, 10);
  }
  for(int i = 0; i < k_means.size(); i++){
    fill(k_means.get(i).label);
    circle(k_means.get(i).x, k_means.get(i).y, 10);
  }
  k_means=recompute();
}

class Point{
    public float x, y;
    public color label;
    public Point(float x, float y){
      this.x=x;
      this.y=y;
    }
    public Point(float x, float y, color label){
      this.x =x;
      this.y=y;
      this.label=label;
    }
}
