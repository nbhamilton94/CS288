lst=($1 $2 $3 $4 $5 $6 $7 $8 $9)

for ((i=0; i < ${#lst[@]}; i++)); do
 small=${lst[$i]}
 index=$i
 for ((j=i+1; j < ${#lst[@]}; j++)); do
  if (( lst[j] < small )); then
   small=${lst[$j]}
   index=$j 
  fi
 done
 temp=${lst[$i]}
 lst[$i]=${lst[$index]}
 lst[$index]=$temp
done
 
echo ${lst[@]}
