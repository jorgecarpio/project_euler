// Playground - noun: a place where people can play

import Foundation



func isPalindrome(n: Int) -> Bool {
    var answer: Bool = false
    
    var str: String = String(n)
    var chars: [Character] = []
    
    for c in str {
        chars.append(c)
    }
    
    answer = (chars == chars.reverse())
    
    
    return answer
}

var result: Bool = false
var left: Int = 999
var right: Int = 999
var palindromes: [Int] = []
let start = NSDate()

while left > 99 {
    
    while right > 99 {
        result = isPalindrome(left * right)
        left * right
        if result == true {
            palindromes.append(left * right)
            // println("left is \(left), right is \(right) and product is \(left * right)")
            
        }
        right -= 1
    }
    
    left -= 1
    right = left
    

}
let numMax = palindromes.reduce(0, { max($0, $1) })
println("The winner is \(numMax)")
let stop = NSDate()
let diff = stop.timeIntervalSinceDate(start)
println(diff)