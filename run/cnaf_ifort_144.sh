#!/bin/bash


TOTAL_NUMBER_OF_CORES=144

EXECUTABLE="./ALaDyn"
stderr_file=epic.txt
stdout_file=opic.txt

job=job_test_ifort.cmd
job_name=impi
queue=hpc_inf

###########################
rm -f $job
touch $job
chmod 755 $job

touch ${stderr_file}
touch ${stdout_file}

echo "#BSUB -J ${job_name}" > $job # Job name
echo "#BSUB -o %J.out" >> $job # Job standard output
echo "#BSUB -e %J.err" >> $job # Job standard error
echo "#BSUB -q ${queue}" >> $job
echo "#BSUB -n ${TOTAL_NUMBER_OF_CORES}" >> $job
echo "module load compilers/gcc-4.9.0" >> $job
echo "module load compilers/intel-parallel-studio-2016" >> $job
echo "module load boost_1_56_0_gcc4_9_0" >> $job
echo "export TMI_CONFIG=/shared/software/compilers/impi/intel64/etc/tmi.conf" >> $job
echo "/shared/software/compilers/impi/intel64/bin/mpirun -np ${TOTAL_NUMBER_OF_CORES} -genv PSM_SHAREDCONTEXTS_MAX 8 -genv I_MPI_FABRICS shm:tmi ${EXECUTABLE} >> ${stdout_file} 2>> ${stderr_file}" >> $job


echo "Please submit the job with the following command: "
echo "bsub < $job"
