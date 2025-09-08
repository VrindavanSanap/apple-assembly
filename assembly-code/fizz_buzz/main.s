// Created by Vrindavan Sanap
// This program solves the FizzBuzz problem (https://leetcode.com/problems/fizz-buzz/description/) and prints the results to standard output.

// FizzBuzz problem:
// Given an integer n, return a string array answer (1-indexed) where:
//   answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
//   answer[i] == "Fizz" if i is divisible by 3.
//   answer[i] == "Buzz" if i is divisible by 5.
//   answer[i] == i (as a string) if none of the above conditions are true.

// Example 1:
// Input: n = 3
// Output: ["1","2","Fizz"]

// Example 2:
// Input: n = 5
// Output: ["1","2","Fizz","4","Buzz"]

// Example 3:
// Input: n = 15
// Output: ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]

.global _main // Provide program starting address to linker
.align 4      // Make sure everything is aligned properly.
.data 

.text
.align 4

_main:
    
    adr x0, fizz 
    mov x1, fizz_len 
    bl _write_stdout
  
    adr x0, buzz 
    mov x1,buzz_len
    bl _write_stdout


    bl _exit

fizz: .ascii "Fizz\n"
.equ fizz_len, . - fizz
buzz: .ascii "Buzz\n"
.equ buzz_len, . - buzz
fizz_buzz: .ascii "FizzBuzz\n"
.equ fizz_buzz_len, . - fizz_buzz


