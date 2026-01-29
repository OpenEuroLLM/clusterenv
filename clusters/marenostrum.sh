# Jupiter cluster configuration
CLUSTER_HOSTNAME_PATTERN="^(jupiter|jpbl|jpt[0-9]+)"
CLUSTER_NAME="marenostrum"

export OELLM_PROJECT_ROOT="/gpfs/projects/xxx"
export WANDB_PROJECT="openeurollm"

# Slurm configuration
export OELLM_SLURM_DEFAULT_PARTITION="acc"
export OELLM_SLURM_DEFAULT_ACCOUNT="xxx"
