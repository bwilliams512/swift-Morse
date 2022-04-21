/*
Morse code, named after American artist Samuel Finley Breese Morse, is a method of
telecommunication that visually encodes letters into unique combinations of dots . and dashes -

In this project, we write a Swift program that uses
dictionaries to encrypt and decrypt secret Morse code messages.
*/

var englishText = "this is a secret message"

var secretMessage = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-. -.-.--"

// Add your code below 🤫

// Setting Up....................................

var lettersToMorse: [String: String] = [
  "a": ".-",
  "b": "-...",
  "c": "-.-.",
  "d": "-..",
  "e": ".",
  "f": "..-.",
  "g": "--.",
  "h": "....",
  "i": "..",
  "j": ".---",
  "k": "-.-",
  "l": ".-..",
  "m": "--",
  "n": "-.",
  "o": "---",
  "p": ".--.",
  "q": "--.-",
  "r": ".-.",
  "s": "...",
  "t": "-",
  "u": "..-",
  "v": "...-",
  "w": ".--",
  "x": "-..-",
  "y": "-.--",
  "z": "--..",
  ".": ".-.-.-",
  "!": "-.-.--",
  "?": "..--..",
  ",": "--..--"
]

// Turning Text into Morse Code..................

// Create an empty string to store the encrypted message
var morseText = ""

// Loop through each character in englishText
for element in englishText {
  // Create an if-let statement that assigns a variable to the value of a key in the dictionary
  if let morseChar = lettersToMorse["\(element)"]{
    // Append morseChar as well as a space to the end of the value
    morseText += morseChar + " "
  }
  else{
    // Append three spaces to morseText because in Morse code, three spaces represent the spacing between words
    morseText+="  "
  }
}
// Uncomment line below to see our encoded message
// print (morseText)

// Storing a Decoded Message.....................

// Create an empty string variable to store the decoded version of secretMessage
var decodedMessage = ""

// Creating an Array of Morse Code Letters.......

var morseCodeArray = [String]()
var currMorse = ""

// Iterate through each character of secretMessage
for char in secretMessage {
  if char != " " {
    currMorse.append(char)
  }
  else {
    switch currMorse {
      case "":
        currMorse += " "
      case " ":
        morseCodeArray.append(" ")
        currMorse = ""
      default:
        morseCodeArray.append(currMorse)
      currMorse = ""
    }
  }
}

// Finish populating morseCodeArray by appending currMorse
morseCodeArray.append(currMorse)
// Uncomment line below to see each Morse code letter contained as an individual element
// print(morseCodeArray)

// Creating a New Dictionary.....................

// Create a new dictionary with morse keys and letter values
var morseToLetter: [String: String] = [:]

// Iterate through the keys and the values of the letterToMorse dictionary
for (letter, morseChar) in lettersToMorse {
  morseToLetter[morseChar]=letter
}

// Decoding the Message..........................

// It is time to decode the secret message!
for morseValue in morseCodeArray {
  if let letterChar = morseToLetter[morseValue] {
    decodedMessage += letterChar
  }
  else {
    decodedMessage += " "
  }
}

// Print decodedMessage to find out what the secret message is
print(decodedMessage)

// Output: howdy partner!
