#!/bin/zsh

# if [[ $(date '+%H') == 00 ]];then
#     time=$(($RANDOM%10))" 2 * * *"
# elif [[ $(date '+%H') == 02 ]];then
#     time=$(($RANDOM%10))" 5 * * *"
# elif [[ $(date '+%H') == 05 ]];then
#     time=$(($RANDOM%10))" 7 * * *"
# elif [[ $(date '+%H') == 07 ]];then
#     time=$(($RANDOM%10))" 9 * * *"
# elif [[ $(date '+%H') == 09 ]];then
#     time=$(($RANDOM%10))" 11 * * *"
# elif [[ $(date '+%H') == 11 ]];then
#     time=$(($RANDOM%5))" 13 * * *"
# elif [[ $(date '+%H') == 13 ]];then
#     time=$(($RANDOM%10))" 0 * * *"
# else
#     time=$(($RANDOM%10))" 0,2,5,7,9,11,13 * * *"
# fi
if [[ ( $(date '+%H') == 08 ) || ( $(date '+%H') == 19 )  || ( $(date '+%H') == 21 )  || ( $(date '+%H') == 23 )  || ( $(date '+%H') == 01 )  || ( $(date '+%H') == 03 )  || ( $(date '+%H') == 06 ) ]] ;then
    time=$(($RANDOM%10))" 19,21,23,1,3,6,8 * * *"
    echo 当前时间为$(date '+%H')时，计划运行时间$time
    sed -i '/cron:/d' .github/workflows/run.yml
    sed -i '/schedule/a\    - cron: '$time'' .github/workflows/run.yml
    exit 0
else
    exit 0
fi
