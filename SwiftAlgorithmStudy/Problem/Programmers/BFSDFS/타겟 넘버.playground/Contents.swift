var numbers = [4,1,2,1]
var target = 4

func re(idx:Int, add:Int)->Int {
    if numbers.count == idx {return target == add ? 1 : 0}
    var add = add
    var result = 0
    var current = numbers[idx]

    for i in [-1,1] {
        result += re(idx: idx+1, add: (current*i)+add)
    }
    return result
}

func sol(_ numbers: [Int],_ target: Int) -> Int {
    var result = 0
    result = re(idx: 0, add: 0)
    return result
}


sol(numbers, target)


func re1(numbers:[Int], target:Int, idx:Int, add:Int, answer: inout Int) {
    if numbers.count == idx {answer += target == add ? 1 : 0;return}
    var current = numbers[idx]
    for i in [-1,1] {
        re1(numbers: numbers, target: target, idx: idx+1, add: (current*i)+add, answer: &answer)
    }
}

func solution1(_ numbers:[Int], _ target:Int) -> Int {
    var  answer = 0
    re1(numbers: numbers, target: target, idx: 0, add: 0, answer: &answer)
    return answer
}

solution1(numbers, target)
