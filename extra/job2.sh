#!/bin/bash -l

#SBATCH --job-name=Nextflow-master-nanopore
#SBATCH --account=pawsey0281
#SBATCH --partition=workq
#SBATCH --time=1-00:00:00
#SBATCH --no-requeue
#SBATCH --export=none

module load singularity/3.3.0
module load nextflow

nextflow run marcodelapierre/nanopore-nf \
  -profile zeus --slurm_account='pawsey0281' -name nxf-${SLURM_JOB_ID} \
  -with-trace trace-${SLURM_JOB_ID}.txt -with-report report-${SLURM_JOB_ID}.html \
  --read_dir='sample6' --seqid='D10930.1,MK116873.1'
