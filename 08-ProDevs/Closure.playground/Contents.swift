import UIKit

//전통적인 함수 정의
func descriptiveName() {
    print("Run!")
}
//전통적인 함수 실행
descriptiveName()

func multiplyBy2 (x: Int) -> Int {
    return x * 2
}

print(multiplyBy2(x: 4))
print(multiplyBy2(x: 17))

let y = { (x: Int) -> Int in return x * 2 }
print(y(4))
print(y(17))

//클로저, 인풋, 아웃풋 인자 생략
let z = { x in return x * 2}
print(z(4))
print(z(17))

//return 키워드 생략
let w = { x in x * 2}
print(w(4))
print(w(17))

//인풋 argument 이름 생략
let v = { $0 * 2 }
print(v(4))
print(v(17))
