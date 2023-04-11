import Foundation

/*
 MARK: 소수점
 ceil(값) = 소수점 올림
 floor(값) = 소수점 내림
 trunc(값) = 소수점 버림
 round(값) = 소수점 반올림

 MARK: 절대값
 abs(Int값) = 정수 절대값
 fab(Double값) = 실수 절대값
 
 MARK: 로그
 log(float값) = 로그 값
 log10(float값) = 밑이 10인 로그 반환
 
 MARK: 제곱
 pow(Int값(밑), 거듭제곱할 횟수(지수)) = 거듭제곱 값 반환
 sqrt(Double(제곱값)) = 제곱의 밑 값 반환
 cbrt(Double(세제곱값)) = 세제곱의 밑 값 반환
 hypot(Double(높이), Double(밑변)) = (높이제곱 + 밑변제곱)의 제곱근 = 빗변의 값
 
 MARK: 기타
 fma(Double, Double, Double) = (1*2+3) ?? 이게 왜 필요하지?
 2.isMultiple(of: 2) // 짝수반환
 */

print(pow(2.0,4.0)) // 2의 4승 = 16
print(sqrt(16.0)) // 4
print(cbrt(27.0)) // 3
print(hypot(3.0, 4.0)) // 5
fma(14, 2, 3) // 31
max(2, 3) // 3
fmax(2.0, 3.0) // 3
round(3.50404)


