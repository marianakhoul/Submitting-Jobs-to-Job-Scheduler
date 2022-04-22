#!/bin/bash

#Get path to bam files
cd /path/to/data/files
find "$PWD" -name "*.bam" > $HOME/bam_file_paths.txt

mkdir -p $HOME/indexbam_jobs

for i in `$HOME/bam_file_paths.txt`;
	do
	base_name=$(basename ${i})
	echo '#!/bin/bash'"\n" > $HOME/indexbam_jobs/${base_name}.qsub
	echo 'source /etc/profile' >> $HOME/indexbam_jobs/${base_name}.qsub
	echo '#$ -S /bin/bash' >> $HOME/indexbam_jobs/${base_name}.qsub
	echo '#$ -pe pvm 32'"\n\n" >> $HOME/indexbam_jobs/${base_name}.qsub
	echo 'module load /modules/linux-ubuntu16.04-x86_64/samtools-1.9-gcc-5.4.0-jjq5nua'"\n" >> $HOME/indexbam_jobs/${base_name}.qsub
	echo "samtools index ${i}" >> $HOME/indexbam_jobs/${base_name}.qsub
	done

for i in `ls $HOME/indexbam_jobs`;
	do
	qsub $HOME/indexbam_jobs/$i
	done
