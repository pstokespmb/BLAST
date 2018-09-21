#!/bin/bash 
#SBATCH -D /global/scratch/peter_stokes/BLAST/databases
#SBATCH -J blast_db
#SBATCH --partition=vector
#SBATCH --qos=vector_batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=128000
#SBATCH --time=400:00:00
#SBATCH --account=vector_blackmanlab
#SBATCH -o /global/home/users/peter_stokes/blast_db.out
#SBATCH -e /global/home/users/peter_stokes/blast_db.err
#SBATCH --mail-user=peter_stokes@berkeley.edu
#SBATCH --mail-type=All

module load seqtk
module load blast

srun makeblastdb -in fullAssembly_pseudohap2.1.fasta -input_type fasta -dbtype nucl -title pseudohap2.1_db -out pseudohap2.1_db
