# Parallel Processing Systems Lab

| Authors                                                                |
|------------------------------------------------------------------------|
| Dimitra Leventi ([@dileventi](https://github.com/dileventi))           |
| Dimitrios Mitropoulos ([@dimitrismit](https://github.com/dimitrismit)) |
| Apostolis Stamatis ([@apostolis1](https://github.com/apostolis1))      |

## Overview

We conducted benchmarks using different configurations of resources (nodes, processors, processors per node), tasks (where applicable) and input sizes to determine scalability and bottlenecks

The results of the benchmarks and their in depth analysis can be found in the report

The report also contains critical parts of the source code 


## Lab 1 - Conway's Game of Life using OpenMP

Given a serial algorithm of Conway's Game of Life:
1. Detect the parallelization possibilities
2. Implement a solution using OpenMP in a shared address space architecture
3. Perform benchmarks

## Lab 2 - Parallelization and optimization on shared memory architectures

Given a serial K-means algorithm:

1. Add the necessary synchronization commands when accessing shared resources, so the algorithmm can be run on a parallel system
2. Improve algorithm of (1) by creating local data structures to avoid synchronization using reduction
3. Perform benchmarks

## Lab 3 - Locks and mutex on shared memory architectures 

Benchmark different lock implementations for parallel systems, compare and interpret the results 

1. pthread_mutex_t lock from the Pthreads library
2. pthread_spinlock_t  lock from the Pthreads library
3. test-and-set lock
4. test-and-test-and-set lock
5. array based lock
6. linked list lock from chapter 7 of "The Art of Multiprocessor Programming"

Implementation of the Floyd-Warshall algorihtm using parallel tasks, understanding the limitations of `parallel for`

## Lab 4 - Concurrent data structures

Benchmark the following implementations of a concurrent double linked list:

1. Coarse-grain locking
2. Fine-grain locking
3. Optimistic synchronization
4. Lazy synchronization
5. Non-blocking synchronization

## Lab 5 - Parallelization and optimization on NVIDIA GPUs using CUDA

Different implementations and optimizations of the K-means algorithm

1. Naïve version: Nearest clusters calculation is offloaded to the GPU
2. Transpose version: Implement column-based indexing for the arrays (instead of row-based which is used in the naïve version)
3. Shared version: Move the frequently accessed `clusters` array to the shared GPU memory


## Lab 6 - Parallelization and optimization on distributed memory architectures

Given the serial versions of Jacobi and Gauss-Seidel kernels for the ... problem:
1. Identify parallelism possiblities on Jacobi and Gauss-Seidel kernels
2. Design and implement a solution for a distributed memory arhcitecture using message passing with MPI 
3. Perform benchmarks