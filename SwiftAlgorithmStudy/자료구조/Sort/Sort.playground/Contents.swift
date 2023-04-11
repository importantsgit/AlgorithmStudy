/*
 - 내부 정렬 (internal Sort)
    내부 정렬은 입력의 크기가 주기억 장치의 공간보다 크지 않은 경우에 수행되는 정렬
    모든 요소들을 비교하여 정렬 -> 비교가 불가능한 레코드들은 정렬할 수 없음
 
    - 기수 정렬
        어떤 비교 연산도 실행하지 않고 데이터를 정렬할 수 있는 색다른 정렬 기법
        O(kn) 이라는 시간 복잡도를 가짐 대부분 K<4임
        다만 추가적인 메모리가 필요
        요소들이 동일한 길이를 가지는 숫자나 문자열로 구성되어야 함
    
 - 외부 정렬 (External Sort)
    입력의 크기가 주기억 장치 공간보다 큰 경우에 보조 기억 장치에 있는 입력을 여러 번에 나누어 주기억 장치에 읽어 들인 후, 정렬하여 보조 기억 장치에 다시 저장하는 과정 반복
 
 */



var arr = [40,20,50,30,10,60]
var sort = Sort(array: arr)
sort.returnQuickSortArray(by: .selectionSort)
sort.returnQuickSortArray(by: .noFilterQuickSort)
sort.returnQuickSortArray(by: .filterQuickSort)
sort.returnQuickSortArray(by: .mergeSort)
