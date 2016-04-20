class TempoDetector {
    Minim minim;
    AudioPlayer player;
    int time_limit = 1000;  // The minimum interval between two consecutive drop
    int capacity = 500;
    float minimum_diff = 0.01;
    
    float level = 2;
    int t = millis();
    float[] history = new float[capacity];
    float[] history_time = new float[capacity];
    int start = 0;
    int end = 0;
    int cur_tempo = 0;
    
    TempoDetector(Minim minim, AudioPlayer player) {
      this.minim = minim;
      this.player = player;
      for (int i = 0; i < capacity; ++i) {
         history[i] = 1; 
      }
    }
  
   void detectTempo() {
     float new_level = player.mix.level();
     float diff = new_level - level;
     level = new_level;
     int cur_time = millis();
     
     //println(level);
     while (start != end && cur_time - history_time[start] > time_limit) {
       start = (start+1)%capacity;  
     }
     
     if (start == end || diff > history[start]) {
       history[start] = diff;
       history_time[start] = cur_time;
       end = (start+1) % capacity;
       //println("true");
       //if (cur_time - t > time_limit) {
       //  t = cur_time;
       //  return true;
       //}
       cur_tempo = 2;
       return;
     } else {
       while (diff > history[(end+capacity-1)%capacity]) {
         end = (end + capacity - 1) % capacity;
       }
       history[end] = diff;
       history_time[end] = cur_time;
       end = (end + 1) % capacity;
     }
     cur_tempo = diff > minimum_diff? 1 : 0;
  }
  int getTempo() {
     return cur_tempo; 
  }
}