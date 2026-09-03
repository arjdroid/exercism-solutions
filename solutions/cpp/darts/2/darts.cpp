#include "darts.h"
#include <cmath>

namespace darts {

int score(float x, float y){
    float hyp = sqrt(pow(x,2) + pow(y,2));
    if (hyp <= 1) {return 10;}
    else if (hyp <= 5) {return 5;}
    else if (hyp <= 10) {return 1;}
    else {return 0;}
}

}  // namespace darts
