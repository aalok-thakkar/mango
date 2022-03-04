#!/usr/bin/env bash

bench="$1"
egs_dir="$2"
ilasp_dir="$3"

mkdir -p $bench/biases $bench/other $bench/solutions $bench/tables

cp $egs_dir/$bench/*.facts $egs_dir/$bench/*.expected $bench/tables

sed -nE "s/(^\..*)/\1/p" "$egs_dir/$bench/rules.small.dl" | sed -E "/.*Rule.*/d" > $bench/biases/rules.dl
echo "" > $bench/biases/constants.txt
sed -nE 's/(#.*)/\1/p' "$ilasp_dir/$bench/ilasp_bench.las" | sed -E '/#[pos|neg].*/d' > "$bench/biases/modes.txt"

cp "$egs_dir/$bench/solution.txt" $bench/solutions/solution_datalog.txt || echo "" > $bench/solutions/solution_datalog.txt
echo "" > $bench/solutions/solution_sql.txt

echo "" > $bench/other/source.txt
echo "" > $bench/other/features.txt
echo "" > $bench/other/notes.txt

