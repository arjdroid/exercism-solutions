#include "bob.h"

namespace bob {

// TODO: add your solution here
std::string hey(std::string msg) {
    // TODO: more semantic, less ad hoc, O(n) ≻? O(2n)
    bool isyell = false;
    bool issilence = true;
    bool isquest = false;
    for (int i = 0; i < (int) msg.length(); i++) {
        //if (!isalpha(msg[i])) {isquest = msg[i] == '?';}
        if (!isspace(msg[i])) {
            issilence = false;
            if (isalpha(msg[i])) {
                isyell = (isupper(msg[i]));
                if (!isyell) {break;}
            }
        }
    }
    // this is a copout
    for (int i = (int) msg.length(); i >= 0; i--) {
        if (isalpha(msg[i])) {break;}
        if (!isspace(msg[i])) {
            isquest = msg[i] == '?';
            if (isquest) {break;}
        }
    }
    if (issilence) {return "Fine. Be that way!";}
    //if (msg[msg.length()-1] == '?') {
    if (isquest) {
        return (isyell) ? "Calm down, I know what I'm doing!" : "Sure.";
    } else {
        return (isyell) ? "Whoa, chill out!" : "Whatever.";
    }
}

}  // namespace bob
