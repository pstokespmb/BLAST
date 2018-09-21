#!/bin/bash
#SBATCH -D /clusterfs/rosalind/users/peter_stokes/BLAST
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
#SBATCH -e /global/home/users/peter_stokes/BLASTn.out
#SBATCH --mail-user=peter_stokes@berkeley.edu
#SBATCH --mail-type=All

module load seqtk
module load blast

srun blastn -task blastn -query /clusterfs/rosalind/users/peter_stokes/BLAST/XRQ_wantedSeqIDs.fasta -db /clusterfs/rosalind/users/peter_stokes/BLAST/pseudohap2.1_db -out /clusterfs/rosalind/users/peter_stokes/BLAST/pseudohap2.1_wantedMatches_XRQ.txt -outfmt "7 qseqid qlen sseqid slen qstart qend sstart send evalue bitscore score length pident nident mismatch positive gapopen gaps"