#import "../../template/dewdrop.typ": *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/theorion:0.4.0": *
#import "@preview/pinit:0.2.2": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

#set heading(numbering: numbly("{1}.", default: "1.1"))

#show: codly-init.with()

#import cosmos.rainbow: *
// other optional themes for theorion
// #import cosmos.fancy: *
// #import cosmos.clouds: *
#show: show-theorion


#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  logo: image(
    "../../template/Monash_University_logo_page.svg",
    height: 2em,
    ),
  footer: none,  // Footer removed
  navigation: "mini-slides",
  // logo: image("your-logo.svg", height: 2em),  // Uncomment and add your SVG logo path here
  config-info(
    title: [FIT3143 Applied Presentation],
    subtitle: [Week 3: Flynn's Taxonomy and Parallel Processing],
    author: [Xingyu Yang (33533563)],
    date: datetime.today(),
    institution: [Tutorial 03],
  ),
  config-common(frozen-counters: (theorem-counter,)),
)

#title-slide()

#outline-slide()

= Flynn's taxonomy

// Summary of classes by instruction and data streams


== SISD (Single Instruction Single Data)
#definition(title: "SISD")[
  A single processor executes a single instruction stream to operate on data stored in a single memory. This is the traditional *von Neumann architecture*.
]
#example[
  - Early mainframes and minicomputers: IBM System/360, PDP-11
  - Early microprocessors and microcontrollers: Intel 8086, 8051
  
  *Real-life applications*
  - Embedded control loops and device drivers
  - Sequential algorithms with strict data dependencies (e.g., single-thread DP)
]



== SIMD (Single Instruction Multiple Data)
#definition(title: "SIMD", numbering: none)[
  A single instruction stream operates on multiple data streams simultaneously. Common in vector processors and GPU architectures.
]
// matrix multiplication example
#example[
  The multiplication between two matrices $A, B$ (given they are of compatible dimensions) can be expressed as:
  $ C_(i j) = sum_n A_(i n) dot B_(n j), $
  where $C$ is the resulting matrix, $n$ is the index over the shared dimension.

  - Only one operation involved (IR maintains the *same instruction* for all data elements).

  - Iteratively calculating inner products for each row vector of $A$ and column vector of $B$ (*data in different memory locations*).
]

#note-box[
  Conducting matrix multiplication is the bed-rock of latest AI paradigms(neuronal networks, transformers, etc.). The SIMD architecture is particularly well-suited for such operations due to its ability to perform the same operation on multiple data points simultaneously.
]

== MISD (Multiple Instruction Single Data)
#definition(title: "MISD")[
  Multiple instruction streams operate on a single data stream. This architecture is rare but used in fault-tolerant systems and parallel processing of single data through multiple stages.
]
#example[
  *Historical/real systems*
  - N-modular redundancy (TMR/NMR) in avionics and spacecraft (e.g., fly-by-wire, Space Shuttle): multiple diverse implementations consume the same sensor data and vote
  - Diverse-program redundant computing: different algorithms validate the same input stream
  
  *Real-life applications*
  - Safety monitoring and voting on sensor data (fault tolerance)
  - Cryptographic verification using multiple independent implementations
  - Signal validation/health monitoring pipelines (same input, multiple processing chains)
]
=== Diagram
```
Input data ──► [ Algo A ] ──►
           └─► [ Algo B ] ──► Voting / Comparison ──► Output
           └─► [ Algo C ] ──►
```

== MIMD (Multiple Instruction Multiple Data)
#definition(title: "MIMD")[
  Multiple instruction streams operate on multiple data streams independently. This is the most common parallel architecture used in modern multi-core processors and distributed systems.
]
#example[

  - Symmetric multiprocessors and multi-core CPUs: Intel Core/Atom, AMD EPYC, IBM POWER
  - Shared-memory many-core: Sun/Oracle Niagara, Xeon Phi (MIC)
  - Clusters and supercomputers: Beowulf clusters, IBM Blue Gene, Cray systems (TOP500)
  - Cloud/distributed systems: Kubernetes microservices, Hadoop/Spark
]
*Real-life applications*
- Web services and microservices at scale
- Scientific/HPC workloads (CFD, climate, molecular dynamics)
- Databases and high-throughput transaction processing

== Summary
This table summarizes the four classes of Flynn's taxonomy, highlighting the number of instruction and data streams for each type.
#let summary =monash-three-line-table[
  | *Type* | *Instruction streams* | *Data streams* |
  | :----: | :-------------------: | :------------: |
  | SISD   | 1                     | 1              |
  | SIMD   | 1                     | Many           |
  | MISD   | Many                  | 1              |
  | MIMD   | Many                  | Many           |
]

#figure(summary, caption: "Summary of Flynn's taxonomy")

Nowadays, the most common architecture is MIMD. SIMD is also widely used, especially in applications that can benefit from vectorization, such as graphics processing and machine learning.


= Processes, Threads, and IPC

== Process Composition (6 Attributes)

#let process-attrs = monash-three-line-table[
| *Attribute* | *Purpose* |
| :----: | :-------: |
| PID | Unique identifier |
| PC | Next instruction address |
| Stack | Function calls & local data |
| Heap | Dynamic memory |
| State | Execution status |
| Registers | Current CPU state |
]

#figure(process-attrs, caption: "Essential process attributes")

== Thread vs Process Resources

*Resources shared between threads (NOT processes):*
- Memory space (same virtual address space)
- File descriptors (shared I/O streams)

== IPC Mechanisms

#let ipc-table = monash-table[
| *Same Host* | *Network* |
| :---------: | :-------: |
| Pipes | Sockets |
| Shared Memory | |
| Message Queues | |
]

#figure(ipc-table, caption: "IPC mechanisms")

*Socket performance: Latency vs Throughput*

= Shared Memory Communication
== Code Snippet: C - Shared Memory Communication
```C
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
void *print_message_function( void *ptr )
{
char *message;
message = (char *) ptr;
printf("%s \n", message);
}
int main()
{
pthread_t thread1, thread2;
char *message1 = "Thread 1";
char *message2 = "Thread 2";
int iret1, iret2;
iret1 = pthread_create( &thread1, NULL, print_message_function,
(void*) message1);
iret2 = pthread_create( &thread2, NULL, print_message_function,
(void*) message2);
printf("Thread 1 returns: %d\n",iret1);
printf("Thread 2 returns: %d\n",iret2);
return;
}
```
=== Thread Outcomes & Reasoning

*Possible outcomes:*
- Thread 1 then Thread 2
- Thread 2 then Thread 1  
- Interleaved execution

*Why?* OS scheduling is non-deterministic:
- No synchronization between threads
- Race condition for CPU/stdout
- Missing `pthread_join()` calls
= Pipelining

== Pipelining Performance

*Non-pipelined:* 1 instruction per 4ns
*Pipelined:* 1 instruction per 1ns (4x speedup)

*Pipeline stalls caused by:*
- Data hazards (RAW dependencies)
- Control hazards (branch misprediction)

= Superscalar Processing

== Key Concepts

*8-way superscalar CPU:*
- 2 Integer EUs, 4 FP EUs, 2 Address EUs
- Multiple instructions per cycle

*Anti-dependency (WAR hazard):*
```cpp
result = a + b;  // Read a, b
a = c + 5;       // Write a (WAR)
result = result + a; // Read new a
```

*Solved by register renaming*