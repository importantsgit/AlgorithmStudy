// 공백 단위로 정수형 받기

var arr = readLine()!.split(separator: " ").map { Int($0)! }

// 이게 더 빠름
// Substring → String → Int
var arr1 = readLine()!.split(separator: " ").map { Int(String($0))! }




// 배열 만들기
var array = [Int](repeating: 0, count: 3)
print(array)




// 배열 정렬하기
arr.sort() // 원본 순서 변경 (오름차순) [1,2,3]
let changeArr = arr.sorted() // 정렬한 배열을 반환
arr.sort(by: >) // 원본 순서 변경 (내림차순) [3,2,1]

// String은 아스키 코드 정렬임



// 배열 중 최소, 최대 찾기
var min = arr.min()!
var max = arr.max()!





// 배열 정방향, 역방향으로 찾기

// 정방향
// count 사용
for i in 0..<arr.count {
    print(arr[i])
}

// indices 사용
for i in arr.indices {
    print(arr[i])
}

// 역방향
for i in (0..<arr.count).reversed() {
    print(arr[i])
}

for i in arr.indices.reversed() {
    print(arr[i])
}
// 아니면 배열 자체를 뒤집고 정방향 순회 해도 됨




// 이중 배열 사용하기
/*
 3
 26 40 83
 49 60 57
 13 89 99
 */

let n = Int(readLine()!)!

var house: [[Int]] = []

for _ in stride(from: 0, to: n, by: 1) { // 마지막 n은 출력 xx 0..<n
    // stride from:x부터 to:n-1까지 by:1 만큼의 보폭으로 전진 ( 0~2의 배열 생성 )
    house.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}

for _ in stride(from: 0, through: n, by: 1) { // 마지막 n은 출력 oo 0...n
    
}

print(house)
//[[26,40,83],[49,60,57],[13,89,99]]






// 2차원 배열 1차원 배열로 만들기
var arr4 = [[1,2,3],[2,3],[4]]
let flatten = arr4.flatMap {$0} // [1,2,3,2,3,4]
let reduced = arr4.reduce([], +) // [1,2,3,2,3,4]
let joined = Array(arr4.joined()) // [1,2,3,2,3,4]



// 출력하는 함수
func printArray(arr: [[Int]]) {
    var grid: [String] = []
    for i in 0..<arr.count {
        var row = ""
        for j in 0..<arr.first!.count {
            let value = arr[i][j]
            if value != 1000000 {
                row += "\(value) \t"
            } else {
                row += "INF\t"
            }
        }
        grid.append(row)
    }

    let edgesDescription = grid.joined(separator: "\n\n")
    print(edgesDescription)
}
