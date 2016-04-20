class TempoDetector {
    Minim minim;
    AudioPlayer player;
    int localization = 800;  // Control how long to look backward
    int minimum_interval = 200;  // The minimum interval between two consecutive drop
    int last_drop;
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
    }
    
    void init() {
      
    }
    
   void detectTempo() {
     float new_level = player.mix.level();
     float diff = new_level - level;
     level = new_level;
     int cur_time = millis();
     
     //println(level);
     while (start != end && cur_time - history_time[start] > localization) {
       start = (start+1)%capacity;  
     }
     //println(history_time[start]);
     //println("start:"+start);
     //println("end:"+end);
     //println(history[start]);
     if (start == end) {
       history[end] = diff;
       history_time[end] = cur_time;
       end = (end+1) % capacity;
       return;
     } else if (diff > history[start]) {
       history[start] = diff;
       history_time[start] = cur_time;
       end = (start+1) % capacity;
       if (cur_time - last_drop > minimum_interval) {
         cur_tempo = 2;
         last_drop = cur_time;
       }
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