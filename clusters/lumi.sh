# LUMI cluster configuration
CLUSTER_HOSTNAME_PATTERN="^(lumi|nid[0-9]+|uan)"
CLUSTER_NAME="lumi"

export OELLM_PROJECT_ROOT="/scratch/project_465000xxx"
export WANDB_PROJECT="openeurollm"

# Slurm configuration
export OELLM_SLURM_DEFAULT_PARTITION="standard-g"
export OELLM_SLURM_DEFAULT_ACCOUNT="project_465000xxx"

# LUMI-specific paths
export OELLM_DATASETS_RAW_DIR="$SCRATCH/datasets"
export OELLM_DATASETS_TOKENIZED_DIR="$SCRATCH/preprocessed"
export OELLM_CHECKPOINTS_PRETRAIN_DIR="$SCRATCH/experiments/pretrained/$USER"
export OELLM_CHECKPOINTS_POSTTRAIN_DIR="$SCRATCH/experiments/posttrained/$USER"
