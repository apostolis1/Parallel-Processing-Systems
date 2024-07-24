#!/bin/bash

## Give the Job a descriptive name
#PBS -N make_game_of_life

## Output and error files
#PBS -o make_game_of_life.out
#PBS -e make_game_of_life.err

## How many machines should we get? YES 
#PBS -l nodes=1:ppn=1

##How long should the job run for?
#PBS -l walltime=00:10:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd /home/parallel/parlab10/lab1/game_of_life/openmp
make

