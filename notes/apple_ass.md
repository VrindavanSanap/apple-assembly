Sure! Here's a fully polished version of your text with clear structure, consistent terminology, and corrected grammar:

---

## Apple Assembly

### System Calls

This section outlines the system calls available in Apple assembly:

**Exit:**

- **Syscall Number:** 1  
- **Description:** Exits the program and returns the specified exit code. The exit code should be stored in register `x0`.

**Read:**

- **Syscall Number:** 3  
- **Description:** Reads data from the user. The arguments (such as file descriptor, buffer, and size) are passed in registers `x0` to `x2`.

**Write:**

- **Syscall Number:** 4  
- **Description:** Writes data to the user. Similar to `read`, arguments are passed in `x0` to `x2`.

---

### SVC Instruction

The `svc` (Supervisor Call) instruction is used to invoke a system call. The syscall number must be stored in the `x16` register before execution.

**Syntax:**

```assembly
svc #0
```

**Example:**

```assembly
mov x16, 3        // Set syscall number (read)
svc #0            // Invoke the system call
```

**Notes:**

- The `svc` instruction requires the necessary permissions to execute the requested system call.
- System call arguments are passed using general-purpose registers `x0` to `x3`.
- The return value of the system call is stored in register `x0`.

---
