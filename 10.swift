import Foundation

func eratosthenesSieve(n: Int) -> [Int] {
    var a: [Int: Int] = Dictionary<Int, Int>(minimumCapacity: n)
    var p: Int = 2
    var j: Int = p * p
    var primes: [Int] = []
    let start = NSDate()
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
    let stop = NSDate()
    let diff = stop.timeIntervalSinceDate(start)
    println("Generating primes took \(diff) seconds")
    
    return primes
}

var primes: [Int] = eratosthenesSieve(2000000)

var answer: Int = primes.reduce(0, +)

println("...and the answer is...\(answer)")