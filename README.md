# clusterenv
Setup environment variables and slurm configuration automatically on EuroHPC clusters.

How to use:

```bash
cd ~/
git clone https://github.com/OpenEuroLLM/clusterenv.git
cd clusterenv
bash ~/clusterenv/clusterenv.sh juwels
```

which will set environment variables:

```bash
module_init="ml CUDA; ml Python;"
slurm_default_partition="XXX"
slurm_default_account="YYY"
slurm_max_hour="4"
slurm_n_gpu_per_node="4"
HF_HOME="ZZZ"
...
```

which you can use in a slurm sbatch script to make it portable on multiple clusters.