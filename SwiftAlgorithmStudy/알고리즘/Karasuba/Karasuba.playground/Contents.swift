// 곱셈을 분할정복을 통해 빠르게 곱셈하기 위한 알고리즘
import Foundation

func karatsuba(_ num1: Int,_ num2: Int) -> Int {
    // 기저사례
    if num1 < 10 || num2 < 10 { return num1 * num2 }
    
    // 숫자를 분할할 m을 둘 중 더 작은 자릿수의 절반으로 설정
    let m:Float = Float(Int(min((log10(Float(num1))+1.0),(log10(Float(num2))+1.0)))) / 2.0
    
    // num을 high(앞부분), low(뒷부분)으로 분할
    let high1 = num1 / Int(pow(10.0, m))
    let low1 = num1 % Int(pow(10.0, m))
    let high2 = num2 / Int(pow(10.0, m))
    let low2 = num2 % Int(pow(10.0, m))
    
    let z0 = karatsuba(low1, low2)
    let z1 = karatsuba(low1+high1, low2+high2)
    let z2 = karatsuba(high1, high2)
    
    return (z2 * Int(pow(10, (m*2))) + ((z1-z2-z0) * Int(pow(10,m))) + z0)
}

print(karatsuba(12, 12))
