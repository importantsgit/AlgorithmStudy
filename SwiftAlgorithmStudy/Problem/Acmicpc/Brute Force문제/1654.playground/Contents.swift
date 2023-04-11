/*
 랜선 자르기
 1654
 */

//var k=readLine()!.split(separator:" ").map{Int($0)!},lines=[Int]()
//for _ in 0..<k[0]{lines.append(Int(readLine()!)!)}
//var minNum=lines.min()!
//while true{if lines.map({$0/minNum}).reduce(0,+)==k[1]{break};minNum-=1}
//print(minNum)

//var k=readLine()!.split(separator:" ").map{Int($0)!}
//var lines=[Int]()
//for _ in 0..<k[0]{
//    lines.append(Int(readLine()!)!)
//}
//lines = [802,743,457,549]
//var minNum=lines.min()!
//while true{
//    if lines.map({$0/minNum}).reduce(0,+)==k[1]{
//        break
//    };
//    minNum-=1
//}
//print(minNum)

var k=readLine()!.split(separator:" ").map{Int($0)!},lines=[Int]()
for _ in 0..<k[0]{lines.append(Int(readLine()!)!)}
var low=1,high=lines.max()!,mid=0,result=0
while low <= high {
    mid=(low+high)/2
    if lines.map({$0/mid}).reduce(0,+)>=k[1]{
        low=mid+1
    }else{high=mid-1}
}
print(high)
