# OpenEuroLLM Cluster Environment

Standardized environment configuration for LLM training across multiple HPC clusters.

## Installation

```bash
curl -sSL https://raw.githubusercontent.com/OpenEuroLLM/clusterenv/main/install.sh | bash
```

The installer will:
1. Detect your cluster from the hostname
2. Download configuration files to `~/.openeurollm-env/`
3. Add the environment to your `.bashrc` and `.zshrc`

After installation, restart your shell or run:
```bash
source ~/.openeurollm-env/config.sh
```

## Updating

To update to the latest configuration, re-run the installation command:
```bash
curl -sSL https://raw.githubusercontent.com/OpenEuroLLM/clusterenv/main/install.sh | bash
```

## Supported Clusters

| Cluster  | Hostname Pattern | Project Root |
|----------|------------------|--------------|
| LUMI     | `lumi`, `nid*`, `uan*` | `/scratch/project_465000xxx` |
| Leonardo | `leonardo`, `lrdn*` | `/leonardo_scratch/large/project_xxx` |
| Jupiter  | `jupiter`, `jpt*` | `/p/project/xxx` |
| Juwels   | `juwels`, `jwl*`, `jwc*` | `/p/project/xxx` |
| Local    | (fallback) | `~/.openeurollm` |

If no cluster is detected from the hostname, the installer falls back to **local** mode with paths under `~/.openeurollm`.

## Environment Variables

After installation, the following variables are available:

| Variable | Description | Per-user |
|----------|-------------|----------|
| `OELLM_PROJECT_ROOT` | Base project directory for the cluster | - |
| `OELLM_EVAL_DIR` | Evaluation outputs | Yes |
| `OELLM_CONTAINERS_DIR` | Container images | Yes |
| `OELLM_CHECKPOINTS_PRETRAIN_DIR` | Pretraining checkpoints | No |
| `OELLM_CHECKPOINTS_POSTTRAIN_DIR` | Post-training checkpoints | No |
| `OELLM_DATASETS_RAW_DIR` | Raw datasets | No |
| `OELLM_DATASETS_TOKENIZED_DIR` | Tokenized datasets | No |
| `HF_HOME` | HuggingFace cache | Yes |
| `OELLM_WANDB_DIR` | Weights & Biases local directory | Yes |
| `WANDB_PROJECT` | Default W&B project name | - |
| `OELLM_SLURM_JOBS_DIR` | Slurm job scripts and logs | Yes |
| `OELLM_SLURM_DEFAULT_PARTITION` | Default Slurm partition for job submission | - |
| `OELLM_SLURM_DEFAULT_ACCOUNT` | Default Slurm account/project for billing | - |

## Directory Structure

```
$PROJECT_ROOT/
├── evaluations/$USER/
├── containers/$USER/
├── checkpoints/
│   ├── pretrain/          # Shared across users
│   └── posttrain/         # Shared across users
├── datasets/
│   ├── raw/               # Shared across users
│   └── tokenized/         # Shared across users
├── cache/
│   └── huggingface/$USER/
├── wandb/$USER/
└── slurm/$USER/
```

## Adding a New Cluster

1. Create `clusters/<cluster_name>.sh`:
```bash
CLUSTER_HOSTNAME_PATTERN="^(hostname|node[0-9]+)"
CLUSTER_NAME="cluster_name"

export OELLM_PROJECT_ROOT="/path/to/project"
export WANDB_PROJECT="openeurollm"
```

2. Add the cluster name to the `CLUSTERS` array in `install.sh` and `update.sh`

## Overriding Variables

To override any variable, add exports to your `.bashrc` after the source line:
```bash
source "$HOME/.openeurollm-env/config.sh"
export WANDB_PROJECT="my-entity"  # Override default
```
