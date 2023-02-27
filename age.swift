// Version: 1.0
// Here's an example program in Swift that calculates a person's age and the number of days until their next birthday:
// The program reads the user's input using readLine() and uses DateFormatter to parse the input string into a Date object.
// It then calculates the age of the person and the date of their next birthday.
// To calculate the date of the next birthday,
// the program uses Calendar to extract the month and day components of the birthdate and create a Date object for the current year with those components.
// If the resulting Date object is in the past, it adds a year to calculate the date of the next birthday for the following year.
// Finally, the program uses Calendar again to calculate the number of days until the next birthday and prints out the results.

import Foundation

print("Enter your birthdate (MM/DD/YYYY): ", terminator: "")
guard let birthdateStr = readLine() else {
    fatalError("Invalid input")
}

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MM/dd/yyyy"
guard let birthdate = dateFormatter.date(from: birthdateStr) else {
    fatalError("Invalid date format")
}

let ageComponents = Calendar.current.dateComponents([.year], from: birthdate, to: Date())
guard let age = ageComponents.year else {
    fatalError("Failed to calculate age")
}

let nextBirthdayComponents = Calendar.current.dateComponents([.month, .day], from: birthdate)
let currentYear = Calendar.current.component(.year, from: Date())
let nextBirthdayDate = Calendar.current.date(from: DateComponents(year: currentYear, month: nextBirthdayComponents.month!, day: nextBirthdayComponents.day!)) ?? Calendar.current.date(byAdding: .year, value: 1, to: Calendar.current.date(from: DateComponents(year: currentYear, month: nextBirthdayComponents.month!, day: nextBirthdayComponents.day!))!)!

let daysUntilNextBirthdayComponents = Calendar.current.dateComponents([.day], from: Date(), to: nextBirthdayDate)
guard let daysUntilNextBirthday = daysUntilNextBirthdayComponents.day else {
    fatalError("Failed to calculate days until next birthday")
}

print("You were born on a \(birthdate.dayOfWeek()!).")
print("You are currently \(age) years old.")
print("Your next birthday is in \(daysUntilNextBirthday) days.")


// Version: 1.0.2
// To optimize the code, we can simplify the logic for calculating the date of the next birthday using Calendar's nextDate(after:matching:matchingPolicy:) method.
// Here's an optimized version of the program:

import Foundation

print("Enter your birthdate (MM/DD/YYYY): ", terminator: "")
guard let birthdateStr = readLine() else {
    fatalError("Invalid input")
}

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MM/dd/yyyy"
guard let birthdate = dateFormatter.date(from: birthdateStr) else {
    fatalError("Invalid date format")
}

let ageComponents = Calendar.current.dateComponents([.year], from: birthdate, to: Date())
guard let age = ageComponents.year else {
    fatalError("Failed to calculate age")
}

let nextBirthdayComponents = Calendar.current.dateComponents([.month, .day], from: birthdate)
let nextBirthdayDate = Calendar.current.nextDate(after: Date(), matching: nextBirthdayComponents, matchingPolicy: .strict) ?? Calendar.current.nextDate(after: Date(), matching: nextBirthdayComponents, matchingPolicy: .nextTime)!

let daysUntilNextBirthdayComponents = Calendar.current.dateComponents([.day], from: Date(), to: nextBirthdayDate)
guard let daysUntilNextBirthday = daysUntilNextBirthdayComponents.day else {
    fatalError("Failed to calculate days until next birthday")
