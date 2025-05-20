The **caller** and **callee** are terms used in programming (especially in function calls) to describe the relationship between two pieces of code during a function invocation.

---

### 🔹 Caller

The **caller** is the function or code that **calls or invokes another function**.

**Example:**

```c
void greet() {
    printf("Hello!\n");
}

int main() {
    greet();  // <-- main is the caller
    return 0;
}
```

In this example, `main` is the **caller** because it calls the function `greet`.

---

### 🔹 Callee

The **callee** is the function that is **being called**.

**Example (same as above):**

```c
void greet() {  // <-- greet is the callee
    printf("Hello!\n");
}
```

Here, `greet` is the **callee** because it is being invoked by `main`.

---

### 🔁 Summary

| Term   | Role                                |
| ------ | ----------------------------------- |
| Caller | Function that **calls** another one |
| Callee | Function that is **being called**   |

---
