import Foundation
var brown = 24
var yellow = 24

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var brown = brown, yellow = yellow
    var yellowWidth = yellow
    var yellowHeight = 1
    var arr = [Int]()
    
    while yellowHeight+2 <= yellowWidth+2 {
        var compare = 4 + (yellowHeight * 2) + (yellowWidth * 2)
        if brown == compare && (yellowWidth+2) * (yellowHeight+2) == brown+yellow {
                arr = [yellowWidth+2, yellowHeight+2]
                break
        } else {
            yellowHeight += 1
            yellowWidth = yellow/yellowHeight
        }
    }
    
    return arr
}

solution(brown, yellow)
