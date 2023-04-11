func tile(_ num:Int) {
    var DP = [1,2]
    for _ in 3...num { DP = [DP[1],(DP[0]+DP[1])%1000000007] }
    print(DP.last!)
}
tile(100)


var c = 100
var cache = [Int](repeating: -1, count: c+1)
func tile2(_ idx: Int) -> Int {
    if idx == 2 {return 2}
    if idx == 1 {return 1}
    if cache[idx] != -1 {return cache[idx]}
    cache[idx] = (tile2(idx-1)+tile2(idx-2))%1000000007
    return cache[idx]
}
tile2(c)


 
