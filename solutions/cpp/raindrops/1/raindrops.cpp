#include "raindrops.h"

namespace raindrops {

string convert(int number){
    string sound = "";
    if (number % 3 == 0){
        sound = sound+"Pling";
    }
    if (number % 5 == 0){
        sound = sound+"Plang";
    }
    if (number % 7 == 0){
        sound = sound+"Plong";
    }
    if (sound == ""){
        sound = std::to_string(number);
    }
    return sound;
}

}  // namespace raindrops
