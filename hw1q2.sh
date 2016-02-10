#!/bin/bash
lst=()
newlst=()

reverse(){
 while read x; do
  lst=("${lst[@]}" $x)
 done < <(ls $dir)
 
 for ((i=${#lst[@]}; i>0; i--)); do
  newlst=("${newlst[@]}" "${lst[i]}")
 done

 echo ${newlst[@]}
}

main(){
 dir=$1
 
 
 reverse

}

main $1
