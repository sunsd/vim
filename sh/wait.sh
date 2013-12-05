#!/bin/sh
F="/tmp/tmp.wait"
#
if [ -f "$F" ]; then
    rm -f $F
fi
#tput clear

{
    echo "Installing..."
    for i in `seq 0 6`;do
        #echo -n "-i:$i"
        sleep 0.5
    done
    echo "Done" > $F
}&

{
    IS_DONE="0"
    while :
    do
        tput sc
        for j in '-' '\\' '|' '/'; do
            echo -ne  "Please waiting ... [$j]"
            sleep 0.5
            tput rc

            if [ -f "$F" ]; then
                rm -f $F
                tput el
                tput smul
                echo "Done."
                tput rmul
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
