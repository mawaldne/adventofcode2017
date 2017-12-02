use std::io::Read;
use std::fs::File;

fn main() {
    let mut f = File::open("input.txt").unwrap();
    let mut input = String::new();
    f.read_to_string(&mut input).ok();

    let total: u32 = input
        .trim()
        .chars()
        .zip(input.chars().cycle().skip(1))
        .filter(|&(a, b)| a == b)
        .map(|(a, _)| a.to_digit(10).unwrap())
        .sum();

    println!("This output is {}! :D", total);
}
