## Maximum integer in R

...All current implementations of R use 32-bit integers and use IEC 60559 floating-point 
(double precision) arithmetic. So we are subject to a max value that a 32-bit number will allow:

> The number 2,147,483,647 (or hexadecimal 7FFF,FFFF16) is the maximum positive value for a 
> 32-bit signed binary integer in computing. It is therefore the maximum value for variables 
> declared as integers (e.g., as int) in many programming languages.

Why? Well, because **binary**:

> A 32-bit register can store 232 different values. The range of integer values that can be stored 
> in 32 bits depends on the integer representation used. With the two most common representations, 
> the range is 0 through 4,294,967,295 (232 − 1) for representation as an (unsigned) binary number

For the numerical characteristics of the machine you are running R on, try this on the R command line:

> .Machine
> ...
> $integer.max
> [1] 2,147,483,647


Read:
* Look at: R help for the variable .Machine
* https://en.wikipedia.org/wiki/2,147,483,647
* https://en.wikipedia.org/wiki/32-bit
* https://en.wikipedia.org/wiki/Integer_(computer_science)
