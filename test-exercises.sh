#!/bin/bash
exercisesList=$(grep -s -L this E-*)
red=$(tput setaf 1)
green=$(tput setaf 2)
reset=`tput sgr0`

directories=0
exercises=0

for i in ${exercisesList}; 
do
  directories=$((directories + 1))
  test-runner -e -s ${i} >> result
  
  if [ $? -eq 0 ]
  then
    exercises=$((exercises + 1))
    printf '%s\t%s\n' ${i} "${green}Correcto${reset}" >> exercises-list
  else
    printf '%s\t%s\n' ${i} "${red}Error${reset}" >> exercises-list
  fi
done;


echo '#########'
echo Resumen: $exercises/$directories
echo '#########'

echo ' '
echo '#########'
echo Lista de ejercicios
echo '#########'

cat exercises-list
cat result

if [ $exercises -eq $directories ]
then
  exit 0
else
  exit 1
fi