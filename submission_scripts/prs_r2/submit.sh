if [[ ! -d logs ]]
then
  mkdir logs
fi

for i in `seq 1 3`
do
  qsub -v NUM=$i,CONFIG=no_name -N R2-$i run.qsub
done

for i in `seq 4 17`
do
  qsub -v NUM=$i,CONFIG=no_name -N R2-$i run.qsub
done
