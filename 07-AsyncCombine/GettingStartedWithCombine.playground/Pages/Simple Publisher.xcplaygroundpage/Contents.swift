import Foundation
import Combine

Just(42)
    .print()
    .sink { value in
        print("Received \(value)")
    }
["Pepper", "Mushrooms", "Onions"].publisher
    .sink { topping in
        print("\(topping) is a favorite topping for pizza")
    }
"Combine".publisher
    .sink { value in
        print("Hello, \(value)")
    }
Just("Combine")
    .sink { value in
        print("Hello, \(value)")
    }
