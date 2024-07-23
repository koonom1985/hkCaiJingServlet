#!/bin/bash

root_url="https://arch.metroradio.hk"
prefix="104"
# declare -a timearr=("0600" "0630" "0700" "0730" "0800" "0830" "0900" "0930" "1000" "1030" "1100" "1130" "1200" "1230" "1300" "1330" "1400" "1430" "1500" "1530" "1600" "1630" "1700" "1730" "1800" "1830" "1900" "1930" "2000" "2030" "2100" "2130" "2200" "2230" "2300" "2330")
declare -a timearr=("0700" "0730" "0800" "0830" "0900" "0930" "1000")

#should be the day before, then it will download the next date
today="2024-07-14"
end_day="2024-07-18"

# Initialize an empty array
dates=()

for d in $(seq $(date -d $today +%s) 86400 $(date -d $end_day +%s)); do
    # Append each date to the array
    dates+=("$(date -d @$d +%Y%m%d)")
done

# Print the dates stored in the array
for date in "${dates[@]}"; do
    echo $date
    if [ -d "$date" ];then
      echo "$date exist"
    else
      echo "$date not exist"
      echo `mkdir $date`
    fi
    for t in "${timearr[@]}"; do
      out=$?
      if [[ $out -eq 0 ]]; then
          echo $root_url/$prefix/$date/"$prefix"_"$date""$t".mp3
          `wget -c $root_url/$prefix/$date/"$prefix"_"$date""$t".mp3 -P ./$date/` || break
          echo "this is out status:"$out
      fi
    done
    
    tar -zcvf "$date".tar.gz "$date"
done
