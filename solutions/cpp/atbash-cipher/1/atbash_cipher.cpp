#include "atbash_cipher.h"

namespace atbash_cipher {

char lookup(char c){
    // there's got to be a better way
    switch(c){
        case 'a':
            return 'z';
        case 'b':
            return 'y';
        case 'c':
            return 'x';
        case 'd':
            return 'w';
        case 'e':
            return 'v';
        case 'f':
            return 'u';
        case 'g':
            return 't';
        case 'h':
            return 's';
        case 'i':
            return 'r';
        case 'j':
            return 'q';
        case 'k':
            return 'p';
        case 'l':
            return 'o';
        case 'm':
            return 'n';
        case 'n':
            return 'm';
        case 'o':
            return 'l';
        case 'p':
            return 'k';
        case 'q':
            return 'j';
        case 'r':
            return 'i';
        case 's':
            return 'h';
        case 't':
            return 'g';
        case 'u':
            return 'f';
        case 'v':
            return 'e';
        case 'w':
            return 'd';
        case 'x':
            return 'c';
        case 'y':
            return 'b';
        case 'z':
            return 'a';
        default:
            return '\n';
    }
}

std::string encode(std::string input){
    std::string ret = "";
    int grplen = 0;
    for (int i = 0; i < (int) input.length(); i++){
        // handle fixed length group spacing
        if (grplen == 5
            // this is so scuffed there's got to be a better way
            // but ascii-table
            && ((47 < ((int) input[i]) && ((int) input[i]) < 58)
            || (96 < ((int) input[i]) && ((int) input[i]) < 123)
            || (64 < ((int) input[i]) && ((int) input[i]) < 91))
        ){
            ret += ' ';
            grplen = 0;
        }
        if (47 < ((int) input[i]) && ((int) input[i]) < 58){
            grplen += 1;
            // numerical case
            ret += (input[i]);
        }
        else if (96 < ((int) input[i]) && ((int) input[i]) < 123){
            grplen += 1;
            // lowercase case
            ret += lookup(input[i]);
        }
        else if (64 < ((int) input[i]) && ((int) input[i]) < 91) {
            grplen += 1;
            // uppercase case
            ret += lookup(input[i] + 32/*('a' - 'A')*/);
        }
    }
    return ret;
}

std::string decode(std::string input){
    std::string ret = "";
    for (int i = 0; i < (int) input.length(); i++){
        if (input[i] != ' ' && (
            (96 < ((int) input[i]) && ((int) input[i]) < 123)
            || (64 < ((int) input[i]) && ((int) input[i]) < 91))
        ){
            ret += lookup(input[i]);
        }
        if (47 < ((int) input[i]) && ((int) input[i]) < 58){
            // numerical case
            ret += (input[i]);
        }
    }
    return ret;
}

}  // namespace atbash_cipher
