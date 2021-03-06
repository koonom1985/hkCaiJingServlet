#!/usr/bin/env bash

root_url="http://testmp3.http.akamai-trials.com"
prefix="104"

if [[ -n "$1" ]]; then
    today="$1"
else
    today=`date +%Y%m%d`
fi

if [ -d "$today" ];then
	echo "$today exist"
else
	echo "$today not exist"
	echo `mkdir $today`
fi

echo $root_url
echo $prefix
echo $today

declare -a timearr=("0600" "0630" "0700" "0730" "0800" "0830" "0900" "0930" "1000" "1030" "1100" "1130" "1200" "1230" "1300" "1330" "1400" "1430" "1500" "1530" "1600" "1630" "1700" "1730" "1800" "1830" "1900" "1930" "2000" "2030" "2100" "2130" "2200" "2230" "2300")

for t in "${timearr[@]}"
do
    out=$?
    if [[ $out -eq 0 ]]; then
        `wget -c $root_url/$prefix/$today/"$prefix"_"$today""$t".mp3 -P ./$today/` || break
        echo "this is out status:"$out
    fi
done
