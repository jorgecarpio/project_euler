// Playground - noun: a place where people can play

import Foundation

func getPrimeFactors(var n:Int) -> [Int] {
    var primeFactors: [Int] = []
    var currentPrimes: [Int] = [2]
    
    var dividend: Int = n
    var done: Bool = false
    
    var counter: Int = 0
    var currentPrime: Int = currentPrimes[counter]
    let start = NSDate()
    // Generate prime list once.
    let f:Float = Float(n)
    var nsqrt: Float = sqrt(f)
    var floored: Int = Int(floor(nsqrt))
    if n == 1 || n == 2 || n == 3 {
        primeFactors.append(n)
        return primeFactors
    }
    var primes: [Int] = eratosthenesSieve(floored)
    
    for p in primes {
        if (p * p) > n {
            break
        }
        while n % p == 0 {
            primeFactors.append(p)
            n = n/p
        }
    }
    if n > 1 {
        primeFactors.append(n)
    }
    let stop = NSDate()
    let diff = stop.timeIntervalSinceDate(start)

    return primeFactors
}

func eratosthenesSieve(n: Int) -> [Int] {
    var a: [Int: Int] = Dictionary<Int, Int>(minimumCapacity: n)
    var p: Int = 2
    var j: Int = p * p
    var primes: [Int] = []
    
    // Populate first
    a[1] = 0
    
    // Populate the dictionary marking 2...n as prime
    for i in 2...n {
        a[i] = 1
    }
    
    while (p * p) <= n {
        j = p * p
        while j <= n {
            a[j] = 0
            j = j + p
        }
        p = p + 1
    }
    for (key, value) in a {
        if a[key] == 1 {
            primes.append(key)
        }
    }
    return primes
}

// 2520 is the smallest number that [1...10]
// can divide into w/o remainder
// Prime factors of 2520 are
// 2,2,2,3,3,5,7

// Takes an array like [2,2,2,4,4] and
// returns a dict [2:3,4:2] showing counts

func countArrayElements(elements: [Int]) -> [Int:Int] {
    var count: [Int:Int] = [:]
    
    for element in elements {
        if (count[element] != nil) {
            count[element] = count[element]! + 1
        } else {
            count[element] = 1
        }
    }
    
    
    return count
}



let exampleArray = 1...20
var lcdArray: [Int:Int] = [:]

for element in exampleArray {
    var primes = getPrimeFactors(element)
    var count = countArrayElements(primes)
    for (k, v) in count {
        if (lcdArray[k] == nil || lcdArray[k] < v) {
            lcdArray[k] = v
        }
    }
}

var answer: Double = 1.0
for (k,v) in lcdArray {
    answer *= pow(Double(k), Double(v))
}

println(Int(answer))