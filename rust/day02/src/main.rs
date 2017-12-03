const INPUT: &'static str = include_str!("../input.txt");

fn main() {
    println!("day 2.1: {}", checksum(INPUT));
}

fn checksum(input: &str) -> u32 {
    let mut checksum = 0;
    for (_, row) in input.lines().enumerate() {

        let numbers = row.split_whitespace()
            .map(|c| c.parse::<u32>().unwrap())
            .collect::<Vec<_>>();

        let max = numbers.iter().max().unwrap();
        let min = numbers.iter().min().unwrap();
        checksum += max - min;
    }
    checksum
}
