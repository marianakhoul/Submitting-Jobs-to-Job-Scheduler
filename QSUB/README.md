# QSUB Job Scheduler Commands

## Breakdown of the README.md file
1. [QSUB Jop Options](#Jop-Options)
2. [How-to run qsub in terminal](#Running-qsub-in-Terminal)
3. [Creating qsub Scripts](#Creating-qsub-Scripts)
4. [Check Job Status](#Check-Job-Status)
5. [Scripts for Automation in this Repository](#Scripts-for-Automation-in-this-Repository)
6. [Delete Submitted Jobs](#Delete-Submitted-Jobs)

## Jop Options
 * -V: passes all environmental variables to the job
 * -N <jobname>: name of the job. Will see it when using qstat
 * -l h_vmem=size: Maximum memory required. This is per job
 * -l h_rt=<hh:mm:ss> Maxmimum runtime. This is per job
 * -pe pvm/smp <n_slots>: Parallel environment. n_slots ~ usually 32.
 * -cwd: Run in current working directory
 * -o <output_log_file_name>: Name of the output log file
 * -e <error_log_file_name>: Name of the error log file
 * -m ea: Will send an email when job finishes/aborts
 * -M <email_address>: The email address to send email to
 
## Running qsub in Terminal
To run qsub in the terminal:
```
qsub -N Example -l h_vmem=40G,h_rt=100:00:00 -pe pvm 32 -o ~/Example.out file.qsub
```

## Creating qsub Scripts
Add the options for qsub in your scripts after the bash shebang using the #$ opperator.

Example:
```
#!/bin/bash
 
#$ -pe pvm 32
#$ -l h_vmem=6G
```
Since the options are inside the script, simply run qsub as follows:
```
qsub file.qsub
```
## Check Job Status
To check the status of your job
```
qstat
```
## Delete Submitted Jobs
Get the job-ID by using qstat.

To delete a job
```
qdel 1869793 # deletes job 1869793
```
To delete a consecutive series of jobs, first make sure that all the jobs from Number X to Number Y are actually yours. You don't want to delete someone elses running jobs.
```
qdel {1869793..1869796}  # deletes jobs from 1869793 to 1869796 included
```  
 
## Scripts for Automation in this Repository
1. **cram2bam.sh** creates the .qsub files and submits them using the qsub command. Converts files from.cram to .bam 
2. **indexbam.sh** creates the .qsub files and submits them using the qsub command. Indexes .bam files and outputs to .bam.bai
