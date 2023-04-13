var one = [1, 2, 3, 4, 5]
var two = [2, 1, 2, 3, 2, 4, 2, 5]
var three = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]

var answers = [1,2,3,4,5]
var answer = [1,3,2,4,2]

func solution(_ answers:[Int]) -> [Int] {
    var idx = [0,0,0]
    var result = [0,0,0]
    for i in answers {
        if i == one[idx[0]] {result[0] += 1}
        if i == two[idx[1]] {result[1] += 1}
        if i == three[idx[2]] {result[2] += 1}
        
        idx[0] = (idx[0]+1)%5
        idx[1] = (idx[1]+1)%8
        idx[2] = (idx[2]+1)%10
    }
    var arr = result.enumerated().sorted(by: {$0.element > $1.element})
    var resultarr = [Int]()
    for (idx,_) in arr.filter({arr[0].element == $0.element}).sorted(by: {$0.offset < $1.offset}){
        resultarr.append(idx+1)
    }
    return resultarr
}

solution(answer)

func solution1(_ answers:[Int]) -> [Int] {
    var idx = [0,0,0]
    var result = [0,0,0]
    for i in answers {
        if i == one[idx[0]] {result[0] += 1}
        if i == two[idx[1]] {result[1] += 1}
        if i == three[idx[2]] {result[2] += 1}
        
        idx[0] = (idx[0]+1)%5
        idx[1] = (idx[1]+1)%8
        idx[2] = (idx[2]+1)%10
    }
    var arr = result.enumerated().sorted(by: {$0.element > $1.element})

    return arr.filter({arr[0].element == $0.element}).sorted(by: {$0.offset < $1.offset}).map{$0.offset+1}
}

solution1(answer)


func solution2(_ answers:[Int]) -> [Int] {
    let answer = (
        a: [1, 2, 3, 4, 5],
        b: [2, 1, 2, 3, 2, 4, 2, 5],
        c: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    )
    var point = [1: 0, 2: 0, 3: 0]
    for (i,n) in answers.enumerated() {
        if n == answer.a[i%5] {point[1] = point[1]! + 1}
        if n == answer.b[i%8] {point[2] = point[2]! + 1}
        if n == answer.c[i%10] {point[3] = point[3]! + 1}
    }

    return point.filter{point.values.max() == $0.value}.sorted{$0.key < $1.key}.map{$0.key}
}

solution2(answer)
