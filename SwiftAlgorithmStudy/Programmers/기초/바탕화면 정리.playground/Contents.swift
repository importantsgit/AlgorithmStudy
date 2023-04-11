//var wallpaper = [".#...", "..#..", "...#."]
var wallpaper = ["..........", ".....#....", "......##..", "...##.....", "....#....."]
//var wallpaper = [".##...##.", "#..#.#..#", "#...#...#", ".#.....#.", "..#...#..", "...#.#...", "....#...."]
func solution(_ wallpaper:[String]) -> [Int] {
    var s = [-1,50]
    var e = [0,0]
    for paper in 0..<wallpaper.count {
        
        if let firstIndex = wallpaper[paper].firstIndex(of: "#"),
           let lastIndex = wallpaper[paper].lastIndex(of: "#"){
            
            var first = wallpaper[paper].distance(from: wallpaper[paper].startIndex, to: firstIndex)
            var last = wallpaper[paper].distance(from: wallpaper[paper].startIndex, to: lastIndex)
            
            if s[0] == -1 {s[0] = paper}
            e[0] = paper+1
            
            if first == last {
                s[1] = min(s[1],first)
                e[1] = max(e[1],first+1)
            } else {
                s[1] = min(s[1],first)
                e[1] = max(e[1],last+1)
            }
        }
    }
    return s+e
}

solution(wallpaper)


// 기억하기
for (i, str) in wallpaper.enumerated() {
     for (j, file) in str.enumerated() {
         if file == "#" {
             lux = min(lux, i)
             luy = min(luy, j)
             rdx = max(rdx, i)
             rdy = max(rdy, j)
         }
     }
 }
