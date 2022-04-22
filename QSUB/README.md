# QSUB Job Scheduler Commands

## Jop Options
 * -q <queue>
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
 

## Scripts for Automation in this Repository
**cram2bam.sh** creates the .qsub files and submits them using the qsub command.
