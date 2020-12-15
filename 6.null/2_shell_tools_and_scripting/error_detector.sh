#!/usr/bin/zsh

count=0
while true; do
	./command.sh &>> out.log
	if [[ "$?" -ne 0 ]]; then
		echo "Failed after run $count times"
		echo "Output:"
		cat out.log
		break
	fi
	count=$[count+1]
done
