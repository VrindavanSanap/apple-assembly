## Apple Assembly

### System Calls

This section outlines the system calls available in Apple assembly:

**Read:**

* **Syscall Number:** 3
* **Description:** Reads data from the user.

**Write:**

* **Syscall Number:** 4
* **Description:** Writes data to the user.

### SVC Instruction

The SVC instruction is used to invoke a system call. The specific syscall number is stored in the `x16` register.

**Syntax:**

```assembly
svc syscall_number
```

**Example:**

```assembly
mov x16, 3        ; Set the syscall number (read)
svc 0           ; Invoke the system call
```

**Note:**

* The `svc` instruction requires the user to have the necessary permissions to execute the specified system call.
* The system call arguments are passed in the general-purpose registers `x0` to `x3`.
* The return value of the system call is stored in the accumulator register `x0`.