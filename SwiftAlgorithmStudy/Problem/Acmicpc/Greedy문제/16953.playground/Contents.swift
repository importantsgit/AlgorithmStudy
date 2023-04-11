/*
 A → B
 16953
 */
var AB = [2,162]//readLine()!.split(separator: " ").map{Int(String($0))!}
var result = 1

func Greedy() {
    while AB[0]<=AB[1] {
        if AB[0] == AB[1] { break }
        result += 1
        if AB[1]%10==1 {
            AB[1] /= 10
        } else if AB[1].isMultiple(of: 2) {
            AB[1] /= 2
        } else {break}
    }
    print(AB[0]==AB[1] ? result : -1)
}



//MARK: - dfs
import Foundation

var cnt = 1

// var AB = readLine()!.split(separator: " ").map{Int(String($0))!}

func dfs(_ a: Int, _ count: Int) -> Int {
    if a == AB[1] { // 값이 같을 때
        return count
        //exit(0)
    } else if a > AB[1] { // 값이 같지 않을 때
        return -1
    }
    return max(dfs(a*2, count+1), dfs(a*10+1, count+1))
}

print(dfs(AB[0], cnt))
