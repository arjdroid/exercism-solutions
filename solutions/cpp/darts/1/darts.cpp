#include "darts.h"
#include <cmath>

namespace darts {

int score(float x, float y){
    float hyp = sqrt(pow(x,2) + pow(y,2));
    int score;
    if (hyp <= 1) {score = 10;}
    else if (hyp <= 5) {score = 5;}
    else if (hyp <= 10) {score = 1;}
    else {score = 0;}
    return score;
}

}  // namespace darts
