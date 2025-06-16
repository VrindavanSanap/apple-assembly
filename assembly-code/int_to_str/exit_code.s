//
//  exit_code.s
//  MyApp
//
//  Created by Vrindavan Sanap on 16/06/25.
//
// This file defines a function that exits the program 
// with a specific exit code.









.global _main
.balign 4


_exit:
  // arguments 
  // x0 is the exit code

  // move '1' into 32 bit register-read by 0S
  // which syscall to perform 
  // here #1 is exit syscall
  mov x16, #1 

  // perform syscall, look at x16 to see
  // which sycall to perform 
  svc 0

