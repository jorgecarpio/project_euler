// Problem 3

import Darwin

func isPrime(n:Int) -> Bool {
    // Convert n to Float for Darwin sqrt function
    let f:Float = Float(n)
    
    var answer: Bool = false
    var nsqrt: Float = sqrt(f)
    var floored: Int = Int(floor(nsqrt))
    var divisible: Int = 0
    if n == 3 {
        return true
    }

    for index in 2...floored {
        if n % index == 0 {

            divisible++
            return answer
        }
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

getPrimeFactors(5959)
