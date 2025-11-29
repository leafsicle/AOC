# Advent of Code

Solutions for [Advent of Code](https://adventofcode.com) challenges.

## Current Year

[2025 Advent of Code](https://adventofcode.com/2025/about) <img src="https://progress-bar.xyz/0" alt="Overall Progress"/>

## Setup

### Install the `new_day` script

Add the `bin` directory to your PATH by adding this to your `~/.zshrc` or `~/.bashrc`:

```bash
export PATH="/Users/mcooke/dev/AOC/bin:$PATH"
# Then reload your shell:
source ~/.zshrc  # or source ~/.bashrc
```

### Create a new day

Navigate to the year directory and run:

```bash
cd 2024
new_day 2
```

This creates:

```filetree --max-depth 1
day2/
  example.txt       # Example input from the puzzle
  solution.rb       # Your solution
  solution_test.rb  # Tests using Minitest
```

### Run tests

```bash
cd day2
ruby solution_test.rb
```

### Run your solution

```bash
ruby solution.rb
```

## Past Years

[2024](https://adventofcode.com/2024/about) <img src="https://progress-bar.xyz/4" alt="Overall Progress"/>

[2022](https://adventofcode.com/2022/about) <img src="https://progress-bar.xyz/0" alt="Overall Progress"/>
