Addressing Modes

  Addressing without offset
    LDR r1, [r0]            ;r0 holds the memory address

  Addressing with offset
    LDR r1, [r0, #4]        ;pre-index
    LDR r1, [r0] #4         ;post-index
    LDR r1, [r0 #4]!        ;pre-index with update
    offset range -255 to +255



  Pre-index 
    Dont update
    LDR r1, [r0, #4]
    r1 = memory.word[r0 + 4]
    r0 remains unchanged

  Post-index  
    Update after indexing 
    LDR r1 ,[r0], #4
    r1 = memory.word[r0]
    r0 = r0 + 4
 
  Pre-index with update
    Update before indexing
    LDR r1 ,[r0, #4]!
    r1 = memory.word[r0 + 4]
    r0 = r0 + 4   


