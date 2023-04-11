/*
 알고리즘 수업 - 피보나치 수 1
 24416
 */
//var n = Int(readLine()!)!
func fib(_ n: Int) -> Int {
    if n == 1 || n == 2 {
        return 1
    }
    return fib(n-1) + fib(n-2)
}


func fib1(_ n: Int) -> Int {
    if n == 1 || n == 2 {
        return 1
    }
    return fib1(n-1) + fib1(n-2)
}

//print(fib1(n),n-2)



// 그냥 계산한 값이니 꼼수
//var a=Int(readLine()!)!;var f=[1,1];for _ in 2..<a{f=[f[1],f[0]+f[1]]};print(f[1],a-2)


//fibonacci(Int(readLine()!)!)

func fibonacci(_ n: Int)-> UInt64 {
    if n == 0 { return 0 }
    if n == 1 || n == 2 { return 1 }
    var f:[UInt64] = [1,1]
    for _ in 2..<n {
        f = [f[1],f[0]+f[1]]
    }
    return f[1]
}



// print(fibonacci(100))

UInt.max
UInt64.max
CUnsignedLong.max
