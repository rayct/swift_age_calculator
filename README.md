## Here's an example program in Swift that calculates a person's age and the number of days until their next birthday:

## This program will prompt the user for their date of birth, and then it will calculate current age, the day of the week you were born on, and the number of days until your next birthday.

## To use the program, simply run it in a MacOs XCode IDE or code editor environment and follow the prompts.


# Version: 1.0.1
## To optimize the code, we can simplify the logic for calculating the date of the next birthday using Calendar's nextDate(after:matching:matchingPolicy:) method.


# Version: 1.0
## Here's an example program in Swift that calculates a person's age and the number of days until their next birthday: The program reads the user's input using readLine() and uses DateFormatter to parse the input string into a Date object. It then calculates the age of the person and the date of their next birthday. To calculate the date of the next birthday, the program uses Calendar to extract the month and day components of the birthdate and create a Date object for the current year with those components. If the resulting Date object is in the past, it adds a year to calculate the date of the next birthday for the following year Finally, the program uses Calendar again to calculate the number of days until the next birthday and prints out the results.


## Ray C. Turner
