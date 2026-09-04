#pragma once
#include <string>

namespace atbash_cipher {

// takes plaintext and enciphers it per atbash
std::string encode(std::string input);

// takes ciphertext and deciphers it per atbash
std::string decode(std::string input);

}  // namespace atbash_cipher
