# SLURM Job Scheduler Commands

A SLURM job script is a bash shell script with special comments starting with #SBATCH.
The first line of a bash file is always the shebang. 

Example for simplejob.sh
```
#!/bin/bash

# the name of the job
#SBATCH --job-name=test
# this is the file your output and errors go to
#SBATCH --output=~/output/output.txt
# 20 min, this is the MAX time your job will run
#SBATCH --time=20:00
# your working directory
#SBATCH --workdir=~/WGS_data

echo "Hello World"
```

Submitting the job, we use
```
sbatch simplejob.sh
```

To check the status of your job
```
squeue
```

