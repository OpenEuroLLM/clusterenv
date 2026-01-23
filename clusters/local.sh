# Local development configuration
CLUSTER_HOSTNAME_PATTERN=""  # Fallback, no pattern matching
CLUSTER_NAME="local"

export OELLM_PROJECT_ROOT="$HOME/.openeurollm"
export OELLM_WANDB_ENTITY="openeurollm"

# Slurm configuration (not used locally, but set for consistency)
export OELLM_SLURM_DEFAULT_PARTITION=""
export OELLM_SLURM_DEFAULT_ACCOUNT=""
