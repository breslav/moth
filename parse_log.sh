#!/bin/bash
grep -o 'Iteration [0-9]*[,]\sloss\s\=\s[0-9\.]*' ./solver_log.txt > solver_log_training.txt
echo "Parsing training information..."
awk '{print $2}' solver_log_training.txt | grep -o [0-9]* > solver_log_training_iterations.txt
echo "Parsed training iterations"
awk '{print $5}' solver_log_training.txt > solver_log_training_loss.txt
echo "Parsed training loss"

grep -E -o 'Iteration\s[0-9]*\,\sTesting' solver_log.txt | awk '{print $2}' | grep -o [0-9]* > solver_log_testing_iterations.txt

echo "Parsed testing iterations"

grep -E -o 'Test\s.*' ./solver_log.txt | awk '{print $7}' > solver_log_testing_loss.txt
echo "Parsed testing loss"

if [ -d parsed_log ] 
then
	rm -r parsed_log/
fi

mkdir parsed_log

cp solver_log.txt solver_log_training_iterations.txt solver_log_training_loss.txt solver_log_testing_iterations.txt solver_log_testing_loss.txt ./parsed_log


echo "Copied log files to parsed_log folder."

rm solver_log_training_iterations.txt solver_log_training_loss.txt solver_log_testing_iterations.txt solver_log_testing_loss.txt

echo "Removed log files from this directory."
echo "Done!"
