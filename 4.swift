// Playground - noun: a place where people can play

import Foundation



func isPalindrome(n: Int) -> Bool {
    var str: String = String(n)
    var chars: [Character] = []
    
    for c in str {
        chars.append(c)
    }
    
    return (chars == chars.reverse())
}

var result: Bool = false
var left: Int = 999
var right: Int = 999
var palindromes: [Int] = []
let start = NSDate()

let mults: [Int] = Array(Range(101...999))
var initial: Int = 121


while initial < 1000 {
    mults.map({
        (number: Int) -> () in
        if (number % 10 == 0) { return }
        let result = number * initial
        if (isPalindrome(result)) {
            palindromes.append(result)
        }
    })
    
    initial += 11
}


let winner = palindromes.reduce(0, { max ($0, $1) })
println(winner)
let stop = NSDate()
let diff = stop.timeIntervalSinceDate(start)
println(diff)