/*
 타일 장식물
 13301
 */

func tiles(_ n:Int) {
    var f:[UInt] = [1,1,2,3]
    if n==1 {print(4);return}
    if n==2 {print(6);return}
    if n==3 {print(10);return}
    
    for _ in 4..<n {
        f = [f[1],f[2],f[3],f[2]+f[3]]
    }
    print(f[0]+f[1]*2+f[2]*2+f[3]*3)
}
tiles(Int(readLine()!)!)

