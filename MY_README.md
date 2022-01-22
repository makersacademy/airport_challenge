Airport Challenge

This is my approach to the week 3 airport challenge.
I focused on following the TTD process by writing the test first. This went fine until I had to implement the weather.

I was unsure how to best test for the weather and after some research decided to create a weather object I could pass to my functions. This allowed me to create a double in rspec and pass that to the tests with it returning the desired result.
This worked but I did not like how it looked.

After thinking about it for a while I decided to seed the randomness using srand. srand(1) gave clear weather while srand(2) gave stormy.
This allowed me to remove the argument from the functions but in return each test needs to be seeded before running.

I prefer how this looks, however now changing the chance of a storm will break the tests, requiring you to change the srand values.

For now that is as close as I can get as I'm not sure the best way to write rspec tests on randomness.