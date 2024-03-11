#!/usr/bin/bash

#a=$1
#if [[ $a -eq 23 ]]
#then
#echo $(($a + 19))
#else
#echo '$a is not "23"'
#fi

#hostname=$( hostname -I )



IFS=. read -r a b c d <<< "$1"

function convertIntvalToBase () 
{
   val=$1
   result=""
   while [ $val -ne 0 ] ; do
        result=$(( $val % 2 ))$result
        val=$(( $val / 2 ))
   done
   if [[ $result -eq "" ]]
   then
      echo -n 0
    else
   echo -n $result
   fi
}

a=$(convertIntvalToBase $a)
b=$(convertIntvalToBase $b)
c=$(convertIntvalToBase $c)
d=$(convertIntvalToBase $d)

echo "$a.$b.$c.$d"

