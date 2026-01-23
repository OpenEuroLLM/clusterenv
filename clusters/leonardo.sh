# Leonardo cluster configuration
CLUSTER_HOSTNAME_PATTERN="^(leonardo|lrdn[0-9]+)"
CLUSTER_NAME="leonardo"

export OELLM_PROJECT_ROOT="/leonardo_scratch/large/project_xxx"
export WANDB_PROJECT="openeurollm"

# Slurm configuration
export OELLM_SLURM_DEFAULT_PARTITION="boost_usr_prod"
export OELLM_SLURM_DEFAULT_ACCOUNT="project_xxx"
