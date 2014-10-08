var a = 1
var b = 1
var c: Int

func square(n:Int) -> Int {
    return n * n
}

func isTriplet(var a:Int, var b:Int, var c:Int) -> Bool {
    if (square(a) + square(b) == square(c)) {
        return true
    } else {
        return false
    }
}

func solveForC(var a: Int, var b: Int) -> Int {
    return 1000 - a - b
}

mainLoop: for i in 1..<1000 {
    a = i
    for j in 1...499 {
        b = j
        c = solveForC(a, b)
        if (isTriplet(a, b, c)) {
            println("winner!")
            println("a is \(a), b is \(b), c is \(c)")
            println("product is \(a*b*c)")
            break mainLoop
        }
    }
}