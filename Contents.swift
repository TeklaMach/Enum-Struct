//1//

enum DayOfWeek {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}
func checkDay(day: DayOfWeek) {
    switch day {
    case .monday, .tuesday, .wednesday, .thursday, .friday:
        print("It's a boring weekday again.")
    case .saturday, .sunday:
        print("It's a weekend yayy, finaly we can rest or rest-ish.")
    }
}

var day: DayOfWeek = .sunday
checkDay(day: day)

//2//

enum Weather {
    case sunny(temperature: Double)
    case cloudy(temperature: Double)
    case rainy(temperature: Double)
    case snowy(temperature: Double)
}

func clothingForWeather(for weather: Weather) {
    switch weather {
    case .sunny(var temperature):
        if temperature > 25 {
            print("omg it is so hot, wear light clothes, drink cold water and wear spf, or just stay at home :)")
        } else {
            print("It is normal weather, you can enjoy the sunlight and take vitamin D")
        }
    case .cloudy(var temperature):
        if temperature > 20 {
            print("It's cloudy but warm, my favorite weather, do you want Netflix and chill? if you are going outside, just take a jacket")
        } else {
            print("It is cloudy and coldish. wear puffer jacket if you want.")
        }
    case .rainy(var temperature):
        if temperature > 15 {
            print("It is rainy day but not so cold, bring an umbrella and funky boots to hav fun.")
        } else {
            print("It is rainy and cold. Wear a warm jacket and take an umbrella.")
        }
    case .snowy(var temperature):
        if temperature > 0 {
            print("It is snowy wear gloves, warm jumper and scarf.")
        } else {
            print("It is snowy and cold, wear boots, warm jumper and scarf and be ready for snowman.")
        }
    }
}

var currentWeather: Weather = .sunny(temperature: 28.0)
clothingForWeather(for: currentWeather)

//3//

struct Book {
    var title: String
    var author: String
    var publicationYear: Int
}

func getBooksReleasedAfter(year: Int, from books: [Book]) -> [Book] {
    var filteredBooks = books.filter { $0.publicationYear > year }
    return filteredBooks
}
var booksArray: [Book] = [
    Book(title: "Alice's Adventures in Wonderland", author: "Lewis Carroll", publicationYear: 1988),
    Book(title: "The Perks of Being a Wallflower", author: "Stephen Chbosky", publicationYear: 1999),
    Book(title: "Matilda", author: "Roald Dahl", publicationYear: 1988),
    Book(title: "Winnie-the-Pooh", author: " A.A. Milne", publicationYear: 1926),
    Book(title: "The Hobbit", author: "J.R.R. Tolkien", publicationYear: 1937)
]


var yearToFilter: Int = 1950
var newerBooks = getBooksReleasedAfter(year: yearToFilter, from: booksArray)

print("Books released after \(yearToFilter):")
for book in newerBooks {
    print("\(book.title) by \(book.author) (\(book.publicationYear))")
}

//4//

struct BankAccount {
    var holderName: String
    var accountNumber: String
    var balance: Double
    
    mutating func deposit(amount: Double) {
        guard amount > 0 else {
            print("Error: Deposit amount must be greater than zero.")
            return
        }
        balance += amount
        print("Deposit of \(amount) successfully processed. New balance: \(balance)")
    }
    
    mutating func withdraw(amount: Double) {
        guard amount > 0 else {
            print("Error: Withdrawal amount must be greater than zero.")
            return
        }
        
        guard amount <= balance else {
            print("Error: Cannot withdraw \(amount). Current balance: \(balance)")
            return
        }
        
        balance -= amount
        print("Withdrawal of \(amount) successfully processed. New balance: \(balance)")
    }
}

var myBankAccount = BankAccount(holderName: "Tekla Matcharashvili", accountNumber: "93BG948473892GEL", balance: 2000.0)//i wish :DD//

myBankAccount.deposit(amount: 500.0)

myBankAccount.withdraw(amount: 200.0)

myBankAccount.withdraw(amount: 2500.0)

myBankAccount.deposit(amount: -300.0)

//5//
enum Genre: String {
    case rock
    case pop
    case jazz
}

struct Song {
    var title: String
    var artist: String
    var duration: Double
    var genre: Genre
    var description: String {
        return "\(title) by \(artist)"
    }
    
    lazy var publisher: String? = {
        return "No information have found"
    }()
}

func filterSongs(playlist: [Song], forGenre genre: Genre) -> [Song] {
    var filteredSongs = playlist.filter { $0.genre == genre }
    return filteredSongs
}

var myPlaylist: [Song] = [
    Song(title: "HONEY", artist: "Måneskin", duration: 2.47, genre: .rock),
    Song(title: "Hotel California", artist: "Eagles", duration: 6.3, genre: .rock, publisher: "Eagles Publishing"),
    Song(title: "Back in Black", artist: "AC/DC", duration: 4.2, genre: .rock),
    Song(title: "Echo", artist: "Olivia Dean", duration: 3.58, genre: .pop, publisher: "AMF Records"),
    Song(title: "I'm Confessin' (That I Love You)", artist: "Samara Joy", duration: 5.05, genre: .jazz),
]

var filteredRockSongs = filterSongs(playlist: myPlaylist, forGenre: .rock)
print("Rock Song:")
for var song in filteredRockSongs {
    print(song.description)
    if let publisher = song.publisher {
        print("Publisher: \(publisher)")
    }    }

var filteredPopSongs = filterSongs(playlist: myPlaylist, forGenre: .pop)
print("\nPop Song:")
for var song in filteredPopSongs {
    print(song.description)
    if let publisher = song.publisher {
        print("Publisher: \(publisher)")
    }
}

var filteredJazzSongs = filterSongs(playlist: myPlaylist, forGenre: .jazz)
print("\njazz Song:")
for var song in filteredJazzSongs {
    print(song.description)
    if let publisher = song.publisher {
        print("Publisher: \(publisher)")
    }
}
