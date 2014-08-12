// Problem 3

import Darwin

func isPrime(n:Int) -> Bool {
    // Convert n to Float for Darwin sqrt function
    let f:Float = Float(n)
    
    var answer: Bool = false
    var nsqrt: Float = sqrt(f)
    var floored: Int = Int(floor(nsqrt))
    var counter: Int = 2
    var divisible: Int = 0
    
    while counter <= floored {
        if n % counter == 0 {
            divisible++
        }
        counter++
    }
    if divisible < 1 {
        answer = true
    }
    
    
    return answer
}

func getPrimes(n:Int) -> [Int] {
    var primes: [Int] = []
    
    for index in 2...n {
        if isPrime(index) {
            primes.append(index)
        }
        }
    
    
    return primes
}


func nextPrime(n:Int) -> Int {
    var foundAPrime: Bool = false
    var myPrime = n
    
    while !foundAPrime {
        myPrime++
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

isPrime(11)
// getPrimeFactors(111999)
// 13195 calls isPrime 39 times
// Changing array lookup loop to > from >= gets it to 25 times.
