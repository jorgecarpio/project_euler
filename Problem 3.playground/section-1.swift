// Problem 3

import Foundation

func isPrime(n:Int) -> Bool {
    // Convert n to Float for Darwin sqrt function
    let f:Float = Float(n)
    var nsqrt: Float = sqrt(f)
    var floored: Int = Int(floor(nsqrt))
    if n == 2 || n == 3 {
        return true
    }

    
    // check the rest of the primes minus 2 and 3
    var primes = eratosthenesSieve(floored)
    
    for index in primes {
        if n % index == 0 {
            return false
        }
    }
    
    return true
}

func nextPrime(n:Int) -> Int {
    var foundAPrime: Bool = false
    var myPrime = n
    
    // If myPrime is even (unlikely) add one.
    if myPrime % 2 == 0 {
        myPrime++
    }
    
    while !foundAPrime {
        // Only look at odds.
        myPrime = myPrime + 2
        if isPrime(myPrime) {
            foundAPrime = true
        }
    }
    return myPrime
}


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
    println(diff)
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

getPrimeFactors(12)






