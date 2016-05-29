## TO USE:
cd to the directory
bundle console
Gradient.create "#222222", "#333333", 4


## TASK
# Gradient

Write a function that accepts 2 hexadecimal RGB colour code strings and a number N.

The output should be an array of hexadecimal RGB colour code strings that represent a gradient between the two given codes over N steps. you don't need to make a UI or anything, just the core function is fine.

You can assume that there is enough difference between the start and finish colours to accommodate N steps. you may also assume that the input are both valid, 6 character hexadecimal strings (but feel free to add in checks).

Please solve this without using any domain-specific third-party libraries. It's fine to use generic libraries (a library for testing, for example).

A successful answer is any that gives a visually correct gradient.