#!/bin/bash
label=$1
num_reps=$2
query=$3
db_file=$4
csv_file=$5

# Get current time
start_time=$(date +%s)

# Loop num_reps times
for i in $(seq 1 $num_reps); do
    sqlite3 $db_file "$query" > /dev/null 2>&1
done

# Get end time
end_time=$(date +%s)

# Compute elapsed time
elapsed_time=$((end_time - start_time))

# Divide elapsed time by num_reps
average_time=$(echo "scale=5; $elapsed_time/$num_reps" | bc)

# Write output
echo "$label,$average_time" >> $csv_file
