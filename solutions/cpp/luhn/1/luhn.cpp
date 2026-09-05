#include "luhn.h"

namespace luhn {

bool valid(std::string input){
    std::string str;

    // there might ∃ more efficient ways to validate?
    for (int i = 0; i < (int) input.length(); i++) {
        // skip spaces, only want digits
        if (input[i] == ' ') {continue;}
        if (!isdigit(input[i])) {return false;}
        else {
            str.push_back(input[i]);
        }
    }

    if (str.length() <= 1) {return false;}

    int sum = 0;

    for (int i = 1; i <= (int) str.length(); i++) {
        // backwards, might have better ways
        int j = (int) str.length() - i;
        // double it and give it to the next person
        if (i % 2 == 0) {
            int dub = 2*(str[j] - '0');
            if (dub > 9) {dub = dub - 9;}
            str[j] = (dub) + '0';
        }
        // sum it up
        sum += str[j] - '0';
    }

    return (sum % 10 == 0);
}

}  // namespace luhn
