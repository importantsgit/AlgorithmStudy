var boggleBoard = [["U","R","L","P","M"],
                   ["X","P","R","E","T"],
                   ["G","I","A","E","T"],
                   ["X","T","N","Z","Y"],
                   ["X","O","Q","R","S"]]

var strings = ["PRETTY","GIRL","REPEAT","KARA"]


func Boggle(str: String, idx: Int, x: Int, y: Int) -> Bool {
    if idx == str.count { return true }
    if (x < 0 || x >= boggleBoard[0].count) || (y < 0 || y >= boggleBoard.count) { return false }
    if str.findIndex(from: idx) != boggleBoard[y][x] { return false }

    for j in -1...1 {
        for i in -1...1 {
            if Boggle(str: str, idx: idx+1, x: x+i, y: y+j) {
                return true
            }
        }
    }
    return false
}

func startBoggle(strings: [String]) {
    for string in strings {
        var isFind = false
        for y in 0..<boggleBoard.count {
            for x in 0..<boggleBoard[0].count {
                if Boggle(str: string, idx: 0, x: x, y: y) {
                    isFind = true
                }
            }
        }
        print(isFind ? string + " Yes" : string + " No")
    }
}

startBoggle(strings: strings)




//MARK: - 시험

func bogglegame(_ xy:[Int],_ str:[String])->Bool {
    if xy[0]>4||xy[0]<0||xy[1]>4||xy[1]<4 {return false}
    if boggleBoard[xy[0]][xy[1]] != str.first! {return false}
    if str.isEmpty {return true}
    for i in -1...1 {
        for j in -1...1 {
            if xy[0] != 0&&xy[1] != 0&&bogglegame([xy[0]+i,xy[1]+j],Array(str[1...])) {return true}
        }
    }
    return false
}
