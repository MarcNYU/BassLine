class BeatQueue {
  
  int capacity = 50;
  int queue[] = new int[capacity];
  int front = 0;
  int end = 0;
  int size = 0;
    
  public BeatQueue(BeatDetector bd) {
    bd.addListener(     
      new Bead()
       {
           protected void messageReceived(Bead b)
           {
             push_back(millis());
           }
       }
    );
  }
  
  // Give the time of next beat
  public int next() {
    pop_invalids();
    return queue[front];
  }
  
  // Give an array of times of beat within the set period 
  public int[] nexts() {
    if (size == 0) return new int[1];
    pop_invalids();
    int result[] = new int[size];
    for (int i = front, count=0; i != end; i = increase_index(i), ++count) {
      result[count] = queue[i]; 
    }
    return result;
  }
  
  private void push_back(int time) {
    queue[end] = time + bd.forward;
    end = increase_index(end);
    ++size;
  }

  
  private void pop_invalids() {
    while (size > 0 && millis() > queue[front]) {
       front = increase_index(front);
       --size;
    }
  }

  private int increase_index(int i) {
    return (i+1)%capacity;
  }
  
}