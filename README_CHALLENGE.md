## Airplan Challenge - Jamie Bowers - https://app.travis-ci.com/JRMBowers/airport_challenge.svg?branch=main

My approach to solving the challenge was to use the TDD process to write all aspects of the code out using <it 'requirement' do> first. I then write one rpsec (ensuring to approach them logically and per user story), run the rspec and then use this (the errors) to write the code to solve the rspec.

Once all of the rspecs had been complete, I looked to refactoring the code and rspec ensuring that I use private functions for private features. I also set to making my rspec more readable by grouping similar tests such as the tests around taking of planes and landing planes.

I tested the rspec and code using IRB in order to be sure that everything was functional during my coding. I also set out and produced a feature test of multiple planes taking off and landing. 

After the completion of the code I used rubocop, rspec and simplecov to ensure that I cover as much of the code with tests as I can and that the code has been produced in an acceptable way. The code will not be submitted until both of these have been satisfied.