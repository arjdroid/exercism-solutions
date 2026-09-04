#include "atbash_cipher.h"
#include <cctype>

namespace atbash_cipher {

char lookup(char c){
    return "zyxwvutsrqponmlkjihgfedcba"[((std::string)"abcdefghijklmnopqrstuvwxyz").find(c)];
}

std::string encode(std::string input){
    std::string ret = "";
    int grplen = 0;
    for (int i = 0; i < (int) input.length(); i++){
        // handle fixed length group spacing
        char c = input[i];
        if (grplen == 5 && (isalpha(c) || isdigit(c))){
            ret += ' ';
            grplen = 0;
        }
        if (isdigit(c)){
            grplen += 1;
            ret += (input[i]);
        }
        else if (isalpha(c)){
            grplen += 1;
            ret += lookup(tolower(c));
        }
    }
    return ret;
}

std::string decode(std::string input){
    std::string ret = "";
    for (int i = 0; i < (int) input.length(); i++){
        if (isalpha(input[i])){ret += lookup(input[i]);}
        else if (isdigit(input[i])){ret += (input[i]);}
    }
    return ret;
}

}  // namespace atbash_cipher
