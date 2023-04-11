extension String {
    func findWord(idx: Int)->String? {
        if idx >= self.count || idx < 0 {return nil}
        let startidx = index(self.startIndex, offsetBy: idx)
        return String(self[startidx])
    }
}

var park = ["SOO","OXX","OOO"]
var route = ["E 2","S 2","W 1"] //Ex+1 Sy+1 Wx-1 ny-1


func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var hw = [park.count-1, park[0].count-1]
    var yx = [0,0]
    for y in 0...hw[0] {
        for x in 0...hw[1] {
            if park[y].findWord(idx: x) == "S" { yx = [y,x] }
        }
    }
    for route in routes {
        var route = route.split(separator: " ")
        var repeatNum = Int(route[1])!
        var path = route[0]
        var chageyx = yx
        for i in 0..<repeatNum {
            switch path {
            case "E": chageyx[1] += 1
            case "S": chageyx[0] += 1
            case "W": chageyx[1] -= 1
            default : chageyx[0] -= 1
            }
            if chageyx[0] < 0 || chageyx[0] > hw[0] || chageyx[1] < 0 || chageyx[1] > hw[1] {chageyx = yx;break}
            if park[chageyx[0]].findWord(idx: chageyx[1]) == "X" {chageyx = yx;break}
        }
        yx = chageyx
    }
    return yx
}

solution(park, route)
