#!/bin/sh

#SBATCH --job-name=tune_ddpm_breastcancer  # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --partition=mig
#SBATCH --mem=2G                 # total memory
#SBATCH --gres=gpu:1             # number of gpus per node
#SBATCH --mem=2G                 # total memory
#SBATCH --time=12:00:00          # total run time limit (HH:MM:SS)
#SBATCH --mail-type=begin        # send email when job begins
#SBATCH --mail-type=end          # send email when job ends
#SBATCH --mail-type=fail         # send email if job fails
#SBATCH --mail-user=cw0466@princeton.edu

# Set up environment
module purge
module load anaconda3/2023.9
conda activate tddpm

python scripts/tune_ddpm.py heart_failure 215 synthetic catboost ddpm_tune --eval_seed