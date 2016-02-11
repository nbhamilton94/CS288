lst=($1 $2 $3 $4 $5 $6 $7 $8 $9)

for ((i=0; i < ${#lst[@]}; i++)); do
 position=`expr ${lst[$i]}`
 for ((j=0; j < ${#lst[@]}; j++)); do
  next=${lst[$j]} 
  echo "next is $next"
  if [[ "$position" -gt "$next" ]]; then
   
   lst[$i]=$next
   echo "before i update lst[j] it is: ${lst[$j]}"
   lst[$j]=$position
   
  fi

 done
done
 

