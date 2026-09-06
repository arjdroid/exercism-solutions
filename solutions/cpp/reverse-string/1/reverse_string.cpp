#include "reverse_string.h"

namespace reverse_string {

std::string reverse_string(std::string input){
    // conveniently only dealing with ascii here
    std::string out = "";
    for (int i = (int) input.length()-1; i >= 0; i--) {
        out.push_back(input[i]);
    }
    return out;
}

}  // namespace reverse_string
