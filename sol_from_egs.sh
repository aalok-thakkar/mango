#!/usr/bin/env bash

bench="$1"
bench_type="$2"
egs_dir="$3"

mkdir -p $bench/biases $bench/other $bench/solutions $bench/tables

tail -n +2 $egs_dir/logs/benchmarks/$bench_type/$bench/out.log | sed '$ d' | sed -E "/.*\Unit.*/d" > $bench/solutions/solution_datalog.txt
