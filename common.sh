# common.sh - Shared environment paths for OpenEuroLLM training
# These paths are derived from OELLM_PROJECT_ROOT set by the cluster-specific config
# Cluster files can override any path by setting it before this file is sourced

export OELLM_EVAL_DIR="${OELLM_EVAL_DIR:-$OELLM_PROJECT_ROOT/evaluations/$USER}"
export OELLM_CONTAINERS_DIR="${OELLM_CONTAINERS_DIR:-$OELLM_PROJECT_ROOT/containers/$USER}"
export OELLM_CHECKPOINTS_PRETRAIN_DIR="${OELLM_CHECKPOINTS_PRETRAIN_DIR:-$OELLM_PROJECT_ROOT/checkpoints/pretrain}"
export OELLM_CHECKPOINTS_POSTTRAIN_DIR="${OELLM_CHECKPOINTS_POSTTRAIN_DIR:-$OELLM_PROJECT_ROOT/checkpoints/posttrain}"
export OELLM_DATASETS_RAW_DIR="${OELLM_DATASETS_RAW_DIR:-$OELLM_PROJECT_ROOT/datasets/raw}"
export OELLM_DATASETS_TOKENIZED_DIR="${OELLM_DATASETS_TOKENIZED_DIR:-$OELLM_PROJECT_ROOT/datasets/tokenized}"
export HF_HOME="${HF_HOME:-$OELLM_PROJECT_ROOT/cache/huggingface/$USER}"
export OELLM_WANDB_DIR="${OELLM_WANDB_DIR:-$OELLM_PROJECT_ROOT/wandb/$USER}"
export OELLM_SLURM_JOBS_DIR="${OELLM_SLURM_JOBS_DIR:-$OELLM_PROJECT_ROOT/slurm/$USER}"
