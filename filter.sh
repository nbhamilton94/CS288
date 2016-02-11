#!/bin/bash
filter(){

 for item in ${files_in_dir[@]}; do
  file_size=`stat -c %s $cur/$item`
  if [ "${file_size}" -gt "${avg_file_size}" ]; then
   echo $item  
  fi
 done

}

average(){

 avg_file_size=`expr ${total_size} / ${file_count}`
 echo "avg_file_size: ${avg_file_size}"

}

main(){
 dir=$1 #directory we pass in is $1 
 files_in_dir=(`ls ~/$dir`)
 echo "dir is: $dir"
 cur=`pwd` #get the directory we are in
 cd ~ #change to home directory so we can do stat -c in next line
 tot=0
 for item in ${files_in_dir[@]}; do
  i_size=`stat -c %s $cur/$item`
  (( tot = $tot+$i_size))
 done

 total_size=$tot #total_size of directory
 echo "total_size: ${total_size}"

 file_count=`ls $dir | wc -l` #number of files in directory
 echo "file_count: ${file_count}"
 average
 filter

 cd ~
 cd $cur #take me back to my original location
}

main $1
