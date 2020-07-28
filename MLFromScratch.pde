import java.util.Queue;
import java.util.LinkedList;

float START_X = 90;
float START_Y = 150;
float CUR_X = 90;
float CUR_Y = 150;
ANN_Fully_Connected ann;
ArrayList<Integer> sizes;
int FIN_SIZE;

class Neuron{
  float value;
  float bias;
  float x, y;
  public Neuron(float activation, float bias, float x, float y){
    this.value = activation;
    this.bias = bias;
    this.x = x;
    this.y = y;
  }
}


void setup(){
   sizes = new ArrayList<Integer>();
   for(int i = 0; i < 5; i++){
     sizes.add(10);
   }
  FIN_SIZE = 10;
  ann = new ANN_Fully_Connected();
  ann.create_network(sizes);
  for(int i = 0; i < FIN_SIZE; i++){
    ann.expected_output.add(random(0,10));
  }
  
  
  
}
void draw(){
  ann.feedforward(0);
  ann.backpropagation
}


//fully connected ANN
class ANN_Fully_Connected{
  
  HashMap<Neuron, Float> backpropagation_vals = new HashMap<Neuron, Float>();
  float cur_size;
  float BATCH_SIZE = 20;
  float LEARNING_RATE = 0.2;
  
  //in the end, make it ArrayList< ArrayList<Float> > for testing on batches
  ArrayList<Float> expected_output = new ArrayList<Float>();
  
  HashMap< Paired, Float> weightMatrix = new HashMap<Paired, Float>();
  HashMap<Integer, ArrayList<Neuron> > layerNeurons;

  
  public float sigmoid(float input){
    return (float)(1/(1 + Math.pow(Math.E, -1 * input) ));
  }
  
  
  
  public void feedforward(float curLayer){
     if(curLayer == cur_size){
       return;
     }
     ArrayList<Neuron> prev = layerNeurons.get(curLayer - 1);
     ArrayList<Neuron> cur = layerNeurons.get(curLayer);
     for(int i = 0; i < cur.size(); i++){
       float newV = 0;
       Neuron node = cur.get(i);
       for(int j = 0; j < prev.size(); j++){
        Neuron node2 = prev.get(j);
        newV += weightMatrix.get(new Paired(node, node2));
        newV *= node.value;
        newV += node.bias;
       }
       node.value = newV;
       layerNeurons.get(curLayer).set(i, node);
     }
     
     feedforward(curLayer + 1);
  }
  
  //fix backprop implementation
  //E = 0.5 * (a-y)^2
  
  //sigmoid = 1/(1 + e^-(w*a) )
  
  //dE/dA = 
  public void backpropagation(float curLayer){
    if(curLayer == 0){
      return;
    }
    
    if(curLayer == cur_size - 1){
      ArrayList<Neuron> nodes = layerNeurons.get(curLayer);
      ArrayList<Neuron> nodes2 = layerNeurons.get(curLayer - 1);
      for(int i = 0; i < nodes2.size(); i++){
        Neuron c = nodes2.get(i);
        for(int j = 0; j < nodes.size(); j++){
          float newWt = nodes.get(j).value * sigmoid(expected_output.get(j)) * (1 - sigmoid(expected_output.get(j))) * 2*(expected_output.get(j) - nodes.get(j).value);
          weightMatrix.replace(new Paired(c, nodes.get(j)), newWt); 
          weightMatrix.replace(new Paired(nodes.get(j), c), newWt);   
        }
      }
    } else {
      ArrayList<Neuron> nodes = layerNeurons.get(curLayer);
      ArrayList<Neuron> nodes2 = layerNeurons.get(curLayer - 1);
      for(int i = 0; i < nodes2.size(); i++){
        Neuron c = nodes2.get(i);
        float newWt = 0;
        //pretty sure this backprop is wrong, but kinda hard to correspond to linalg explanation
        for(int j = 0; j < nodes.size(); j++){
          newWt = nodes2.get(i).value * 2*(expected_output.get(i) - nodes2.get(i).value) * weightMatrix.get(new Paired(c, nodes.get(j))) * sigmoid(nodes.get(j).value) * (1-sigmoid(nodes.get(j).value)) * sigmoid(expected_output.get(i)) * (1-sigmoid(expected_output.get(i)));
          weightMatrix.replace(new Paired(c, nodes.get(j)), newWt);
        }
      }
    }
    
    backpropagation(curLayer - 1);
    
    
   
  }
  
  public void gradient_descent(float layer, float node, float FACTOR){
    Neuron cur = layerNeurons.get(layer).get( (int)(node) );
    cur.value = -1 * LEARNING_RATE * FACTOR + cur.value;
    layerNeurons.get(layer).set( (int)(node), cur);
  }
  
  public float product_sum_bias(float layer, float node){
    ArrayList<Neuron> layerPrev = layerNeurons.get(layer - 1);
    ArrayList<Neuron> layerCur = layerNeurons.get(layer);
    Neuron n = layerCur.get( (int)(node) );
    float res = 0;
    for(int i = 0;  i < layerPrev.size(); i++){
      res += weightMatrix.get(new Paired(n, layerPrev.get(i)));
    }
    res += n.bias;
    return res;
  }
  
  
  public void create_network(ArrayList<Integer> layerSizes){
    cur_size = layerSizes.size();
    for(int i = 0; i < layerSizes.size(); i++){
      Neuron n = new Neuron(random(0,1), random(0,1), CUR_X, CUR_Y);
      ArrayList<Neuron> cur = layerNeurons.get(i);
      cur.add(n);
      layerNeurons.put(i,cur);
    }
    
    //add weights connecting nodes
    for(int i = 0; i < layerSizes.size() - 1; i++){
        ArrayList<Neuron> prevLay = layerNeurons.get(i);
        ArrayList<Neuron> succLay = layerNeurons.get(i+1);
        for(int j = 0; j < prevLay.size(); j++){
          for(int k = 0; k < succLay.size(); k++){
            weightMatrix.put(new Paired(succLay.get(k), prevLay.get(j)), random(0,1));
            weightMatrix.put(new Paired(prevLay.get(j), succLay.get(k)), random(0,1) ) ;
          }
        }
      
    }
    
  }
  
  public void stochastic_gradient_descent(){
    
  }
}


class Paired{
  Neuron neuron;
  Neuron neuron2;
  public Paired(Neuron neuron, Neuron neuron2){
    this.neuron = neuron;
    this.neuron2 = neuron2;
  }
}


//unfinished at the moment
class LSTM_Cell{
  
}

class CNN{
}
