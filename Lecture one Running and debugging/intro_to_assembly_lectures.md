# Introduction to Assembly Language
### Lecture Series — Part 1 & 2 (x86-64, NASM syntax, Linux)

---

## Lecture 1: What Assembly Is and Why It Matters

### 1.1 The Big Picture

Every program you run eventually becomes a sequence of raw binary instructions the CPU executes one at a time. The layers look like this:

```
High-level language (Python, C, Java)
        ↓ compiler / interpreter
Assembly language        <-- you are here
        ↓ assembler
Machine code (binary)
        ↓
CPU executes it directly
```

**Assembly language is a human-readable, near 1-to-1 representation of machine code.** Each assembly instruction usually corresponds to exactly one machine instruction. This is different from C or Python, where one line can expand into dozens of machine instructions.

### 1.2 Why learn it today?

- **Understand what your compiler is really doing** — optimization, calling conventions, stack layout.
- **Reverse engineering / security** — malware analysis, exploit development, CTFs.
- **Performance-critical code** — SIMD, cryptography, embedded systems.
- **OS/kernel development** — bootloaders, interrupt handlers, device drivers.
- **Debugging** — reading a disassembler or debugger (gdb, x64dbg) fluently.

### 1.3 Architectures you'll hear about

| Architecture | Where it's used | Instruction style |
|---|---|---|
| x86 / x86-64 | Desktops, laptops, servers | CISC (complex, variable-length instructions) |
| ARM / ARM64 | Phones, Macs (M-series), embedded | RISC (simpler, fixed-length instructions) |
| RISC-V | Emerging open-standard, embedded, research | RISC |

We'll focus on **x86-64** because most tutorials, tools, and debuggers target it, and the concepts transfer directly to ARM/RISC-V once you understand them.

### 1.4 Core Concept: The CPU's Toolbox

A CPU has three things it works with:

1. **Registers** — tiny, extremely fast storage locations built into the CPU itself.
2. **Memory (RAM)** — much larger but slower storage, accessed via addresses.
3. **Instructions** — operations that move data between registers/memory and do arithmetic/logic on it.

That's genuinely the whole game: **move data around, and do arithmetic/logic/comparisons on it.**

### 1.5 x86-64 General Purpose Registers

