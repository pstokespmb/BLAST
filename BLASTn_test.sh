#!/bin/bash 
#SBATCH -D /global/scratch/peter_stokes/fastas
#SBATCH -J BLASTn
#SBATCH --partition=vector
#SBATCH --qos=vector_batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=128000
#SBATCH --time=400:00:00
#SBATCH --account=vector_blackmanlab
#SBATCH -o /global/home/users/peter_stokes/BLASTn.out
#SBATCH -e /global/home/users/peter_stokes/BLASTn.err
#SBATCH --mail-user=peter_stokes@berkeley.edu
#SBATCH --mail-type=All

module load seqtk
module load blast

srun blastn -task blastn -query /global/scratch/peter_stokes/fastas/XRQ_PS21_unmapped_sorted.fa -db /global/scratch/nwales/Genomes/BLAST_nt_database/nt -out /global/scratch/peter_stokes/fastas/XRQ_PS21_unmapped_sorted_mod.txt -num_threads 20 -perc_identity 80 -evalue 0.0001 -outfmt "6 qseqid qlen qstart qend sseqid sstart send length pident evalue bitscore"