#import "/template/dewdrop.typ": *
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
    "/template/Monash_University_logo_page.svg",
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

== SISD (Single Instruction Single Data)
#definition(title: "SISD")[
  A single processor executes a single instruction stream to operate on data stored in a single memory. This is the traditional *von Neumann architecture*.
]
#example[
  - 
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

  - Only one operation involved (IR maintains the *same instruction* for all data elements)

  - Iteratively calculating inner products for each row of $A$ and column of $B$ (*Different data elements*)
]

#note-box[
  Conducting matrix multiplication is the bed-rock of latest AI paradigms(neuronal networks, transformers, etc.). The SIMD architecture is particularly well-suited for such operations due to its ability to perform the same operation on multiple data points simultaneously.
]

== MISD (Multiple Instruction Single Data)
#definition(title: "MISD")[
  Multiple instruction streams operate on a single data stream. This architecture is rare but used in fault-tolerant systems and parallel processing of single data through multiple stages.
]
=== Diagram

== MIMD (Multiple Instruction Multiple Data)
#definition(title: "MIMD")[
  Multiple instruction streams operate on multiple data streams independently. This is the most common parallel architecture used in modern multi-core processors and distributed systems.
]
=== Diagram


= Processes, Threads, and IPC

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
=== What are the Possible Outcomes?
#lorem(100)

=== Reason for the Possible Outcomes
#lorem(100)
= Pipelining

= Superscalar processing