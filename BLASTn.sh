#!/bin/bash 
#SBATCH -D /global/scratch/peter_stokes/fastas
#SBATCH -J BLASTn
#SBATCH --partition=savio
#SBATCH --account=co_rosalind 
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=48:00:00
#SBATCH --mem=64000
#SBATCH -o /global/home/users/peter_stokes/BLASTn.out
#SBATCH -e /global/home/users/peter_stokes/BLASTn.err
#SBATCH --mail-user=peter_stokes@berkeley.edu
#SBATCH --mail-type=All

module load seqtk
module load blast

srun blastn -task blastn -query /global/scratch/peter_stokes/fastas/XRQ_PS21_unmapped_sorted.fa -db /global/scratch/nwales/Genomes/BLAST_nt_database/nt -out /global/scratch/peter_stokes/fastas/XRQ_PS21_unmapped_sorted_mod.txt -num_threads 20 -perc_identity 80 -evalue 0.0001 -outfmt "6 qseqid qlen qstart qend sseqid sstart send length pident evalue bitscore"

-num_threads 20