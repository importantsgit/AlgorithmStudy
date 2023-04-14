import Foundation
var numbers = "011"
func isPrime(num:Int)->Bool {
    if num == 0 {return false}
    if num < 4 {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {return false}
    }
    return true
}

func DFS(start: Int, num: String, visited: [Bool], numbers: [String], result:inout Set<String>) {
    var start = start, visited = visited, num = num
    visited[start] = true
    
    for (idx, i) in numbers.enumerated() {
        if visited[idx] == false {
            
            var isNum = num != "0" ? (num + i) : i
            if isPrime(num: Int(isNum)!) {
                result.insert(isNum)
            }
            DFS(start: idx, num: isNum, visited: visited, numbers: numbers, result: &result)
        }
    }
}

func solution(_ numbers:String) -> Int {
    var numbers = numbers.map{String($0)}
    var visited = [Bool](repeating: false, count: numbers.count)
    var result = Set<String>()
    for (idx, i) in numbers.enumerated() {
        if isPrime(num: Int(i)!) {result.insert(i)}
        DFS(start: idx, num: i, visited: visited, numbers: numbers, result: &result)
    }
    
    print(result)
    
    return result.count
}

solution(numbers)
