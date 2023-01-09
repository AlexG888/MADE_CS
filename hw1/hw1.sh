#!/bin/bash
check (){
	MAXPOINTS=$1
	export PATH=pwd:$PATH
	cd students
	if [ "$#" -ne 1 ]
	then
		echo ""
		echo "Usage ./hw1.sh MAXPOINTS"
	else
		echo ""
		echo "Maximum score $MAXPOINTS"
		for entry in */
		do
			echo "Processing ${entry%/} ..."
			cd $entry
			if [[ -f "task1.sh" ]]
			then
				./task1.sh > tmp
				diff -w ../../expected.txt tmp > diff_res
				declare -i mist_cnt=$(grep -E '>|<' diff_res | wc -l)
				if (($mist_cnt == 0))
				then
					echo "${entry%/} has correct output"
					echo "${entry%/} has earned a score of $MAXPOINTS / $MAXPOINTS"
                                	echo ""
				else
					echo "${entry%/} has incorrect output ($mist_cnt lines do not match)"
					declare -i res=$MAXPOINTS-$mist_cnt*5
					if (( $res < 0)); then
						let res=0
					fi
					echo "${entry%/} has earned a score of $res / $MAXPOINTS"
					echo ""
				fi
				rm diff_res
				rm tmp
				cd ..
			else
				echo "${entry%/} did not turn in the assignment"
				echo ""
				cd ..
			fi
		done
	fi
	cd ..
}
check $1
