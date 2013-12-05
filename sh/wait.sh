#!/bin/sh
F="/tmp/tmp.wait"
#
trap '' 2
if [ -f "$F" ]; then
    rm -f $F
fi
#tput clear

# tips for the main cmd
echo "$2"
{
    #put "exec 1>/tmp/tmp.exec 2>&1" in file $1
    . "$1"
    echo "OK." > $F
}&

{
    IS_DONE="0"
    OUT="SUCCEED!"
    while :
    do
        tput sc
        for j in '-' '\\' '|' '/'; do
            echo -ne  "Please waiting ... [$j]"
            sleep 0.5
            tput rc

            if [ -f "$F" ]; then
                #RESULT=`head -n1 $F`
                #STATUS=${RESULT%% *}
                STATUS=`awk -F "[ .!]" '{if (NR==2) exit; print $1;}' $F`
                if [ $STATUS != "OK" ]; then
                    OUT="FAILED!"
                fi
                tput el
                tput smul
                echo $OUT
                tput rmul
                #rm -f $F
                IS_DONE="1"
                break
            fi
        done
        if [ "$IS_DONE" = "1" ]; then
            break
        fi
    done
}
wait
# create, wirte, read, close the named pipe through fd6
#mkfifo $F
#exec 6<>$F
#rm $F
#echo "??">&6
#read -u6 i
#echo $i
#exec 6>&-
