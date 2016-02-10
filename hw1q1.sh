#!/bin/bash

#Write a Bash script, count.sh, which builds a table of counters for #the commands under /bin in alphabetical order. For example, there are #9 #commands starting with "a" (a2p addftinfo addr2line apropos ar #arch as ash awk) while there are 11 commands starting with "z" (zcat #zcmp #zdiff zegrep zfgrep zforce zgrep zless zmore znew zsoelim). #Exclude commands starting with non-alphabets such as "[." Your script #will print

#a 9
#...
#...
#...
#z 11

#Use loop and array to design and implement this script. 

alphabet=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
alphabetCounters=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)

#This is our alphabet
function count(){
 
 #Creating a function called count which will increment the amount for each letter
 local item=$1 #Our first argument that we pass
 (( alphabetCounters[item]++ ))
  

}

function outputCount() {
 for ((j=0; j<26; j++)); do
  echo ${alphabet[$j]} ${alphabetCounters[$j]}
 done
}

main() {
 while read x ;do #Can not pipe "|" because it creates a subshell which will cause us to lose access to alphabetCounters
  if [ $x = \[ ] ; then #If whatever is listed is a [, then go to next iteratio
   continue
  fi
  tmp=($x)
  
  
  for ((i=0; i<26; i++)); do
   if [ ${tmp::1} = ${alphabet[$i]} ]; then
    count $i
    
    break
   fi
  done

 done < <(ls /bin) #see notes on process Substitution 
#http://mywiki.wooledge.org/ProcessSubstitution

outputCount
}

main
