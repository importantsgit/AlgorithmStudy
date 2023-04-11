// 간단하게 풀기

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var result = 0
    var idx = 0
    for i in section {
        if idx<i {
            result+=1
            idx = m + i - 1
        }
    }
    return result
}
