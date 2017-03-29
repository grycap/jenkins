#!/bin/bash -e
pbsnodes -a
cat >> test.sh << EOF
#!/bin/bash
date > date.out
/bin/hostname
date
EOF
chmod +x test.sh
sleep 2

echo "Start submitting jobs"
for i in 1 2 3
do
    qsub test.sh > job$i.out
    echo "Job $i finished"
    sleep 2
done

for i in 1 2 3
do
    echo "Job $i output"
    cat job$i.out
done

exit
