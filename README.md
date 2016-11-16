# cipher-StriBobr1

Stribob is an algorithm for Authenticated Encryption with Associated Data (AEAD).
StriBob was created by Markku-Juhani O. Saarinen as a first round entry in the CAESAR contest by NIST.

It uses a 512x512 bit permutation PI as its cryptographic foundation. PI is built from twelve iterations of LPS transformation, interleaved with EX-OR operation with round constants. LPS itself stands for Linear, Permutation, Substitution.

All design credits for the algorithm reside with Markku-Juhani O. Saarinen. This is a VHDL implementation of his algorithm as understood by me.
