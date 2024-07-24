#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_game_of_life_8

## Output and error files
#PBS -o run_game_of_life_8.out
#PBS -e run_game_of_life_8.err

## How many machines should we get? 
#PBS -l nodes=1:ppn=8

##How long should the job run for?
#PBS -l walltime=00:10:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd /home/parallel/parlab10/lab1/game_of_life/openmp
export OMP_NUM_THREADS=8
for SIZE in 64 1024 4096
do
	./game_of_life $SIZE 1000
done

