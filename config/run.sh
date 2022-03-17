#!/usr/bin/env bash
echo welcome
# Extract current version
node_version=`node -p "require('../package.json').version"`
# split the version into pieces
IFS='.' read -ra nv <<<"$node_version"
first_digit=$((${nv[0]}))
second_digit=$((${nv[1]}))
third_digit=$((${nv[2]}))
function second() {
  if [ $second_digit -lt 10 ]; then
    second_digit=$(($second_digit+1))
  elif [ $second_digit -ge 10  ]; then
    second_digit=0
    first_digit=$(($first_digit+1))
  fi

}
# increment the last digit of the version
if [ $third_digit -lt 10 ]; then
  third_digit=$(($third_digit+1))
elif [ $third_digit -ge 10  ]; then
  third_digit=0
  second
fi



newVersion="$first_digit.$second_digit.$third_digit"
sed -i "s/$node_version/$newVersion/g" ../package.json


git config --global user.email "mitch.chanza@gmail.com"
git config --global user.name "Mitch Chanza"
