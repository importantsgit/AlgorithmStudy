import Foundation

class RadixSort<T:Comparable> {
    func makeRadixSort(arr: inout [Int]){
        var queues: Array<Queue<Int>> = []
        var factor = 1
        for _ in 0..<10 { queues.append(Queue<Int>()) }
        for _ in 0..<4 {
            for i in 0..<arr.count {
                queues[(arr[i]/factor)%10].enqueue(arr[i])
            }
            
            
        }
    }
}
