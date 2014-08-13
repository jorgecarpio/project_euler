// Problem 3

import Darwin

func isPrime(n:Int) -> Bool {
    // Convert n to Float for Darwin sqrt function
    let f:Float = Float(n)
    var nsqrt: Float = sqrt(f)
    var floored: Int = Int(floor(nsqrt))
    var primes: [Int] = eratosthenesSieve(floored)
    var divisible: Int = 0
    if n == 2 || n == 3 {
        return true
    }

    for index in primes {
        println(index)
        if n % index == 0 {
            divisible++
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


func getPrimeFactors(n:Int) -> [Int] {
    var primeFactors: [Int] = []
    var currentPrimes: [Int] = [2]
    
    var dividend: Int = n
    var done: Bool = false
    
    var counter: Int = 0
    var currentPrime: Int = currentPrimes[counter]
    
    while done == false {
        if isPrime(dividend) {
            println("found a prime: \(dividend)")
            primeFactors.append(dividend)
            done = true
        } else if dividend % currentPrime == 0 {
            println("found a prime: \(currentPrime)")
            primeFactors.append(currentPrime)
            dividend = dividend / currentPrime
            
            // Reset currentPrime to 2
            // old way
            // currentPrime = currentPrimes[0]
            counter = 0
            println("counter reset to zero")
            
        } else {
            // Old way
            // currentPrime = nextPrime(currentPrime)
            
            // New way to get the next Prime
            // If currentPrimes[counter + 1 ] doesn't
            // exist getPrimes add it to the array.
            // Otherwise, just get it
            println("counter is \(counter)")
            // If this is greater than or equal to, then it will execute
            // when the array is the right length.
            
            if (counter + 1 > (currentPrimes.count - 1)) {
                currentPrimes.append(nextPrime(currentPrimes[counter]))
                counter++
                currentPrime = currentPrimes[counter]
                println("current prime is \(currentPrime)")
                println(currentPrimes)
            } else {
                counter++
                currentPrime = currentPrimes[counter]
                println("Saved a step; got \(currentPrime) from \(currentPrimes)")
                
            }
            
        }

}
    return primeFactors
}


func eratosthenesSieve(n: Int) -> [Int] {
    var a: [Int: Int] = [1:0]
    var p: Int = 2
    var j: Int = p * p
    var primes: [Int] = []
    
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

// Original isPrime(104729) for loop executes 322 times
isPrime(9000000)
// After

