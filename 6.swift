import Foundation

func square(n:Int) -> Int {
    return n * n
}

func sumOfSquares(n: Int) -> Int {
    let naturals:[Int] = Array(Range(1...n))
    return naturals.reduce(0, {(acc:Int, val:Int) -> Int in acc + square(val)})
}

func squareOfSums(n: Int) -> Int {
    let naturals:[Int] = Array(Range(1...n))
    return square(naturals.reduce(0,+))
}

println(squareOfSums(100) - sumOfSquares(100))