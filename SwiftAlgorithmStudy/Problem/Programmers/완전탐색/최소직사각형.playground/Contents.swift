var sizes = [[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]]

func change(idx: Int, sizes:[[Int]])->Int{
    if idx == sizes.count {
        return sizes.max(by: {$0[0] < $1[0]})![0] * sizes.max(by: {$0[1] < $1[1]})![1]
    }
    var sizes = sizes
    var result = Int.max
    for _ in 0..<2 {
        result = min(result, change(idx: idx+1, sizes: sizes))
        sizes[idx].swapAt(0, 1)
    }
    
    return result
}

func solution(_ sizes:[[Int]]) -> Int {
    return change(idx: 0, sizes: sizes)
}

solution(sizes)


func solution1(_ sizes:[[Int]]) -> Int {
    var sizes = sizes
    var x = [Int]()
    var y = [Int]()
    for i in 0..<sizes.count {
        sizes[i].sort()
        x.append(sizes[i][0])
        y.append(sizes[i][1])
    }
    
    return x.max()! * y.max()!
}

solution1(sizes)

func solution2(_ sizes:[[Int]]) -> Int {
    var sizes = sizes, x = 0, y = 0
    for i in 0..<sizes.count {
        x = max(x, sizes[i].max()!)
        y = max(y, sizes[i].min()!)
    }
    return x * y
}

solution2(sizes)
