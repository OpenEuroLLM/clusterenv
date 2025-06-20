#!/bin/bash

# 0) detect system
# 1) load configuration of the detected system
# 2) prints it and set env variable

function parse_yaml {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   
   eval "$(sed -ne "s|^\($s\):|\1|" \
        -e "/^$s#/d" \
        -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         var_name = "'$prefix'" vn $2;
         var_value = $3;
         printf("echo \"Setting %s=%s\"; ", var_name, var_value);
         printf("export %s=\"%s\"; ", var_name, var_value);
      }
   }')"
}

if [ -z "$system" ]; then
	# TODO automatically detect system if not provided
    system="juwels"
fi

echo "Setting up system: ${system}"
parse_yaml configs/${system}.yaml

echo "All set, try:"
echo "srun --pty --nodes=1 --account=\$slurm_default_account --partition \$slurm_default_partition --mem=\$slurm_memory --time=60 /bin/bash"
env