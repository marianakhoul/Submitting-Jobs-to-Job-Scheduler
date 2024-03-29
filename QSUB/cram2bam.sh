#!/bin/bash

#Find the cram file absolute paths and removes the .cram extension. Outputs path into file cram_file_paths.txt.
find "$PWD" -name "*.cram" | sed s/.cram//g > ~/cram_file_paths.txt

#creates the cram2bam_jobs if it doesn't exist (-p option)
mkdir -p $HOME/cram2bam_jobs

#Creates the .qsub scripts for each file in cram_file_paths.txt and saves them to $HOME/cram2bam_jobs
for i in `cat ~/cram_file_paths.txt`;
	do
	base_name=$(basename ${i})
	#echo $base_name
	echo '#!/bin/bash'"\n" > $HOME/cram2bam_jobs/${base_name}.qsub
	echo 'source /etc/profile' >> $HOME/cram2bam_jobs/${base_name}.qsub
	echo '#$ -S /bin/bash' >> $HOME/cram2bam_jobs/${base_name}.qsub 
	echo '#$ -pe pvm 32'"\n\n" >> $HOME/cram2bam_jobs/${base_name}.qsub
	echo 'module load /modules/linux-ubuntu16.04-x86_64/samtools-1.9-gcc-5.4.0-jjq5nua'"\n" >> $HOME/cram2bam_jobs/${base_name}.qsub
	echo "samtools view -T /path/to/reference/fasta/Homo_sapiens_assembly38.fasta -b -o ${i}.bam ${i}.cram" >> $HOME/cram2bam_jobs/${base_name}.qsub
	done

# Submits .qsub scripts found inside $HOME/cram2bam_jobs
for i in `ls $HOME/cram2bam_jobs`;
	do
	qsub $HOME/cram2bam_jobs/$i
	done
