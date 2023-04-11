import Foundation

enum sortStatus {
    case selectionSort
    case bubbleSort
    case insertionSort
    case shallSort
    case filterQuickSort
    case noFilterQuickSort
    case mergeSort
}
class Sort<T:Comparable> {
    var array:[T] = []
    
    init(array: [T]) {
        self.array = array
    }
    
    //MARK: - selectionSort
    public func selectionSort(arr:inout [T]) {
        for pass in 0 ..< arr.count - 1 {
            var least = pass
            for i in pass + 1 ..< arr.count {
                if arr[i] < arr[least] { least = i }
            }
            changeNum(arr: &arr, idx1: least, idx2: pass)
        }
    }
    
    //MARK: - bubbleSort
    public func bubbleSort(arr:inout [T]){
        for pass in 1 ..< arr.count {
            for i in 1 ..< arr.count - pass {
                if arr[i-1] > arr[i] { changeNum(arr: &arr, idx1: i-1, idx2: i) }
            }
        }
    }
    
    //MARK: - insertionSort
    public func insertionSort(arr:inout [T]) {
        for i in 1 ..< arr.count {
            let currentElement = arr[i]
            var j = i - 1
            while j >= 0 && arr[j] > currentElement {
                arr[j+1] = arr[j]
                j -= 1
            }
            arr[j+1] = currentElement
        }
    }
    
    //MARK: - shallSort
    public func shallSort(arr:inout [T]) {
        for gap in [7,5,3,1] {
            if gap > arr.count { continue }
            for i in gap ..< arr.count {
                let currentElement = arr[i]
                var j = i
                while j >= gap && arr[j-gap] > currentElement {
                    arr[j] = arr[j-gap]
                    j = j - gap
                    arr[j] = currentElement
                }
            }
        }
    }
    //MARK: - mergeSort
    // 분할정복의 대표 사례
    // 1. 먼저 분할 -> 원자값 나올때까지 (기저사례)
    // 2. 분할 다 끝나면 통합 -> merge
    public func mergeSort(_ array:[T]) -> [T] {
        // 기저사례
        if array.count <= 1 { return array }
        let center = array.count / 2
        let left = Array(array[0..<center])
        let right = Array(array[center..<array.count])
        
        return merge(mergeSort(left), mergeSort(right))
    }
    
    private func merge(_ left: [T],_ right: [T]) -> [T] {
        var left = left, right = right
        var result: [T] = []
        // 모든 작은 값이 result에 들어가게끔
        while !left.isEmpty && !right.isEmpty { left[0] < right[0] ? result.append(left.removeFirst()) : result.append(right.removeFirst()) }
        // 남은건 제일 큰거 남음
        if !left.isEmpty { result.append(contentsOf: left) }
        if !right.isEmpty { result.append(contentsOf: right) }
        // 오름차순으로 return
        return result
    }
    
    //MARK: - quickSort
    // 먼저 정리하고 분할
    // 분할된 것을 정리하고 분할
    // 정리 -> 분할 반복
    // 만약 원자값이라면 그 값 리턴 (기저사례)
    public func quickSort(_ array: [T]) -> [T] {
        guard let first = array.first, array.count > 1 else { return array }
        
        let pivot = first
        let left = array.filter  { $0<pivot }
        let right = array.filter { $0>pivot }
        
        return quickSort(left) + [pivot] + quickSort(right)
    }
    
    //MARK: - noFilterQuickSort
    public func noFilterQuickSort(arr:inout [T] ,left: Int, right: Int) {
        // 기저사레: 원자가 아닐때
        if (left<right) {
            let q = partition(arr: &arr, left: left, right: right)
            // q인덱스는 피봇이 있는 위치이기 때문에 q-1과 q+1로 나누기
            noFilterQuickSort(arr: &arr, left: left, right: q-1)
            noFilterQuickSort(arr: &arr, left: q+1, right: right)
        }
    }
    
    private func partition(arr:inout [T],left: Int, right: Int) -> Int {
        let pivot = arr[left]
        var low = left, high = right + 1
        // 피봇보다 작으면 왼쪽에 크면 오른쪽에
        repeat {
            repeat {
                low+=1
            } while arr[low] < pivot
            repeat {
                high-=1
            } while arr[high] > pivot
            if low < high {changeNum(arr:&arr ,idx1: low, idx2: high)}
        } while low < high
        
        changeNum(arr:&arr ,idx1: left, idx2: high)
        return high
    }
    
    //MARK: - ETC
    public func returnQuickSortArray(by sort: sortStatus) {
        var arr = array
        var string = ""
        switch sort {
        case .selectionSort:
            string = "selectionSort"
            selectionSort(arr: &arr)
        case .bubbleSort:
            string = "bubbleSort"
            bubbleSort(arr: &arr)
        case .insertionSort:
            string = "insertionSort"
            insertionSort(arr: &arr)
        case .shallSort:
            string = "shallSort"
            shallSort(arr: &arr)
        case .mergeSort:
            string = "mergeSort"
            arr = mergeSort(arr)
        case .filterQuickSort:
            string = "filterQuickSort"
            arr = quickSort(arr)
        case .noFilterQuickSort:
            string = "noFilterQuickSort"
            noFilterQuickSort(arr: &arr, left: 0, right: arr.count - 1)

        }
        print(string)
        print(arr)
    }
    
    private func changeNum(arr:inout [T], idx1: Int, idx2: Int) {
        let num = arr[idx1]
        arr[idx1] = arr[idx2]
        arr[idx2] = num
    }
}
