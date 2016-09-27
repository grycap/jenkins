#!/bin/bash
sinfo
cat >> test.sh << EOF
#!/bin/bash
date > date.out
/bin/hostname
EOF
chmod +x test.sh
sleep 2

echo "Start submitting jobs"
JOB1=$(sbatch test.sh | awk '{print $4}')
echo "Job $JOB1 finished"
sleep 2
JOB2=$(sbatch test.sh | awk '{print $4}')
echo "Job $JOB2 finished"
sleep 2
JOB3=$(sbatch test.sh | awk '{print $4}')
echo "Job $JOB3 finished"
sleep 10

echo "Job outputs"
cat slurm-$JOB1.out
cat slurm-$JOB2.out
cat slurm-$JOB3.out
exit
