var c = 92
var cache = [Int](repeating: -1, count: c+1)
func tile(_ idx: Int) -> Int {
    if idx <= 2 {
        return idx
    }
    if cache[idx] != -1 {return cache[idx]}
    
    cache[idx] = (tile(idx-1)+tile(idx-2))%1000000007
    return cache[idx]
}

// 모든 경우에서 비대칭 경우 빼기

func asymmetryTile1(_ idx: Int) {
    var DP1:[Int] = [Int](repeating: 0, count: idx+1), DP2:[Int] = [Int](repeating: 0, count: idx+1)
    DP1[1] = 1; DP1[2] = 2
    for i in 3...idx {
        DP1[i] = (DP1[i-1] + DP1[i-2])%1000000007
        DP2[i] = 1000000007 + (i.isMultiple(of: 2) ? DP1[i] - DP1[(i-2)/2] - DP1[i/2] : DP1[i] - DP1[(i-1)/2])%1000000007
    }
    print(DP2[idx])
}

asymmetryTile1(92)



var n = 92
var cache1 = [Int](repeating: -1, count: n+1), cache2 = [Int](repeating: -1, count: n+1)
cache1[1] = 1; cache1[2] = 2

func asymmetryTile2(_ idx: Int)->Int{
    if idx <= 2 {return idx}
    if cache1[idx] != -1 {return cache1[idx]}
    cache1[idx] = (asymmetryTile2(idx-2) + asymmetryTile2(idx-1))%1000000007
    cache2[idx] = 1000000007 + (idx.isMultiple(of: 2) ? cache1[idx] - cache1[(idx-2)/2] - cache1[idx/2] : cache1[idx] - cache1[(idx-1)/2])%1000000007
    // (홀수-1)/2 하는 것과 홀수/2 하는 거랑 같음
    return cache1[idx]
}

asymmetryTile2(n)
print(cache2[n])
