/*
 체스판 다시 칠하기
 1018
 */
import Foundation

var str =
[
    "BBBBBBBBBBBBBBBBBBBBBBB",
    "BBBBBBBBBBBBBBBBBBBBBBB",
    "BBBBBBBBBBBBBBBBBBBBBBB",
    "BBBBBBBBBBBBBBBBBBBBBBB",
    "BBBBBBBBBBBBBBBBBBBBBBB",
    "BBBBBBBBBBBBBBBBBBBBBBB",
    "BBBBBBBBBBBBBBBBBBBBBBB",
    "BBBBBBBBBBBBBBBBBBBBBBB",
    "BBBBBBBBBBBBBBBBBBBBBBW"
]
//var board: [[Int]] = []
//var yx = [9,23]//readLine()!.map{Int(String($0))!}
//var count = 10000000
//
//for i in 0..<yx[0] {
//    board.append(str[i].map{$0=="B" ?1:0})//readLine()!.map{$0=="B" ?1:0})//
//}
//
//for i in 0...(yx[0]-8) {
//    for j in 0...(yx[1]-8) {
//        var compare = 0
//        var d = board[i][j] // 맨 왼쪽
//        for iy in i...(i+7) {
//            for ix in j...(j+7) {
//                if board[iy][ix] != d {compare+=1}
//                if ix != j+7 {d = d == 1 ? 0 : 1}
//            }
//        }
//        count = min(compare, count)
//    }
//}
//
//print(count)


//
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])

var board: [[String]] = []
board.append(Array(repeating: ".", count: M + 1))
for _ in 0..<N {
    board.append(["."] + readLine()!.map{String($0)})
}

let (endY, endX) = ((N - 8) + 1, (M - 8) + 1)

var answer: Int = Int.max
for startY in 1...endY {
    for startX in 1...endX {
        let answerTemp: Int = min(fill(startY, startX, "W"), fill(startY, startX, "B")) // W 시작 Case, B 시작 Case 중 작은 값 저장.
        answer = min(answer, answerTemp)
    }
}

print(answer) // 가장 최소값 출력.

func fill(_ y: Int, _ x: Int, _ bw: String) -> Int {
    var count: Int = 0 // 변경 횟수 카운팅.
    
    for i in 0..<8 {
        for j in 0..<8 {
            if (i + j) % 2 == 0 { // (홀, 홀) || (짝, 짝) -> bw와 같아야 함.
                if board[y + i][x + j] != bw { // 같아야 하는데 다르면,
                    count += 1 // 변경.
                }
            }
            else { // (홀, 짝) || (짝, 홀) -> bw와 달라야 함.
                if board[y + i][x + j] == bw { // 달라야 하는데 같으면,
                    count += 1 // 변경.
                }
            }
        }
    }
    return count
}
