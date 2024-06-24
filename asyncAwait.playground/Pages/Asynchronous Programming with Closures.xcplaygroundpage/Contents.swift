import Foundation

public func customerSays(_ message: String) {
    print("[Custom] \(message)")
}

public func sandwichMakerSays(_ message: String, waitFor time: UInt32 = 0) {
    print("[SnadWitch maker] \(message)")
    if time > 0 {
        print("               .....this will take \(time)s")
        sleep(time)
    }
}

func toastBread(_ bread: String, completion: @escaping(String) -> Void) -> String {
    DispatchQueue.global().async{
        sandwichMakerSays("Toasting th bread... Standing by...", waitFor: 5)
        completion( "Cripy \(bread)")
    }
}

func slice(_ ingredients: [String], completion: @escaping(String) -> Void) -> [String] {
    DispatchQueue.global().async {
        let results = ingredients.map { ingredient in
            sandwichMakerSays("Slicing \(ingredient)", waitFor: 1)
            return "sliced \(ingredient)"
        }
    }
    completion(results)
}

func makeSandwich(bread: String, ingredients: [String], condiments: [String]) -> String {
    toastBread(bread) { toasted in
        slice(ingredients) { sliced in
            sandwichMakerSays("Spreading \(condiments.joined(separator: ", and"))")
            sandwichMakerSays("Layering \(sliced.joined(separator: ", "))")
            sandwichMakerSays("Putting lettuce on top")
            sandwichMakerSays("Putting another slice of bread on top")
        }
    }
    return "End"
}

sandwichMakerSays("Hello to Cafe Synchronous, where we execute your order serially.")
sandwichMakerSays("Please place your order.")

let clock = ContinuousClock()
let time = clock.measure {
  let sandwich = makeSandwich(bread: "Rye", ingredients: ["Cucumbers", "Tomatoes"], condiments: ["Mayo", "Mustard"])
  customerSays("Hmmm.... this looks like a delicious \(sandwich) sandwich!")
}

print("Making this sandwich took \(time)")
