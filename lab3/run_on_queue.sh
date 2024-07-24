#!/bin/bash

#PBS -N run_kmeans_ttas_lock

## Output and error files
#PBS -e /home/parallel/parlab10/lab3/sandman_outputs/run_kmeans_ttas_lock.err
#PBS -o /home/parallel/parlab10/lab3/sandman_outputs/run_kmeans_ttas_lock.out

##How long should the job run for?
#PBS -l walltime=00:10:00


## Start
module load openmp
cd /home/parallel/parlab10/lab3

for THREAD_NUM in 1 2 4 8 16 32 64
do
	export OMP_NUM_THREADS=$(($THREAD_NUM + 0))
	UPPER=$(($THREAD_NUM - 1))
	export GOMP_CPU_AFFINITY="0-${UPPER}"
	./kmeans_omp_ttas_lock -s 16 -n 16 -c 16 -l 10
done