| 64-bit | 32-bit | 16-bit | 8-bit | Typical use |
|---|---|---|---|---|
| `rax` | `eax` | `ax` | `al` | Accumulator / return value |
| `rbx` | `ebx` | `bx` | `bl` | Base / general |
| `rcx` | `ecx` | `cx` | `cl` | Counter (loops) |
| `rdx` | `edx` | `dx` | `dl` | Data / general |
| `rsi` | `esi` | `si` | `sil` | Source index (string/array ops) |
| `rdi` | `edi` | `di` | `dil` | Destination index |
| `rsp` | `esp` | `sp` | `spl` | **Stack pointer** (don't touch casually) |
| `rbp` | `ebp` | `bp` | `bpl` | **Base pointer** (stack frame) |
| `r8`–`r15` | `r8d`–`r15d` | `r8w`–`r15w` | `r8b`–`r15b` | Extra general-purpose registers |

Key insight: `rax`, `eax`, `ax`, `al` are **not different registers** — they're different-width views into the *same* 64-bit register. Writing to `eax` zeroes the upper 32 bits of `rax` automatically.

### 1.6 Your First Instructions

```asm
mov rax, 5      ; rax = 5
mov rbx, rax    ; rbx = rax (copy, not move — the name is historical)
add rax, rbx    ; rax = rax + rbx
sub rax, 2      ; rax = rax - 2
inc rbx         ; rbx = rbx + 1
dec rbx         ; rbx = rbx - 1
```

General syntax (NASM/Intel style): `instruction destination, source`

### 1.7 Your First Full Program

A minimal Linux x86-64 program that exits with status code 42:

```asm
section .text
    global _start

_start:
    mov rax, 60      ; syscall number for exit
    mov rdi, 42      ; exit code
    syscall          ; invoke the kernel
```

Assemble and run it:

```bash
nasm -f elf64 exit.asm -o exit.o
ld exit.o -o exit
./exit
echo $?          # prints 42
```

**What happened:** `syscall` asks the Linux kernel to do something privileged (here, terminate the process). `rax` holds *which* syscall, and the other registers (`rdi`, `rsi`, `rdx`...) hold its arguments — this is the Linux x86-64 syscall calling convention.

---

## Lecture 2: Memory, the Stack, and Control Flow

### 2.1 Memory Basics

RAM is just a giant array of bytes, each with a numeric address. You access it in assembly using **square brackets**:

```asm
mov rax, [rbx]        ; load 8 bytes from the address in rbx into rax
mov [rbx], rax         ; store rax's value at the address in rbx
```

Think of `rbx` here as a pointer — just like `*ptr` in C.

### 2.2 Data Sizes

| Size | Name | NASM directive |
|---|---|---|
| 1 byte | byte | `db` |
| 2 bytes | word | `dw` |
| 4 bytes | doubleword | `dd` |
| 8 bytes | quadword | `dq` |

Declaring data:

```asm
section .data
    my_byte     db  5
    my_number   dq  1000000
    my_string   db  "Hello", 0     ; null-terminated
```

### 2.3 The Stack

The stack is a region of memory used for temporary storage, growing **downward** (toward lower addresses). `rsp` always points to the current top.

```asm
push rax     ; rsp -= 8; store rax at [rsp]
pop  rbx     ; load [rsp] into rbx; rsp += 8
```

The stack is essential for:
- Saving registers before calling a function (so you can restore them after)
- Passing/returning from functions
- Local variables

### 2.4 Functions: `call` and `ret`

```asm
section .text
    global _start

_start:
    call add_five      ; push return address, jump to add_five
    ; execution resumes here after ret
    mov rdi, rax
    mov rax, 60
    syscall

add_five:
    add rax, 5
    ret                 ; pop return address, jump back
```

`call` pushes the address of the *next* instruction onto the stack, then jumps. `ret` pops that address and jumps back to it. This is how functions "remember where to return."

### 2.5 Comparisons and Jumps (Control Flow)

Assembly has no `if`/`while` — you build them from **compare + conditional jump**.

```asm
cmp rax, rbx     ; compute rax - rbx, set CPU flags, discard the result

je  label        ; jump if equal      (rax == rbx)
jne label        ; jump if not equal
jg  label        ; jump if greater    (signed)
jl  label        ; jump if less       (signed)
jge label        ; jump if greater or equal
jle label        ; jump if less or equal
jmp label        ; unconditional jump
```

Example — a loop that sums 1 to 10:

```asm
section .text
    global _start

_start:
    mov rax, 0       ; sum = 0
    mov rcx, 1       ; counter = 1

loop_start:
    cmp rcx, 11
    jge loop_end     ; if counter >= 11, exit loop

    add rax, rcx     ; sum += counter
    inc rcx
    jmp loop_start

loop_end:
    mov rdi, rax     ; exit code = sum (should be 55)
    mov rax, 60
    syscall
```

This is literally what a `for` loop compiles down to — a compare, a conditional jump, and a body.

### 2.6 The `loop` shortcut

x86 also has a dedicated instruction that uses `rcx` as an automatic counter:

```asm
mov rcx, 10
my_loop:
    ; body
    loop my_loop     ; decrements rcx, jumps if rcx != 0
```

(Rarely used in modern hand-written or compiler-generated code due to performance quirks, but good to recognize.)

### 2.7 What to practice before Lecture 3

1. Write a program that computes the factorial of a number using a loop.
2. Write a program that finds the maximum of three hardcoded numbers using `cmp`/`jg`.
3. Trace through the sum-loop example by hand, writing down `rax` and `rcx` after each instruction.

**Coming in Lecture 3:** the stack frame in detail (`push rbp` / `mov rbp, rsp`), function arguments via the System V calling convention, and reading/writing strings.

---

## Quick Reference Card

| Category | Instructions |
|---|---|
| Data movement | `mov`, `push`, `pop`, `lea` |
| Arithmetic | `add`, `sub`, `mul`, `imul`, `div`, `idiv`, `inc`, `dec` |
| Logic | `and`, `or`, `xor`, `not`, `shl`, `shr` |
| Comparison | `cmp`, `test` |
| Control flow | `jmp`, `je`, `jne`, `jg`, `jl`, `call`, `ret` |
| System | `syscall`, `int` |

**Tools to install:**
- `nasm` — the assembler
- `gdb` — debugger, to step through your program instruction by instruction
- `objdump -d <binary>` — disassemble a compiled binary to see its assembly
